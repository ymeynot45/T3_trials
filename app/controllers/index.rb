get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  move = params[:move]
  currentboard = params[:board]
  message = ""
  if currentboard.include? "#{move}"
    currentboard.gsub!("#{move}", "X")
    if playerwin(currentboard)
      message = "YOU WIN!"
    else
      #AI places a piece
      #Evaluate if the AI won the game
      #Insert moves back to the page using json
    end
  else
    message = "Invalid Move"
    #Possible put an error message here for picking a taken box.
  end
  if request.xhr?
    content_type :json
    {playermove: params[:move],
    playervalue: "X",
    playercolor: "blue",
    currentboard: "#{currentboard}",
    message: message}.to_json
  else
    erb :index
  end
end
