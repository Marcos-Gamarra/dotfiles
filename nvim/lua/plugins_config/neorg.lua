require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                    projects = "~/notes/projects",
                },
                index = "index.norg",
                default_workspace = "notes",
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                hook = function(keybinds)
                    keybinds.remap_event("norg", "n", "<space>nn", "core.dirman.new.note")
                end,
            },
        },
    },
}
