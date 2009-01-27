class Payment < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  
  def amount= dollars
    cents = dollars * 100
    update_attribute(:amount_in_cents, cents)
  end
  
  def amount
    cents_to_dollars(amount_in_cents)
  end
  
  def self.sum_in_dollars
    sum(:amount_in_cents)
  end
  
  def dollars_to_cents dollars
    dollars * 100
  end
  
  def cents_to_dollars cents
    return 0 unless cents
    cents / 100
  end
end
