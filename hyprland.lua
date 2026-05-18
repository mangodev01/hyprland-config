hl.monitor({
	output   = "HDMI-A-2",
	mode	 = "3440x1440@100",
	position = "auto",
	scale	= 1,
})

-- settings
local terminal	= "ghostty"
local browser	 = "zen-browser"
local tele		= "Telegram"
local fileManager = "thunar"
local menu		= "rofi -show drun"
local emojiMenu   = "rofi -show emoji"
local windowMenu  = "rofi -show window"
local sshMenu	 = "rofi -show ssh"
local runMenu	 = "rofi -show run"
local bar		 = "waybar"
local wallpaper   = "hyprpaper"
local wifi		= "nm-applet"

hl.on("hyprland.start", function()
	hl.exec_cmd(bar)
	hl.exec_cmd(wallpaper)
	hl.exec_cmd(wifi)
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
end)

hl.env("XCURSOR_SIZE", 48)
hl.env("XCURSOR_THEME", "Banana-Green")
hl.env("HYPRCURSOR_SIZE", 48)
hl.env("HYPRCURSOR_THEME", "Banana-Green")
hl.env("GTK_USER_PORRTAL", 1)
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({ 
	general = {
		gaps_in = 5,
		gaps_out = 20,

		border_size = 2,

		col = {
			active_border = { colors = {"rgba(ff5000ff)", "rgba(ffff00ff)", angle = 180 } },
			-- active_border = rgba(ff450000) rgba(ff8c0000) 45deg
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = true,

		allow_tearing = false,

		layout = dwindle,
	},
	decoration = {
		rounding = 10,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)"
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,

			vibrancy = 0.1696
		}
	},
	animations = {
		enabled = true
	}
})

hl.curve("easeOutQuint", {
	type = "bezier",
	points = { { 0.23, 1 }, { 0.32, 1 } }
})
hl.curve("easeInOutCubic", {
	type = "bezier",
	points = { { 0.65, 0.05 }, { 0.36, 1 } }
})
hl.curve("linear", {
	type = "bezier",
	points = { { 0, 0 }, { 1, 1 } }
})
hl.curve("almostLinear", {
	type = "bezier",
	points = { { 0.5, 0.5 }, { 0.75, 1.0 } }
})
hl.curve("quick", {
	type = "bezier",
	points = { { 0.15, 0 }, { 0.1, 1 } }
})

-- s/animation = \(.*\), \(.*\), \(.*\), \(.*\)

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 10,
	bezier = "default"
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 5.39,
	bezier = "easeOutQuint"
})

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4.79,
	bezier = "easeOutQuint"
})

hl.animation({
	leaf = "fadeIn",
	enabled = true,
	speed = 1.73,
	bezier = "almostLinear"
})

hl.animation({
	leaf = "fadeOut",
	enabled = true,
	speed = 1.46,
	bezier = "almostLinear"
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 3.03,
	bezier = "quick"
})

hl.animation({
	leaf = "layers",
	enabled = true,
	speed = 3.81,
	bezier = "easeOutQuint"
})

hl.animation({
	leaf = "fadeLayersIn",
	enabled = true,
	speed = 1.79,
	bezier = "almostLinear"
})

hl.animation({
	leaf = "fadeLayersOut",
	enabled = true,
	speed = 1.39,
	bezier = "almostLinear"
})


hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 4,
	bezier = "easeOutQuint",
	style = "fade"
})

hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade"
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade"
})

hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = 1.21,
	bezier = "almostLinear",
	style = "fade"
})

hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = 1.94,
	bezier = "almostLinear",
	style = "fade"
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4.1,
	bezier = "easeOutQuint",
	style = "popin 87%"
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1.49,
	bezier = "linear",
	style = "popin 87%"
})


hl.window_rule({
	name = "float funcdoodle",
	match = {
		class = "^(funcdoodle)$"
	},
	float = true
})

hl.config({ dwindle = {
	preserve_split = true
}})

hl.config({ master = {
	new_status = "master"
}})

require("mocha")

hl.config({ misc = {
	background_color = base,
	force_default_wallpaper = 0,
	disable_hyprland_logo = true
}})

hl.config({ input = {
	kb_layout = "us,ua",
	kb_options = "grp:alt_shift_toggle, caps:swapescape"
}})

local mainMod = "SUPER"


local mainMod = "SUPER"

-- Main app binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal), { ["repeating"] = true })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(browser), { ["repeating"] = true })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(tele), { ["repeating"] = true })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { ["repeating"] = true })
hl.bind(mainMod .. " + TAB", hl.dsp.window.cycle_next(), { ["repeating"] = true })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { ["repeating"] = true })

-- i dont care about what anyone has to say about this
-- "oh, hyprshutdown is better"
-- no.
-- i will always be using my hl.dsp.exit()
-- its a lot more convenient
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { ["repeating"] = true })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu), { ["repeating"] = true })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(windowMenu), { ["repeating"] = true })
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(emojiMenu), { ["repeating"] = true })
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(sshMenu), { ["repeating"] = true })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }), { ["repeating"] = true })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { ["repeating"] = true })

-- ALT binds
hl.bind("ALT + TAB", hl.dsp.exec_cmd("export LAST=\"$HOME/media/screenshots/$(date +'%H:%M:%S').png\" && grim -g \"$(slurp)\" $LAST && thunar $LAST && printf $LAST | wl-copy"))
hl.bind("ALT + Q", hl.dsp.exec_cmd("hyprpicker | tail -n 1 | wl-copy"))
hl.bind("ALT + W", hl.dsp.exec_cmd("zsh $HOME/.config/hypr/scripts/record.sh"))

-- Editor shortcut
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("ghostty -e bash -c \"nvim +206 /home/illia/.config/hypr/hyprland.conf\""))

-- Window management
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(runMenu))

-- Volume controls
hl.bind(mainMod .. " + EQUAL", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1% && dunstify -r 9999 -t 1000 \"🔊 Volume Up\" \"$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1)\""))
hl.bind(mainMod .. " + MINUS", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1% && dunstify -r 9999 -t 1000 \"🔉 Volume Down\" \"$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1)\""))

-- Focus movement
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { ["repeating"] = true })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r"}), { ["repeating"] = true })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u"}), { ["repeating"] = true })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { ["repeating"] = true })

-- Workspaces
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = tostring(1) }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = tostring(2) }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = tostring(3) }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = tostring(4) }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = tostring(5) }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = tostring(6) }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = tostring(7) }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = tostring(8) }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = tostring(9) }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = tostring(10)}))

-- Move windows to workspace
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = tostring(1) }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = tostring(2) }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = tostring(3) }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = tostring(4) }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = tostring(5) }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = tostring(6) }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = tostring(7) }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = tostring(8) }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = tostring(9) }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = tostring(10)}))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special({ name = "magic" }))

-- Workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "r-1" }))

-- Mouse window control
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Media controls
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"))
