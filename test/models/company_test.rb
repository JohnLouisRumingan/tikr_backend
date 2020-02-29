require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  
  test "company has many owners (users) through shares" do 
    
    test_user = User.new 
    new_company = Company.new 
    stock_certificate = Share.new

    test_user.shares << stock_certificate
    new_company.shares << stock_certificate

    assert_equal(test_user.shares.length, 1)
    assert_equal(new_company.shares.length, 1)
    assert_equal(test_user.shares.first.company.symbol, new_company.symbol)
  end 

  
end
