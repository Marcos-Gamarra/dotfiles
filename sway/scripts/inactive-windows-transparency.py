#!/usr/bin/python

from i3ipc import Connection, Event

active_opacity = "1"
inactive_opacity = "0.8"

ipc = Connection()

def on_window_focus(ipc, e):
    current_focused = ipc.get_tree().find_focused()
    if current_focused.parent.layout == "tabbed":
        return
    
    for window in current_focused.workspace().leaves():
        if window.parent.layout == "tabbed":
            continue
        window.command("opacity " + inactive_opacity)
    current_focused.command("opacity " + active_opacity)
        

# Subscribe to events
ipc.on(Event.WINDOW, on_window_focus)
ipc.on(Event.WORKSPACE, on_window_focus)
ipc.main()
