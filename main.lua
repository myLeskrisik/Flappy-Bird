require "bird"
require "world"
require "input"
require "ui"

gameOver = false

function love.load(arg)
  screenWidth, screenHeight = love.graphics.getDimensions()
  birdSetup()
  pipeSetup()
  setupUi()
end

function love.update(dt)
  updateBirdPosition(dt)
  pipeUpdate(dt)
  updateScore()
  if not gameOver then gameOver = birdCollidesWithPipes() end
end

function love.draw()
  drawBackground()
  drawPipes()
  drawBird(bird.y)
  if gameOver then endGame() end
  drawScore()
end
