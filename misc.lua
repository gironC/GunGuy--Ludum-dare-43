function toInt(num)
	local string = tostring(num)
    local a, b = string:find('%.')
    if a then
        return tonumber(string:sub(1, a-1))
    else
        return num
    end
end

function AnimarEnt()
	acnt=acnt+1
	if acnt==8 then
		ansp=ansp+1
		if ansp>4 then ansp=1 end
		acnt=0
	end
end

function PColision(ob1,ob2)
	local col = 0
	if (ob1.x>=ob2.x and ob1.x<=ob2.x+ob2.w) or (ob1.x+ob1.w>=ob2.x and ob1.x+ob1.w<=ob2.x+ob2.w) then
		if ob1.y>=ob2.y and ob1.y<=ob2.y+ob2.h then
			col=2
		elseif ob1.y+ob1.h>=ob2.y and ob1.y+ob1.h<=ob2.y+ob2.h then
			col=1
		end
	end
	return col
end

function CColision(ob1,ob2)
	local col = 0
	if (ob1.y>=ob2.y and ob1.y<=ob2.y+ob2.h) or (ob1.y+ob1.h>=ob2.y and ob1.y+ob1.h<=ob2.y+ob2.h) then
		if ob1.x>=ob2.x and ob1.x<=ob2.x+ob2.w then
			col=2
		elseif ob1.x+ob1.w>=ob2.x and ob1.x+ob1.w<=ob2.x+ob2.w then
			col=1
		end
	end
	return col
end