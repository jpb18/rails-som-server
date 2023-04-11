
class RunSelfOrganizingMapJob < ApplicationJob
  queue_as :default

  def perform(map)
    # build sample data
    sample_data = map.sample_data_entries.map do |entry|
      JSON.parse(entry.value)
    end

    # run our map
    map_service = SelfOrganizingMap.new(sample_data, map.feature_number, height: map.height, width: map.width).call!

    # store the map result
    map.update!(map_state: map_service.map_state.to_json)
  end
end