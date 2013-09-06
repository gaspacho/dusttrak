class AdminForm

  def initialize(params)
    @umbral = params['umbral']

    @aparatos = params['aparatos']
  end

  def save
    Configuracion.create(umbral: @umbral) unless Configuracion.umbral == @umbral

    @aparatos.each do |parametros|
      atributos = parametros.slice!('cero', 'escala')
      aparato = Aparato.find(atributos.delete('id'))

      unless aparato.cero == parametros['cero'].to_i and aparato.escala == parametros['escala'].to_f
        aparato.parametros.build(parametros)
      end

      aparato.update_attributes(atributos)
      aparato.save
    end
  end
end
