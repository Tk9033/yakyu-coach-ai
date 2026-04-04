class DropBaseballTerms < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/ReversibleMigration
    drop_table :baseball_terms
    # rubocop:enable Rails/ReversibleMigration
  end
end