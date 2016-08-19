get '/' do
	erb :index
end

get '/meaning' do
	if request.xhr?
		erb :'_meaning', layout: false
	else
		erb :'_meaning'
	end
end