io.stdout:setvbuf("no")

require "input"
require "settings"
require "util"
require "entity"
require "scene"

function love.load()
	entity.load()
    s = scene.load("data/scenes/test.lua")
end

function love.update(dt)

end

function love.draw()
    scene.draw(s)
end

function love.quit()
    return false
end
