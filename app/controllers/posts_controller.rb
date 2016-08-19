# Posts INDEX
get '/posts/' do
  @user = current_user
  @posts = @user.posts
  erb :'posts/index'
end


# Posts NEW
get '/posts/new/sentiment' do
  if current_user
    @user = current_user
    if request.xhr?
      erb :'posts/_sentiment', layout: false, locals: { user: @user }
      # Ajax this?
    else
      erb :'posts/new'
    end
  else
    @errors = "You must be logged in to do that."
    erb :'posts/_error', layout: false
  end
end

get '/posts/new/emotion' do
  if current_user
    @user = current_user
    if request.xhr?
      erb :'posts/_emotion', layout: false, locals: { user: @user }
    else
      erb :'posts/new'
    end
  else
    if request.xhr?
      @errors = "You must be logged in to do that."
      erb :'posts/_error', layout: false
    end
  end
end


get '/posts/new/targeted-sentiment' do
  if current_user
    @user = current_user
    if request.xhr?
      erb :'posts/_targeted-sentiment', layout: false, locals: { user: @user }
    else
      erb :'posts/new'
    end
  else
    if request.xhr?
      @errors = "You must be logged in to do that."
      erb :'posts/_error', layout: false
    end
  end
end



get '/posts/new' do
  @user = current_user
  erb :'posts/new'
end


# Posts SHOW
get '/posts/:id' do
  @user = current_user
  @post = Post.find(params[:id])
  erb :'posts/show'
end


# Potentially superfluous routes for event listeners/ajax
get '/posts/sentiment/explanation' do
  if request.xhr?
    erb :'posts/_sentiment-details', layout: false
  else
    redirect '/'
  end
end


get '/posts/emotion/explanation' do
  if request.xhr?
    erb :'posts/_emotion-details', layout: false
  else
    redirect '/'
  end
end


get '/posts/targeted-sentiment/explanation' do
  if request.xhr?
    erb :'posts/_targeted-sentiment-details', layout: false
  else
    redirect '/'
  end
end

# Jerk Alert Suggestion Routes
# get '/posts/sentiment/suggestion' do
#   if request.xhr?
#     erb :'posts/_suggestion-sent', layout: false
#   else
#     redirect '/'
#   end
# end


# get '/posts/emotion/suggestion' do
#   if request.xhr?
#     erb :'posts/_suggestion-emo', layout: false
#   else
#     redirect '/'
#   end
# end


# get '/posts/targeted-sentiment/suggestion' do
#   if request.xhr?
#     erb :'posts/_suggestion-targ', layout: false
#   else
#     redirect '/'
#   end
# end


# Posts CREATE
# post '/posts' do
#   p "*" * 100
#   p params
#   @user = current_user
#   @post = Post.new(params[:post])
#   # if request.xhr?
#     # Going to need to put the API query in here
#     if @post.save
#       status 200
#       redirect '/posts'
#       # erb :'posts/_index', layout: false, locals: {post: @post}
#     # else
#     #   status 422
#     # end
#   else
#     @errors = @post.errors.full_messages
#     redirect '/posts/new'
#   end
# end

# Posts EDIT -- Shouldn't be able to do this


# Posts UPDATE -- Or this


# Posts DESTROY -- Stretch feature
