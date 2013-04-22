local dong = {}

dong.os = {}
dong.os["Linux"] = {
  _getAxes = function(joystick)
    local temp = {}
    temp.ls_x,temp.ls_y,temp.lt,temp.rs_x,temp.rs_y,temp.rt = love.joystick.getAxes(joystick)
    return temp
  end,
  buttons = function()
    return {"A","B","X","Y","LB","RB","SELECT","START","XBOX","LS","RS","LD","RD","UD","DD"}
  end
}

dong.os["OS X"] = {
  _getAxes = function(joystick)
    local temp = {}
    temp.ls_x,temp.ls_y,temp.rs_x,temp.rs_y,temp.lt,temp.rt = love.joystick.getAxes(joystick)
    return temp
  end,
  buttons = function()
    return {"UD","DD","LD","RD","START","SELECT","LS","RS","LB","RB","XBOX","A","B","X","Y"}
  end
}

dong.os["Windows"] = {
  _getAxes = function(joystick)
    local temp = {}
    local trigger = nil
    temp.ls_x,temp.ls_y,trigger,temp.rs_y,temp.rs_x = love.joystick.getAxes(joystick)
    if trigger < 0 then
      temp.rt = -trigger*2-1
      temp.lt = -1
    elseif trigger > 0 then
      temp.lt = trigger*2-1
      temp.rt = -1
    else -- trigger == 0
      temp.rt,temp.lt = -1,-1
    end
    return temp
  end,
  buttons = function(joystick)
    return {"A","B","X","Y","LB","RB","SELECT","START","LS","RS","RD","UD","LD","DD"}
  end,
  extra_buttons = function(joystick,button)
    local direction = love.joystick.getHat( joystick, 1 )
    if direction == "r" then
      if button == 11 then
        return true
      end
    elseif direction == "u" then
      if button == 12 then
        return true
      end
    elseif direction == "l" then
      if button == 13 then
        return true
      end
    elseif direction == "d" then
      if button == 14 then
        return true
      end
    elseif direction == "ru" then
      if button == 11 or button == 12 then
        return true
      end
    elseif direction == "lu" then
      if button == 13 or button == 12 then
        return true
      end
    elseif direction == "ld" then
      if button == 13 or button == 14 then
        return true
      end
    elseif direction == "rd" then
      if button == 11 or button == 14 then
        return true
      end
    end
  end
}
dong.os["Unknown"] = dong.os["Linux"]

function dong._getAxes(joystick)
  return dong.os[love._os]._getAxes(joystick)
end

-- LEFT STICK

function dong.ls(joystick)
  return dong.left_stick(joystick)
end

function dong.left_stick(joystick)
  local temp = dong._getAxes(joystick)
  return temp.ls_x,temp.ls_y
end

-- LEFT TRIGGER

function dong.lt(joystick)
  return dong.left_trigger(joystick)
end

function dong.left_trigger(joystick)
  local temp = dong._getAxes(joystick)
  return temp.lt
end

-- RIGHT STICK

function dong.rs(joystick)
  return dong.right_stick(joystick)
end

function dong.right_stick(joystick)
  local temp = dong._getAxes(joystick)
  return temp.rs_x,temp.rs_y
end

-- RIGHT TRIGGER

function dong.rt(joystick)
  return dong.right_trigger(joystick)
end

function dong.right_trigger(joystick)
  local temp = dong._getAxes(joystick)
  return temp.rt
end

function dong._isDown(joystick,i)
  if dong.os[love._os].extra_buttons then
    if dong.os[love._os].extra_buttons(joystick,i) then
      return true
    end
  end
  return love.joystick.isDown(joystick,i)
end

-- BUTTONS
dong.buttons = dong.os[love._os].buttons()
function dong.isDown(joystick,button_name)
  for i,button in ipairs(dong.buttons) do
    if button == button_name then
      return dong._isDown(joystick,i)
    end
  end
  print("Invalid button.")
  return nil
end

return dong
