class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.belongs_to :user
      t.belongs_to :instructor
      t.timestamps
    end
  end
end
