class CreateAiResults < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_results do |t|
      t.string :term
      t.string :level
      t.text :description
      t.json :related_terms

      t.timestamps
    end

  end
end
