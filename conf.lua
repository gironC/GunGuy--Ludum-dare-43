function love.conf(t)
    t.identity = nil                    -- The name of the save directory (string)
    t.appendidentity = false            -- Search files in source directory before save directory (boolean)
    t.version = "11.2"                  -- The LÖVE version this game was made for (string)
    t.console = true                   -- Attach a console (boolean, Windows only)
    t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
    t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
    t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)
 
    t.audio.mixwithsystem = true        -- Keep background music playing when opening LOVE (boolean, iOS and Android only)
 
    t.window.title = "Untitled"         -- The window title (string)
    t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
    t.window.width = 800                -- The window width (number)
    t.window.height = 600               -- The window height (number)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
    t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)
    t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
    t.window.vsync = 0                  -- Vertical sync mode (number)
    t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
    t.window.depth = nil                -- The number of bits per sample in the depth buffer
    t.window.stencil = nil              -- The number of bits per sample in the stencil buffer
    t.window.display = 1                -- Index of the monitor to show the window in (number)
    t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
    t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
    t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)
 
    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.data = true               -- Enable the data module (boolean)
    t.modules.event = true              -- Enable the event module (boolean)
    t.modules.font = true               -- Enable the font module (boolean)
    t.modules.graphics = true           -- Enable the graphics module (boolean)
    t.modules.image = true              -- Enable the image module (boolean)
    t.modules.joystick = true           -- Enable the joystick module (boolean)
    t.modules.keyboard = true           -- Enable the keyboard module (boolean)
    t.modules.math = true               -- Enable the math module (boolean)
    t.modules.mouse = true              -- Enable the mouse module (boolean)
    t.modules.physics = true            -- Enable the physics module (boolean)
    t.modules.sound = true              -- Enable the sound module (boolean)
    t.modules.system = true             -- Enable the system module (boolean)
    t.modules.thread = true             -- Enable the thread module (boolean)
    t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
    t.modules.touch = true              -- Enable the touch module (boolean)
    t.modules.video = true              -- Enable the video module (boolean)
    t.modules.window = true             -- Enable the window module (boolean)
end

function ConfInicial()
	love.window.setMode(800,450,{fullscreen=false,resizable=false}) -- 400,225
	love.window.setTitle("GunGuy 0.1")
	love.graphics.setDefaultFilter('nearest', 'nearest', 1)
	font = love.graphics.newImageFont("pixelfuente.png"," ABCDEFGHIJKLMN*OPQRSTUVWXYZabcdefghijklmn*opqrstuvwxyz0123456789.,-()¡!¿?:\"_+")
	love.graphics.setFont(font)
	love.graphics.setBackgroundColor(0.1,0.1,0.1)
end

function CargarImgs()
	sbarras = love.graphics.newImage("barras.png")
	sbody = love.graphics.newImage("body.png")
	shand = love.graphics.newImage("manos.png")
	sgun = love.graphics.newImage("gun.png")
	senemy = love.graphics.newImage("enemigos.png")
	srt = love.graphics.newImage("rt.png")
	sart = love.graphics.newImage("art.png")
	smenu = love.graphics.newImage("menu.png")
	barrabg = love.graphics.newImage("barrabg.png")
	for a=0,3 do bgs[a] = love.graphics.newImage("bgs/bg"..a..".png") end
	for a=0,4 do lvls[a] = love.graphics.newImage("lvls/lv"..a..".png") end
end

function CargarAudios()
	rolita1 = love.audio.newSource("rolita1.ogg","static")
	rolita2 = love.audio.newSource("rolita2.ogg","static")
	pew = love.audio.newSource("pew.ogg","static")
	pum = love.audio.newSource("pum.ogg","static")
	rolita1:setVolume(0)
	rolita2:setVolume(0)
	pew:setVolume(0.7)
	pum:setVolume(0.7)
end

function CargarQuads()
	crearQuads.new(sbody,qbody,8,8,15,25)
	crearQuads.new(shand,qhand,22,8,15,25)
	crearQuads.new(sgun,qgun,22,8,25,25)
	crearQuads.new(senemy,qenemy,9,8,15,25)
	crearQuads.new(srt,qrt,3,8,15,25)
	crearQuads.new(sart,qart,2,4,20,20)
end