# Corriente en µA (I)
corriente = Configuracion.new({ :atributo => 'corriente',
                                :valor    => '2500' })

# Valor de la escala (E)
escala = Configuracion.new({ :atributo => 'escala',
                             :valor    => '3.2' })

# Agrupar cada X minutos
grouped = Configuracion.new({ :atributo => 'grouped',
                              :valor    => '15' })

escala.save
corriente.save
grouped.save
