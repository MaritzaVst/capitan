# == Schema Information
#
# Table name: educations
#
#  id         :integer          not null, primary key
#  branch_id  :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Education < ActiveRecord::Base
  belongs_to :branch
end
