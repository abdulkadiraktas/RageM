---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Mld.
--- DateTime: 15/07/2021 20:22
---

local PlayerPedId = PlayerPedId;
local GetEntityCoords = GetEntityCoords;
local GetInteriorFromEntity = GetInteriorFromEntity;
local PlayerId = PlayerId;

Thread = {};
Thread.Registers = {};

Global = {};
Global.CameraNoClip = nil;

Player = {};
Player.PlayerId = PlayerId();
Player.PedId = PlayerPedId();
Player.Position = GetEntityCoords(Player.PedId);
Player.InteriorId = GetInteriorFromEntity(Player.PedId);
Player.IsInNoClip = false;
Player.NoClipSpeed = 10.0;
Player.IsInvincible = false;

Citizen.CreateThread(function()
    local INDEXER_TIMER = 0;
    while true do
        Citizen.Wait(0)

        local GAME_TIMER = GetGameTimer()

        if (INDEXER_TIMER + 1000 < GAME_TIMER) then
            INDEXER_TIMER = GAME_TIMER;

            Player.PlayerId = PlayerId();
            Player.PedId = PlayerPedId();
            Player.Position = GetEntityCoords(Player.PedId);
            Player.InteriorId = GetInteriorFromEntity(Player.PedId);

        end

        for _, onTick in pairs(Thread.Registers) do
            onTick();
        end

        if (IsControlJustPressed(0, 0xCEFD9220)) then
            RageUI.Visible(RageM.Get("RageM", "Main"), not RageUI.Visible(RageM.Get("RageM", "Main")))
        end

    end
end)
