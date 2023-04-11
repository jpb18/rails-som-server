
class Map < ApplicationRecord
  has_many :sample_data_entries, dependent: :destroy
end