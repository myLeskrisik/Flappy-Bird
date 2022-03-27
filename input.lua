function love.keypressed(key, scancode, isrepeat)
  if(key == "space") and not gameOver then liftBird() end
end
