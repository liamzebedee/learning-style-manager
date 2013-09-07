class AuiTestResult < ActiveRecord::Base
  AUS_IDENTITIES = ['Eagle', 'Kangaroo', 'Dolphin', 'Wombat']

  serialize :raw_results, Hash
end
