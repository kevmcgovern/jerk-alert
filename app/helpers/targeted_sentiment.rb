require_relative '../models/api_model.rb'



def alchemy_query(query_text, query_target)
  alchemyapi = AlchemyAPI.new()

  puts "Making calls "

  response = alchemyapi.sentiment_targeted('text', query_text, query_target)

  if response['status'] == 'OK'
    puts 'All clear. Response object inbound'
    puts JSON.pretty_generate(response)

    puts "Targeted sentiment analysis forthcoming"
    puts "type: " + response['docSentiment']['type']

    if response['docSentiment'].key?('score')
      puts 'score: ' + response['docSentiment']['score']
    end

  else
    puts "That was an invalid request: " + response['statusInfo']
    puts response
  end
end
