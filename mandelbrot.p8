pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
z_init={r=0,i=0}
limit=100
m_speed=2
scale=512
center={x=0.3594,y=-0.6826}


function c_mult(c1,c2)
	return {
		r=(c1.r * c2.r) - 
				(c1.i * c2.i),
		i=(c1.r * c2.i) + 
	   (c2.r * c1.i)
	}
end

function c_add(c1,c2)
 return {
 	r=c1.r + c2.r,
 	i=c1.i + c2.i
 }
end

function c_mag_sqr(c)
 return (c.r * c.r) + (c.i * c.i)
end

function c_print(c)
 printh(c.r .. "+" .. c.i .. "i")
end

function test(c)
	local i = 0
	local z = {
	 r=z_init.r,
	 i=z_init.i
	}
	while (i<limit) do
	 z = c_add(c_mult(z,z),c)
	 if c_mag_sqr(z) > 4 then
	  return i
	 end
	 i=i+1
	end
	return i
end

function map_px(x,y)
 return {
  r=((x-63)/scale/32)+center.x,
  i=((y-63)/scale/32)+center.y
 }
end

function draw()
 cls()
	for x=0,127 do
	 for y=0,127 do
	  local z=map_px(x,y)
	  local its = test(z)
	  local c=its%16
	  if (its == limit) then
	  	c=0
	  end
	  pset(x,y,c)
	 end
	end
end

function _draw()
	if updated then
	 draw()
	 updated=false
	 printh(scale .. " " .. center.x .. " " .. center.y)
	end
end

updated = true

function _update()

	if btnp(❎,1) then
	 home()
	end

	if btnp(🅾️) then
	 zoom(2)
	end
	if btnp(❎) then
		zoom(0.5)
	end
	
	if btnp(⬅️) then
	 move(-m_speed/scale,0)
	end
	if btnp(➡️) then
	 move(m_speed/scale,0)
	end
	if btnp(⬆️) then
	 move(0,-m_speed/scale)
	end
	if btnp(⬇️) then
	 move(0,m_speed/scale)
	end
end

function move(dx,dy)
	center.x = center.x + dx
	center.y = center.y + dy
	updated = true
end

function zoom(dz)
	scale = abs(scale * dz)
	updated = true
end

function home()
 scale = 1
 center.x = 0
 center.y = 0
 updated = true
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
