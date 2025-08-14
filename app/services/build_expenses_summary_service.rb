class BuildExpensesSummaryService < ApplicationService
  def initialize(month)
    @month = month
  end

  def call
    return ServiceResponse.new(errors: ['Invalid date']) unless @month.present?

    parsed_date = DateTime.parse("#{@month}-01")
    expenses = Expense.by_month(parsed_date)
    by_category = expenses.group(:category).sum(:value).map { |k, v| { category: k, total: v } }

    result = {
      month: @month,
      total: expenses.sum(:value),
      by_category: by_category
    }

    ServiceResponse.new(payload: result)
  rescue StandardError => e
    ServiceResponse.new(errors: [e.message])
  end
end
