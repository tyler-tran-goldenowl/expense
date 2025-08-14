class Expense < ApplicationRecord
  scope :by_month, ->(month) { where(created_at: month.beginning_of_month..month.end_of_month) }
end
