# require_relative '../models/api_model.rb'

post '/posts/sentiment' do
  @user = current_user
  @post = Post.new(params[:post])
  analysis = sentiment_query(@post.body)
  @post.update(analysis: sentiment_parse(analysis))
  if request.xhr?
    if @post.save
      status 200
      analysis = eval(@post.analysis)
      erb :'posts/_new-sent', layout: false, locals: { post: @post, analysis: analysis }
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
  if request.xhr?
    if @post.save
      status 200
      analysis = eval(@post.analysis)
      erb :'posts/_new-emo', layout: false, locals: { post: @post, analysis: analysis }
    else
      status 422
      @errors = @post.errors.full_messages
    end
  else
    redirect '/posts'
  end
end

post '/posts/targeted-sentiment' do
  @user = current_user
  @post = Post.new(params[:post])
  analysis = targeted_sentiment_query(@post.body, @post.target)
  @post.update(analysis: targeted_sentiment_parse(analysis))
  if request.xhr?
    if @post.save
      status 200
      analysis = eval(@post.analysis)
      erb :'posts/_new-targ', layout: false, locals: {post: @post, analysis: analysis}
    else
      status 422
      @errors = @post.errors.full_messages
    end
  else
    redirect '/posts'
  end
end

# post '/posts' do
#   redirect '/'
# end
