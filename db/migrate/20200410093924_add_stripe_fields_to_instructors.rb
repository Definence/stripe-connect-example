class AddStripeFieldsToInstructors < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :stripe_account_id, :string
    add_column :instructors, :stripe_meta, :json
  end
end
