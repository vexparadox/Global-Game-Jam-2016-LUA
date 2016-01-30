io.stdout:setvbuf("no")

require "input"
require "settings"
require "util"
require "entity"

function love.load()
	entity.load()
end

function love.update(dt)

end

function love.draw()

end

function love.quit()
    return false
end
