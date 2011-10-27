require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: sections
#
#  id           :integer(4)      not null, primary key
#  page_id      :integer(4)
#  name         :string(255)
#  position     :integer(4)
#  visible      :boolean(1)      default(FALSE)
#  content_type :string(255)
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#

