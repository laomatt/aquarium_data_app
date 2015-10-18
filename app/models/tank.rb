class Tank < ActiveRecord::Base
  belongs_to :user
  has_many :updates
  has_many :entries

end
