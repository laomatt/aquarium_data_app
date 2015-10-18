class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable #, :validatable
  has_many :tanks
  has_many :replies
  has_many :entries, :through => :tanks

  has_attached_file :portrait, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :portrait, content_type: /\Aimage\/.*\Z/

end
