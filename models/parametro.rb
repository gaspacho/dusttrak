class Parametro < ActiveRecord::Base
  belongs_to :aparato

  default_scope order('created_at desc')
end
