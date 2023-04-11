pyfrom :'sklearn_som.som', import: :SOM

class SelfOrganizingMap
  attr_reader :som, :map_state

  def initialize(sample_data, features, options)
    @sample_data = sample_data
    @width = options[:width] || 20
    @height = options[:height] || 20
    @epochs = options[:epochs] || 1
    @shuffle = options[:shuffle] || false
    @som = SOM.new(m: @height, n: @width, dim: features)
  end

  def call!
    pyfrom :numpy, import: :array
    @som.fit(array(@sample_data, dtype: :float), epochs: @epochs, shuffle: @shuffle)
    @map_state = { positions: @som._locations.tolist, values: @som.weights.tolist }

    self
  end
end
