require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'rest_client'
require 'cgi'
require 'rubygems'

uri = URI(URI.encode('http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=103&oid=015&aid=0003953689'))

req = Net::HTTP::Get.new(uri)
req['X-Naver-Client_Id'] = "yBbYMfZiLcGXkrXc_Npp"
req['X-Naver-Client_Secret'] = "kvzlfGVfKl"

res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https'){|http|
    http.request(req)
}

xml_doc = Nokogiri::XML(res.body)

links = xml_doc.xpath("//link")

links.each do |l|
    puts l.inner_text
end



