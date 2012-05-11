class Patient < ActiveRecord::Base
  has_many :documents
  has_many :authorized_users
  
  scope :accessible_to, ->(email) {joins(:authorized_users).where(authorized_users: {email: email})}
end
