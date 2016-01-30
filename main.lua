io.stdout:setvbuf("no")

require "input"
require "settings"
require "util"
require "entity"
require "scene"
require "camera"

function love.load()
	entity.load()
    s = scene.load("data/scenes/test.lua")
end

function love.update(dt)

end

function love.draw()
    camera.draw(s)
end

function love.quit()
    return false
end
