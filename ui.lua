function setupUi()
  score = 0
  gameOverSprite = love.graphics.newImage("sprites/gameOver.png")
  scores = {}
  for i = 0, 9 do table.insert(scores, love.graphics.newImage("sprites/" .. i .. ".png")) end
end

function updateScore()
  for i in pairs(pipes) do
    pipe = pipes[i]
    if pipe.x < screenWidth / 2 and not pipe.scored then
      score = score + 1
      pipe.scored = true
    end
  end
end

function drawScore()
  -- KA1 font for score
  -- love.graphics.print(score, screenWidth / 2, 2 * screenHeight/12)

  score = score .. ""
  offset = 16
  for i = 1, #score do
    local char = toNumber(score:sub(i,i))
    love.graphics.draw(scores[char], screenWidth/2 + (offset * i), 2 * screenHeight/2)
  end
end

function endGame()
  love.graphics.draw(gameOverSprite, screenWidth/4 , 1 * screenHeight/16)
end
