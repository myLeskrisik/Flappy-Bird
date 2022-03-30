function love.keypressed(key, scancode, isrepeat)
  if(key == "space") and gameState == "alive" then liftBird() end
  if(key == "r") and gameState == "dead" then restartGame() end
end
