require 'spec_helper'
require 'coffee_app'

RSpec.describe CoffeeApp do
  let(:prices_json) {
    <<-JSON
      [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
    JSON
  }

  let(:orders_json) {
    <<-JSON
      [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    JSON
  }

  let(:payments_json) {
    <<-JSON
      [
        { "user": "coach", "amount": 2.50 },
        { "user": "ellis", "amount": 2.60 },
        { "user": "rochelle", "amount": 4.50 },
        { "user": "ellis", "amount": 0.65 }
      ]
    JSON
  }

  let(:expected_result_json) {
    <<-JSON
      [
        { "user": "coach",    "order_total": 8.00, "payment_total": 2.50, "balance": 5.50 },
        { "user": "ellis",    "order_total": 3.25, "payment_total": 3.25, "balance": 0.00 },
        { "user": "rochelle", "order_total": 4.50, "payment_total": 4.50, "balance": 0.00 },
        { "user": "zoey",     "order_total": 6.53, "payment_total": 0.00, "balance": 6.53 }
      ]
    JSON
  }

  before do
    allow(File).to receive(:read).with(/prices\.json/).and_return(prices_json)
    allow(File).to receive(:read).with(/orders\.json/).and_return(orders_json)
    allow(File).to receive(:read).with(/payments\.json/).and_return(payments_json)
  end

  subject(:app) { CoffeeApp.new }

  describe "#load_data" do
    it "loads the prices, orders, and payments data" do
      expect { app.load_data }.not_to raise_error
      expect(app.instance_variable_get(:@prices)).not_to be_empty
      expect(app.instance_variable_get(:@orders)).not_to be_empty
      expect(app.instance_variable_get(:@payments)).not_to be_empty
    end
  end

  describe "#calculate_total_cost" do
    before { app.load_data }

    it "calculates the total cost for each order" do
      app.calculate_total_cost

      expect(app.instance_variable_get(:@orders)).to all(have_key("total_cost"))
    end
  end

  describe "#calculate_total_payment" do
    before { app.load_data }

    it "calculates the total payment for each user" do
      app.calculate_total_payment

      expect(app.instance_variable_get(:@user_amounts)).not_to be_empty
    end
  end

  describe "#calculate_amount_owed" do
    before do
      app.load_data
      app.calculate_total_cost
      app.calculate_total_payment
    end

    it "calculates the amount owed for each user" do
      app.calculate_amount_owed

      expect(app.instance_variable_get(:@owed)).not_to be_empty
    end
  end

  describe "#display_user_orders" do
    before { app.load_data }

    it "displays the user orders" do
      expect { app.display_user_orders }.to output.to_stdout
    end
  end
end
