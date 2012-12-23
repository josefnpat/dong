dong = require("dong")

j = 1
name = love.joystick.getName(j)

axes = love.joystick.getNumAxes(j)
print("axes:"..axes)

buttons = love.joystick.getNumButtons( j )
print("buttons:"..buttons)

stick_offsetl = {x=200,y=200}
stick_offsetr = {x=600,y=200}

function love.draw()
  love.graphics.print(name,0,0)
  local lstickx,lsticky = dong.ls(j)
  love.graphics.circle("line",stick_offsetl.x,stick_offsetl.y,100)
  love.graphics.circle("fill",stick_offsetl.x+lstickx*100,stick_offsetl.y+lsticky*100,4)
  love.graphics.print("LS",stick_offsetl.x+lstickx*100,stick_offsetl.y+lsticky*100)
  
  local ltrigger = dong.lt(j)
  love.graphics.rectangle("fill",stick_offsetl.x+100,stick_offsetl.y,16,ltrigger*100)
  love.graphics.print("LT",stick_offsetl.x+116,stick_offsetl.y+ltrigger*100)

  local rstickx,rsticky = dong.rs(j)
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
    love.graphics.print(button.." ["..i.."]",32,300+(i-1)*16)
    love.graphics.setColor(255,255,255)
  end
end