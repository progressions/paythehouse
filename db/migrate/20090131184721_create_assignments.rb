class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :amount_in_cents
      t.integer :user_id
      t.integer :payee_id
      t.integer :bill_id
      t.string :note
      t.timestamps
    end
  end
  
  def self.down
    drop_table :assignments
  end
end
