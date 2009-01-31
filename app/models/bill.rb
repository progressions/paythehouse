class Bill < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  
  has_many :assignments
  belongs_to :payee, :class_name => "User", :foreign_key => "payee_id"
  
  def amount= dollars
    update_attribute(:amount_in_cents, Money.new(dollars.to_f).cents)
  end
  
  def self.sum_in_dollars
    Money.new(self.sum(:amount_in_cents)/100.0)
  end
  
  def assignment_attributes=(assignment_attributes)
    assignment_attributes.each do |attributes|
      assignments.build(attributes)
    end
  end
end
