class Legacy::Tag < ActiveRecord::Base
  establish_connection 'legacy'
end