class Patient < ActiveRecord::Base
  has_many :documents
end
