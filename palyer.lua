
local player = {

    sprite = love.graphics.newImage("sprites/canasta.png"),
    x = 400,
    y = 500,
    speed = 400,
    medida = 0.5
}


----------------------------------------------------------------
--PERMITE EL MOVIMIENTO DEL JUGADOR

function player.update(dt)

    if love.keyboard.isDown("right") and player.x >= 0 and player.x <= 800 - player.sprite:getWidth() * player.medida then

        player.x =
            player.x + player.speed * dt

    elseif love.keyboard.isDown("left") and player.x >= 0 and player.x <= 800 - player.sprite:getWidth() * player.medida then
        player.x =
            player.x - player.speed * dt

    elseif (love.keyboard.isDown("left") or love.keyboard.isDown("right")) and player.x > 800 - player.sprite:getWidth() * player.medida then
        player.x = player.x - 50 * dt

     elseif (love.keyboard.isDown("left") or love.keyboard.isDown("right")) and player.x < 0 + player.sprite:getWidth() * player.medida then
        player.x = player.x + 50 * dt
    end
end

-----------------------------------------------------------------
--DIBUJA AL JUGADOR EN PANTALLA

function player.draw()
    love.graphics.draw(player.sprite, player.x, player.y, 0, player.medida, player.medida) -- aqui se muestra la imagen del personaje en pantalla, el 0 es la rotacion, y el 0.5 es el escalado, es decir, el tamaño de la imagen, en este caso se reduce a la mitad

end

return player