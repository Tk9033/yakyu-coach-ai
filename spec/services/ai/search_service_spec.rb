require "rails_helper"

RSpec.describe Ai::SearchService do
  describe "#call" do
    let(:term) { "スライダー" }
    let(:level) { "beginner" }

    before do
      allow(Ai::OpenaiClient).to receive(:call).and_return(
        {
          description: <<~TEXT
            これは解説です
            {"related_terms":["カーブ","ストレート"]}
          TEXT
        }
      )
    end

    it "解説文を表示" do
      result = described_class.new(term: term, level: level).call

      expect(result[:description]).to eq("これは解説です")
    end

    it "関連用語を表示" do
      result = described_class.new(term: term, level: level).call

      expect(result[:related_terms]).to include("カーブ")
    end
  end
end