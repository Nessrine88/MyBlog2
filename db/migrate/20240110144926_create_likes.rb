class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.integer :userId
      t.integer :postId

      t.timestamps
    end
  end
end
