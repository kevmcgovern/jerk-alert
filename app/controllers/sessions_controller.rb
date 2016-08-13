# Sessions NEW
get '/sessions/new' do
  erb :'sessions/new'
end


# Sessions CREATE
post '/sessions' do
  @user = User.find_by(username: params[:user][:username])
  if @user
    if @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect '/'
    else
      @error = "invalid login information. Please try again."
      redirect '/sessions/new'
    end
  else
    @error = "You are not registered..... yet."
    redirect '/users/new'
  end
end


# Sessions DESTROY
delete '/sessions/:id' do
  if request.xhr?
    session[:id] = nil
    redirect '/'
  end
end
