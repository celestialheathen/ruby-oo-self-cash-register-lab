class CashRegister
    attr_accessor :total, :discount, :cart, :current_trans

    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @cart = []
    end 

    def add_item(title, price, quantity=1) 
        self.current_trans = {title: title, price: price, quantity: quantity}
        self.total += price * quantity
        while quantity > 0 
            self.cart << title 
            quantity -= 1 
        end
    end 

    def apply_discount
        if self.discount != 0 
            self.total = self.total * ((100 - self.discount) / 100.0)
            "After the discount, the total comes to $#{self.total.to_i}."

        else 
            "There is no discount to apply."
        end 
    end 

    def items 
        self.cart 
    end

    def void_last_transaction
        self.current_trans[:quantity].times do 
            self.cart.pop
            self.total -= current_trans[:price]
        end 
        if self.cart == nil 
            self.total = 0 
        end 
    end 
end



  