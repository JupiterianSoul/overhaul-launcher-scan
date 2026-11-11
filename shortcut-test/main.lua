function love.load()
    local SC = require("shortcuts")
    local exe = os.getenv("TEST_EXE")
    local workdir = os.getenv("TEST_WORKDIR")
    local out = os.getenv("TEST_RESULT")
    local script = SC.lnk_script(exe, workdir, nil)
    local line
    if script:find('[%c"%%]') then
        line = "refused"
    else
        local ok = os.execute('powershell -NoProfile -NonInteractive -Command "' .. script .. '"')
        line = "exit " .. tostring(ok)
    end
    local f = io.open(out, "w")
    if f then
        f:write(line, "\n")
        f:close()
    end
    love.event.quit(0)
end
