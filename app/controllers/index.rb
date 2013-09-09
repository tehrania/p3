get '/' do
 p current_user
 p session[:user_id]
 #TODO: Show all users if user is signed in
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
   # sign-in

  
authenticate(params)
p @user
  if @user 
    p @user    
   login(@user.id)
    redirect to '/'
  else 
    redirect to '/'
  end
end

delete '/sessions/:id' do
  log_out_user
 erb :sign_in
end

#----------- USERS -----------

get '/users/new' do

  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user

  User.create(params)

  redirect to '/home'

end

get '/home' do

  erb :index
end
