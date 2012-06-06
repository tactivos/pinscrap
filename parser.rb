require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML:Document for the page we’re interested in...
get "/" do 
	doc = Nokogiri::HTML(open('http://pinterest.com/patojutard/gadgets-i-want/'))

	# Do funky things with it using Nokogiri::XML::Node methods...
	# Search for nodes by css
	content = []
	doc.css('.PinImage.ImgLink').each do |link|
	 	content << "http://pinterest.com#{link['href']}|"	
	end

	content
end