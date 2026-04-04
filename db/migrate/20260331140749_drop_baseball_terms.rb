class DropBaseballTerms < ActiveRecord::Migration[7.1]
  def change
    drop_table :baseball_terms
  end
end