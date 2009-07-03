module Rangetastic
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_rangetastic(options = {:fields => []})
      @fields = options[:fields]
      named_scope :between, lambda{ |start_date, end_date, fieldname|
        field = @fields.include?(fieldname) ? fieldname : raise(ActiveRecord::StatementInvalid)
        { :conditions => ["#{field} >= ? AND #{field} <= ?", start_date, end_date] }
      }
    end
    
    private
      def method_missing(symbol, *args, &block)
        if (columns_hash.has_key? field(symbol)) || @fields.has_key?(field(symbol))
          make_scope(symbol, field(symbol), *args)
        else
          super
        end
      end
      
      def field(symbol)
        "#{symbol.to_s.gsub("_between","")}_on"
      end
      
      def make_scope(scope, field, *args)
        named_scope scope, lambda{ |start_date, end_date|
          { :conditions => ["#{field} >= ? AND #{field} <= ?", start_date, end_date] }
        }
        call_scope(scope, *args)
      end
    
      def call_scope(scope, *args)
        self.send(scope, args[0], args[1])
      end
  end
end

ActiveRecord::Base.class_eval do
  include Rangetastic
end
