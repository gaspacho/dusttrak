class Historical < ActiveRecord::Base
  self.table_name = 'historical'
  C = Configuracion

  # TODO sacar de la configuración lo que haga falta
  def self.mas_concentracion
    select("*, ((value - #{C.corriente}) / #{C.escala}) / 1000 as 'concentracion'")
  end

  # http://forums.mysql.com/read.php?10,174757,176666#msg-176666
  # Dividimos los minutos de cada hora por el valor de agrupación para
  # poder parametrizarlo.  Se asume que la multiplicación por tres lleva
  # esta relación con la respuesta original (cada 20 minutos).
  def self.cada(x)
    group("(60/#{x}) * hour(`timestamp`) + floor(minute(`timestamp`) / #{x})")
  end

  def self.sobre_umbral
    # dependiente de mysql
    mas_concentracion.having 'concentracion > ?', C.umbral
  end

  def calcular_concentracion
    ((self.value - C.corriente) / C.escala) / 1000
  end

  def pasado?
    self.calcular_concentracion > C.umbral
  end

  def self.desde(timestamp)
    where("`timestamp` > :timestamp",
          { timestamp: DateTime.parse(timestamp).strftime("%Y-%m-%d 00:00:00")})
  end

  def self.hasta(timestamp)
    where("`timestamp` < :timestamp",
          { timestamp: DateTime.parse(timestamp).strftime("%Y-%m-%d 23:59:59")})
  end
end
