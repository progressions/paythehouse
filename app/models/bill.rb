class Bill < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  
  validates_associated :assignments
  validate :validate_assignments
  
  has_many :assignments
  belongs_to :payee, :class_name => "User", :foreign_key => "payee_id"
  
  def amount= dollars
    dollars.gsub!(/^\$/, "")
    self[:amount_in_cents] = Money.new(dollars).cents
  end
  
  def self.sum_in_dollars
    Money.new(self.sum(:amount_in_cents)/100.0)
  end
  
  def assignment_attributes=(assignment_attributes)
    assignment_attributes.each do |attributes|
      assignments.build(attributes)
    end
  end
  
  # value of assignments amounts must total the amount of the bill 
  def validate_assignments
    assignments.sum(:amount_in_cents) == self[:amount_in_cents]
  end
end
