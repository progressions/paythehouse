class Payment < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  
  belongs_to :payee, :class_name => "User", :foreign_key => "payee_id"
  
  def amount= dollars
    update_attribute(:amount_in_cents, Money.new(dollars.to_f).cents)
  end
end
