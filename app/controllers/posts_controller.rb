# Posts INDEX
get '/posts' do
  @user = current_user
  erb :'posts/index'
end


# Posts NEW
get '/posts/new' do
  @user = current_user
  # Ajax this?
  erb :'posts/new'
end


# Posts SHOW
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end


# Posts CREATE
posts '/posts' do
  @user = current_user
  @post = Post.new(params[:post])
  if request.xhr?
  	# Going to need to put the API query in here
    if @post.save
      status 200
      erb :'posts/_index', layout: false, locals: {post: @post}
    else
      status 422
    end
  else
    @errors = @post.errors.full_messages
    redirect '/posts'
  end
end

# Posts EDIT -- Shouldn't be able to do this


# Posts UPDATE -- Or this


# Posts DESTROY -- Stretch feature
