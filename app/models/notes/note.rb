class Note < ApplicationRecord
  def completed?
    is_completed
  end
end