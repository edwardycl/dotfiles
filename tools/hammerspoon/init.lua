local function toggleKitty(size)
	local app = hs.application.find("net.kovidgoyal.kitty", true, false)
	local hidden = false

	local screenFrame = hs.mouse.getCurrentScreen():frame()
	local sizeRect = size
			and hs.geometry.rect(
				math.floor(screenFrame.x + screenFrame.w * size[1]),
				math.floor(screenFrame.y + screenFrame.h * size[2]),
				math.floor(screenFrame.w * size[3]),
				math.floor(screenFrame.h * size[4])
			)
		or nil

	if app then
		if not app:mainWindow() then
			app:selectMenuItem({ "Shell", "New OS Window" })
		elseif app:isFrontmost() then
			local frame = app:mainWindow():frame()
			if sizeRect == nil or frame == sizeRect then
				app:hide()
				hidden = true
			else
				app:activate()
			end
		else
			app:activate()
		end
	else
		hs.application.launchOrFocusByBundleID("net.kovidgoyal.kitty")
		app = hs.application.get("kitty")
	end

	if not hidden and size then
		local screen = hs.mouse.getCurrentScreen()
		local mainWin = app:mainWindow()
		mainWin:moveToScreen(screen)
		mainWin:move(sizeRect)
	end
end

-- No change
hs.hotkey.bind({ "ctrl", "cmd" }, "f", function()
	toggleKitty(nil)
end)

-- Full screen
hs.hotkey.bind({ "ctrl", "cmd" }, "r", function()
	toggleKitty({ 0, 0, 1, 1 })
end)

-- Mini
hs.hotkey.bind({ "ctrl", "cmd" }, "t", function()
	toggleKitty({ 0.2, 0.5, 0.6, 0.5 })
end)

