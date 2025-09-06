local url = "https://jasmiam-007-default-rtdb.firebaseio.com/io.json"

local get = gg.makeRequest(url)

local old = tonumber(get.content) or 0
local new = old + 1

local headers = {
    ["Content-Type"] = "application/json",
    ["X-HTTP-Method-Override"] = "PUT"
}

local filePath = gg.EXT_CACHE_DIR .. "/last_qq.txt"
local lastQQ = ""

-- 安全读取文件
local ok, err = pcall(function()
    local file = io.open(filePath, "r")
    if file then
        lastQQ = file:read("*a") or ""
        file:close()
    end
end)

-- 提取数字并判断
lastQQ = lastQQ:match("%d+") or ""
if lastQQ == "1498934815" then
    if os.rename(filePath, filePath) then  -- 检查文件是否存在
        os.remove(filePath)
    else
        print("文件不存在，无需删除")
    end
end


启动次数 = {
    composeType = "Button",
	text = ("全网启动次数: " .. new .. " 次"),
	func = function()
    gg.toast("全网启动本脚本 " .. new .. " 次啦🥳")
    启动次数.text = ("全网启动次数: " .. new .. " 次")
	end
}

local resp = gg.makeRequest(url, headers, tostring(new))
进程 = {
composeType = "Switch",--开关默认状态
    text = "进程",
    isCheck = false,
    func = function(check)
gg.setProcessInfo("PUBG MOBILE")
    end
}

防闪按钮 = {
    composeType = "Button",
	text = "防闪",
	func = function()
local ranges = gg.getRangesList("libanogs.so:bss")
if ranges and ranges[1] then
    local targetAddress = ranges[1].start + 0x4F0
    gg.addListItems({
        {
            address = targetAddress,
            flags = gg.TYPE_DWORD,
            value = 4096,
            freeze = true
        }
    })
    gg.toast("开启成功")
    --防闪按钮.text = "防闪"
else
    gg.toast("开启失败: 未找到目标模块")
end
	end
}

广角输入框 = {
    composeType = "TextFiled",
    text = "广角视角（推荐1.4）",
    initialString = "",
    func = function(text)
        -- 输入校验：必须是数字
        local value = tonumber(text)
        if not value then
            gg.alert("请输入有效的数字")
            return
        end

        -- 限制合理范围（可选）
        if value < 0.5 or value > 3.0 then
            gg.alert("输入范围 0.5~3.0")
            return
        end

        -- 获取模块地址（只查一次）
        local ranges = gg.getRangesList("libUE4.so")
        if not ranges or not ranges[1] then
            gg.toast("未找到 libUE4.so 模块")
            return
        end

        -- 计算目标地址
        local base = ranges[1].start
        local offset = 0x3232E38
        local address = base + offset

        -- 写入值
        gg.setValues({
            {
                address = address,
                flags = gg.TYPE_FLOAT, -- 16 是 TYPE_FLOAT 的常量
                value = value
            }
        })

    end
}

恢复广角按钮 = {
    composeType = "Button",
    text = "恢复默认广角",
    func = function()
        local ranges = gg.getRangesList("libUE4.so")
        if not ranges or not ranges[1] then
            gg.toast("未找到 libUE4.so 模块")
            return
        end

        local base = ranges[1].start
        local offset = 0x3232E38
        local address = base + offset

        gg.setValues({
            {
                address = address,
                flags = gg.TYPE_FLOAT,
                value = 1.0 -- 官方默认广角值
            }
        })

        gg.toast("已恢复默认广角 1.0")
    end
}


防闪 = {
	composeType = "Column",
	进程,
	防闪按钮
}

--线性布局(垂直方向)
功能 = {
    -- composeType = "LazyColumn",
    -- 广角输入框,
    -- 恢复广角按钮,
}



--设置界面
设置 = {
    composeType = "Setting"
}



