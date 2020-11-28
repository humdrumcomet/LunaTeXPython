function pythonSetup()
    python = require 'python'
    pg = python.globals()
    python.execute("import os")
    python.execute("import sys")
    python.execute("from pathlib import Path")
    python.execute("import lua")
    python.execute("lg = lua.globals()")
    pyPath = pg.Path
    pb = python.builtins()
end
function pyPathAdd(path, item)
    local path = path
    if path == 'path' then
        path = ''
    end
    pg.modPath = path
    python.execute("sys.path.append(modPath)")
    return path
end
function itPyObj(pyObj)
    local pyObjAttr = python.asattr(pyObj)
    local objType = pb.type(pyObj).__name__
    local index = -1
    local count = math.floor(pb.len(pyObj))
    local keyList = ''
    if objType == 'dict' then 
        keyList = pb.list(pyObjAttr.keys())
    end
    
    return function()
        index = index+1
        if index <= count then
            if objType == 'dict' then
                return pyObj[keyList[index]]
            else
                return pyObj[index]
            end
        end
    end
end
