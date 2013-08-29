class Historical < ActiveRecord::Base
  self.table_name = 'historical'

  # TODO sacar de la configuración lo que haga falta
  def self.mas_concentracion
    select('*, ((value - 2500) / 3.2) / 1000 as "concentracion"')
  end

  # http://forums.mysql.com/read.php?10,174757,176666#msg-176666
  # Dividimos los minutos de cada hora por el valor de agrupación para
  # poder parametrizarlo.  Se asume que la multiplicación por tres lleva
  # esta relación con la respuesta original (cada 20 minutos).
  def self.cada(x)
    group("(60/#{x}) * hour(`timestamp`) + floor(minute(`timestamp`) / #{x})")
  end

  # TODO sacar de la configuración lo que haga falta
  def calcular_concentracion
    ((self.value - 2500) / 3.2) / 1000
  end
end
