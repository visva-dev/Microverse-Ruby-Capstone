require 'nokogiri'
require 'open-uri'

class GetInfo
  def conect_to_page
    doc = Nokogiri::HTML(URI.open('https://www.info.lt/rubrika/Advokatai/100209472'))
  end
  
  def lawyer_name
    conect_to_page.css('//div.row//div.info//div.pavadinimas_pirmumas//a',
                       '//div.row//div.info//div.pavadinimas//a').each do |link|
      puts lawyer = link.content
    end
  end
  
  def working_time
    conect_to_page.css('//div.kontaktai//div.work-time-now').each do |link|
      puts working_time = link.content
    end
  end
  
  def phone_number
    conect_to_page.css('//div.kontaktai//div.telefonas').each do |link|
      puts mobile_phone = link.content
    end
  end
  
  def website_link
    conect_to_page.css('//div.kontaktai//div.tinklalapis//a').each do |link|
      puts website = link['href']
    end
  end
  
  def lawyer_address
    conect_to_page.css('//div.kontaktai//span.adresas-nuoroda').each do |link|
      puts address = link.content
    end
  end
end

# launch = Launcher.new
# launch.hello