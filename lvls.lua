function CargarPisos()
	b=table.getn(plataformas)
	for a=1,b do table.remove(plataformas) end
	if lvl==0 then
		table.insert(plataformas,block.new(0,400,400,20))
		table.insert(plataformas,block.new(300,340,100,20))
		table.insert(plataformas,block.new(0,280,300,20))
		table.insert(plataformas,block.new(0,220,40,20))
		table.insert(plataformas,block.new(40,160,60,20))
		table.insert(plataformas,block.new(100,100,300,20))
	elseif lvl==1 then
		table.insert(plataformas,block.new(0,400,400,20))
		table.insert(plataformas,block.new(160,100,240,20))
		table.insert(plataformas,block.new(40,160,120,20))
		table.insert(plataformas,block.new(0,220,40,20))
		table.insert(plataformas,block.new(0,280,300,20))
		table.insert(plataformas,block.new(300,340,100,20))
	elseif lvl==2 then
		table.insert(plataformas,block.new(0,400,600,20))
		table.insert(plataformas,block.new(320,100,280,20))
		table.insert(plataformas,block.new(40,160,560,20))
		table.insert(plataformas,block.new(0,220,40,20))
		table.insert(plataformas,block.new(0,280,560,20))
		table.insert(plataformas,block.new(560,340,40,20))
	elseif lvl==3 then
		table.insert(plataformas,block.new(0,800,400,20))
		table.insert(plataformas,block.new(0,100,200,20))
		table.insert(plataformas,block.new(200,160,100,20))
		table.insert(plataformas,block.new(180,220,20,20))
		table.insert(plataformas,block.new(0,280,360,20))
		table.insert(plataformas,block.new(40,460,360,20))
		table.insert(plataformas,block.new(0,520,40,20))
		table.insert(plataformas,block.new(0,580,360,20))
		table.insert(plataformas,block.new(360,640,40,20))
		table.insert(plataformas,block.new(40,700,360,20))
		table.insert(plataformas,block.new(0,740,40,20))
	end
end

function CargarParedes()
	b=table.getn(paredes)
	for a=1,b do table.remove(paredes) end
	if lvl==0 or lvl==1 then
		table.insert(paredes,block.new(-20,0,20,400))
		table.insert(paredes,block.new(400,0,20,400))
	elseif lvl==2 then
		table.insert(paredes,block.new(-20,0,20,400))
		table.insert(paredes,block.new(600,0,20,400))
	elseif lvl==3 then
		table.insert(paredes,block.new(-20,0,20,800))
		table.insert(paredes,block.new(400,0,20,800))
	end
end

function CargarLava()
	b=table.getn(lava)
	for a=1,b do table.remove(lava) end
	b=table.getn(art)
	for a=1,b do table.remove(art) end
	if lvl==0 then
		table.insert(lava,block.new(130,280,40,20))
	elseif lvl==1 then
		table.insert(lava,block.new(70,280,20,20))
		table.insert(lava,block.new(210,280,20,20))
	elseif lvl==2 then
		table.insert(lava,block.new(70,280,20,20))
		table.insert(lava,block.new(150,280,20,20))
		table.insert(lava,block.new(230,280,20,20))
		table.insert(lava,block.new(290,280,20,20))
		table.insert(lava,block.new(350,280,20,20))
		table.insert(lava,block.new(410,280,20,20))
	elseif lvl==3 then
		table.insert(lava,block.new(250,280,20,20))
		table.insert(lava,block.new(330,280,20,20))
		table.insert(lava,block.new(110,700,20,20))
		table.insert(lava,block.new(230,700,20,20))
		table.insert(lava,block.new(330,700,20,20))
	end
	for a=1,table.getn(lava) do
		for b=lava[a].x-10,lava[a].x+lava[a].w,20 do
			for c=lava[a].y,lava[a].y+160,20 do
				table.insert(art,{x=b,y=c,t=0})
			end
		end
	end
end

function CargarEnemigos()
	b=table.getn(enemis)
	for a=1,b do table.remove(enemis) end
	if lvl==0 then
		table.insert(enemis,enemy.new(120,80,9,20,0,100))
	elseif lvl==1 then
		table.insert(enemis,enemy.new(200,380,9,20,0,100))
		table.insert(enemis,enemy.new(200,20,9,20,3,100))
	elseif lvl==2 then
		table.insert(enemis,enemy.new(60,140,9,20,1,3))
		table.insert(enemis,enemy.new(150,200,9,20,3,300))
		table.insert(enemis,enemy.new(200,200,9,20,3,200))
	elseif lvl==3 then
		table.insert(enemis,enemy.new(100,80,9,20,2,100))
		table.insert(enemis,enemy.new(20,260,9,20,1,3))
		table.insert(enemis,enemy.new(40,260,9,20,1,2))
		table.insert(enemis,enemy.new(20,330,9,20,3,300))
		table.insert(enemis,enemy.new(70,330,9,20,3,200))
		table.insert(enemis,enemy.new(120,330,9,20,3,150))
		table.insert(enemis,enemy.new(100,560,9,20,2,150))
		table.insert(enemis,enemy.new(200,560,9,20,0,100))
		table.insert(enemis,enemy.new(100,510,9,20,3,100))
	end
end

function CargarPosiciones()
	if lvl==0 then
		pl.x=10 pl.y=300
		meta.x=340 meta.y=100 meta.w=60 meta.h=20
	elseif lvl==1 then
		pl.x=10 pl.y=300
		meta.x=340 meta.y=100 meta.w=60 meta.h=20
	elseif lvl==2 then
		pl.x=570 pl.y=80
		meta.x=0 meta.y=400 meta.w=60 meta.h=20
	elseif lvl==3 then
		pl.x=10 pl.y=80
		meta.x=40 meta.y=800 meta.w=60 meta.h=20
	end
end

function CargarBarras()
	if lvl==0 then bar=5
	elseif lvl==1 then bar=5
	elseif lvl==2 then bar=10
	elseif lvl==3 then bar=10 end
	table.insert(botones,button.new(235,90,10,10))
	table.insert(botones,button.new(250,90,10,10))
	table.insert(botones,button.new(235,115,10,10))
	table.insert(botones,button.new(250,115,10,10))
	table.insert(botones,button.new(235,140,10,10))
	table.insert(botones,button.new(250,140,10,10))
	table.insert(botones,button.new(255,155,30,12))
	btnselec = 1
end