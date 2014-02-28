get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  move = params[:move]
  currentboard = params[:board]
  message = ""
  cpumove = ""
  if currentboard.include? "#{move}"
    currentboard.gsub!("#{move}", "X")
    if player_win?(currentboard)
      message = "YOU WIN!"
    else
      cpumove = cpu_move(currentboard) #AI places a piece
      if cpu_win?(currentboard) #Evaluate if the AI won the game
      message = "YOU LOOSE!"
      end
    end
  else
    message = "Invalid Move"
  end
  if request.xhr?
    content_type :json
    {playermove: params[:move],
    playervalue: "X",
    playercolor: "blue",
    cpumove: "#{cpumove}",
    cpuvalue: "O",
    cpucolor: "red",
    currentboard: "#{currentboard}",
    message: message}.to_json
  else
    #if JS is turned off we can run it all using the currentboard string.
    erb :index
  end
end
