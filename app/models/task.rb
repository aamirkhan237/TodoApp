class Task < ApplicationRecord
  belongs_to :user
  enum status: [:to_do, :in_progress, :done]
  validates :title, :description, :status, presence: true

  # Scope to filter tasks by status
  scope :filter_by_status, -> (status) do
    send(status) if statuses.key?(status)
  end
end
