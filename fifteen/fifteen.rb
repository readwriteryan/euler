done_x = 20
done_y = 20

base_x = 0

x = 0
y = 0

visited = Array.new(21){ Array.new(21)}



def move_down y
  y += 1
end

def move_right x
  x += 1
end


def rewind x, y, base_x, visited
  while(x > base_x && !visited[x][y])
    x -= 1
  end  
  x
end

def clear_visited visited, base_x
  for i in 0..20
    for j in base_x..20
      if visited[i][j] != nil
	visited[i][j] = nil
      end
    end
  end
end

done = false
total_paths = 0

while !done
  if x == done_x && y == done_y
    total_paths 	+= 1
    x			= rewind x, y, base_x, visited
    visited[x][y]	= true
    y			-= 1
  elsif(y < 20 && visited[x][y+1] != nil)
    y = move_down y
  elsif(x < 20 && visited[x+1][y] != nil)
    x = move_right x
  elsif(x == 20 && y == 0 && visited[x][y+1] == true)
      done = true
  else
    visited clear_visited visited, base_x + 1
    x = rewind x, y, base_x, visited
    
    if y == 0 && x == base_x + 1
      base_x += 1
    end
  end
end
