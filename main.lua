io.stdout:setvbuf("no")

require "camera"
require "editor"
require "entity"
require "input"
require "scene"
require "settings"
require "state"
require "util"
require "editor"
require "collision"

function love.load()
	entity.load()
end

function love.update(dt)
    state[state.current].update(dt)
end

function love.draw()
    state[state.current].draw()
end

function love.quit()
    return false
end
