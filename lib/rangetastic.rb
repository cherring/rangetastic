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
        if (field(symbol) || @fields.include?(field_to_query))
          make_scope(symbol, field_to_query, *args)
        else
          super
        end
      end
      
      def field(symbol)
        if columns_hash.has_key? on_field(symbol)
          @field = on_field(symbol)
        elsif columns_hash.has_key? at_field(symbol)
          @field = at_field(symbol)
        else
          @field = nil
        end
      end
      
      def at_field(symbol)
        "#{symbol.to_s.gsub("_between","")}_at"
      end
      
      def on_field(symbol)
        "#{symbol.to_s.gsub("_between","")}_on"
      end
      
      def field_to_query
        @field
      end
      
      def make_scope(scope, field, *args)
        named_scope scope, lambda{ |start_date, end_date|
          { :conditions => ["#{field} BETWEEN ? AND ?", start_date, end_date] }
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
