class AddEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
    add_column :instructors, :email, :string
  end
end
