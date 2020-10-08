require 'nokogiri'
require 'rubocop'
require 'pry'
require 'open-uri'


def get_single_email
	page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))

	single_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

	puts single_email
	return single_email
end

def get_townhalls_url

	page2 = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

	array_townhalls_url =[]

	page2.xpath('//p/a[@class="lientxt"]').each do |link|
		
		array_townhalls_url << link["href"][1..-1]
	end

	#puts array_townhalls_url
	return array_townhalls_url
end


def get_list_email(get_townhalls_url)

	array_list_townhalls_emails =[]

	get_townhalls_url.length.times do |i|
		page3 = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{get_townhalls_url[i]}"))
		email = page3.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
		array_list_townhalls_emails << email
	end

	puts array_list_townhalls_emails
	return array_list_townhalls_emails

end

get_single_email

get_list_email(get_townhalls_url)

