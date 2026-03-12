MainScreen.startTutorial = function()
    local currentMods = ActiveMods.getById("default")
--  currentMods:clear()
    if ActiveMods.requiresResetLua(currentMods) then
        getCore():ResetLua("currentGame", "startTutorial")
    end

    deleteAllGameModeSaves("Tutorial");
    MainScreen.instance:setDefaultSandboxVars()
    getWorld():setGameMode("Tutorial");
    local worldName = ZombRand(100000)..ZombRand(100000)..ZombRand(100000)..ZombRand(100000);
    getWorld():setWorld(worldName);
    doTutorial(Tutorial1);
    TutorialData = {}
    TutorialData.chosenTutorial = Tutorial1;
    createWorld(worldName);

    GameWindow.doRenderEvent(false);
    forceChangeState(LoadingQueueState.new());
end

-- As 1 --
-- Available in B42.15.2 --
-- line 2 is changed from ActiveMods.getById("currentGame") to ActiveMods.getById("default").
-- line 3 is skipped to ensure that default mods can be loaded.