class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates_presence_of :first_name, :last_name, :password_confirmation
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase) # class method called on class
    user && user.authenticate(password) ? user : nil # instance method called on instance
  end
end
