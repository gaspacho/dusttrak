class Usuario < ActiveRecord::Base
  before_save :encriptar

  validates_uniqueness_of :nombre

  default_scope order('created_at desc')

  attr_accessor :password

  def self.autenticar!(nombre, password)
    usuario = self.find_by_nombre(nombre.downcase)
    hash = usuario.hashear(password)
    usuario.nombre == nombre && usuario.password_hash == hash
  end

  def hashear(password)
    BCrypt::Engine.hash_secret(password, self.password_salt)
  end

  private

    def encriptar
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
end
