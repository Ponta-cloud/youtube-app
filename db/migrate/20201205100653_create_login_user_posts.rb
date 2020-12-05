class CreateLoginUserPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :login_user_posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
