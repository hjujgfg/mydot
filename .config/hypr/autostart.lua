-- Autostart applications and services on startup

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("waybar & hyprpaper & chromium")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("Telegram")
	hl.exec_cmd("wl-paste --type text --watch cliphist store &")
	hl.exec_cmd("wl-paste --type image --watch cliphist store &")
end)
