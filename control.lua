speedmap = {
    zero    = 0,
    vfast   = 6,
    fast    = 15,
    medium  = 30,
    slow    = 60,
}

script.on_event(
    defines.events.on_player_driving_changed_state,
    function (event)
        local player = game.get_player(event.player_index)
        if player.controller_type ~= defines.controllers.character then
            return
        end

        local cfg = settings.get_player_settings(event.player_index)

        local vkind = "car"
        if event.entity then
            if event.entity.type == "car" then
                vkind = "car"
            elseif event.entity.type == "locomotive" or string.match(event.entity.type, "-wagon") then
                vkind = "train"
            elseif event.entity.type == "spider-vehicle" then
                vkind = "spider"
            end
        end

        local oldlevel, newlevel
        if player.driving then
            oldlevel = cfg["vzoom-lv-walk"].value
            newlevel = cfg["vzoom-lv-" .. vkind].value
        else
            newlevel = cfg["vzoom-lv-walk"].value
            oldlevel = cfg["vzoom-lv-" .. vkind].value
        end

        if oldlevel and newlevel and oldlevel ~= newlevel then
            local speed = speedmap[cfg["vzoom-speed"].value]
            if speed > 0 then 
                player.set_controller({
                    type = defines.controllers.cutscene,
                    character = player.character,
                    waypoints = {
                        {
                            target = player.character,
                            transition_time = speed,
                            time_to_wait = 0,
                            zoom = newlevel,
                        },
                    },
                })
            else
                player.zoom = newlevel
            end
        end
    end
)
