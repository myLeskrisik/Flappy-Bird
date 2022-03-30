liftConstant = -2.4
gravity = 5

function drawBird(y)
  love.graphics.setColor(love.math.colorFromBytes(245,245,81))
  love.graphics.rectangle("fill", bird.x, y, bird.width, bird.height)
end

function birdSetup()
  bird = {}
  bird.x = screenWidth / 2
  bird.y = screenHeight / 2
  bird.velocity = 0
  bird.height = 50
  bird.width = 50
end

function updateBirdPosition(dt)
  if bird.y < 0 then
    bird.y = 0
  elseif bird.y < screenHeight - bird.height  then
    bird.velocity = bird.velocity +  gravity * dt
    bird.y = bird.velocity + bird.y
  elseif bird.y >= screenHeight - bird.height then
    bird.y = screenHeight - bird.height
    gameState = "dead"
  end
end

function birdCollidesWithPipes(pipe)
  for i in pairs(pipes) do
    pipe = pipes[i]

    bottomPipeRect = {x=pipe.x, y=pipe.bottomPipeY, w=pipeWidth, h=screenHeight - pipe.bottomPipeY}
    topPipeRect = {x=pipe.x, y=0, w=pipeWidth, h=pipe.bottomPipeY - verticalPipeGap}
    birdRect = {x=bird.x, y=bird.y, w=bird.width, h=bird.height}

    if rectsCollide(birdRect, bottomPipeRect) or
    rectsCollide(birdRect, topPipeRect)
    then return "dead" end
  end
  return "alive"
end

function rectsCollide(one, two)
  return one.x < two.x + two.w and
  two.x < one.x + one.w and
  one.y < two.y + two.h and
  two.y < one.y + one.h
end

function liftBird()
  bird.velocity =  liftConstant
end
