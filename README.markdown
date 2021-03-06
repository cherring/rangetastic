Introduction
============
Rangetastic allows you to filter results of a named_scope call on any dates using any of a list of whitelisted fields you specify.

Configuration & Usage
=====================

To acheive this you need to install rangetastic, but first install gemcutter and enable it for gems if you haven't already:

    sudo gem install gemcutter
    
    gem tumble

    sudo gem install rangetastic
    
Then inside your environment.rb

    config.gem "rangetastic"
    
Then in your model pass in the fields you wish to allow to be searchable using the between filter

    class Order < ActiveRecord::Base
      acts_as_rangetastic :fields => ["ordered_on", "fulfilled_on"]
    end
    
You can then chain the between scope with any named_scope call you make:

    Order.fulfilled.between(1.week.ago, 10.minutes.ago, "fulfilled_on")

But if you (or someone nasty!) try to use a field that is not whitelisted, it will raise ActiveRecord::StatementInvalid
    
Now you can also access this with the following syntax for any field ending with _on that is on the Model you are calling from like so.

    Order.fulfilled.ordered_between(1.week.ago, 10.minutes.ago)

In this new version of rangetastic you can also query on _at fields. If you have an _at field such as created_at you can now

    Order.fulfilled.created_between(1.week.ago, 10.minutes.ago)
    
However if you have an _on field and _at field the on field will take precedence over the at. If you want to access the _at field over _on field you will need to use the .between and whitelisted fields method specified first.

But if your field isn't on the Model or isn't an _on or an _at field then it will raise the standard NoMethodError.

Thanks to [spraints](http://github.com/spraints) for some inspiration.