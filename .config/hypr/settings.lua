-- Look and Feel, Input, Device Overrides, and Gesture settings

local colors = require("colors")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = colors.accentColor,
			inactive_border = colors.inactiveBorder,
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.95,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
			ignore_opacity = true,
			special = true,
		},
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
	},
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
	input = {
		kb_layout = "us,ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = -0.9,
		touchpad = {
			natural_scroll = true,
			tap_to_click = false,
			scroll_factor = 0.3,
			clickfinger_behavior = true,
		},
	},
	cursor = {
		no_hardware_cursors = true,
	},
})

-- Touchpad Gestures
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "down",
	action = function()
		hl.dispatch(hl.dsp.workspace.toggle_special("telegram"))
	end,
})

hl.gesture({
	fingers = 4,
	direction = "down",
	action = function()
		hl.dispatch(hl.dsp.workspace.toggle_special("magic"))
	end,
})

-- Per-Device Overrides
hl.device({
	name = "logitech-g-pro--1",
	sensitivity = -0.8,
})

hl.device({
	name = "apple-inc.-magic-trackpad",
	sensitivity = 0.1,
	accel_profile = "adaptive",
})

hl.device({
	name = "apple-inc.-magic-trackpad-1",
	sensitivity = 0.0,
	accel_profile = "adaptive",
})
