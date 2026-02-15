require "rails_helper"

# 内部処理

RSpec.describe Ai::SearchService do
  describe "解説を生成する処理" do
    let(:term) { "スライダー" }
    let(:level) { "beginner" }

    let(:result) do
      described_class.new(term: term, level: level).call
    end

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

    it "解説文を返す" do
      expect(result[:description].strip).to eq("これは解説です")
    end

    it "関連用語を返す" do
      expect(result[:related_terms]).to include("カーブ")
    end
  end
end