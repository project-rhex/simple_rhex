class AuthorizedUser < ActiveRecord::Base
  belongs_to :patient
end
