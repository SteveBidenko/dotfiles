-------------------------------------------------
-- CPU Widget for Awesome Window Manager
-- Shows the current CPU utilization
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------

local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")
--local beautiful = require("beautiful")

local icon = wibox.widget{
    --markup='<span size="2000"> </span><span size="8000" color="#74aeab"></span>',
    markup='<span size="2000"> </span><span size="8000" color="#7777FF"></span>',
    widget=wibox.widget.textbox
}

local cpugraph_widget = wibox.widget {
    max_value = 100,
    --color = '#74aeab',
    color = '#7777FF',
    --background_color = "#1e252c",
    forced_width = 40,
    step_width = 2,
    step_spacing = 1,
    widget = wibox.widget.graph
}

-- mirros and pushs up a bit
local cpu_widget = wibox.container.margin(wibox.container.mirror(cpugraph_widget, { horizontal = true }), 0, 1, 0, 2)

local total_prev = 0
local idle_prev = 0

gears.timer {
    timeout=0.25,
    autostart=true,
    callback=function()
        local lines = {}
        for line in io.lines('/proc/stat') do
            lines[#lines + 1] = line
        end
        local info = lines[1]
        local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice =
        info:match('(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)')

        local total = user + nice + system + idle + iowait + irq + softirq + steal

        local diff_idle = idle - idle_prev
        local diff_total = total - total_prev
        local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

        if diff_usage > 80 then
            icon.markup = '<span size="2000"> </span><span size="8000" color="#ff4136"></span>'
            cpugraph_widget:set_color('#ff4136')
        else
            --cpugraph_widget:set_color('#74aeab')
            icon.markup = '<span size="2000"> </span><span size="8000" color="#7777FF"></span>'
            cpugraph_widget:set_color('#7777FF')
        end

        cpugraph_widget:add_value(diff_usage)

        total_prev = total
        idle_prev = idle
    end
}
watch("cat /proc/stat | grep '^cpu '", 0.25,
    cpugraph_widget
)

local layout = wibox.layout.fixed.horizontal()
layout.spacing = 8
local widget = wibox.widget{
    icon,
    cpu_widget,
    layout=layout
}
return widget

