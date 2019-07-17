require "conf"
require "clases"
require "misc"
require "draws"
require "lvls"

--fondos
bgs = {}
lvls = {}
--quads
qbody = {}
qhand = {}
qgun = {}
qenemy = {}
qrt = {}
qart = {}
--entorno
plataformas = {}
paredes = {}
botones = {}
lava = {}
art = {}
--enemigos
enemis = {}

function love.load()
--cargamos funciones
	ConfInicial()
	CargarImgs()
	CargarQuads()
	CargarAudios()
--cargamos clases
	--pl = player.new(x,y,w,h,vd,atk,amo)
	pl = player.new(100,100,9,20,1,5,1)
	cam = camera.new(2,10,0,0)
	plataformas = {block.new(0,200,300,20),block.new(300,140,300,20),block.new(600,100,300,20)}
--variables de entorno
	meta={x=0,y=0,w=0,h=0}
	display="menu"
	lvl = 0
	lvlmax = 0
	bar = 10
	btnselec = 1
	msj = ""
	msjal=255
	cmb=255
	ansp = 1
	acnt=0
end

function love.update()
	if display=="menu" then
		if cmb>0 then cmb=cmb-5 end
		if rolita2:isPlaying() == false then
			rolita2:play()
		end
		if rolita2:getVolume() < 0.5 then rolita2:setVolume(rolita2:getVolume()+0.05) end
		pl.Anim()
	elseif display=="mapa" then
		if rolita2:isPlaying() == false then
			rolita2:play()
		end
		if rolita2:getVolume() < 0.5 then rolita2:setVolume(rolita2:getVolume()+0.05) end
		if rolita1:isPlaying() == true then
			if rolita1:getVolume() > 0 then rolita1:setVolume(rolita1:getVolume()-0.05)
			else rolita1:stop() end
		end
	elseif display=="barras" then
		if rolita2:isPlaying() == false then
			rolita2:play()
		end
		if rolita2:getVolume() < 0.5 then rolita2:setVolume(rolita2:getVolume()+0.05) end
		if rolita1:isPlaying() == true then
			if rolita1:getVolume() > 0 then rolita1:setVolume(rolita1:getVolume()-0.05)
			else rolita1:stop() end
		end
		if btnselec<1 then btnselec=1 end
		if btnselec>7 then btnselec=7 end
	elseif display=="juego" then
		if rolita1:isPlaying() == false then
			rolita1:play()
		end
		if rolita1:getVolume() < 0.5 then rolita1:setVolume(rolita1:getVolume()+0.05) end
		if rolita2:isPlaying() == true then
			if rolita2:getVolume() > 0 then rolita2:setVolume(rolita2:getVolume()-0.05)
			else rolita2:stop() end
		end
		pl.Anim()
		if cmb==0 then
			if pl.rt==0 then pl.Keys() end
			pl.Colisiones(plataformas,paredes,enemis,meta,lava)
			pl.Jump()
			pl.Bullets()
			pl.NumAnim()
			pl.Retroceso()
			for a=1,table.getn(enemis) do
				if enemis[a].tp < 5 then
					enemis[a].Anim()
					enemis[a].NumAnim()
				end
				if enemis[a].tp < 4 then
					enemis[a].Move()
					enemis[a].Jump()
					enemis[a].Cols(plataformas,paredes,pl)
					enemis[a].Bullets(pl)
				end
			end
			AnimarEnt()
			cam.Move(pl)
			cam.Shake()
		else
			cmb=cmb+5
			if cmb>255 then display="mapa" end
		end
	end
end

function love.keypressed(key)
	if display=="menu" then
		if key=="x" then display="mapa" lvl=0 end
	elseif display=="mapa" then
		if key=="left" and lvl>0 then lvl=lvl-1 end
		if key=="right" and lvl<3 then lvl=lvl+1 end
		if key=="x" and lvl<=lvlmax then
			display="barras"
			CargarBarras()
			pl.vd=0
			pl.amo=0
			pl.atk=0
		end
	elseif display=="barras" then
		if key=="left" then btnselec=btnselec-1 end
		if key=="right" then btnselec=btnselec+1 end
		if key=="down" then btnselec=btnselec+2 end
		if key=="up" then btnselec=btnselec-2 end
		if key=="x" then
			if bar>0 then
				if btnselec == 2 and pl.vd<5 then pl.vd=pl.vd+1 bar=bar-1
				elseif btnselec == 4 and pl.atk<5 then pl.atk=pl.atk+1 bar=bar-1
				elseif btnselec == 6 and pl.amo<5 then pl.amo=pl.amo+1 bar=bar-1 end
			end
			if btnselec== 1 and pl.vd>0 then pl.vd=pl.vd-1 bar=bar+1
			elseif btnselec == 3 and pl.atk>0 then pl.atk=pl.atk-1 bar=bar+1
			elseif btnselec == 5 and pl.amo>0 then pl.amo=pl.amo-1 bar=bar+1 end
			if btnselec==7 and bar == 0 then
				display="juego" pl.amo=pl.amo*5 cmb=0 pl.rt=0
				CargarPisos()
				CargarParedes()
				CargarPosiciones()
				CargarEnemigos()
				CargarLava()
			end
		end
	elseif display=="juego" then
		pl.KeysP(key)
	end
end

function love.draw()
	if display=="menu" then
		DbMenu()
	elseif display=="mapa" then
		DbMapa()
	elseif display=="barras" then
		DbBarras()
	elseif display=="juego" then
		DbJuego()
	end
end