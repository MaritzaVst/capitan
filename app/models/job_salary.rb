# == Schema Information
#
# Table name: job_salaries
#
#  id         :integer          not null, primary key
#  branch_id  :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobSalary < ActiveRecord::Base
  belongs_to :branch

  def self.by_branch branch_id
    !branch_id.nil? ? self.where(branch_id: branch_id) : []
  end  
end
