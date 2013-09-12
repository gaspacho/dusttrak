class Parametro < ActiveRecord::Base
  belongs_to :aparato

  default_scope order('created_at desc')

  def self.actuales
    limit(1)
  end
end
