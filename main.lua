
function love.load()    -- los personajes, objetos, etc que se van a mostrar en pantalla, se crean en esta funcion
    
   
    Fascinate = love.graphics.newFont("biblioteca/fonts/Fascinate/fascinate-Regular.ttf", 15)
    love.graphics.setFont(Fascinate)

    sonido_perder = love.audio.newSource("all_sounds/Blip.wav", "static")

    backgroundMusic = love.audio.newSource("all_sounds/backgroundmusic.mp3", "stream")
    backgroundMusic:setLooping(true)
    backgroundMusic:play()

    frutas = require "frutas"
    player = require "palyer"
    basura = require "basura"   

    math.randomseed(os.time()) -- esto es para que los numeros aleatorios sean diferentes cada vez que se ejecute el programa, ya que si no se hace esto, los numeros aleatorios seran los mismos cada vez que se ejecute el programa, porque se basan en la hora del sistema, y si no se cambia la semilla, siempre sera la misma hora, y por lo tanto los mismos numeros aleatorios
     
    spawnTimer = 0
    spawnDelay = 1

    spawnTimer2 = 0
    spawnDelay2 = 1 

    mensajeTiempo = 0
    mensajeTexto = ""
    contador = 0
    eliminar = 0

    background = love.graphics.newImage("sprites/fondo.png")   
    
    pantallaInicio = true
    gameOver = false
    paused = false
    puntajeFinal = 0
    imagenInicio = love.graphics.newImage("sprites/ventana_intrucciones.png")

end

function love.keypressed(key)
    if gameOver and key == "return" then
        contador = 0
        eliminar = 0
        mensajeTiempo = 0
        frutas.ativas = {}
        basura.ativas = {}
        spawnTimer = 0
        spawnDelay = 1
        spawnTimer2 = 0
        spawnDelay2 = 1
        player.x = 400
        gameOver = false
        pantallaInicio = false
        frutas.spawn()
        basura.spawn()
    elseif pantallaInicio and key == "return" then
        pantallaInicio = false
        frutas.spawn()
        basura.spawn()
    elseif key == "x" and not pantallaInicio and not gameOver then
        paused = not paused
    end
end

function love.update(dt)

    if pantallaInicio or gameOver then
        return
    end

    if paused then
        return
    end

    player.update(dt)

    spawnTimer = spawnTimer + dt

    if spawnTimer >= spawnDelay then

        local cantidad = math.random(1, 3)

        for i = 1, cantidad do
            frutas.spawn()
        end

        spawnTimer = 0

        spawnDelay = math.random(20, 40) / 10 

    end

    spawnTimer2 = spawnTimer2 + dt

    if spawnTimer2 >= spawnDelay2 then

        local cantidad = math.random(1, 2)

        for i = 1, cantidad do
            basura.spawn()
        end

        spawnTimer2 = 0

        spawnDelay2 = math.random(30, 50) / 10 

    end

    if mensajeTiempo > 0 then
        mensajeTiempo = mensajeTiempo - dt
    end

    if eliminar >= 10 then
        sonido_perder:play()
        puntajeFinal = contador
        gameOver = true
    end
    
    frutas.update(dt)
    basura.update(dt)

end

function drawOutlinedText(text, x, y, r, sx, sy)
    love.graphics.setColor(0.2, 0.2, 0.2)
    for dx = -2, 2, 2 do
        for dy = -2, 2, 2 do
            if dx ~= 0 or dy ~= 0 then
                love.graphics.print(text, x + dx, y + dy, r or 0, sx or 1, sy or 1)
            end
        end
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(text, x, y, r or 0, sx or 1, sy or 1)
end

function drawOutlinedTextf(text, x, y, w, align, r, sx, sy)
    love.graphics.setColor(0.2, 0.2, 0.2)
    for dx = -2, 2, 2 do
        for dy = -2, 2, 2 do
            if dx ~= 0 or dy ~= 0 then
                love.graphics.printf(text, x + dx, y + dy, w, align, r or 0, sx or 1, sy or 1)
            end
        end
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(text, x, y, w, align, r or 0, sx or 1, sy or 1)
end

function love.draw()

    love.graphics.draw(background, 0, 0, 0, 0.5, 0.56)

    frutas.draw()
    basura.draw()
    player.draw()

    if mensajeTiempo > 0 then
        drawOutlinedText(mensajeTexto, 100, 100)
    end

    drawOutlinedText("Score: "..contador, 10, 10, 0, 1.9, 1.9)

    if pantallaInicio then
        love.graphics.draw(imagenInicio, (love.graphics.getWidth() - imagenInicio:getWidth()) / 2, (love.graphics.getHeight() - imagenInicio:getHeight()) / 2)

        drawOutlinedTextf(
            "Press ENTER to start playing",
            0,
            love.graphics.getHeight()-70,
            love.graphics.getWidth(),
            "center"
        )
    end

    if gameOver then
        drawOutlinedTextf("¡GAME OVER!", 0, love.graphics.getHeight()/2 - 80, love.graphics.getWidth(), "center", 0, 3, 3)
        drawOutlinedTextf("Score: "..puntajeFinal, 0, love.graphics.getHeight()/2 - 30, love.graphics.getWidth()/2, "center", 0, 2, 2)
        drawOutlinedTextf("Press Enter to restart", 0, love.graphics.getHeight()/2 + 20, love.graphics.getWidth(), "center")
    end

    if paused then
        drawOutlinedTextf("Paused", 0, love.graphics.getHeight()/2 - 80, love.graphics.getWidth()/2-130, "center", 0, 3, 3)
        drawOutlinedTextf("Press X to continue playing", 0, love.graphics.getHeight()/2 + 20, love.graphics.getWidth(), "center")
    end

end

