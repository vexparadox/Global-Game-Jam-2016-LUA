editor = {
    scene = {}
}

function editor.cameratoworld(x, y)
    return x - camera.x, y - camera.y
end

function editor.handleinput(x)

end

function editor.addcollider(x1, y1, x2, y2)

end

function editor.remove(index)
    table.remove(editor.scene, index)
end
