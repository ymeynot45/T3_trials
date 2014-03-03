def player_win?(board)
playerwin = [/XXX....../, /...XXX.../, /......XXX/, /X..X..X../, /.X..X..X./, /..X..X..X/, /X...X...X/, /..X.X.X../]
  if playerwin.any? { |win| board =~ win }
    return true
  end
  false 
end

def cpu_win?(board)
  cpuwin = [/OOO....../, /...OOO.../, /......OOO/, /O..O..O../, /.O..O..O./, /..O..O..O/, /O...O...O/, /..O.O.O../]
  if cpuwin.any? { |win| board =~ win }
    return true
  end
   false
end

def cpu_move(board)
  if board.include? "5"
    return "5"
  elsif move = check_rows(board)
    return move
  elsif move = check_col(board)
    return move
  elsif move = check_diag(board)
    return move
  elsif move = block_rows(board)
    return move
  elsif move = block_col(board)
    return move
  elsif move = block_diag(board)
    return move
  elsif board[6] == "7" and seven_block(board)
    return "7"
  elsif board[8] == "9" and nine_block(board)
    return "9"
  elsif board.include? "1" and board.include? "3" and board.include? "7" and board.include? "9"
    return "3"
  elsif board[4] == "O" and forking_block(board)
    return "2"
  else
    return random_move(board)
  end
end

def check_rows(board)
  rows = board.scan(/.../)
  move = line_check(rows, "O")
  if move
    return move
  end
  false
end

def check_col(board)
  board = board.split(//)
  firstcol = board.values_at(0, 3, 6)
  secondcol = board.values_at(1, 4, 7)
  thirdcol = board.values_at(2, 5, 8)
  cols = [firstcol.join, secondcol.join, thirdcol.join]
  move = line_check(cols, "O")
  if move
    return move
  end
  false
end

def check_diag(board)
  board = board.split(//)
  left = board.values_at(0, 4, 8)
  right = board.values_at(2, 4, 6)
  dia = [left.join, right.join]
  move = line_check(dia, "O")
  if move
    return move
  end
  false
end

def block_rows(board)
  rows = board.scan(/.../)
  move = line_check(rows, "X")
  if move
    return move
  end
  false
end

def block_col(board)
  board = board.split(//)
  firstcol = board.values_at(0, 3, 6)
  secondcol = board.values_at(1, 4, 7)
  thirdcol = board.values_at(2, 5, 8)
  cols = [firstcol.join, secondcol.join, thirdcol.join]
  move = line_check(cols, "X")
  if move
    return move
  end
  false
end

def block_diag(board)
  if board[4] == "O"
    return false
  end
  board = board.split(//)
  left = board.values_at(0, 4, 8)
  right = board.values_at(2, 4, 6)
  dia = [left.join, right.join]
  move = line_check(dia, "X")
  if move
    return move
  end
  false
end

def line_check(line, piece)
  line.each{ |line|
    if line.count(piece) == 2
      line.gsub!(piece, "")
      if line != "X" and line != "O"
        return line
      end
    end 
  }
  false
end

def seven_block(board)
  if board[0] == "X" and board[7] == "X"
    return true
  elsif board[3] == "X" and board[7] == "X"
    return true
  end
  false
end

def nine_block(board)
  if board[2] == "X" and board[7] == "X"
    return true
  elsif board[5] == "X" and board[6] == "X"
    return true
  end
  false
end

def forking_block(board)
  if board[0] == "X" and board[8] == "X"
    return true
  elsif board[2] == "X" and board[6] == "X"
    return true
  else
    false
  end
end

def random_move(board)
  move = board.gsub(/[OX]/, "")
  return move[/(.)/]
end
