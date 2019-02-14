        require 'open-uri'
        require 'nokogiri'
class HomeController < ApplicationController
  def chart
    doc = Nokogiri::HTML(open('https://music.bugs.co.kr/chart'))

    melon = Nokogiri::HTML(open('https://www.melon.com/chart/day/index.htm'))
  
    
    i = 1
    j = 0
    
    doc.css('tr').each do |r|
        if (j == 0)
          j += 1
          next
        elsif (i > 100)
          break
        else
          @bugs = Bpost.new
          @bugs.rank = i 
          @bugs.title = "#{r.css('p.title').text}"
          @bugs.artist = "#{r.css('p.artist').text}"
          @bugs.save
         
          i += 1
        end
      end
     
      #멜론부분

    
    i = 1
    j = 1
    
    melon.css('div .wrap_song_info').each do |x|
      if j % 2 == 1
      @melon = Melon.new
      @melon.rank = i 
      @melon.title = "#{x.css('.ellipsis.rank01 a').text}"
      @melon.artist = "#{x.css('.checkEllipsis a').text}"
      @melon.save
      j += 1
      else
        j += 1
        next
      end
      i += 1
    end
    
   
    
  end

  def article
        @img_urls = Array.new 
        @table_hsh = Array.new

        @url ="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=103&oid=015&aid=0003953689"
        @page = Nokogiri::HTML(open(@url), nil, 'EUC-KR')

        @title = @page.search("title").text

        @title_edit = @title.split(':')[0]
        @content = @page.css('#articleBodyContents').text
        @img_urls = @page.css('.end_photo_org img').map{|i| i['src']}

        @table_hsh << {:imgs => @img_urls }
  end

  def login
  end

  def forgot_password
  end

  def navbar
  end

  def register
  end

  def table
    @bugses = Bpost.all
    @melons = Melon.all
  end
end
