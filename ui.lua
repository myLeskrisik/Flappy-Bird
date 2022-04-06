function setupUi()
  score = 0
  gameOverSprite = love.graphics.newImage("sprites/gameOver.png")
  gameOverSprite:setFilter("nearest", "nearest")
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
  love.graphics.print(score, screenWidth / 2, 2 * screenHeight/12)
end

function endGame()
  gameOverXScale = 4
  gameOverYScale = 4
  -- Puts the center of the gameOver sprite in the center of the screen
  gameOverX = screenWidth/2 - (gameOverSprite:getWidth() * gameOverXScale / 2)

  love.graphics.draw(gameOverSprite, gameOverX,
  1 * screenHeight/16, 0, gameOverXScale, gameOverYScale)
end
