return {
    Moveset = {
        Identifier = "Boxing";
        Icon = "common/boxer";

        HeatbarColor = Color3.fromRGB(177, 26, 26);
--      NeutralStance = "";
--      NeutralWalk = "";
        CombatStance = "animations/boxing/boxing_stand";
        CombatWalk = "animations/boxing/boxing_shift"; --8Directional
        CombatRun = "animations/boxing/boxing_stand";
        CombatSway = "animations/boxing/boxing_stand";
        CombatGuard = "animations/boxing/boxing_stand";
        CombatSwitch = "animations/boxing/boxing_stand";

        CombatTaunts = {
            "animations/styles/boxing/footwork"
        };
        CombatBattleStart = {
            "animations/styles/boxing/battlestart"
        };

        AnimRate = 1;
        AttackAnimRate = 1;

        WeaponOnly = false;
        StringedLightCombos = true;
        StringedHeavyCombos = false;
        ComboFinishers = false;

        LightAttacks = {
            "animations/styles/boxing/combo01",
            "animations/styles/boxing/combo02",
            "animations/styles/boxing/combo03",
        };
        HeavyAttacks = {
            "animations/styles/boxing/jab",
            "animations/styles/boxing/upper",
        };
        Stomps = {
            "animations/styles/common/down",
        };
        HeatAttacks = {
            "animations/heat/trample";
            "animations/heat/nishiki"
        };
        Events = {
            Jab = {
                func = function(Owner, Key)
                    Owner:Attack()

                end;
                dmgfunc = function(Owner, Victim, DMG)
                    
                end
            }
        }
    };
    AI = {

    };
}