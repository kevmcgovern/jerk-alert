# require_relative '../models/api_model.rb'

post '/posts' do
	@user = current_user
	@post = Post.new(params[:post])
	analysis = sentiment_query(@post.body)
	@post.update(analysis: sentiment_parse(analysis))
	if @post.save
		status 200
		redirect '/posts'
	else
		@errors = @post.errors.full_messages
	end
end

# post '/posts' do
# 	redirect '/'
# end