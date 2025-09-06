if gg.getRangesList("libanogs.so:bss")[1] then
	local t = {}
	t[1] = gg.getRangesList("libanogs.so:bss")[1]["start"] + 0x4F0; -- 数值地址:0x72C5BDA2A0
	gg.addListItems({
		[1] = { 
			address = t[1],
			flags = 4,
			value = 4096,
			freeze = true,
		},
	})
	gg.alert("防闪开启成功")
end