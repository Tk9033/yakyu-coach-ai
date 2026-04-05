class DropPosts < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/ReversibleMigration
    drop_table :posts
    # rubocop:enable Rails/ReversibleMigration
  end
end
