function DbMenu()
	love.graphics.setColor(1,1,1)
	love.graphics.scale(cam.z,cam.z)
	love.graphics.draw(smenu,0,0)
	love.graphics.draw(sbody,qbody[pl.nsp+16],190,131)
	love.graphics.draw(shand,qhand[pl.nsp+16],190,131)
	love.graphics.draw(sgun,qgun[pl.nsp+16],185,131)
end

function DbMapa()
	love.graphics.setColor(1,1,1)
	love.graphics.setBackgroundColor((lvl*72)/255,0,1-((lvl*72)/255))
	love.graphics.scale(cam.z,cam.z)
	love.graphics.translate(0,0)
	for a=0,3 do
		if a<=lvlmax then love.graphics.draw(lvls[a],((a+1)*170)-(lvl*170),70)
		else love.graphics.draw(lvls[4],((a+1)*170)-(lvl*170),70) end
	end
	love.graphics.print("Level "..(lvl+1),180,140)
	love.graphics.print("Move",188,160)
	love.graphics.print("Press X to Start",154,180)
	love.graphics.setColor(1,1,1,msjal/255)
	love.graphics.print(msj,180,40)
	love.graphics.setColor(1,1,1)
	love.graphics.draw(barrabg,0,0)
	if msjal>0 then msjal=msjal-1 end
end

function DbBarras()
	love.graphics.scale(cam.z,cam.z)
	love.graphics.setColor(1,1,1)
	love.graphics.setBackgroundColor(0,0.3,1)
	love.graphics.draw(sbarras,100,50)
	love.graphics.print("X "..bar,150,65)
	for a=1,table.getn(botones) do
		if a == btnselec then
			love.graphics.setColor(1,0,0)
			love.graphics.rectangle("line",botones[a].x,botones[a].y,botones[a].w,botones[a].h)
		end
	end
	love.graphics.setColor(1,0,0)
	for a=1,pl.vd do
		love.graphics.rectangle("fill",(a*16)+129,85,15,20)
	end
	for a=1,pl.atk do
		love.graphics.rectangle("fill",(a*16)+129,110,15,20)
	end
	for a=1,pl.amo do
		love.graphics.rectangle("fill",(a*16)+129,135,15,20)
	end
	love.graphics.setColor(1,1,1)
	love.graphics.print("life",115,98)
	love.graphics.print("attack",110,123)
	love.graphics.print("ammo\n(x5)",115,148)
	love.graphics.print([[            Press the arrow keys to move.
   Press X in "+" buttons to add life, power or ammo.
Press X in "-" buttons to substrack life, power or ammo.]],65,180)
end

function DbJuego()
	love.graphics.scale(cam.z,cam.z)
	love.graphics.translate(-cam.x+(cam.sx*2),-cam.y+(cam.sy*2))
	love.graphics.setColor(1,1,1)
	if lvl<2 then
		love.graphics.setBackgroundColor((71-((400-pl.y)/22))/255,(170-((400-pl.y)/2))/255,(227-((400-pl.y)/2))/255)
	elseif lvl==2 then
		love.graphics.setBackgroundColor((255-((400-pl.y)/2))/255,(239-((400-pl.y)/2))/255,(131-((400-pl.y)/6))/255)
	else
		love.graphics.setBackgroundColor((255-((800-pl.y)/2))/255,(239-((800-pl.y)/2))/255,(131-((800-pl.y)/6))/255)
	end
	love.graphics.setColor(1,1,1)
	for a=1,table.getn(enemis) do
		if enemis[a].tp < 5 then
			love.graphics.setColor(1,1,1)
			love.graphics.draw(senemy,qenemy[(enemis[a].tp*16)+(enemis[a].d*8)+enemis[a].nsp],enemis[a].x-3,enemis[a].y-5)
			for b=1,enemis[a].vd do
				love.graphics.setColor(0,1,0.3)
				love.graphics.rectangle("fill",enemis[a].x+((b-1)*4),enemis[a].y-15,3,3)
			end
			for b=1,table.getn(enemis[a].bala) do
				love.graphics.setColor(1,0,0)
				love.graphics.rectangle("fill",enemis[a].bala[b].x,enemis[a].bala[b].y,enemis[a].bala[b].w,enemis[a].bala[b].h)
			end
		end
	end
	love.graphics.setColor(1,1,1)
	if pl.rt==0 then
		love.graphics.draw(sbody,qbody[(pl.bnfl*8)+pl.nsp],pl.x-3,pl.y-5)
		love.graphics.draw(shand,qhand[(pl.anfl*8)+pl.nsp],pl.x-3,pl.y-5)
		love.graphics.draw(sgun,qgun[(pl.anfl*8)+pl.nsp],pl.x-8,pl.y-5)
	elseif pl.rt==1 then love.graphics.draw(srt,qrt[pl.nsp],pl.x-3,pl.y-5)
	elseif pl.rt==2 then love.graphics.draw(srt,qrt[8+pl.nsp],pl.x-3,pl.y-5)
	elseif pl.rt==3 then love.graphics.draw(srt,qrt[16+pl.nsp],pl.x-3,pl.y-5)
	end
	love.graphics.print("ammo: "..pl.amo,pl.x,pl.y-20)
	love.graphics.print("life:",pl.x,pl.y-10)
	for a=1,pl.vd do
		love.graphics.setColor(0,1,0.3)
		love.graphics.rectangle("fill",pl.x+((a-1)*5)+24,pl.y-8,4,4)
	end
	for a=1,table.getn(pl.bala) do
		love.graphics.setColor(1,0,0.3)
		love.graphics.rectangle("fill",pl.bala[a].x,pl.bala[a].y,pl.bala[a].w,pl.bala[a].h)
	end
	--[[for a=1,table.getn(plataformas) do
		love.graphics.rectangle("fill",plataformas[a].x,plataformas[a].y,plataformas[a].w,plataformas[a].h)
	end
	love.graphics.setColor(1,0,1)
	for a=1,table.getn(paredes) do
		love.graphics.rectangle("fill",paredes[a].x,paredes[a].y,paredes[a].w,paredes[a].h)
	end]]
	love.graphics.setColor(1,1,1)
	for a=1,table.getn(art) do
		love.graphics.draw(sart,qart[(art[a].t*8)+ansp],art[a].x,art[a].y)
	end
	love.graphics.draw(bgs[lvl],-20,-20)
	love.graphics.print(pl.mv,cam.x+10,cam.y+20)
	if lvl<2 then
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",-20,-400,440,380)
		love.graphics.rectangle("fill",-400,-400,380,1200)
		love.graphics.rectangle("fill",-20,420,440,380)
		love.graphics.rectangle("fill",420,-400,380,1200)
	elseif lvl==2 then
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",-20,-400,640,380)
		love.graphics.rectangle("fill",-400,-400,380,1200)
		love.graphics.rectangle("fill",-20,420,640,380)
		love.graphics.rectangle("fill",620,-400,380,1200)
	else
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",-20,-400,440,380)
		love.graphics.rectangle("fill",-400,-400,380,1600)
		love.graphics.rectangle("fill",-20,820,440,380)
		love.graphics.rectangle("fill",420,-400,380,1600)
	end
	love.graphics.setColor(0,0,0,cmb/255)
	love.graphics.rectangle("fill",cam.x,cam.y,love.graphics.getWidth()/cam.z,love.graphics.getHeight()/cam.z)
end