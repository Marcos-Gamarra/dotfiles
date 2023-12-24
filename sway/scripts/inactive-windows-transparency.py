#!/usr/bin/python

from i3ipc import Connection, Event

active_opacity = "1"
inactive_opacity = "0.8"

ipc = Connection()

# everytime the layout is changed, a mark is toggled to trigger this function
def on_window_mark(ipc, e):
    on_window_focus(ipc, e)

def on_window_focus(ipc, e):
    current_focused = ipc.get_tree().find_focused()
    descendants = current_focused.workspace().descendants()
    main_descendant = descendants[0]

    if main_descendant.layout == "tabbed":
        for window in current_focused.workspace().leaves():
            if window.focused or window.parent.layout == 'tabbed' or current_focused.parent.layout == 'tabbed':
                window.command("opacity " + active_opacity)
            else: 
                window.command("opacity " + inactive_opacity)
    else:
        for window in current_focused.workspace().leaves():
            if window.focused:
                window.command("opacity " + active_opacity)
            elif window.parent.layout == "tabbed" and current_focused.parent == window.parent:
                window.command("opacity " + active_opacity)
            else:
                window.command("opacity " + inactive_opacity)

# Subscribe to events
ipc.on(Event.WINDOW_FOCUS, on_window_focus)
ipc.on(Event.WINDOW_MARK, on_window_mark)
ipc.main()
