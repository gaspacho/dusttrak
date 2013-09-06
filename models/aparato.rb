class Aparato < ActiveRecord::Base
  has_many :mediciones, class_name: 'Historical', inverse_of: :aparato,
    primary_key: :grd, foreign_key: :grd_id
  has_many :parametros

  accepts_nested_attributes_for :parametros
  validates_uniqueness_of :nombre, :grd
end
