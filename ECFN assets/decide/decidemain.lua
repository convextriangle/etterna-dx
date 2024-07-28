local function append_all(list, list1)
	for i, v in ipairs(list1) do
		table.insert(list, v)
	end
end

local property = {
}


local filepath = {
	{name = "BG", path = "background/*.png"},
}

local header = {
	type = 6,
	name = "EC:FN",
	w = 1920,
	h = 1080,
	scene = 2500,
	input = 500,
	fadeout = 500,
	property = property,
	filepath = filepath
}

local function main()

	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end


	skin.source = {
		{id = 0, path = "../system.png"},
		{id = 1, path = "background/*.png"},
		{id = 2, path = "decide.png"},

	}
	skin.font = {
		{id = 0, path = "../VL-Gothic-Regular.ttf"},
		{id = 1, path = "font/selectsongname.fnt"},
		{id = 2, path = "font/Genre-Art.fnt"},
		{id = 3, path = "font/subtitle.fnt"},
	}

	skin.image = {
		{id = "blank", src = 0, x = 0, y = 0, w = 8, h = 8},
		{id = "bg", src = 1, x = 0, y = 0, w = 1920, h = 1080},	
		{id = "bg-main", src = 2, x = 0, y = 620, w = 6400, h = 8640 , divx = 5 , divy = 12 , cycle = 2200},

		{id = "freestage", src = 2, x = 0, y = 514, w = 432, h = 73},
		{id = "songbar", src = 2, x = 0, y = 594, w = 1791, h = 25},
		{id = "nextstage", src = 2, x = 0, y = 449, w = 567, h = 51},

		{id = "song_flash", src = 2, x = 0, y = 0, w = 61, h = 134 , divx = 61 , cycle = 80},
	}

	skin.imageset = {}
	skin.value = {}
	skin.text = {
		{id = "genre", font = 2, size = 22, overflow = 1, ref = 13, align = 2},
		{id = "title", font = 1, size = 50, overflow = 1, ref = 10, align = 2},
		{id = "subtitle", font = 3, size = 20, overflow = 1, ref = 11, align = 2},
		{id = "artist", font = 2, size = 20, overflow = 1, ref = 16, align = 2},
		{id = "subdiff", font = 2, size = 14, overflow = 1, ref = 1003, align = 2},
	}
	skin.slider = {
	}
	skin.destination = {

		{id = "bg", dst = {
			{x = 0, y = 0, w = 1920, h = 1080, a = 40}
		}},

		{id = "bg-main", filter = 1 , dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}},

--[[		{id = -111, loop = -1, dst = {
			{time = 300, x = 0, y = 0, w = 1920, h = 1080, a = 50, acc = 2 },
			{time = 1000, a = 0, acc = 2 },
		}},		]]--
		{id = "genre", loop = 300,op={-290}, dst = {
			{time = 0, x = 1843, y = 632, w = 1200, h = 18, a = 0},
			{time = 300, a = 255},
		}},
		{id = "title", loop = 300, dst = {
			{x = 1843, y = 570, w = 1200, h = 18, a = 0},
			{time = 300, a = 255},
		}},
		{id = "subtitle", loop = 300,op={-290}, dst = {
			{time = 0, x = 1843, y = 530, w = 1200, h = 18, a = 0},
			{time = 300, a = 100},
		}},		
		{id = "artist", loop = 300,op={-290}, dst = {
			{time = 0, x = 1843, y = 482, w = 1200, h = 18, a = 0},
			{time = 300, a = 255},
		}},
		{id = "subdiff", loop = 300,op={-290}, dst = {
			{time = 0, x = 1843, y = 443, w = 1200, h = 18, a = 0},
			{time = 300, a = 255},
		}},



		{id = "freestage", loop = 300, dst = {
			{x = 1440, y = 688, w = 432, h = 73, a = 0},
			{time = 300, a = 205},
		}},
		{id = "songbar", loop = 300, dst = {
			{x = 66, y = 509, w = 1791, h = 25, a = 0},
			{time = 300, a = 200},
		}},
		{id = "nextstage", loop = 300, dst = {
			{x = 1282, y = 370, w = 567, h = 51, a = 0},
			{time = 300, a = 255},
		}},



		{id = "song_flash", blend = 2  , loop = -1 ,  dst = {
			{time = 0 , x = 0, y = 288 + 200, w = 2220, h = 246 , a = 230},
			{time = 300 , x = -1500, y = 419 + 200, w = 6700, h = 0 , a = 0},
		}},
		{id = -111, loop = -1, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 255, acc = 2 },
			{time = 300, a = 0, acc = 2 },
		}},
		{id = -110, loop = 2000, dst = {
			{time = 1500, x = 0, y = 0, w = 1920, h = 1080, a = 0, acc = 2 },
			{time = 2000, a = 255, acc = 2 },
		}},	
		{id = -110, loop = 500, timer= 2 ,dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0, acc = 2 },
			{time = 500, a = 255, acc = 2 },
		}},	
	}
	return skin
end

return {
	header = header,
	main = main
}
