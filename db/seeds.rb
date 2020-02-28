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


User.destroy_all

jl = User.create(name: 'John-Louis', organization: 'Flatiron')
paul = User.create(name: 'Paul', organization: 'Flatiron')
ann = User.create(name: 'Ann', organization: 'Flatiron')

api_key = Rails.application.credentials.tikr_app[:api_key] 

def getResponse(ticker, key)

    return RestClient.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=#{ticker}&apikey=#{key}")
end 

apple = getResponse('AAPL', api_key)
apple_hash = JSON.parse(apple)

#apple_hash["Meta data"] can be used to get the symbol and last-refreshed (if needed)
#apple_hash["Time Series (Daily)"] can be used to get the hashes via dates
#e.g. apple_hash["Time Series (Daily)"]["2020-02-28"]
#so will have to make a function that sorts through dates
#apple_hash["Time Series (Daily)"]["2020-02-28"]["1. open"] replace with: "2. high" "3. low" "4. close" "5. volume"


binding.pry 