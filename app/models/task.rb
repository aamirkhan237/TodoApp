class Task < ApplicationRecord
    enum status: [ :to_do, :in_progress , :done ]

    validates :title, :description , presence: true

#     ransacker :status, formatter: proc { |v| statuses[v] } do |parent|
#     parent.table[:status]
#   end
scope :to_do,       -> { where(status: :to_do) }
scope :in_progress, -> { where(status: :in_progress) }
scope :done,        -> { where(status: :done) }

scope :filter_by_status, -> (status) do
  send(status) if statuses.key?(status)
end


end
