class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :amount_in_cents
      t.integer :user_id
      t.integer :payee_id
      t.string :note
      t.timestamps
    end
  end
  
  def self.down
    drop_table :payments
  end
end
