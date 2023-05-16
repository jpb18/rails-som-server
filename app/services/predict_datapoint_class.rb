
class PredictDatapointClass
  attr_reader :predictions, :success

  def initialize(som_model, datapoints)
    @som_model = som_model
    @datapoints = datapoints
  end

  def call!
    pyfrom :numpy, import: :array
    pyimport :pickle
    @som = pickle.loads(@som_model.serialized_map)
    @predictions = @som.predict(array(@datapoints, dtype: :float))
    @predictions = @predictions.tolist

    @success = true
    self
  end
end