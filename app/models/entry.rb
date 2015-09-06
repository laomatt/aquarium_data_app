class Entry < ActiveRecord::Base
  belongs_to :tank
  has_many :replies
end
