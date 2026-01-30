class CreateBaseballTerms < ActiveRecord::Migration[7.1]
  def change
    create_table :baseball_terms do |t|
      t.string :name

      t.timestamps
    end

    add_index :baseball_terms, :name
  end
end
