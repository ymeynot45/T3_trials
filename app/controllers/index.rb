get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  currentgame = Game.new(params[:board], params[:move])
  currentgame.process
  if request.xhr?
    content_type :json
    {playermove: "#{currentgame.move}",
    playervalue: "X",
    playercolor: "blue",
    cpumove: "#{currentgame.cpumove}",
    cpuvalue: "O",
    cpucolor: "red",
    currentboard: "#{currentgame.currentboard}",
    message: "#{currentgame.message}"}.to_json
  else
    #if JS is turned off we can run it all using the currentboard string. NOT implemented yet.
    erb :index
  end
end
