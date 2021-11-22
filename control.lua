function vzoom_update(event)
    local player = game.get_player(event.player_index)
    if player.controller_type ~= defines.controllers.character then
        return
    end

    local cfg = settings.get_player_settings(event.player_index)

    local zoom = cfg["vzoom-lv-walk"].value
    if player.vehicle then
        if player.vehicle.type == "car" then
            zoom = cfg["vzoom-lv-car"].value
        elseif player.vehicle.type == "locomotive" or string.match(player.vehicle.type, "-wagon") then
            zoom = cfg["vzoom-lv-train"].value
        elseif player.vehicle.type == "spider-vehicle" then
            zoom = cfg["vzoom-lv-spider"].value
        end
    end

    player.zoom = zoom * player.display_scale
end

script.on_event(defines.events.on_player_driving_changed_state, vzoom_update)
script.on_event(defines.events.on_player_display_scale_changed, vzoom_update)
script.on_event(defines.events.on_runtime_mod_setting_changed, vzoom_update)
