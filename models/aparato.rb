class Aparato < ActiveRecord::Base
  has_many :mediciones, class_name: 'Historical', inverse_of: :aparato,
    primary_key: :grd, foreign_key: :grd_id
end
