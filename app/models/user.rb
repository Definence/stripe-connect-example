class User < ApplicationRecord
  has_many :trainings

  after_commit :assign_customer_id, on: :create

  private

  def assign_customer_id
    ext_customer = Stripe::Customer.create(email: email, name: name)
    self.stripe_customer_id = ext_customer.id
  end
end
