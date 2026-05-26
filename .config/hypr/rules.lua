-- Window, Layer, and Workspace Rules configuration

local colors = require("colors")

-- Window Rules
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

hl.window_rule({
    match = { class = "^(org.telegram.desktop)$" },
    suppress_event = "activate"
})

hl.window_rule({
    match = { class = "^(org.telegram.desktop)$" },
    workspace = "special:telegram silent"
})

hl.window_rule({
    match = { class = "^(obsidian)$" },
    workspace = "special:magic silent"
})

hl.window_rule({
    match = { workspace = "special:magic" },
    border_color = colors.magicBorder
})

-- Layer Rules
hl.layer_rule({
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0
})

hl.layer_rule({
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true
})

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true
})

-- Workspace Rules
hl.workspace_rule({
    workspace = "name:special:magic",
    no_shadow = true
})
