class AddUserToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user, :string
    remove_column :posts, :author
  end
end
