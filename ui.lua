function setupUi()
  score = 0
  gameOverSprite = love.graphics.newImage("sprites/gameOver.png")
  gameOverSprite:setFilter("nearest", "nearest")
end

function updateScore()
  for i in pairs(pipes) do
    local pipe = pipes[i]
    if pipe.x < screenWidth / 2 and not pipe.scored then
      score = score + 1
      pipe.scored = true
    end
  end
end

function drawScore()
  love.graphics.print(score, screenWidth / 2, 2 * screenHeight/12)
end

function endGame()
  local gameOverXScale = 4
  local gameOverYScale = 4
  -- Puts the center of the gameOver sprite in the center of the screen
  local gameOverX = screenWidth/2 - (gameOverSprite:getWidth() * gameOverXScale / 2)
  local gameOverY = screenHeight/6 - (gameOverSprite:getHeigh() * gameOverYScale / 2)

  love.graphics.draw(gameOverSprite, gameOverX,
  1 * screenHeight/16, 0, gameOverXScale, gameOverYScale)
end
