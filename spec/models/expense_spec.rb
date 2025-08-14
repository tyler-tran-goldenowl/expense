require 'rails_helper'

RSpec.describe Expense, type: :model do
  # scopes
  describe '.by_month' do
    it 'returns expenses for the given month' do
      date = DateTime.parse('2023-01-01')
      expense1 = create(:expense, created_at: date + 1.week)
      expense2 = create(:expense, created_at: date + 2.weeks)
      expense3 = create(:expense, created_at: date + 1.month)

      result = Expense.by_month(date)

      expect(result).to include(expense1, expense2)
      expect(result).not_to include(expense3)
    end
  end
end
