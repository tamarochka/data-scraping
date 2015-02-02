require 'nokogiri'
require 'open-uri'
require "Pry"


url = 'http://www.amazon.com/46894A-Programmable-Coffeemaker-Frustration-Packaging/product-reviews/B00EI7DPTY/ref=cm_cr_pr_top_link_next_2?ie=UTF8&pageNumber=1'
page = Nokogiri::HTML(open(url))
good_reviews = []
reviews = page.xpath("//tr/td/div/div")

reviews.each do |review|
	if review.content.include? "1.0 out of 5 stars"
		good_reviews << review
	end
end

File.open("reviews.txt", "a") do |i|
	good_reviews.each do |link|
    i.write(link.content)
	end
end
