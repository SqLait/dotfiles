-- Example config for Swayimg.
-- This file contains the default configuration used by the application.

-- The viewer searches for the config file in the following locations:
-- 1. $XDG_CONFIG_HOME/swayimg/init.lua
-- 2. $HOME/.config/swayimg/init.lua
-- 3. $XDG_CONFIG_DIRS/swayimg/init.lua
-- 4. /etc/xdg/swayimg/init.lua

-- General config
swayimg.mode = "viewer"                -- mode at startup
swayimg.fullscreen = true
swayimg.antialiasing = true         -- anti-aliasing
swayimg.decoration = true           -- window title/buttons/borders
swayimg.overlay = false             -- window overlay mode
swayimg.exif_orientation = true     -- image orientation by EXIF
swayimg.dnd_button = "MouseRight"      -- drag-and-drop mouse button

-- Image list configuration
swayimg.imagelist.order = "numeric"    -- list order
swayimg.imagelist.reverse = false   -- reverse order
swayimg.imagelist.recursive = false -- recursive directory reading
swayimg.imagelist.adjacent = false  -- add adjacent files from same dir
swayimg.imagelist.fsmon = true      -- enable file system monitoring

-- Text overlay configuration
swayimg.text.font = "monospace"        -- font name
swayimg.text.size = 18                 -- font size in pixels
swayimg.text.spacing = 0               -- line spacing
swayimg.text.padding = 10              -- padding from window edge
swayimg.text.color = 0xFFebdbb2   -- foreground text color
swayimg.text.background = 0x00000000   -- text background color
swayimg.text.shadow = 0x0d000000       -- text shadow color
swayimg.text.timeout = 5               -- layer hide timeout
swayimg.text.status_timeout = 3        -- status message hide timeout

-- Image viewer mode
swayimg.viewer.default_scale = "optimal"      -- default image scale
swayimg.viewer.default_position = "center"    -- default image position
swayimg.viewer.drag_button = "MouseLeft"      -- mouse button to drag image
swayimg.viewer.set_window_background(0xFF32302f) -- window background color
swayimg.viewer.set_image_chessboard(20, 0xff333333, 0xff4c4c4c) -- chessboard
swayimg.viewer.autocenter = true            -- enable automatic centering
swayimg.viewer.loop = true                 -- enable image list loop mode
swayimg.viewer.preload = 1                  -- number of images to preload
swayimg.viewer.history = 1                  -- number of the history cache
swayimg.viewer.mark_color = 0xff808080        -- mark icon color
swayimg.viewer.pinch_factor = 1.0             -- pinch gesture factor
swayimg.viewer.set_text("topleft", {             -- top left text block scheme
    "File: {name}",
    "Format: {format}",
    "File size: {sizehr}",
    "File time: {time}",
})
swayimg.viewer.set_text("topright", {            -- top right text block scheme
    "Image: {list.index} of {list.total}",
    "Frame: {frame.index} of {frame.total}",
    "Size: {frame.width}x{frame.height}"
})
swayimg.viewer.set_text("bottomleft", {          -- bottom left text block scheme
    "Scale: {scale}"
})

swayimg.viewer.set_text("bottomright", {          -- bottom left text block scheme
    "EXIF date: {meta.Exif.Photo.DateTimeOriginal}",
    "EXIF camera: {meta.Exif.Image.Model}"
})

-- Key and mouse bindings in viewer mode (example only, not all):

-- bind Escape key for exit
swayimg.viewer.on_key("Escape", function()
    swayimg.exit()
end)

swayimg.viewer.on_key("q", function()
    swayimg.exit()
end)

swayimg.viewer.on_key("h", function()
    swayimg.viewer.switch_image("prev")
end)

swayimg.viewer.on_key("l", function()
    swayimg.viewer.switch_image("next")
end)

swayimg.viewer.on_key("Shift+h", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)

swayimg.viewer.on_key("Shift+j", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.width / 10));
end)

