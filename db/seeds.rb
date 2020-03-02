# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'
require 'pry'


# User.destroy_all
# Company.destroy_all
# Price.destroy_all

# jl = User.create(name: 'John-Louis', organization: 'Flatiron')
# paul = User.create(name: 'Paul', organization: 'Flatiron')
# ann = User.create(name: 'Ann', organization: 'Flatiron')

#apple_hash["Meta Data"] can be used to get the symbol and last-refreshed (if needed)
#apple_hash["Time Series (Daily)"] can be used to get the hashes via dates
#e.g. apple_hash["Time Series (Daily)"]["2020-02-28"]
#so will have to make a function that sorts through dates
#apple_hash["Time Series (Daily)"]["2020-02-28"]["1. open"] replace with: "2. high" "3. low" "4. close" "5. volume"
api_key = Rails.application.credentials.tikr_app[:api_key] 


def getResponse(ticker, key)
    
    return RestClient.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{ticker}&apikey=#{key}")
end 

def addPricingData(hash)
    
    symbol_name = hash["Meta Data"]["2. Symbol"]
    
    new_company = Company.create(symbol: symbol_name)
    
    hash["Time Series (Daily)"].each do |date, price_data|
        
        open_price = price_data["1. open"]
        high_price = price_data["2. high"]
        low_price = price_data["3. low"]
        close_price = price_data["4. close"]
        volume = price_data["5. volume"]
        
        new_price = Price.create(company_id: new_company.id, date: date, open_price: open_price, high_price: high_price, low_price: low_price, close_price: close_price, volume: volume)
    end 
end 

# companies already seeded (API hit limitations): AAPL, MSFT, COST, NVDA, WMT
#place any stock name in the string below:

# stock = getResponse('', api_key)
# stock_hash = JSON.parse(stock)
# addPricingData(stock_hash)


#need to seed some associations between users and companies to create shares 

def randomCompany()

    randNum = rand(0...Company.all.length)
    randomCompany = Company.all[randNum]
end 

def randomPurchaseDateForShares(company)

    #gets random date from all the stock prices available for this company
    return random_date = company.prices[rand(0...company.prices.length)].date
end 

def createShares(user)

    stock_certificate = Share.new
    new_company = randomCompany()
    purchase_date = randomPurchaseDateForShares(new_company)
    stock_certificate.user = user 
    stock_certificate.company = new_company
    stock_certificate.purchase_date = purchase_date
    stock_certificate.save  
end 


# for a in 1..6 do 
    
#     createShares(User.third)
# end 