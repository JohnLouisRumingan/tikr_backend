require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  
  test "a company's stock has many prices" do 

    company = Company.new 
    price_1 = Price.new
    price_2 = Price.new

    company.prices << price_1
    company.prices << price_2

    assert_equal(company.prices.length, 2)
    assert_equal(company.prices[0], price_1)
    assert_equal(company.prices[1], price_2)
  end 
end
