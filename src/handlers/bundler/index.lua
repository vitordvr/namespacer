utils = {
  "src/sandbox/util.lua",
  "src/sandbox/class.lua",
  "src/sandbox/interface.lua",
  "src/sandbox/__init__.lua"
}


function bundler()
  local rw = ""
  for i = 1, #utils, 1 do
    local j = readFile(utils[i])
    rw = rw..[[
    if true then
      ]]..j..[[
    end
    ]]
  end

  return rw
end
