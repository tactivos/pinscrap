require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML:Document for the page we’re interested in...
post "/" do 

	doc = Nokogiri::HTML(open(params.url))

	# Do funky things with it using Nokogiri::XML::Node methods...
	# Search for nodes by css
	content = []
	doc.css('.PinImage.ImgLink').each do |link|
	 	content << "#{link['href']}|"	
	end

	content
end