get '/' do
  # Look in app/views/index.erb
  erb :index

end

get '/new' do
  erb :new
end

post '/new' do
  puts 'hello'
  @user = User.create(name: params[:user]["name"],
                      email: params[:user]["email"],
                      password: params[:user]["password"])
  erb :secret
end


get '/secret' do
  erb :secret
end

