player = {}
player.new = function(x,y,w,h,vd,atk,amo)
	local self = {}
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.rt = 0
	self.mv = 0 --si sesta moviendo xd
	self.vd = vd --vida
	self.atk = atk --atakexd
	self.amo = amo*5 --munizion
	self.d = 0 -- direccion enrike zegoviano xd
	self.db = 0 --0derecha 1derechaarriba 2arriba 3arribaizquierda 4izquierda 5abajoizquierda 6abajo 7derechaabajo
	self.nsp = 1
	self.cnt = 0
	self.dsp = 0 --si esta disparando xd
	self.bnfl = 0 --nfl del cuershpo
	self.anfl = 0 --nfl de las manos y los ojos xd
	self.s = 0 --salto 0=nosalto 1=arriba 2=abajo
	self.fs = 0 --fuerza de salto
	self.cpi = false --colision con el piso xd
	self.cpa = false --colision con la pared
	self.bala = {}
	self.NumAnim = function()
		if self.s > 0 then
			self.bnfl = self.d + 4
			if self.dsp==0 then
				self.anfl = self.d+4
			else
				if self.db==0 then self.anfl=6
				elseif self.db==1 then self.anfl=12
				elseif self.db==2 then if self.d==0 then self.anfl=8 else self.anfl=9 end
				elseif self.db==3 then self.anfl=13
				elseif self.db==4 then self.anfl=7
				elseif self.db==5 then self.anfl=15
				elseif self.db==6 then if self.d==0 then self.anfl=10 else self.anfl=11 end
				elseif self.db==7 then self.anfl=14 end
				if self.nsp==4 and self.cnt==4 then self.dsp=0 end
			end
		else
			if self.mv==0 then
				if self.dsp==0 then
					self.bnfl=self.d
					self.anfl=self.d
				else
					self.bnfl=self.d+6
					if self.db==0 then self.anfl=6
					elseif self.db==2 then if self.d==0 then self.anfl=8 else self.anfl=9 end
					elseif self.db==4 then self.anfl=7
					elseif self.db==6 then if self.d==0 then self.anfl=10 else self.anfl=11 end end
					if self.nsp==4 and self.cnt==4 then self.dsp=0 end
				end
			else
				self.bnfl=self.d+2
				if self.dsp==0 then
					self.anfl=self.d+2
				else
					if self.db==0 then self.anfl=16
					elseif self.db==1 then self.anfl=18
					elseif self.db==3 then self.anfl=19
					elseif self.db==4 then self.anfl=17
					elseif self.db==5 then self.anfl=21
					elseif self.db==7 then self.anfl=20 end
					if self.nsp==4 and self.cnt==4 then self.dsp=0 end
				end
			end
		end
	end
	self.Anim = function()
		self.cnt = self.cnt + 1
		if self.cnt == 5 then
			self.nsp = self.nsp + 1
			if self.nsp > 8 then self.nsp = 1 end
			self.cnt = 0
		end
	end
	self.Keys = function()
		if love.keyboard.isDown("right") then
			self.x=self.x+2
			self.mv=1
			self.d = 0
			if love.keyboard.isDown("up") then
				self.db = 1
			elseif love.keyboard.isDown("down") then
				self.db = 7
			else
				self.db = 0
			end
		elseif love.keyboard.isDown("left") then
			self.x=self.x-2
			self.mv=1
			self.d = 1
			if love.keyboard.isDown("up") then
				self.db = 3
			elseif love.keyboard.isDown("down") then
				self.db = 5
			else
				self.db = 4
			end
		else
			self.mv=0
			if love.keyboard.isDown("up") then
				self.db = 2
			elseif love.keyboard.isDown("down") then
				self.db = 6
			else
				if self.d==0 then self.db = 0 else self.db = 4 end
			end
		end
	end
	self.KeysP = function(key)
		if key == "x" and self.s == 0 then self.s=1 self.fs=10 end
		if key == "c" and self.amo > 0 and ((self.dsp==1 and self.nsp>4) or self.dsp==0) then
			pew:clone():play()
			table.insert(self.bala,{x=self.x,y=self.y,w=5,h=5,d=self.db,act=1})
			if self.bala[table.getn(self.bala)].d==0 then
				self.bala[table.getn(self.bala)].x=self.x+self.w+6
				self.bala[table.getn(self.bala)].y=self.y+8
			elseif self.bala[table.getn(self.bala)].d == 1 then
				self.bala[table.getn(self.bala)].x=self.x+self.w
				self.bala[table.getn(self.bala)].y=self.y+3
			elseif self.bala[table.getn(self.bala)].d == 2 then
				self.bala[table.getn(self.bala)].x=self.x+2
				self.bala[table.getn(self.bala)].y=self.y+2
			elseif self.bala[table.getn(self.bala)].d == 3 then
				self.bala[table.getn(self.bala)].x=self.x
				self.bala[table.getn(self.bala)].y=self.y+3
			elseif self.bala[table.getn(self.bala)].d == 4 then
				self.bala[table.getn(self.bala)].x=self.x-6
				self.bala[table.getn(self.bala)].y=self.y+8
			elseif self.bala[table.getn(self.bala)].d == 5 then
				self.bala[table.getn(self.bala)].x=self.x-4
				self.bala[table.getn(self.bala)].y=self.y+self.h-7
			elseif self.bala[table.getn(self.bala)].d == 6 then
				self.bala[table.getn(self.bala)].x=self.x+2
				self.bala[table.getn(self.bala)].y=self.y+self.h
			elseif self.bala[table.getn(self.bala)].d == 7 then
				self.bala[table.getn(self.bala)].x=self.x+self.w+4
				self.bala[table.getn(self.bala)].y=self.y+self.h-7
			end
			self.amo=self.amo-1
			self.dsp=1 self.cnt=0 self.nsp=1
		end
	end
	self.Colisiones = function(pl,pa,en,mt,lv)
		self.c = 0
		if self.rt==0 then
			if PColision(self,mt) > 0 then
				self.rt=3
			end
			for a=1,table.getn(lv) do
				if PColision(self,lv[a]) > 0 then
					self.rt=2
					self.vd=0
					self.cnt=0
					self.nsp=1
					cam.sh=20
					break
				end
			end
			for a=1,table.getn(en) do
				if en[a].tp<4 then 
					if PColision(self,en[a]) > 0 then
						self.vd = self.vd - 1
						self.rt = 1
						self.cnt = 0
						self.nsp = 1
						if PColision(self,en[a])==1 then self.d=1 else self.d=0 end
						cam.sh=20
						break
					end
					for b=1,table.getn(en[a].bala) do
						if PColision(en[a].bala[b],self) >0 then
							self.vd = self.vd - 1
							self.rt = 1
							self.cnt = 0
							self.nsp = 1
							if PColision(self,en[a].bala[b])==1 then self.d=0 else self.d=1 end
							table.remove(en[a].bala,b)
							cam.sh=20
							break
						end
					end
				end
			end
		end
		for a=1,table.getn(pl) do
			for b=1,table.getn(self.bala) do
				if PColision(self.bala[b],pl[a]) > 0 then
					table.remove(self.bala,b)
					break
				end
			end
		end
		for a=1,table.getn(pa) do
			for b=1,table.getn(self.bala) do
				if PColision(self.bala[b],pa[a]) > 0 then
					table.remove(self.bala,b)
					break
				end
			end
		end
		for a=1,table.getn(pl) do
			if PColision(self,pl[a]) == 2 then
				if self.s == 1 then self.s=2 self.fs=1 end
				break
			elseif PColision(self,pl[a]) == 1 then
				if self.s == 2 then self.s=0 self.c=1 self.y=pl[a].y-self.h end
				if self.s == 0 then self.c=1 end
				break
			end
		end
		if self.c == 0 and self.s==0 then self.s=2 self.fs=1 end
		for a=1,table.getn(pa) do
			if CColision(self,pa[a]) == 1 then self.x=pa[a].x-self.w break
			elseif CColision(self,pa[a])==2 then self.x=pa[a].x+pa[a].w break end
		end
	end
	self.Jump = function()
		if self.s == 1 then
			if self.fs > 1 then
				self.fs = self.fs - (self.fs/10)
				self.y = self.y - toInt(self.fs)
			else self.s = 2 self.fs=1 end
		elseif self.s == 2 then
			if self.c == 0 then
				if self.fs < 10 then self.fs = self.fs + (self.fs/10) end
				self.y = self.y + toInt(self.fs)
			else self.s=0 end
		end
	end
	self.Bullets = function()
		for a=1,table.getn(self.bala) do
			if self.x-self.bala[a].x > 500 or self.x-self.bala[a].x < -500 then
				table.remove(self.bala,a)
				break
			end
			if self.y-self.bala[a].y > 500 or self.y-self.bala[a].y < -500 then
				table.remove(self.bala,a)
				break
			end
			if self.bala[a].d == 0 then
				self.bala[a].x = self.bala[a].x+10
				self.bala[a].y = self.bala[a].y+0
			elseif self.bala[a].d == 1 then
				self.bala[a].x = self.bala[a].x+5
				self.bala[a].y = self.bala[a].y-5
			elseif self.bala[a].d == 2 then
				self.bala[a].x = self.bala[a].x+0
				self.bala[a].y = self.bala[a].y-10
			elseif self.bala[a].d == 3 then
				self.bala[a].x = self.bala[a].x-5
				self.bala[a].y = self.bala[a].y-5
			elseif self.bala[a].d == 4 then
				self.bala[a].x = self.bala[a].x-10
				self.bala[a].y = self.bala[a].y+0
			elseif self.bala[a].d == 5 then
				self.bala[a].x = self.bala[a].x-5
				self.bala[a].y = self.bala[a].y+5
			elseif self.bala[a].d == 6 then
				self.bala[a].x = self.bala[a].x+0
				self.bala[a].y = self.bala[a].y+10
			elseif self.bala[a].d == 7 then
				self.bala[a].x = self.bala[a].x+5
				self.bala[a].y = self.bala[a].y+5
			end
		end
	end
	self.Retroceso = function()
		if self.rt==0 then
			if self.vd <=0 then self.rt=1 end
		elseif self.rt==1 then
			if self.nsp<6 then
				if self.d==0 then self.x=self.x-3 else self.x=self.x+3 end
			end
			if self.nsp==8 and self.cnt==4 then
				if self.vd > 0 then self.rt=0
				else self.rt=2 end
			end
		elseif self.rt==2 then
			if self.nsp==1 and self.cnt==0 then pum:clone():play() end
			if self.nsp==8 and self.cnt==4 then
				cmb=1
				self.rt=4
			end
		elseif self.rt==3 then
			if cmb==0 then
				if lvl== lvlmax then lvlmax=lvl+1 end
				msjal=255
				if lvlmax<4 then msj=" Level "..(lvlmax+1).."\nUNLOCKED!"
				else msj="COMPLETE!" end
			end
			cmb=1
		end
	end
	return self
