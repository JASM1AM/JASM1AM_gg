html = [[
<style>
	div {
		margin: 20px 10px;
		border: 1px solid red;
	}
</style>
<div onclick="A.onClick()">需要更新</div>
<div onclick="B.number(123.0)">复制更新链接</div>
]]
funs = {}

funs["A"] = function()
gg.toast("需要更新")
end
funs["B"] = function()
gg.copyText("https://hjgg.lanzoue.com/ihlfZ33nnlpe")
gg.alert("复制成功")
end
local view = gg.viewWeb(html, funs)
gg.mainTabs("Web", view, false, window)