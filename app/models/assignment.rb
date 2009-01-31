class Assignment < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  
  belongs_to :bill
  belongs_to :payee, :class_name => "User", :foreign_key => "payee_id"
  
  def amount= dollars
    dollars.gsub!(/^\$/, "")
    update_attribute(:amount_in_cents, Money.new(dollars.to_f).cents)
  end
  
  def self.sum_in_dollars
    Money.new(self.sum(:amount_in_cents)/100.0)
  end
  
end