class Api::V1::ExpensesController < ApplicationController
  def expenses_summary
    result = BuildExpensesSummaryService.call(params[:month])

    if result.success?
      render json: result.payload
    else
      render json: { error: result.errors }, status: :unprocessable_entity
    end
  end
end
