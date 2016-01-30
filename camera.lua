camera = {
    x = 0,
    y = 0;
}
function camera.draw(scene)
    love.graphics.push()
    love.graphics.translate(camera.x, camera.y)
    --draw entities
    for _, e in ipairs(scene) do
        entity.draw(e)
    end
    love.graphics.pop()
end