swayimg.viewer.on_key("Shift+k", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.width / 10));
end)

swayimg.viewer.on_key("Shift+l", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)

-- bind mouse vertical scroll button with pressed Ctrl to zoom in the image at mouse pointer coordinates
swayimg.viewer.on_mouse("Ctrl-ScrollUp", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale + scale / 10
    swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)

-- Show image info when 't' is pressed
swayimg.viewer.on_key("t", function()
    if swayimg.text.visible() then
        swayimg.text.hide()
    else
        swayimg.text.show()
    end
end)

-- Refresh (reload) image when 'r' is pressed
swayimg.viewer.on_key("r", function()
    swayimg.viewer.reload()
end)

-- Hard reload (reset cache and reload) when 'R' is pressed
swayimg.viewer.on_key("Shift+r", function()
    swayimg.viewer.reload(true)  -- true forces cache reset
end)   

-- Slide show mode, same config as for viewer mode with the following defaults:
swayimg.slideshow.timeout = 5                    -- timeout to switch image
swayimg.slideshow.default_scale = "fit"          -- default image scale
swayimg.slideshow.set_window_background("auto")     -- window background mode
swayimg.slideshow.history = 0                  -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme


-- Gallery mode
swayimg.gallery.aspect = "fill"                  -- thumbnail aspect ratio
swayimg.gallery.thumb_size = 200                 -- thumbnail size in pixels
swayimg.gallery.padding_size = 5                 -- padding between thumbnails
swayimg.gallery.border_size = 2                  -- border size for selected thumbnail
swayimg.gallery.border_color = 0xFFf2e5bc        -- border color for selected thumbnail
swayimg.gallery.selected_scale = 1.05            -- scale for selected thumbnail
swayimg.gallery.selected_color = 0xFFd3869b      -- background color for selected thumbnail
swayimg.gallery.unselected_color = 0xff202020    -- background color for unselected thumbnail
swayimg.gallery.window_color = 0xFF32302f        -- window background color
swayimg.gallery.pinch_factor = 100.0             -- pinch gesture factor
swayimg.gallery.cache = 100                    -- number of thumbnails stored in memory
swayimg.gallery.preload = false               -- preloading invisible thumbnails
swayimg.gallery.pstore = false                -- enable persistent storage for thumbnails
swayimg.gallery.set_text("topleft", {               -- top left text block scheme
    "File: {name}"
})
swayimg.gallery.set_text("topright", {              -- top right text block scheme
    "{list.index} of {list.total}"
})

-- Key and mouse bindings in gallery mode (example only, not all):

-- bind Enter key to open image in viewer
swayimg.gallery.on_key("Return", function()
    swayimg.set_mode("viewer")
end)
-- bind the left arrow key to select thumbnail on the left side
swayimg.gallery.on_key("Left", function()
    swayimg.gallery.switch_image("left")
end)

swayimg.gallery.on_key("h", function()
    swayimg.gallery.switch_image("left")
end)

swayimg.gallery.on_key("l", function()
    swayimg.gallery.switch_image("right")
end)

--
-- Other configuration examples
--

-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
    swayimg.viewer.set_fix_scale("optimal")
end)

-- bind the Delete key in slide show mode to delete the current file and display a status message
swayimg.slideshow.on_key("Delete", function()
    local image = swayimg.slideshow.get_image()
    os.remove(image.path)
    swayimg.text.set_status("File "..image.path.." removed")
end)

-- set a custom window title in gallery mode
swayimg.gallery.on_image_change(function()
    local image = swayimg.gallery.get_image()
    swayimg.set_title("Gallery: "..image.path)
end)

swayimg.gallery.on_key("q", function()
    swayimg.exit()
end)

-- print paths to all marked files by pressing Ctrl-p in gallery mode
swayimg.gallery.on_key("Ctrl-p", function()
    local entries = swayimg.imagelist.get()
    for _, entry in ipairs(entries) do
        if entry.mark then
            print(entry.path)
        end
    end
end)
