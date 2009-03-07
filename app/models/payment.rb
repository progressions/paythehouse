class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :payee, :class_name => "User", :foreign_key => "payee_id"
  
  validates_presence_of :user
  
  def amount= dollars
    dollars = dollars.to_s.gsub(/^\$/, "")
    update_attribute(:amount_in_cents, Money.new(dollars.to_f).cents)
  end
  
  def self.sum_in_dollars
    Money.new(self.sum(:amount_in_cents)/100.0)
  end
end
