require 'nokogiri'
require 'rubocop'
require 'pry'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


def get_currencies_symbol(page)
	list_currencies_symbol =[]

	page.xpath('//td[3]').each do |symbol|
		
		list_currencies_symbol << symbol.text
	end

	#puts list_currencies_symbol.length
	return list_currencies_symbol
end

def get_currencies_price(page)
	list_currencies_price =[]

	page.xpath('//td[5]/a').each do |price|
		
		list_currencies_price << price.text.delete("$,").to_f
	end

	#puts list_currencies_price.length
	return list_currencies_price
end

def create_hash(get_currencies_symbol,get_currencies_price)

	array_currencies_symbol_price = []

	get_currencies_symbol.each_with_index do |x, y|    #/ on associe pour chaque item de symbols_array un item de prices_array
        array_currencies_symbol_price << {x => (get_currencies_price)[y]} #/ on sauvegarde sous forme d'hash dans le tableau
    end

	puts array_currencies_symbol_price

	return array_currencies_symbol_price
end

create_hash(get_currencies_symbol(page),get_currencies_price(page))