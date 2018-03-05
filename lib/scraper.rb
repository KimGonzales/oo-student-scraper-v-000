require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

     doc.css('.student-card').collect do |student|
      {:name => student.css('h4').text, :location => student.css('p').text, :profile_url => student.css('a')[0]['href']}
    end
  end

  def self.scrape_profile_page(profile_url)
    student = {}

    html = open(profile_url)
    doc = Nokogiri::HTML(html)

    student[:bio] = doc.css('p').text
    student[:profile_quote] = doc.css(".profile-quote").text

    social_node = doc.css('.social-icon-container a')
    links = social_node.map{|element| element['href']}

    links.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      else
        student[:blog] = link
      end
    end
    student
=======
    my_hash = doc.css('.student-card').collect do |student|
      {:name => student.css('h4').text,
      :location => student.css('p').text,
      :profile_url =>  doc.css('.student-card').first.css('a')[0]['href']}
    end
    #student name? = doc.css('.student-card').first.css('h4').text TRUE
    #student location? = doc.css('.student-card').first.css TRUE
    #student profile_url?  = doc.css('.student-card').first.css('a')[0]['href'] TRUE



  end

  def self.scrape_profile_page(profile_url)

>>>>>>> ee21bad655f2196bfb55430efc0d6f526a173d38
  end

end
