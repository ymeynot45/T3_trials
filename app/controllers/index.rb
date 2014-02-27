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
    if playerwin(currentboard)
      message = "YOU WIN!"
    else
      #AI places a piece
      #Evaluate if the AI won the game
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
    erb :index
  end
end
