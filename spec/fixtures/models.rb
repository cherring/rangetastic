class Order < ActiveRecord::Base

  acts_as_rangetastic #:fields => ["fulfilled_on","ordered_on","shipped_on"]
  
  named_scope :fulfilled, :conditions => ["fulfilled_on is not null"]
  
end