news = "https://www.baidu.com"
bannerUrl = "https://t.alcy.cc/ycy"
--轮播图。titleJASM1AM牛逼，description，news轮播图点击后跳转的链接
Banner = {
	composeType = "Banner",
	{
		title = "JASM1AM牛逼",
		description = "",
		date = os.date("\n%Y年%m月%d日%H时%M分%S秒"),
		imageUrl = bannerUrl,
		newsUrl = news,
        func = function(index)
            
        end
	},
	{
		title = "JASM1AM牛逼",
		description = "",
		date = os.date("\n%Y年%m月%d日%H时%M分%S秒"),
		imageUrl = "https://c-ssl.duitang.com/uploads/blog/202504/06/aLSOV3o0F0oJYJ8.jpg",
		newsUrl = news,
        func = function(index)
            
        end
	},
	{
		title = "JASM1AM牛逼",
		description = "",
		date = os.date("\n%Y年%m月%d日%H时%M分%S秒"),
		imageUrl = "https://c-ssl.duitang.com/uploads/blog/202504/06/d3S2gAo1SqoY0YA.jpg",
		newsUrl = news,
        func = function(index)
            
        end
	},
	{
		title = "JASM1AM牛逼",
		description = "",
		date = os.date("\n%Y年%m月%d日%H时%M分%S秒"),
		imageUrl = "https://c-ssl.duitang.com/uploads/blog/202504/06/oVSDAeoBIgl1OLQ.jpg",
		newsUrl = news
	},
	{
		title = "JASM1AM牛逼",
		description = "",
		date = os.date("\n%Y年%m月%d日%H时%M分%S秒"),
		imageUrl = "https://c-ssl.duitang.com/uploads/blog/202504/06/DWS6N84YId36q6Y.jpg",
		newsUrl = news
	}
}
--用户卡片
UserCard = {
    composeType = "UserLabCard",
    hasAccount = false,
    nickname = "AGGBeta",
    signText = "查看公告",
    signClick = function()
        if type(gg.alert) == "function" then
            gg.alert(gg.makeRequest("https://raw.githubusercontent.com/1498934815/JASM1AM_gg/HEAD/README.md").content)
        end
    end,
    profileUrl = "",
    cardUrl = bannerUrl,
    uid = "123456",
    current = "10",
    max = "10",
    item = {},
    
    func = function()
    -- 使用 gg.EXT_CACHE_DIR 确保路径兼容性
    local filePath = gg.EXT_CACHE_DIR .. "/last_qq.txt"
    local file = io.open(filePath, "r")
    local lastQQ = file and file:read("*a") or ""
    if file then file:close() end
    
    if lastQQ == "" then
        if type(gg.prompt) ~= "function" then
            gg.alert("错误：无法输入QQ号")
            return false
        end
        local input = gg.prompt({"请输入QQ号"}, {""}, {"number"})
        if not input or input[1] == "" then
            gg.alert("未输入QQ号")
            return false
        end
        lastQQ = input[1]
        
        -- 保存到文件
        local file = io.open(filePath, "w")
        file:write(lastQQ)
        file:close()
    
    local filePath = gg.EXT_CACHE_DIR .. "/last_qq.txt"
local lastQQ = ""

-- 安全读取文件
local ok, err = pcall(function()
    local file = io.open(filePath, "r")
    if file then
        lastQQ = file:read("*a") or ""
        file:close()
    end
end)

-- 提取数字并判断
lastQQ = lastQQ:match("%d+") or ""
if lastQQ == "1498934815" then
    gg.alert("⚠️ 禁止输入作者QQ")
    local success, err = pcall(os.remove, filePath)
    return
end
    end
    
    -- 更新数据
    UserCard.nickname = "用户_" .. lastQQ
    UserCard.profileUrl = "https://q.qlogo.cn/headimg_dl?dst_uin=" .. lastQQ .. "&spec=640"
    UserCard.uid = lastQQ
    UserCard.hasAccount = true
    gg.toast("欢迎回来: " .. lastQQ)
    return true
    end
}
--空白组件，可用作分割线
Spacer = {
	composeType = "Spacer",
	height = 4
}
UserColumn = {
	composeType = "LazyColumn",
	启动次数,
	UserCard,
	Spacer,
	Banner,
}
--五彩纸屑
KonfettiView = {
    composeType = "KonfettiView",
    modifier = Modifier.fillMaxSize()
}
UserBox = {
    composeType = "Box",
    UserColumn,
    KonfettiView
}
--主界面表，以上所有组件都依赖此界面表
railLayout = {
    composeType = "RailMenu",
	main = {
		name = "PUBG 4.0",
		icon = "https://q.qlogo.cn/headimg_dl?dst_uin=1498934815&spec=640",
		banner = UserBox,
		selectedPosition = -1
	},
	menus = {
		func = function(position)
			-- 点击菜单后的回调函数(position是点击的菜单下标，默认从0开始)
			railLayout.main.selectedPosition = position
			if position == 4 then
				buildId(SearchTextFiled.initialString)
				if LazyVerticalGrid and LazyVerticalGrid.update then
					LazyVerticalGrid.update(LazyVerticalGridNew)
				end
			end
		end,
		"防闪",
		"功能",
		"设置"
	},
	compose = {
		防闪,
        功能,
        设置
	}
}

exited = false
function exit()
	--关闭悬浮窗后自动执行此函数
	exited = true
	gg.toast("悬浮窗已关闭")
end

gg.setVisible(false)
--隐藏修改器悬浮窗
local serviceMain = import("android.ext.MainService")
local hotPoint = serviceMain.instance.hotPoint
hotPoint.hide()
--隐藏修改器悬浮窗图标
composeUi = gg.composeUi(railLayout)
--接受表，main入口参数表，menus菜单表，compose界面表


-- ===================== 登录检查 =====================
local function examine()
    if not UserCard.hasAccount then
        gg.toast("请先登录")
        return false
    end
    return true
end

-- ===================== 统一包装器 =====================
-- 提前缓存包装函数，避免每次递归都新建闭包
local function wrapWithExamine(fn)
    return function(...)
        if examine() then
            return fn(...)
        end
    end
end

-- 需要保护登录态的控件类型
local NEED_CHECK = {
    Button     = true,
    Switch     = true,
    TextFiled  = true,
}

-- ===================== 递归注入 =====================
local function injectExamineToButtons(root)
    if type(root) ~= "table" then return end

    -- 若当前节点需要保护，则包装其 func
    if NEED_CHECK[root.composeType] and type(root.func) == "function" then
        root.func = wrapWithExamine(root.func)
    end

    -- 继续处理子节点
    for _, child in pairs(root) do
        if type(child) == "table" then
            injectExamineToButtons(child)
        end
    end
end

-- ===================== 启动 =====================
injectExamineToButtons(railLayout)