end


enemy = {}
enemy.new = function(x,y,w,h,tp,np)
	local self = {}
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.s = 0
	self.fs = 0
	self.c = 0 --colision con el suelo xd
	self.tp = tp --tipo xd
	self.d = 0
	self.nsp = 1
	self.cnt = 0
	self.vd = (tp+1)*3 --vida
	self.np = np
	self.npcnt = 0
	self.mp = 0
	self.acnt = 0 --contador para atacar, nomas el 3 xd
	self.bala = {}
	self.hit = {}
	self.NumAnim = function()
		if self.tp==2 then
			if self.d == 0 then self.hit={x=self.x,y=self.y-10,w=109,h=35}
			else self.hit={x=self.x-100,y=self.y-10,w=100,h=35} end
		elseif self.tp==3 then self.hit={x=self.x-13,y=self.y,w=35,h=120} end
		if self.tp==4 and self.nsp==1 and self.cnt==1 then pum:clone():play() end
		if self.tp==4 and self.nsp==8 and self.cnt==4 then
			self.tp=5
		end
	end
	self.Anim = function()
		self.cnt = self.cnt + 1
		if self.cnt == 5 then
			self.nsp = self.nsp + 1
			if self.nsp > 8 then self.nsp = 1 end
			self.cnt = 0
		end
	end
	self.Move = function()
		if self.tp == 0 or self.tp==2 or self.tp==3 then
			self.npcnt = self.npcnt + 1
			if self.npcnt == self.np then
				self.npcnt = 0
				if self.d==0 then self.d=1 else self.d=0 end
			end
			if self.d == 0 then self.x=self.x+1 else self.x=self.x-1 end
		elseif self.tp == 1 then
			if self.nsp==8 and self.cnt==4 then self.npcnt=self.npcnt+1 end
			if self.npcnt == self.np then
				self.npcnt = 0
				if self.d==0 then self.d=1 else self.d=0 end
			end
			if self.d==0 then
				if self.nsp>1 and self.nsp < 6 then self.x=self.x+3
				elseif self.nsp==6 then self.x=self.x+1 end
			else
				if self.nsp>1 and self.nsp < 6 then self.x=self.x-3
				elseif self.nsp==6 then self.x=self.x-1 end
			end
		end
	end
	self.Bullets = function(jg)
		if self.acnt < 150 then self.acnt=self.acnt+1 end
		for a=1,table.getn(self.bala) do
			if self.bala[a].d==0 then self.bala[a].x=self.bala[a].x+5
			elseif self.bala[a].d==1 then self.bala[a].x = self.bala[a].x-5
			elseif self.bala[a].d==2 then self.bala[a].y=self.bala[a].y+3 end
		end
		if self.acnt==150 then
			if self.tp==2 and PColision(jg,self.hit)>0 then
				if self.d==0 then
					table.insert(self.bala,{x=self.x+self.w,y=self.y+10,w=3,h=3,d=0})
				else
					table.insert(self.bala,{x=self.x-3,y=self.y+10,w=3,h=3,d=1})
				end
				self.acnt = 0
			elseif self.tp==3 and PColision(jg,self.hit)>0 then
				table.insert(self.bala,{x=self.x+self.w,y=self.y+10,w=3,h=3,d=2})
				self.acnt = 0
			end
		end
	end
	self.Jump = function()
		if self.s == 1 then
			if self.c == 0 then
				if self.fs < 10 then self.fs = self.fs + (self.fs/10) end
				self.y = self.y + toInt(self.fs)
			else self.s=0 end
		end
	end
	self.Cols = function(pl,pa,jg)
		self.c = 0
		for a=1,table.getn(pl) do
			for b=1,table.getn(self.bala) do
				if PColision(self.bala[b],pl[a]) > 0 then
					table.remove(self.bala,b)
					break
				end
			end
		end
		for a=1,table.getn(pa) do
			for b=1,table.getn(self.bala) do
				if PColision(self.bala[b],pa[a]) > 0 then
					table.remove(self.bala,b)
					break
				end
			end
		end
		if self.tp < 3 then
			for a=1,table.getn(pl) do
				if PColision(self,pl[a]) == 1 then
					if self.s == 1 then self.s=0 self.c=1 self.y=pl[a].y-self.h end
					if self.s == 0 then self.c=1 end
					break
				end
			end
			if self.c == 0 and self.s==0 then self.s=2 self.fs=1 end
		end
		for a=1,table.getn(pa) do
			if CColision(self,pa[a]) == 1 then self.x=pa[a].x-self.w break
			elseif CColision(self,pa[a])==2 then self.x=pa[a].x+pa[a].w break end
		end
		for a=1,table.getn(jg.bala) do
			if PColision(jg.bala[a],self) > 0 then
				self.vd = self.vd - jg.atk
				if self.vd <= 0 then 
					self.tp = 4
					self.d = 0
					self.vd = 0
					self.cnt = 0
					self.nsp = 1
					cam.sh=20
				end
				table.remove(jg.bala,a)
				break
			end
		end
	end
	return self
