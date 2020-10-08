require 'nokogiri'
require 'rubocop'
require 'pry'
require 'open-uri'


def get_deputy_url

	page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))

	array_deputy_url =[]

	page.xpath('//tr/td/a').each do |link|
		
		array_deputy_url << link["href"][1..-1]
	end

	#puts array_deputy_url
	return array_deputy_url
end


def get_list_names_email(get_deputy_url)

	array_list_deputy_emails =[]
	array_list_deputy_first =[]
	array_list_deputy_last =[]
	hash_first = {}
	hash_zip = {}
	array_hash_name_emails ={}
	#get_deputy_url.length.

	20.times do |i|
		page2 = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/#{get_deputy_url[i]}"))
		
		email = page2.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
		array_list_deputy_emails << email

		first = page2.xpath('//div[2]/h1').text.split(" ")[1]
		array_list_deputy_first << first

		last = page2.xpath('//div[2]/h1').text.split(" ")[2]
		array_list_deputy_last << last
	end

	hash_zip = array_list_deputy_first.each { |i| hash_first[i] = "first_name"}
	#hash_first = {:first_name => array_list_deputy_first}
	#hash_last = {:last_name =>array_list_deputy_last}
	#hash_email = {:email => array_list_deputy_emails}

	#hash_zip = hash_last.zip(hash_email)
	puts hash_zip(first_name)
end


#def creat_hash
#	array_hash_name_emails = []

#	.each_with_index do |x, y|    #/ on associe pour chaque item de symbols_array un item de prices_array
#        array_hash_name_emails << {x => (get_currencies_price)[y]} #/ on sauvegarde sous forme d'hash dans le tableau
#end
	
#	puts array_list_deputy_emails.length
#	return array_list_deputy_emails




get_deputy_url

get_list_names_email(get_deputy_url)