def player_win?(board)
playerwin = [/XXX....../, /...XXX.../, /......XXX/, /X..X..X../, /.X..X..X./, /..X..X..X/, /X...X...X/, /..X.X.X../]
  if playerwin.any? { |win| board =~ win }
    return true
  else
    return false
  end 
end

def cpu_win?(board)
  cpuwin = [/OOO....../, /...OOO.../, /......OOO/, /O..O..O../, /.O..O..O./, /..O..O..O/, /O...O...O/, /..O.O.O../]
  if cpuwin.any? { |win| board =~ win }
    return true
  else
    return false
  end
end

def cpu_move(board)
  if board.include? "2"  #reset to 5 at end of debugging
    return "2"
  elsif board.include? "3"  #delete later
    return "3"              #delete later
  end
  if move = check_rows(board)
    return move
  elsif move = check_col(board)
    return move
  else move = check_diag(board)
    return move
  end
  if move = block_rows(board)
    return move
  elsif move = block_col(board)
    return move
  else move = block_diag(board)
    return move
  end
  return "3" #currently over  
end

def check_rows(board)
  rows = board.scan(/.../)
  move = row_check(rows)
  if move
    return move
  end
  false
end

def row_check(row)
  row.each{ |row|
    if row.count("O") == 2
      row.gsub!("O", "")
      return row
    end 
  }
  return false
end

def check_col(board)
  return "check_col"
end

def check_diag(board)
  return "check_diag"
end


def block_rows(board)
  return "block_rows"
end

def block_col(board)
  return "block_col"
end


def block_diag(board)
  if board[5] == "O" #Diag not possible
    return false
  end
  return "block_diag"
end
