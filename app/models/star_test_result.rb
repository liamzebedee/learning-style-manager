class StarTestResult < ActiveRecord::Base
  serialize :raw_results, Hash
end
