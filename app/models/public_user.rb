require 'digest/sha2'
class PublicUser < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :admin

  has_many :microposts, :dependent => :destroy

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Validations
  validates :name, :presence => true,
            :length => {:maximum => 50}
  validates :email, :presence => true,
            :format => {:with => email_regex},
            :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true,
            :confirmation => true,
            :length=> {:within=>6..40}


  before_save :encrypt_password

  scope :sorted, order("public_users.name ASC")
  def has_password?(submitted_password)
    encrypted_password== encrypt(submitted_password)
  end
  class<< self
    def authenticate(email, submitted_password)
      public_user=find_by_email(email)
      (public_user && public_user.has_password?(submitted_password)) ? public_user : nil
    end
    def authenticate_with_salt (id, cookie_salt)
      public_user=find_by_id(id)
      (public_user && public_user.salt==cookie_salt) ? public_user : nil
    end
  end

  private
  def encrypt_password
    self.salt= make_salt if new_record?
    self.encrypted_password=encrypt(password)

  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end


# == Schema Information
#
# Table name: public_users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

