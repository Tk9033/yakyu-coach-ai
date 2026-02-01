class CreateAiResults < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_results do |t|
      t.string :term, null: false
      t.string :level, null: false
      t.text :description, null: false
      t.json :related_terms

      t.timestamps
    end

    add_index :ai_results, [:term, :level], unique: true
  end
end