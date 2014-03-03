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
  if board.include? "5"  #reset to 5 at end of debugging
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
  elsif board.include? "3"  #delete later
    return "3"              #delete later
  end
  return "run off" #currently over
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
