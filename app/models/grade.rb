class Grade < ApplicationRecord

  belongs_to :student
  belongs_to :assignment,  optional: true

  def self.grouped
  Grade.all.group_by(&:assignment_id)
end



end
