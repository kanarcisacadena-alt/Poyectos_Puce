local player = require("palyer")

local frutas = {}

sonido_recolectar = love.audio.newSource("all_sounds/Pickup1.wav", "static")
BienHecho = love.audio.newSource("all_sounds/buen_score.mp3", "stream")
---------------------------------------------------
-- configuración

frutas.medida = 0.3

frutas.sprites = {

    love.graphics.newImage("sprites/lechuga.png"),
    love.graphics.newImage("sprites/naranja.png"),
    love.graphics.newImage("sprites/pera.png"),
    love.graphics.newImage("sprites/tomate.png"),
    love.graphics.newImage("sprites/uva.png"),
    love.graphics.newImage("sprites/zanahoria.png")

}

---------------------------------------------------
-- Frutas activas

frutas.ativas = {}

---------------------------------------------------
-- Spanw

function frutas.spawn()

    local fruit = {}

    fruit.sprite =
        frutas.sprites[math.random(#frutas.sprites)]

    fruit.x = math.random(
        0,
        love.graphics.getWidth()
        - fruit.sprite:getWidth() * frutas.medida
    )

    fruit.y = -50

    fruit.speed = math.random(150, 300)

    table.insert(frutas.ativas, fruit)

end

---------------------------------------------------
-- actualizacion de la posicion y estado de las frutas

function frutas.update(dt)

    for i = #frutas.ativas, 1, -1 do
        local fruit = frutas.ativas[i]

        fruit.y = fruit.y + fruit.speed * dt

        local playerWidth = player.sprite:getWidth() * player.medida
        local playerHeight = player.sprite:getHeight() * player.medida

        local fruitWidth = fruit.sprite:getWidth() * frutas.medida
        local fruitHeight = fruit.sprite:getHeight() * frutas.medida

        if fruit.x < player.x + playerWidth and
           fruit.x + fruitWidth > player.x and
           fruit.y < player.y + playerHeight and
           fruit.y + fruitHeight > player.y then

            contador = contador + 1
            sonido_recolectar:play()
            table.remove(frutas.ativas, i)


            if contador % 10 == 0 and mensajeTiempo <= 0 then
                BienHecho:stop()
                BienHecho:play()
                mensajeTiempo = 3
                local mensajes = {"¡Great Job!", "¡Awesome!", "¡Incredible!", "¡Great!"}
                mensajeTexto = mensajes[math.random(#mensajes)]
            end

        elseif fruit.y > love.graphics.getHeight() then
            table.remove(frutas.ativas, i)
        end
    end
end

---------------------------------------------------
-- para que las frutas aparescan en pantalla

function frutas.draw()

    for i, fruit in ipairs(frutas.ativas) do

        ---------------------------------
        -- SPRITE

        love.graphics.draw(
            fruit.sprite,
            fruit.x,
            fruit.y,
            0,
            frutas.medida,
            frutas.medida
        )

        

   

    end

end

---------------------------------------------------

return frutas
