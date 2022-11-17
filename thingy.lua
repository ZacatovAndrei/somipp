#! /bin/env lua
local size = 1440 * 1024
local inname = arg[1] or "boot"
local outname = arg[2] or "fd.img" 
print(inname,outname)
local fin = io.open(inname,"r")
local curfile= fin:read("*a")
curfile = curfile .. string.rep("\0", size - #curfile)
local fout =assert( io.open(outname, "w"),"error with file like wtf?")
fout:write(curfile)
fin:close()
fout:close()