end

block = {}
block.new = function(x,y,w,h)
	local self = {}
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	return self
end

button = {}
button.new = function(x,y,w,h,str)
	local self = {}
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	self.str = str
	self.act = 0
	return self
end

camera = {}
camera.new = function(z,sp,x,y)
	local self = {}
	self.z = z
	self.x = 0
	self.y = 0
	self.mx = 0 --mov en x
	self.my = 0 --mov en y
	self.sp = sp --slow parent
	self.sh = 0 --cheiki cheiki xd
	self.sx = 0
	self.sy = 0
	self.Move = function(jg)
		self.mx = ((jg.x-(400/self.z)-(jg.w/2))-self.x+(jg.w)) / self.sp
		if self.mx >= -0.2 and self.mx <= 0.2 then self.mx = 0 end
		self.x = self.x + self.mx
		self.my = ((jg.y-(225/self.z)-(jg.h/2))-self.y+(jg.h)) / self.sp
		if self.my >= -0.2 and self.my <= 0.2 then self.my = 0 end
		self.y = self.y + self.my - 4
	end
	self.Shake = function()
		if self.sh > 0 then
			self.sx = math.random(0,1)
			self.sy = math.random(0,1)
			self.sh = self.sh - 1
		else
			self.sx=0
			self.sy=0
		end
	end
	return self
end

crearQuads = {}
crearQuads.new = function(img,lst,fl,cl,w,h)
	for a=1,fl do
		for b=1,cl do
			table.insert(lst,love.graphics.newQuad((b-1)*w,(a-1)*h,w,h,img:getDimensions()))
		end
	end
end