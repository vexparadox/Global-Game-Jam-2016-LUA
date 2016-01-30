io.stdout:setvbuf("no")

require "input"
require "settings"
require "util"
require "entity"
require "scene"
require "camera"
require "state"
require "editor"
require "collision"

function love.load()
	entity.load()
    s = scene.load("data/scenes/test.lua")
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
