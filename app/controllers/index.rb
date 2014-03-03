get '/' do
  @currentboard = "123456789"
  erb :index
end

post '/playermove' do
  move = params[:move]
  currentboard = params[:board]
  message = "0"
  cpumove = "0"
  if currentboard.include? "#{move}"
    currentboard.gsub!("#{move}", "X")
    if player_win?(currentboard)
      message = "YOU WIN!"
    elsif currentboard.count("X") == 5
      message = "IT'S A TIE"
      move = "0"
    else
      cpumove = cpu_move(currentboard) #AI places a piece
      #message = cpumove #just printing to screen for debugging DELETE LATER
      currentboard.gsub!("#{cpumove}", "O")
      if cpu_win?(currentboard) #Evaluate if the AI won the game
      message = "YOU LOOSE!"
      end
    end
  else
    message = "Invalid Move"
    move = "0"
  end
  if request.xhr?
    content_type :json
    {playermove: "#{move}",
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
