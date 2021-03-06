editor = {
    scene = {},
    horizontal = {},
    vertical = {},
    layer = -1,
    entityname = "tree",
    mode = "entity",
    collisiontemp = {},
}

function editor.update(dt)
    if input.up then
        camera.y = camera.y + 1
    end

    if input.down then
        camera.y = camera.y - 1
    end

    if input.left then
        camera.x = camera.x + 1
    end

    if input.right then
        camera.x = camera.x - 1
    end
end

function editor.drawinterface()
    local mx, my = love.mouse.getPosition()

    love.graphics.print("Mode: "..editor.mode, 10, 10)
    love.graphics.print("Entities: "..#editor.scene, 10, 30)
    love.graphics.print("Layer: "..editor.layer, 10, 50)
    love.graphics.print("Mouse: "..mx-camera.x..
        ", "..my-camera.y, 10, 70)

    for _, e in ipairs(editor.scene) do
        local e = editor.mouseoverentity(mx, my)
        if e ~= nil then
            love.graphics.rectangle("line",
                e.x+camera.x, e.y+camera.y,
                entity.static[e.name].width,
                entity.static[e.name].height)
        end
    end
end

function editor.draw()
    camera.draw(editor.scene)

    for _, e in ipairs(editor.horizontal) do
        love.graphics.line(e.x1, e.y1, e.x2, e.y2)
    end

    for _, e in ipairs(editor.vertical) do
        love.graphics.line(e.x1, e.y1, e.x2, e.y2)
    end

    editor.drawinterface()
end

function editor.loadscene(scene)

end

function editor.mouseoverentity(x, y)
    x = x - camera.x
    y = y - camera.y
    for i, e in pairs(editor.scene) do
        if util.pointInRect(x, y, e.x, e.y,
           entity.static[e.name].width,
           entity.static[e.name].height) then
            return e, i
        end
    end
end

function editor.mouseovercollider(x, y)

end

function editor.addentity(x, y, z, name)
    editor.scene[#editor.scene+1] = {
        name = name,
        x = x - entity.static[name].width/2,
        y = y - entity.static[name].height/2,
        z = z
    }
end

function editor.removeentity(index)
    if index ~= nil then
        table.remove(editor.scene, index)
    end
end

function editor.addcollider(x1, y1, x2, y2)
    if x1 == x2 then
        editor.vertical[#editor.vertical+1] = {
            x1 = x1, y1 = y1,
            x2 = x2, y2 = y2
        }
    elseif y1 == y2 then
        editor.horizontal[#editor.horizontal+1] = {
            x1 = x1, y1 = y1,
            x2 = x2, y2 = y2
        }
    end
end

function editor.removecollider(index, orientation)
    if orientation == "h" or orientation == "horizontal" then
        table.remove(editor.horizontal, index)
    elseif orientation == "v" or orientation == "vertical" then
        table.remove(editor.vertical, index)
    end
end

function editor.mousecontrol(x, y, button)
    if editor.mode == "entity" then
        if button == 1 then
            editor.addentity(x, y, editor.layer, editor.entityname)
        elseif button == 2 then
            local _, i = editor.mouseoverentity(x, y)
            editor.removeentity(i)
        end
    elseif editor.mode == "collision horizontal" then
        if button == 1 then
            editor.collisiontemp[#editor.collisiontemp+1] = {
                x = x,
                y = y,
            }
            if #editor.collisiontemp == 2 then
                editor.addcollider(editor.collisiontemp[1].x,
                                   editor.collisiontemp[1].y,
                                   editor.collisiontemp[2].x,
                                   editor.collisiontemp[1].y)
                editor.collisiontemp = {}
            end
        elseif button == 2 then
        end
    elseif editor.mode == "collision vertical" then
        if button == 1 then
            editor.collisiontemp[#editor.collisiontemp+1] = {
                x = x,
                y = y,
            }
            if #editor.collisiontemp == 2 then
                editor.addcollider(editor.collisiontemp[1].x,
                                   editor.collisiontemp[1].y,
                                   editor.collisiontemp[1].x,
                                   editor.collisiontemp[2].y)
                editor.collisiontemp = {}
            end
        elseif button == 2 then
        end
    end
end

function editor.keyboardcontrol(key)
    if key == "-" or key == "_" then
        editor.layer = editor.layer - 1
    end

    if key == "=" or key == "+" then
        editor.layer = editor.layer + 1
    end

    if key == "o" then
        scene.write(editor.scene,
                    editor.horizontal,
                    editor.vertical,
                    "out.lua")
    end

    if key == "1" then
        editor.mode = "entity"
    end

    if key == "2" then
        editor.mode = "collision horizontal"
    end

    if key == "3" then
        editor.mode = "collision vertical"
    end
end
