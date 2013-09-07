class GmiTestResult < ActiveRecord::Base
  INTELLIGENCES = ['Linguistic', 'Mathematical', 'Musical', 'Bodily/Kinesthetic', 'Spatial', 'Interpersonal', 'Intrapersonal']

  serialize :intelligences_ranked, Array
  serialize :raw_results, Hash
end
