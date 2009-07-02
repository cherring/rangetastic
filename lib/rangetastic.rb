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
    
    def method_missing(symbol, *args, &block)
      if self.new.attributes.has_key? field(symbol)
        make_scope(symbol, field(symbol))
        call_scope(symbol, *args)
      else
        super
      end
    end
    
    def field(symbol)
      "#{symbol.to_s.gsub("_between","")}_on"
    end
    
    def make_scope(scope, field)
      named_scope scope, lambda{ |start_date, end_date|
        { :conditions => ["#{field} >= ? AND #{field} <= ?", start_date, end_date] }
      }
    end
    
    def call_scope(scope, *args)
      self.send(scope, args[0], args[1])
    end
  end
end

ActiveRecord::Base.class_eval do
  include Rangetastic
end
