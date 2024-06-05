class Task < ApplicationRecord
    enum status: [ :to_do, :in_progress , :done ]

    validates :title, :description , presence: true

    ransacker :status, formatter: proc { |v| statuses[v] } do |parent|
    parent.table[:status]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "status", "title", "updated_at"]
  end
end
