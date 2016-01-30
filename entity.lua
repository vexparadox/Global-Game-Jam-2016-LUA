entity = {
    static = {
        player = {
            sprite = love.graphics.newImage("data/image/player.png"),
            update = function()
                if input.up then camera.y = camera.y -2 end
                if input.down then camera.y = camera.y +2 end
                if input.right then camera.x = camera.x +2 end
                if input.left then camera.x = camera.x -2 end
            end,
            width = false,
            height = false,
            state = false,
        },
        -- enemy = {
        --     sprite = love.graphics.newImage("data/enemy.png"),
        --     width = false,
        --     height = false,
        --     state = false,
        -- },
        tree = {
            sprite = love.graphics.newImage("data/image/orangetree.png"),
            width = false,
            height = false,
            state = false,
        },
        -- tile2 = {
        --     sprite = love.graphics.newImage("data/tile2.png"),
        --     width = false,
        --     height = false,
        --     state = false,
        -- },
        -- tile3 = {
        --     sprite = love.graphics.newImage("data/tile3.png"),
        --     width = false,
        --     height = false,
        --     state = false,
        -- },
    }
}

function entity.load()
    for _, e in pairs(entity.static) do
        e.width, e.height = e.sprite:getDimensions()
    end
end

function entity.draw(e)
    -- NOTE: width and height are scale factors of the screen size eg. w/windowWidth
    love.graphics.draw(entity.static[e.name].sprite, e.x, e.y)
end
