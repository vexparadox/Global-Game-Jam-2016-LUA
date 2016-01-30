state = {
    current = "game"
}

state.game = {}
function state.game.update(dt)
    for _, e in ipairs(s) do
        if entity.static[e.name].update ~= nil then
            entity.static[e.name].update()
        end
    end
end

function state.game.draw()
    camera.draw(s)
end

state.pause = {}
function state.pause.update(dt)
end

function state.pause.draw()
end

state.editor = {}
function state.editor.update(dt)
end

function state.editor.draw()
end
