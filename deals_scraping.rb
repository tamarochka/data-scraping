require 'mechanize'
require "csv"
require "pry"
deal_name = "Hair"

url = "https://www.livingsocial.com/cities/2-boston"
@deal_titles = []
agent = Mechanize.new
page = agent.get(url)
@deals = page.search(".deal-tile")
@deals.each do |deal|
	@deal_titles << {:name => deal.search("h3").text, :id => deal.attributes["data-dealid"].text}
end

File.open("deals.txt", "a") do |i|
	@deal_titles.each do |link|
    i.write(link)
	end
end

@selected_deals = @deal_titles.select { |h| h[:name].split.include?(deal_name) }
puts @selected_deals
