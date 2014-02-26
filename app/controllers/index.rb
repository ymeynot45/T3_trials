get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  move = params[:move]
  currentboard = params[:board]
  currentboard.gsub!("#{move}", "X")
  #process player move (evaluate if move was legal)
  #Evaluate if the player won the game
  #AI places a piece
  #Evaluate if the AI won the game
  #Insert moves back to the page using json
  if request.xhr?
    content_type :json
    {playermove: params[:move],
    playervalue: "X",
    playercolor: "blue",
    currentboard: "#{currentboard}"}.to_json
  else
    erb :index
  end
end
