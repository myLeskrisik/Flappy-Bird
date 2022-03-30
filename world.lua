verticalPipeGap = 150
pipeWidth = 90
horizontalPipeGap = 155
pipeSpeed = 120
maxPipesOnScreen = math.ceil(love.graphics.getWidth() / (horizontalPipeGap + pipeWidth))

function drawBackground()
  love.graphics.setColor(love.math.colorFromBytes(18,190,235))
  love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight)
end

function pipeSetup()
  pipes = {}
  for i = 1, maxPipesOnScreen do
    createPipe(screenWidth + ((i-1) * (horizontalPipeGap + pipeWidth)))
  end
end

function pipeUpdate(dt)
  for i in pairs(pipes) do pipes[i].x = pipes[i].x - pipeSpeed * dt end
  if pipes[1].x <= -pipeWidth then
    for i = 1, maxPipesOnScreen do pipes[i] = pipes[i+1] end
    createPipe(pipes[maxPipesOnScreen - 1].x + (horizontalPipeGap + pipeWidth))
  end
end

function createPipe(pipeStartingX)
  bottomPipeBound = (screenHeight * 4) / 5
  topPipeBound = screenHeight / 5 + verticalPipeGap
  pipe = {}
  pipe.x = pipeStartingX
  pipe.scored = false
  -- Generates a Y value from bottomPipeBound to topPipeBound
  pipe.bottomPipeY = love.math.random(bottomPipeBound - topPipeBound) + topPipeBound

  table.insert(pipes, pipe)
end

function drawPipes()
  for i in pairs(pipes) do drawPipe(pipes[i].x, pipes[i].bottomPipeY) end
end

function drawPipe(x, bottomPipeY)
  love.graphics.setColor(love.math.colorFromBytes(24,214,0))
  -- Draws the bottom pipe
  love.graphics.rectangle("fill", x, bottomPipeY, pipeWidth, screenHeight - bottomPipeY)
  -- Draws the top pipe
  love.graphics.rectangle("fill", x, 0, pipeWidth, bottomPipeY - verticalPipeGap)
end
