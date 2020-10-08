require_relative '../lib/dark_trader.rb'

describe "The scrapper collect symbols and values of cryptocurrencies" do
  it "should check if the method does not gives an empty array" do
    expect(create_hash("BTC","EOS")).not_to be_empty
  end
end