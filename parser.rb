require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

post "/" do 
	headers 'Access-Control-Allow-Origin' => '*'
	doc = Nokogiri::HTML(open(params.url))

	# Do funky things with it using Nokogiri::XML::Node methods...
	# Search for nodes by css
	content = []
	doc.css('.PinImage.ImgLink').each do |link|
	 	content << "#{link['href']}|"
	end

	content
end