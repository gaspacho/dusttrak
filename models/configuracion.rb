class Configuracion < ActiveRecord::Base
  # Rango según el que agrupar
  def self.grouped
    where(atributo: 'grouped').first.valor.to_f
  end
end
