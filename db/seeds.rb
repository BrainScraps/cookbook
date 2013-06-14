# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

def getdesc(url)
  @en.css("#recipe-intronote").text.gsub(/\s+/, " ")
end

def gettitle(url)
  @en.css("h1").text
end

def magical(array)

  data = {}
  array.each {|url|
      @en = Nokogiri::HTML(open(url))
      data["name"] = gettitle url
      data["description"] = getdesc url
      temp = Recipe.create(data)
      puts "Recipe created for: #{temp.name}"
  }
end

urls = ["http://www.simplyrecipes.com/recipes/carnitas/print/",
         "http://www.simplyrecipes.com/recipes/ham_salad/print/",
         "http://www.simplyrecipes.com/recipes/lasagna/print/",
         "http://www.simplyrecipes.com/recipes/apple_cobbler/print/" ]


if magical(urls)
        @account_sid = 'younaughtymonkey....stoplookingformyaccouninfo'
        @auth_token = 'does your mother know you do this? '

        # set up a client to talk to the Twilio REST API
        @client = Twilio::REST::Client.new(@account_sid, @auth_token)


        @account = @client.account
        @message = @account.sms.messages.create({:from => '+18319204556', :to => '8312108280', :body => 'That stuff with the array of URLs worked! '})



end


