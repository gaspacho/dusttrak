class CreateParametros < ActiveRecord::Migration
  def self.up
    create_table :parametros do |t|
      t.references :aparato
      t.float :escala
      t.integer :cero
      t.timestamps
    end
  end

  def self.down
    drop_table :parametros
  end
end
