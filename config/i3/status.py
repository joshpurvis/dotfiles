from i3pystatus import Status

status = Status()

status.register("clock", format="%Y-%m-%d %H:%M")

#status.register("bitcoin")

status.register("cpu_usage")

#status.register("shell", command='echo "CPU $(sensors | grep -A 0 \'temp1\' | cut -c16-21)"',)

status.register("mem", divisor=1024**3, color=None, warn_color=None, format="{avail_mem} GB")

# tun0 up/down
#status.register("network", format_up = "{interface}{kbs} KB/s", start_color="#689d6a", format_down="{interface}", interface="tun0", color_up="#689d6a", color_down="#AA3939", dynamic_color=False, on_rightclick=False, on_upscroll=False, on_downscroll=False, on_leftclick=False, graph_width=1, unknown_up=True)

# ciscotun0 up/down
#status.register("network", format_up = "{interface}{kbs} KB/s", format_down="", interface="cscotun0", dynamic_color=True, on_rightclick=False, on_upscroll=False, on_downscroll=False, on_leftclick=False, graph_width=1, unknown_up=True)

# eth0 up/down
#   status.register("network", format_up = "{interface}{kbs} KB/s", interface="eth0", start_color="#689d6a", color_up="#689d6a", color_down="#AA3939", dynamic_color=False, on_rightclick=False, on_upscroll=False, on_downscroll=False, graph_width=1)

status.run()
