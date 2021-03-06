class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.integer :amount_in_cents
      t.integer :user_id
      t.integer :payee_id
      t.string :note
      t.datetime :date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :bills
  end
end
