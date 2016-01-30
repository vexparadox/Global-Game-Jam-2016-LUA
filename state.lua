state = {
    current = "editor"
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
state.editor.update = editor.update
state.editor.draw = editor.draw
