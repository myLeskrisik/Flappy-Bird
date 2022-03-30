require "bird"
require "world"
require "input"
require "ui"

-- The starting value of the game state (will eventually be menu),
gameState = "alive"

function love.load(arg)
  screenWidth, screenHeight = love.graphics.getDimensions()
  birdSetup()
  pipeSetup()
  setupUi()
end

function love.update(dt)
  updateBirdPosition(dt)
  if gameState == "alive" then
    pipeUpdate(dt)
    updateScore()
    gameState = birdCollidesWithPipes()
  end
end

function love.draw()
  drawBackground()
  drawPipes()
  drawBird(bird.y)
  if gameState == "dead" then endGame() end
  drawScore()
end

function restartGame()
  love.load()
  gameState = "alive"
end
