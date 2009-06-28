module Rangetastic
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_rangetastic(options = {:fields => []})
      named_scope :between, lambda{ |start_date, end_date, fieldname|
        field = options[:fields].include?(fieldname) ? fieldname : raise(ActiveRecord::StatementInvalid)
        { :conditions => ["#{field} >= ? AND #{field} <= ?", start_date, end_date] }
      }
    end
  end
end

ActiveRecord::Base.class_eval do
  include Rangetastic
end


# @@valid_fields = %w(referred_on commenced_on created_at updated_at)
# 
# named_scope :between, lambda{ |start_date, end_date, field_name|
#   field = (@@valid_fields.include?(field_name)) ? (field_name) : raise(ActiveRecord::StatementInvalid)
#   {  :conditions => ["#{field} >= ? AND #{field} <= ?",  start_date, end_date]}
# }