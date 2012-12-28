dong = require("dong")

function love.draw()
  draw_joy(1,0)
--  draw_joy(2,300)
end

function draw_joy(j,yoffset)
  local stick_offsetl = {x=200,y=150+yoffset}
  local stick_offsetr = {x=450,y=150+yoffset}

  love.graphics.print(love.joystick.getName(j),16,16+yoffset)
  local lstickx,lsticky = dong.ls(j)
  love.graphics.setColor(255,255,255,127)
  love.graphics.line(stick_offsetl.x-100,stick_offsetl.y,stick_offsetl.x+100,stick_offsetl.y)
  love.graphics.line(stick_offsetl.x,stick_offsetl.y-100,stick_offsetl.x,stick_offsetl.y+100)
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line",stick_offsetl.x,stick_offsetl.y,100)
  love.graphics.circle("fill",stick_offsetl.x+lstickx*100,stick_offsetl.y+lsticky*100,4)
  love.graphics.print("LS",stick_offsetl.x+lstickx*100,stick_offsetl.y+lsticky*100)
  
  local ltrigger = dong.lt(j)
  love.graphics.rectangle("fill",stick_offsetl.x+100,stick_offsetl.y,16,ltrigger*100)
  love.graphics.print("LT",stick_offsetl.x+116,stick_offsetl.y+ltrigger*100)

  local rstickx,rsticky = dong.rs(j)
  love.graphics.setColor(255,255,255,127)
  love.graphics.line(stick_offsetr.x-100,stick_offsetr.y,stick_offsetr.x+100,stick_offsetr.y)
  love.graphics.line(stick_offsetr.x,stick_offsetr.y-100,stick_offsetr.x,stick_offsetr.y+100)
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line",stick_offsetr.x,stick_offsetr.y,100)
  love.graphics.circle("fill",stick_offsetr.x+rstickx*100,stick_offsetr.y+rsticky*100,4)
  love.graphics.print("RS",stick_offsetr.x+rstickx*100,stick_offsetr.y+rsticky*100)

  local rtrigger = dong.rt(j)
  love.graphics.rectangle("fill",stick_offsetr.x+100,stick_offsetr.y,16,rtrigger*100)
  love.graphics.print("RT",stick_offsetr.x+116,stick_offsetr.y+rtrigger*100)

  for i,button in ipairs(dong.buttons) do
    if dong.isDown(j,button) then
      love.graphics.setColor(255,255,255)
    else
      love.graphics.setColor(255,255,255,127)
    end
    love.graphics.print(button.." ["..i.."]",16,32+(i-1)*16+yoffset)
    love.graphics.setColor(255,255,255)
  end
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end