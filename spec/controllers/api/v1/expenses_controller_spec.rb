require 'rails_helper'

RSpec.describe Api::V1::ExpensesController do
  describe 'GET /expenses_summary' do
    it 'returns a summary of expenses for the given month' do
      get :expenses_summary, params: { month: '2023-03' }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).keys).to eq(%w[month total by_category])
    end

    it 'returns error status for invalid month' do
      get :expenses_summary, params: { month: '2025-15' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to include('invalid date')
    end
  end
end
