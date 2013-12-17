get '/' do
  erb :index
end

post '/playermove' do
  #take in player's move
  #process player move
  #Evaluate if the player won the game
  #AI places a piece
  #Evaluate if the AI won the game
  #Insert moves back to the page using json
  content_type :json
  {
    playermove: "#{}",
    aimove: "#{}",
    winner: ""
  }.to_json

end
