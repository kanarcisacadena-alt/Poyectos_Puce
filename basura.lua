imp_palyer = require("palyer")

local basura = {}

sonido_eliminar = love.audio.newSource("all_sounds/Boom.wav", "static")
---------------------------------------------------

basura.medida = 0.3

basura.sprites = {

    love.graphics.newImage("sprites/cascara_banana.png"),
    love.graphics.newImage("sprites/papel.png"),
    love.graphics.newImage("sprites/lata.png")

}

---------------------------------------------------

basura.ativas = {}

---------------------------------------------------

function basura.spawn()

    local item = {}

    -- sprite aleatorio
    item.sprite =
        basura.sprites[math.random(#basura.sprites)]

    -- posición aleatoria
    item.x = math.random(
        0,
        love.graphics.getWidth()
        - item.sprite:getWidth() * basura.medida
    )

    -- aparece arriba
    item.y = -50

    -- velocidad aleatoria
    item.speed = math.random(120, 270)

    -- guardar
    table.insert(basura.ativas, item)

end

---------------------------------------------------

function basura.update(dt)

    for i = #basura.ativas, 1, -1 do
        local item = basura.ativas[i]

        item.y = item.y + item.speed * dt

        local playerWidth = imp_palyer.sprite:getWidth() * imp_palyer.medida
        local playerHeight = imp_palyer.sprite:getHeight() * imp_palyer.medida

        local basuraWidth = item.sprite:getWidth() * basura.medida
        local basuraHeight = item.sprite:getHeight() * basura.medida

        if item.x < imp_palyer.x + playerWidth and
           item.x + basuraWidth > imp_palyer.x and
           item.y < imp_palyer.y + playerHeight and
           item.y + basuraHeight > imp_palyer.y then

            eliminar = eliminar + 1
            sonido_eliminar:play()  
            table.remove(basura.ativas, i)

        elseif item.y > love.graphics.getHeight() then
            table.remove(basura.ativas, i)
        end
    end
end  

---------------------------------------------------

function basura.draw()

    for i, item in ipairs(basura.ativas) do

        ---------------------------------
        -- SPRITE

        love.graphics.draw(
            item.sprite,
            item.x,
            item.y,
            0,
            basura.medida,
            basura.medida
        )

        ---------------------------------
        -- HITBOX

       --[[love.graphics.setColor(0, 0, 1)

        love.graphics.rectangle(
            "line",
            item.x,
            item.y,
            item.sprite:getWidth() * basura.medida,
            item.sprite:getHeight() * basura.medida
        )

        love.graphics.setColor(1, 1, 1)]]

    end

end

---------------------------------------------------

return basura
