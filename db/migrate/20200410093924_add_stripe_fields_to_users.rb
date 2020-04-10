class AddStripeFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_user_id, :string
    add_column :users, :stripe_meta, :json
  end
end
