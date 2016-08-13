# Users INDEX
# Not going to implement this route because no user should have access to it

# Users NEW
get '/users/new' do
	erb :'users/new'
end


# Users SHOW
get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/show'
end


# Users CREATE
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:id] = @user.id
		redirect '/posts/new'
	else
		@errors = @user.errors.full_messages
		redirect '/users/new'
	end
end


# Users EDIT -- Stretch feature


# Users UPDATE -- Stretch feature


# Users DESTROY -- Stretch feature