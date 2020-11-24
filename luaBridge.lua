function pyPathAdd(path, item)
    local path = path
    if path == 'path' then
        path = ''
    end
    pg.modPath = path
    print(path)
    python.execute("sys.path.append(modPath)")
    return path
end
--function pgDictInfo(pgDict)


--end
