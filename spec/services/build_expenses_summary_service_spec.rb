require 'rails_helper'

RSpec.describe BuildExpensesSummaryService do
  describe '#call' do
    let(:month) { DateTime.current.strftime('%Y-%m') }
    let(:result) { described_class.call(month) }

    context 'when there are expenses' do
      let!(:expense1) { create(:expense, category: 'Food', value: 100.0) }
      let!(:expense2) { create(:expense, category: 'Travel', value: 200.0) }

      it 'returns a summary of all expenses' do
        expect(result).to be_a(ServiceResponse)
        expect(result.success?).to be_truthy
        expect(result.payload[:month]).to eq(month)
        expect(result.payload[:total]).to eq(300.0)
        expect(result.payload[:by_category]).to match_array([
          { category: 'Food', total: 100.0 },
          { category: 'Travel', total: 200.0 }
        ])
      end
    end

    context 'when there are no expenses' do
      it 'returns an empty summary' do
        expect(result).to be_a(ServiceResponse)
        expect(result.success?).to be_truthy
        expect(result.payload[:month]).to eq(month)
        expect(result.payload[:total]).to eq(0.0)
        expect(result.payload[:by_category]).to be_empty
      end
    end

    context 'when an error occurs' do
      it 'returns a failure result' do
        result = described_class.call('2025-15')

        expect(result).to be_a(ServiceResponse)
        expect(result.success?).to be_falsey
        expect(result.errors).to be_present
      end
    end
  end
end
