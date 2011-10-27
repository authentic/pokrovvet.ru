require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: pages
#
#  id         :integer(4)      not null, primary key
#  subject_id :integer(4)
#  name       :string(255)
#  permalink  :string(255)
#  position   :integer(4)
#  visible    :boolean(1)      default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

