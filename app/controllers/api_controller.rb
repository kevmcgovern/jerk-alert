# require_relative '../models/api_model.rb'

# demo_text = "The Alabama Shakes show last night was absolutely awesome! Such an incredible show!"

# alchemyapi = AlchemyAPI.new()

# puts "Making calls on: " + demo_text

# response = alchemyapi.sentiment_targeted('text', demo_text, 'Alabama Shakes')

# if response['status'] == 'OK'
# 	puts 'We gucci. Response object inbound'
# 	puts JSON.pretty_generate(response)

# 	puts "Targeted sentiment analysis forthcoming"
# 	puts "type: " + response['docSentiment']['type']

# 	if response['docSentiment'].key?('score')
# 		puts 'score: ' + response['docSentiment']['score']
# 	end

# else
# 	puts "You done fucked up! " + response['statusInfo']
# 	puts response
# end

post '/posts' do
	redirect '/'
end