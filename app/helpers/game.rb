def playerwin(board)
playerwin = [/XXX....../, /...XXX.../, /......XXX/, /X..X..X../, /.X..X..X./, /..X..X..X/, /X...X...X/, /..X.X.X../]
  if playerwin.any? { |win| board =~ win }
    return true
  else
    return false
  end 
end

