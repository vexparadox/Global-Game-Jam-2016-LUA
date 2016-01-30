entity = {
    player = {
        sprite = love.graphics.newImage("data/image/player.png"),
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

function entity.load()
    for _, e in ipairs(entity) do
        e.width, e.height = e.sprite:getDimensions()
    end
end

function entity.draw(entity)
    love.graphics.draw(entity.sprite, entity.x, entity.y)
end