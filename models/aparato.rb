class Aparato < ActiveRecord::Base
  has_many :mediciones, class_name: 'Historical', inverse_of: :aparato,
    primary_key: :grd, foreign_key: :grd_id
  has_many :parametros

  validates_uniqueness_of :nombre, :grd

  delegate :cero, :escala, to: :parametro

  def parametro
    self.parametros.actuales.first
  end
end
