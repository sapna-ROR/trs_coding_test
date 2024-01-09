require 'json'
require_relative 'lib/coffee_app'  # Adjust the relative path based on your project structure

task :default => [:run]

desc "load the prices, order, payments, and execute it all!"
task "run" do
  app = CoffeeApp.new
  app.load_data
  app.calculate_total_cost
  app.calculate_total_payment
  app.calculate_amount_owed
  app.display_user_orders
  result_json = app.generate_output

  # Parse the JSON result back into a Ruby structure
  result = JSON.parse(result_json)

  # Pretty print the output
  puts "Total:"
  puts sprintf("%-10s%-11s%-11s%-11s", "user", "drink", "size", "total_cost")
  puts sprintf("--------")
  result['orders'].each do |order|
    puts sprintf("%-10s%-11s%-11s%-11.2f", order['user'], order['drink'], order['size'], order['total_cost'])
  end

  puts "Payments:"
  puts sprintf("%-10s%-11s", "user", "amount")
  puts sprintf("--------")
  result['payments'].each do |user, amount|
    puts sprintf("%-10s%-11.2f", user, amount)
  end

  puts "Owed:"
  puts sprintf("%-10s%-11s", "user", "amount_owed")
  puts sprintf("--------")
  result['owed'].each do |user, amount|
    puts sprintf("%-10s%-11.2f", user, amount)
  end
end
