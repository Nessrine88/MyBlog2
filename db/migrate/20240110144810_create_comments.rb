class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :userId
      t.integer :postId
      t.text :text

      t.timestamps
    end
  end
end
