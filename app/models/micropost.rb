class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :public_user
  #Validations
  validates :content, :presence => true,
            :length => {:maximum => 250}
  validates :public_user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'

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

