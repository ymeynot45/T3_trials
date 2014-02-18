get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  move = params[:move]
  puts "move = #{move}"
  #take in player's move
  #process player move (evaluate if move was legal)
  #Evaluate if the player won the game
  #AI places a piece
  #Evaluate if the AI won the game
  #Insert moves back to the page using json
  if request.xhr?
    content_type :json
    {playermove: params[:move],
    playervalue: "X",
    playercolor: "blue"}.to_json
  else
    erb :index
  end
end
