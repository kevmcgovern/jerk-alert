# Posts INDEX
get '/posts' do
  @user = current_user
  @posts = @user.posts
  erb :'posts/index'
end


# Posts NEW
get '/posts/new' do
  @user = current_user
  # Ajax this?
  erb :'posts/_new'
end


# Posts SHOW
get '/posts/:id' do
  @user = current_user
  @post = Post.find(params[:id])
  erb :'posts/show'
end


# Posts CREATE
# post '/posts' do
# 	p "*" * 100
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
