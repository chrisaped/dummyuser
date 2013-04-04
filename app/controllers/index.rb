require 'bcrypt'

get '/' do
  # Look in app/views/index.erb
  erb :index

end

post '/' do
  @email = params[:user][:email]
  @password = params[:user][:password]
  # @encrypted_password = BCrypt::Password.create(@password)
  
  @user = User.find_by_email_and_password_digest(@email, @password)
  
  # if @user && @user.authenticate(params[:password])

  if @user
    redirect '/secret'
  else
    "Invalid email or password"
  end
end


get '/new' do
  erb :new
end

post '/new' do
  params.inspect
  User.create(name: params[:user]["name"],
                      email: params[:user]["email"],
                      password_digest: params[:user]["password"])
  erb :secret
  
  
end




get '/secret' do
  erb :secret
end

