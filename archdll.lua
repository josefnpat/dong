#!/usr/bin/lua5.1
local arg = {...}

local signature = "PE\0\0"
local machine_list = {
   ["\76\1"] = "x86",
   ["\100\134"] = "x64",
}

for i = 1, #arg do
   print("Testing "..arg[i])
   local file = io.open(arg[i], "rb")
   if not file then
      print("  Error: Could not open file.")
   else
      local head = file:read(2^15)
      file:close()
      local st = head:find(signature, 1, true)
      if not st then
         print("  Error: Apparently not a PE (Windows binary).")
      else
         local machine = head:sub(st + 4, st + 5)
         if machine_list[machine] then
            print("  Binary is for "..machine_list[machine]..".")
         else
            local m1, m2 = string.byte(machine, 1, 2)
            print(string.format("  Machine type is unkown (0x%04x).", m2 * 256 + m1))
         end
      end
   end
   print("")
end