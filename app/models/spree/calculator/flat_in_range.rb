module Spree
  class Calculator::FlatInRange < Calculator

    preference :verwenden,        :boolean, :default => false
    preference :lower_boundry,    :decimal, :default => 0.0
    preference :upper_boundry,    :decimal, :default => 50.0
    preference :amount,           :decimal, :default => 5.0

    preference :verwenden2,        :boolean, :default => false
    preference :lower_boundry2,    :decimal, :default => 50.01
    preference :upper_boundry2,    :decimal, :default => 100.0
    preference :amount2,           :decimal, :default => 3.0

    preference :verwenden3,        :boolean, :default => false
    preference :lower_boundry3,    :decimal, :default => 100.01
    preference :upper_boundry3,    :decimal, :default => 150.0
    preference :amount3,           :decimal, :default => 1.0

    preference :verwenden4,        :boolean, :default => false
    preference :lower_boundry4,    :decimal, :default => 150.01
    preference :upper_boundry4,    :decimal, :default => 100000000.0
    preference :amount4,           :decimal, :default => 0.0


    attr_accessible :preferred_verwenden, :preferred_verwenden2, :preferred_verwenden3, :preferred_verwenden4, :preferred_lower_boundry, :preferred_upper_boundry, :preferred_amount, :preferred_lower_boundry2, :preferred_upper_boundry2, :preferred_amount2, :preferred_lower_boundry3, :preferred_upper_boundry3, :preferred_amount3, :preferred_lower_boundry4, :preferred_upper_boundry4, :preferred_amount4


    def self.description
      I18n.t(:flat_in_range)
    end

    def compute(object)
      sum = 0
      item_total = object.line_items.map(&:amount).sum
      if (self.preferred_verwenden && (item_total >= self.preferred_lower_boundry && item_total <= self.preferred_upper_boundry))
        return self.preferred_amount
      elsif (self.preferred_verwenden2 &&(item_total >= self.preferred_lower_boundry2 && item_total <= self.preferred_upper_boundry2))
        return self.preferred_amount2
      elsif (self.preferred_verwenden3 &&(item_total >= self.preferred_lower_boundry3 && item_total <= self.preferred_upper_boundry3))
        return self.preferred_amount3
      elsif (self.preferred_verwenden4 &&(item_total >= self.preferred_lower_boundry4 && item_total <= self.preferred_upper_boundry4))
        return self.preferred_amount4
      else
        return 6.0
      end
    end
  end
end
