data:extend({
    {
        name = "vzoom-speed",
        type = "string-setting",
        setting_type = "runtime-per-user",
        default_value = "medium",
        allowed_values = {
            "zero",
            "vfast",
            "fast",
            "medium",
            "slow",
        },
        order = 0,
    },

    {
        name = "vzoom-lv-walk",
        type = "double-setting",
        setting_type = "runtime-per-user",
        default_value = 1.0,
        minimum_value = 0.2,
        maximum_value = 4.0,
        order = 1,
    },

    {
        name = "vzoom-lv-car",
        type = "double-setting",
        setting_type = "runtime-per-user",
        default_value = 0.5,
        minimum_value = 0.1,
        maximum_value = 4.0,
        order = 2,
    },

    {
        name = "vzoom-lv-train",
        type = "double-setting",
        setting_type = "runtime-per-user",
        default_value = 0.5,
        minimum_value = 0.1,
        maximum_value = 4.0,
        order = 3,
    },

    {
        name = "vzoom-lv-spider",
        type = "double-setting",
        setting_type = "runtime-per-user",
        default_value = 1.0,
        minimum_value = 0.1,
        maximum_value = 4.0,
        order = 4,
    },
})
