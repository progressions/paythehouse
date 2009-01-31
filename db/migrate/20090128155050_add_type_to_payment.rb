class AddTypeToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :type, :string
  end

  def self.down
    remove_column :payments, :type
  end
end
