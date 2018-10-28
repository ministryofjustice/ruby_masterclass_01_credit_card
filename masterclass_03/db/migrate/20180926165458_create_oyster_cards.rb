class CreateOysterCards < ActiveRecord::Migration[5.2]
  def change
    create_table :oyster_cards do |t|
      t.integer :user_id
      t.integer :balance

      t.timestamps
    end
  end
end
