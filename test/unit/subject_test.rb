require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: subjects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  position   :integer(4)
#  visible    :boolean(1)      default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

