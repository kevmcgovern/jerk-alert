# require_relative '../models/api_model.rb'

post '/posts/sentiment' do
  @user = current_user
  @post = Post.new(params[:post])
  analysis = sentiment_query(@post.body)
  @post.update(analysis: sentiment_parse(analysis))
  if request.xhr?
    if @post.save
      status 200
      erb :'posts/_new', layout: false, locals: { post: @post }
    else
      status 422
      @errors = @post.errors.full_messages
    end
  else
  	redirect '/posts'
  end
end

post '/posts/emotion' do
  @user = current_user
  @post = Post.new(params[:post])
  analysis = emotion_query(@post.body)
  @post.update(analysis: emotion_parse(analysis))
  if @post.save
    redirect '/posts'
  else
    redirect '/posts/new'
  end
end

# post '/posts' do
# 	redirect '/'
# end
