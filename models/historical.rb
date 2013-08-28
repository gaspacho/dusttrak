class Historical < ActiveRecord::Base
  property :historial_id, :as => :integer
  property :grd_id, :as => :integer
  property :register_type, :as => :integer
  property :timestamp, :as => :datetime
  property :address, :as => :integer
  property :value, :as => :integer
  property :historical_type, :as => :integer
  property :insertion_time, :as => :timestamp
end
