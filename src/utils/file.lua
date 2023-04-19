function readFile(path)
  local cFile = fileOpen(path, true)
  if not cFile then return false end
  local size = fileGetSize(cFile)
  local data =fileRead(cFile, size)
  fileClose(cFile)
  return data, size
end

local __string_gsub = string_gsub

function string_gsub(baseString, matchWord, replaceWord, matchLimit, isStrictcMatch, matchPrefix, matchPostfix)
  if not baseString or (type(baseString) ~= "string") or not matchWord or (type(matchWord) ~= "string") or not replaceWord or (type(replaceWord) ~= "string") then return false end

  matchPrefix, matchPostfix = (matchPrefix and (type(matchPrefix) == "string") and matchPrefix) or "", (matchPostfix and (type(matchPostfix) == "string") and matchPostfix) or ""
  matchWord = (isStrictcMatch and "%f[^"..matchPrefix.."%z%s]"..matchWord.."%f["..matchPostfix.."%z%s]") or matchPrefix..matchWord..matchPostfix
  return __string_gsub(baseString, matchWord, replaceWord, matchLimit)
end
