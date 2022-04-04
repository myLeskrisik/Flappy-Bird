function setupUi()
  score = 0
  gameOverSprite = love.graphics.newImage("sprites/gameOver.png")
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
  love.graphics.draw(gameOverSprite, screenWidth/4 , 1 * screenHeight/16)
end
