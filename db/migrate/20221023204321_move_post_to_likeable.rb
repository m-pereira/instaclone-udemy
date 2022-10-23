class MovePostToLikeable < ActiveRecord::Migration[7.0]
  def up
    move = <<~SQL
      UPDATE likes
      SET likeable_id = post_id,
          likeable_type = 'Post'
    SQL

    ActiveRecord::Base.connection.update(move)

    remove_column :likes, :post_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
