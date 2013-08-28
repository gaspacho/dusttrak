corriente = Configuracion.new({ :atributo => 'corriente',
                                :valor    => '2500' })

escala = Configuracion.new({ :atributo => 'escala',
                             :valor    => '3.2' })

escala.save
corriente.save
