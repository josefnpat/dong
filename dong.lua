local dong = {}

function dong._getAxes(joystick)
  local temp = {}
  temp.ls_x,temp.ls_y,temp.lt,temp.rs_x,temp.rs_y,temp.rt = love.joystick.getAxes(joystick)
  return temp
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

-- BUTTONS
dong.buttons = {"A","B","X","Y","LB","RB","SELECT","START","XBOX","LS","RS","LD","RD","UD","DD"}
function dong.isDown(joystick,button_name)
  for i,button in ipairs(dong.buttons) do
    if button == button_name then
      return love.joystick.isDown(joystick,i)
    end
  end
  print("Invalid button.")
  return nil
end

return dong