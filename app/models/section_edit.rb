class SectionEdit < ActiveRecord::Base
  belongs_to :editor, :class_name => "AdminUser", :foreign_key => 'admin_user_id'
  belongs_to :section
end

# == Schema Information
#
# Table name: section_edits
#
#  id            :integer(4)      not null, primary key
#  admin_user_id :integer(4)
#  section_id    :integer(4)
#  summary       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

