# Put your code here!
require 'json'

class CoffeeApp
  def initialize
    @prices = {}
    @orders = []
    @payments = []
    @owed = {}
    @user_amounts = {}
  end

  def load_data
    prices_data = File.expand_path('../../data/prices.json', __FILE__)
    @prices = JSON.parse(File.read(prices_data))
    orders_data = File.expand_path('../../data/orders.json', __FILE__)
    @orders = JSON.parse(File.read(orders_data))
    payments_data = File.expand_path('../../data/payments.json', __FILE__)
    @payments = JSON.parse(File.read(payments_data))
  end

  def calculate_total_cost
    @orders.each do |order|
      drink = order['drink']
      size = order['size']

      price = @prices.find { |item| item['drink_name'] == drink }
      next unless price

      beverage_prices = price['prices']
      beverage_price = beverage_prices[size]

      next unless beverage_price

      order['total_cost'] = beverage_price
    end
  end

  def calculate_total_payment
    @payments.each do |payment|
      user = payment['user']
      amount = payment['amount']

      @user_amounts[user] ||= 0
      @user_amounts[user] += amount
    end
  end

  def calculate_amount_owed
    @orders.each do |order|
      user = order['user']
      total_cost = order['total_cost'] || 0

      total_payment = @user_amounts[user] || 0
      amount_owed = total_cost - total_payment
      @owed[user] = amount_owed
    end
  end

  def display_user_orders
    @orders.each do |order|
      user = order['user']
      drink = order['drink']
      size = order['size']
      total_cost = order['total_cost'] || 0

      puts "#{user}'s Order:"
      puts "#{drink} (Size: #{size})"
      puts "Total Cost: $#{total_cost}"
      puts "---"
    end
  end

  def generate_output
    result = { 'orders' => @orders, 'payments' => @user_amounts, 'owed' => @owed }
    JSON.generate(result)
  end
end

# Main program
app = CoffeeApp.new
app.load_data
app.calculate_total_cost
app.calculate_total_payment
app.calculate_amount_owed
app.display_user_orders
puts app.generate_output
