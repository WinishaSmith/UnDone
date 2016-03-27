class Task < ActiveRecord::Base
  belongs_to :user
  def completed?
    !completed_at.blank?
  end
  # Woo! First model method I've seen.
end
