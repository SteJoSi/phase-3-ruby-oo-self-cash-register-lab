require 'pry'

class CashRegister
    attr_accessor  :total 
    attr_reader :discount, :items
    attr_writer :last_price

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_price = 0
    end

    def add_item(title, price, quantity=1)
        quantity.times do 
            self.items << title
        end
        last_price = price * quantity

        self.total += price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.discount.to_f / 100) * self.total
                "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_price
    end
end

# binding.pry
# learn test --f-f