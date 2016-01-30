io.stdout:setvbuf("no")

require "camera"
require "editor"
require "entity"
require "input"
require "scene"
require "settings"
require "state"
require "util"

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
