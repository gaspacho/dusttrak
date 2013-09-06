# Umbral de error default
Configuracion.create unless Configuracion.any?

if ENV['password'].present?
  Usuario.create(nombre: 'admin', password: ENV['password'])
else
  puts 'Probá de nuevo con'
  puts '  rake db:seed password="el password del admin global"'
end
