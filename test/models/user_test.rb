require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "has many shares" do 

    user = User.new 
    share1 = user.shares.new
    share2 = user.shares.new

    assert_equal(user.shares.length, 2)
    assert_equal(user.shares[0], share1)
    assert_equal(user.shares[1], share2)
  end 

  test "has many companies through shares" do 
    
    test_user = User.new 
    new_company = Company.new 
    stock_certificate = Share.new

    test_user.shares << stock_certificate
    new_company.shares << stock_certificate

    assert_equal(test_user.shares.length, 1)
    assert_equal(new_company.shares.length, 1)
    assert_equal(test_user.shares.first.company.symbol, new_company.symbol)
  end 

  test "A user's share has many prices" do 

    user = User.new 
    new_company = Company.new 
    stock_certificate = Share.new 
    price_1 = Price.new
    price_2 = Price.new 

    user.shares << stock_certificate
    new_company.shares << stock_certificate 
    new_company.prices << price_1 
    new_company.prices << price_2 

    assert_equal(user.shares[0].company.prices.length, 2)
    assert_equal(user.shares[0].company.prices[0], price_1)
    assert_equal(user.shares[0].company.prices[1], price_2)
  end 

end
