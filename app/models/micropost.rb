class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :public_user

  default_scope :order => 'microposts.created_at DESC'


  #Validations
  validates :content, :presence => true,
            :length => {:maximum => 250}
  validates :public_user_id, :presence => true,


end


# == Schema Information
#
# Table name: microposts
#
#  id             :integer(4)      not null, primary key
#  content        :text
#  public_user_id :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

