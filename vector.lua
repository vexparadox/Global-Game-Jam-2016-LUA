-- TODO: overload operators for vector operations
vec2 = {
    __call = function (self, x, y)
        return { x = x, y = y }
    end,
}

setmetatable(vec2, vec2)

function vec2.add(l, r)
    return vec2(l.x + r.x, l.y + r.y)
end

function vec2.sub(l, r)
    return vec2(l.x - r.x, l.y - r.y)
end

function vec2.scale(v, s)
    return vec2(v.x * s, v.y * s)
end

function vec2.dot(l, r)
    return l.x * r.x + l.y * r.y
end

function vec2.mag(v)
    return (v.x^2 + v.y^2)^0.5
end

function vec2.angle(v)
    return math.atan(v.y / v.x)
end

function vec2.norm(v)
    return vec2(v.x / vec2.mag(v), v.y / vec2.mag(v))
end



vec3 = {
    __call = function (self, x, y, z)
        return { x = x, y = y, z = z }
    end,
    o = { x = 1, y = 1, z = 1 }
}

setmetatable(vec3, vec3)

function vec3.add(l, r)
    return vec3(l.x + r.x, l.y + r.y, l.z + r.z)
end

function vec3.sub(l, r)
    return vec3(l.x - r.x, l.y - r.y, l.z - r.z)
end

function vec3.scale(v, s)
    return vec3(v.x * s, v.y * s, v.z * s)
end

function vec3.div(v, s)
    return vec3(v.x / s, v.y / s, v.z / s)
end

function vec3.cross(l, r)
    return vec3(l.y * r.z - l.z * r.y,
                l.z * r.x - l.x * r.z,
                l.x * r.y - l.y * r.x)
end

function vec3.dot(l, r)
    return l.x * r.x + l.y * r.y + l.z * r.z
end

function vec3.mag(v)
    return (v.x^2 + v.y^2 + v.z^2)^0.5
end

function vec3.mag2(v)
    return (v.x^2 + v.y^2 + v.z^2)
end

function vec3.angle(l, r)
    return math.acos(vec3.dot(l, r) / math.abs(vec3.mag(l) * vec3.mag(r)))
end

function vec3.norm(v)
    local m = vec3.mag(v)
    return vec3(v.x / m, v.y / m, v.z / m)
end

function vec3.dist(l, r)
    return ((r.x-l.x)^2+(r.y-l.y)^2+(r.z-l.z)^2)^0.5
end
