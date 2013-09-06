# encoding: utf-8
class Configuracion < ActiveRecord::Base
  # Devuelve la última configuración creada
  def self.actual
    order('created_at desc').limit(1)
  end

  # Rango de tiempo en minutos según el que agrupar
  # TODO descipayar grouped
  def self.grouped
    Dusttrak::App.rango
  end

  def self.umbral
    actual.first.umbral
  end
end
