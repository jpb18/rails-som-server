
class MapSerializer < ActiveModel::Serializer
  attributes :id, :feature_number, :width, :height, :map_state
end