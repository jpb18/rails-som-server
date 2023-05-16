
class RunSelfOrganizingMapJob < ApplicationJob
  queue_as :default

  def perform(map)
    # build sample data
    sample_data = map.sample_data_entries.map do |entry|
      entry.value.kind_of?(String) ? JSON.parse(entry.value) : entry.value
    end

    # run our map
    map_service = SelfOrganizingMap.new(
      sample_data, 
      map.feature_number, 
      height: map.height, 
      width: map.width, 
      epochs: map.epochs, 
      learning_rate: map.learning_rate, 
      sigma: map.sigma, 
      max_iter: map.max_iter
    ).call!

    # store the map result and serialize the map
    pyimport :pickle
    serialized_map = pickle.dumps(map_service.som)
    map.update!(map_state: map_service.map_state.to_json, serialized_map: serialized_map)
  end
end