function scriptInfo()
    gg.alert(
[[
GameGuardian script for "Into the Dead 2".
Version: 1.71.2(22507)

Created by t0nkov.
FOR LEARNING PURPOSES ONLY, ILLEGAL USAGE PROHIBITED!

!!! Warning !!!
- This game have ANTICHEAT features which may permanently ban access to leaderboard rewards, aka SOFTBAN.
  - The softban is SERVER-SIDE based on PikPokPlus ID, which contaminates cloud save, too.
  - By wiping out local game data the ban will be lifted in the cost of all game progress.
  - USE THIS SCRIPT WITH CAUTION.
- This script is intended for arm64-v8a devices only.
- Only confirmed working in the version mentioned above.
- Only tested after tutorial.

---Script Functions---
! Unlock VIP:
  - Literally unlocks VIP status.
! Reverse Gold-silver Transaction:
  - Convert silver into gold instead.
  - When silver is not sufficient it simply turns into zero (instead of minus).
! Double-cashback Dice Roll:
  - Give instead of cost gold in Dice Rolling.
! Double-cashback Skin Purchase:
  - Give instead of cost crowns for Skin Purchase.
! Easy Parts & Treats Unlock:
  - Enables Purchasing Parts & Treats using gold.
  - May not be available for VIP weapons. Wait for VIP Events.
! Easy Skin Unlock:
  - DO NOT USE BEFORE SKIN PURCHASE TUTORIAL, UNTESTED CONSEQUENCES.
]]
    )
end

function Main()
    local MN = gg.multiChoice({
        "> Unlock VIP",
        "> Reverse Gold-silver Transaction",
        "> Double-cashback Dice Roll",
        "> Double-cashback Skin Purchase",
        "> Easy Parts & Treats Unlock",
        "> Easy Skin Unlock"
        }, switch, "Script by t0nkov")
    if MN ~= nil then
        if xorBool(MN[1], switch[1]) then
            switch[1] = not switch[1]
            unlockVIP(MN[1])
        end
        if xorBool(MN[2], switch[2]) then
            switch[2] = not switch[2]
            goldSilverReverse(MN[2])
        end
        if xorBool(MN[3], switch[3]) then
            switch[3] = not switch[3]
            cashbackDiceRoll(MN[3])
        end
        if xorBool(MN[4], switch[4]) then
            switch[4] = not switch[4]
            cashbackCrowns(MN[4])
        end
        if xorBool(MN[5], switch[5]) then
            switch[5] = not switch[5]
            ezParts(MN[5])
        end
        if xorBool(MN[6], switch[6]) then
            switch[6] = not switch[6]
            ezSkin(MN[6])
        end
    end
    gg_window_status = -1
end

function unlockVIP(toggleon)
    local org = 'h FE 0F 1E F8 F4 4F 01 A9 34 EC 00 90 88 EE 6A 39 F3 03 00 AA C8 00 00 37 A0 D8 00 F0 00 C0 43 F9 02 BD F7 97 28 00 80 52 88 EE 2A 39 60 12 40 F9 E0 00 00 B4 A8 D8 00 F0 08 C1 43 F9 F4 4F 41 A9'
    local mod = 'h 20 00 80 52 C0 03 5F D6 34 EC 00 90 88 EE 6A 39 F3 03 00 AA C8 00 00 37 A0 D8 00 F0 00 C0 43 F9 02 BD F7 97 28 00 80 52 88 EE 2A 39 60 12 40 F9 E0 00 00 B4 A8 D8 00 F0 08 C1 43 F9 F4 4F 41 A9'
    local byteLength = 64
    --[[
    bool __fastcall VIPManager__get_VIPActive
    MOV W0, #1
    RET  
    20 00 80 52 C0 03 5F D6
    --]]

    if toggleon then
        safeAoBReplace(org, mod, byteLength)
        gg.toast("Activated: > unlockVIP")
    else
        safeAoBReplace(mod, org, byteLength)
        gg.toast("Deactivated: > unlockVIP")
    end
end

function goldSilverReverse(toggleon)
    local org = 'h E2 03 16 4B 21 00 80 52 A3 01 80 52 E4 03 1F 2A E5 03 1F AA 24 AB 0B 94 60 12 40 F9 E0 01 00 B4 A3 01 80 52 24 00 80 52 E1 03 1F 2A E2 03 14 2A E5 03 1F AA 1C AB 0B 94 E1 03 14 2A F4 4F 42 A9'
    local mod = 'h E2 03 16 2A 21 00 80 52 A3 01 80 52 E4 03 1F 2A E5 03 1F AA 24 AB 0B 94 60 12 40 F9 E0 01 00 B4 A3 01 80 52 24 00 80 52 E1 03 1F 2A E2 03 14 4B E5 03 1F AA 1C AB 0B 94 E1 03 14 2A F4 4F 42 A9'
    local byteLength = 64
    --[[
    StoreConvertUI__ConvertCurrencyOnClick
    if ( this )
    {
      CurrencyHandler__Increment((CurrencyHandler_o *)this, 1, -v10, 13, 0, 0LL);
      /*
      NEG             W2, W22 ; increment            -> MOV W2, W22
      MOV             W1, #1  ; type
      MOV             W3, #0xD ; context
      MOV             W4, WZR ; flushProfile
      MOV             X5, XZR ; method
      BL              CurrencyHandler$$Increment
      */
      this = (StoreConvertUI_o *)v4->fields.m_currencyHandler;
      if ( this )
      {
        CurrencyHandler__Increment((CurrencyHandler_o *)this, 0, v9, 13, 1, 0LL);
        /*
        MOV             W3, #0xD ; context
        MOV             W4, #1  ; flushProfile
        MOV             W1, WZR ; type
        MOV             W2, W20 ; increment        -> NEG W2, W22
        MOV             X5, XZR ; method
        BL              CurrencyHandler$$Increment
        */

        GenericRewardRevealPopup__LaunchPrizeFlow(0, v9, 53, 0LL);
        return;
      }
    }
    --]]

    if toggleon then
        safeAoBReplace(org, mod, byteLength)
        gg.toast("Activated: > Reversed Gold-silver Transaction")
    else
        safeAoBReplace(mod, org, byteLength)
        gg.toast("Deactivated: > Reversed Gold-silver Transaction")
    end
end

function cashbackDiceRoll(toggleon)
    local org1 = 'h E2 03 16 4B 21 00 80 52 83 05 80 52 E4 03 1F 2A E5 03 1F AA 34 00 80 52 B0 CB 06 94 E0 03 13 AA E1 03 14 2A 07 00 00 94 E0 03 14 2A F4 4F 42 A9 F6 57 41 A9 FE 5F C3 A8 C0 03 5F D6 7D 42 F0 97'
    local mod1 = 'h E2 03 16 2A 21 00 80 52 83 05 80 52 E4 03 1F 2A E5 03 1F AA 34 00 80 52 B0 CB 06 94 E0 03 13 AA E1 03 14 2A 07 00 00 94 E0 03 14 2A F4 4F 42 A9 F6 57 41 A9 FE 5F C3 A8 C0 03 5F D6 7D 42 F0 97'
    local byteLength1 = 64
    --[[
    BonusRoller__TryPurchaseBonus
    CurrencyHandler__Increment(v16, 1, -m_bonusGoldCost, 44, 0, 0LL);
    /*
    NEG             W2, W22 ; increment             -> MOV W2, W22
    MOV             W1, #1  ; type
    MOV             W3, #0x2C ; ',' ; context
    MOV             W4, WZR ; flushProfile
    MOV             X5, XZR ; method
    MOV             W20, #1
    BL              CurrencyHandler$$Increment
    */
    --]]

    local org2 = 'h E2 03 14 4B 21 00 80 52 63 05 80 52 E4 03 1F 2A E5 03 1F AA 49 CA 06 94 A8 C9 00 B0 08 61 47 F9 74 12 40 F9 73 46 40 B9 00 01 40 F9 08 E0 40 B9 48 00 00 35 CE 40 F0 97 60 02 62 1E E0 03 1F AA'
    local mod2 = 'h E2 03 14 2A 21 00 80 52 63 05 80 52 E4 03 1F 2A E5 03 1F AA 49 CA 06 94 A8 C9 00 B0 08 61 47 F9 74 12 40 F9 73 46 40 B9 00 01 40 F9 08 E0 40 B9 48 00 00 35 CE 40 F0 97 60 02 62 1E E0 03 1F AA'
    local byteLength2 = 64
    --[[
    /*
    BonusRoller__TryExtendBonus
    CurrencyHandler__Increment(v13, 1, -v7, 43, 0, 0LL);
    NEG             W2, W20 ; increment             -> MOV W2, W20
    MOV             W1, #1  ; type
    MOV             W3, #0x2B ; '+' ; context
    MOV             W4, WZR ; flushProfile
    MOV             X5, XZR ; method
    BL              CurrencyHandler$$Increment
    */
    --]]


    if toggleon then
        safeAoBReplace(org1, mod1, byteLength1)
        safeAoBReplace(org2, mod2, byteLength2)
        gg.toast("Activated: > Double-cashback Dice Roll")
    else
        safeAoBReplace(mod1, org1, byteLength1)
        safeAoBReplace(mod2, org2, byteLength2)
        gg.toast("Deactivated: > Double-cashback Dice Roll")
    end
end

function cashbackCrowns(toggleon)
    local org = 'h E2 03 19 4B 41 00 80 52 83 06 80 52 E0 03 16 AA E4 03 1F 2A E5 03 17 AA E6 03 1F AA 4B 50 0E 94 40 03 40 F9 41 00 80 52 AE C6 F7 97 F6 03 00 AA 88 1A 40 B9 00 03 40 F9 E1 63 00 91 E8 1B 00 B9'
    local mod = 'h E2 03 19 2A 41 00 80 52 83 06 80 52 E0 03 16 AA E4 03 1F 2A E5 03 17 AA E6 03 1F AA 4B 50 0E 94 40 03 40 F9 41 00 80 52 AE C6 F7 97 F6 03 00 AA 88 1A 40 B9 00 03 40 F9 E1 63 00 91 E8 1B 00 B9'
    local byteLength = 64
    --[[
    WeaponSkinsManager__BuySkin
    CurrencyHandler__Increment_27248236(CurrencyHandler_k__BackingField, 2, -m_cost, 52, 0, v11, 0LL);
    /*
    ADRP            X24, #off_317CFE0@PAGE
    LDR             X26, [X26,#off_317CD28@PAGEOFF]
    LDR             X24, [X24,#off_317CFE0@PAGEOFF]
    NEG             W2, W25 ; increment             -> MOV W2, W25
    MOV             W1, #2  ; type
    MOV             W3, #0x34 ; '4' ; context
    MOV             X0, X22 ; this
    MOV             W4, WZR ; flushProfile
    MOV             X5, X23 ; contextParameters
    MOV             X6, XZR ; method
    BL              CurrencyHandler$$Increment_27248236
    */
    --]]

    if toggleon then
        safeAoBReplace(org, mod, byteLength)
        gg.toast("Activated: > Double-cashback Skin Purchase")
    else
        safeAoBReplace(mod, org, byteLength)
        gg.toast("Deactivated: > Double-cashback Skin Purchase")
    end
end

function ezParts(toggleon)
    local org1 = 'h FE 0F 1C F8 F8 5F 01 A9 F6 57 02 A9 F4 4F 03 A9 B4 EE 00 B0 88 9A 5D 39 F3 03 00 AA 48 02 00 37 00 DB 00 F0 00 F0 47 F9 E2 02 F9 97 20 DB 00 D0 00 1C 42 F9 DF 02 F9 97 20 DB 00 B0 00 3C 45 F9'
    local mod1 = 'h 20 00 80 52 C0 03 5F D6 F6 57 02 A9 F4 4F 03 A9 B4 EE 00 B0 88 9A 5D 39 F3 03 00 AA 48 02 00 37 00 DB 00 F0 00 F0 47 F9 E2 02 F9 97 20 DB 00 D0 00 1C 42 F9 DF 02 F9 97 20 DB 00 B0 00 3C 45 F9'
    local byte_length1 = 64
    --[[
    bool __fastcall PartPurchaseManager__CanPurchaseWeaponParts
    MOV W0, #1
    RET  
    20 00 80 52 C0 03 5F D6
    --]]

    local org2 = 'h FF 03 01 D1 FE 5F 01 A9 F6 57 02 A9 F4 4F 03 A9 B4 EE 00 B0 88 B2 5D 39 F3 03 00 AA 48 02 00 37 00 DB 00 F0 00 F0 47 F9 69 00 F9 97 20 DB 00 D0 00 1C 42 F9 66 00 F9 97 20 DB 00 B0 00 3C 45 F9'
    local mod2 = 'h 20 00 80 52 C0 03 5F D6 F6 57 02 A9 F4 4F 03 A9 B4 EE 00 B0 88 B2 5D 39 F3 03 00 AA 48 02 00 37 00 DB 00 F0 00 F0 47 F9 69 00 F9 97 20 DB 00 D0 00 1C 42 F9 66 00 F9 97 20 DB 00 B0 00 3C 45 F9'
    local byte_length2 = 64
    --[[
    bool __fastcall PartPurchaseManager__CanPurchaseCompanionParts
    MOV W0, #1
    RET  
    20 00 80 52 C0 03 5F D6
    --]]

    if toggleon then
        safeAoBReplace(org1, mod1, byte_length1)
        safeAoBReplace(org2, mod2, byte_length2)
        gg.toast("Activated: > Easy Parts & Treats Unlock")
    else
        safeAoBReplace(mod1, org1, byte_length1)
        safeAoBReplace(mod2, org2, byte_length2)
        gg.toast("Deactivated: > Easy Parts & Treats Unlock")
    end
end

function ezSkin(toggleon)
    local org = 'h 18 91 40 39 E2 03 1F AA 1F 03 00 71 E1 07 9F 1A 19 70 5A 94 60 FA 40 F9 60 1D 00 B4 1F 03 00 71 E1 07 9F 1A E2 03 1F AA 13 70 5A 94 60 F6 40 F9 A0 1C 00 B4 E1 03 1F AA 4B 65 5A 94 18 01 00 35'
    local mod = 'h 38 00 80 52 E2 03 1F AA 1F 03 00 71 E1 07 9F 1A 19 70 5A 94 60 FA 40 F9 60 1D 00 B4 1F 03 00 71 E1 07 9F 1A E2 03 1F AA 13 70 5A 94 60 F6 40 F9 A0 1C 00 B4 E1 03 1F AA 4B 65 5A 94 18 01 00 35'
    local byteLength = 64
    --[[
    void __fastcall ArmoryWeaponDetailsScreen__UpdateSkinUnlockPanel
    Completed_k__BackingField = m_unlockCondition->fields._Completed_k__BackingField;
    // LDRB W24, [X8,#0x24]  ->  MOV W24, #1    38 00 80 52
    --]]

    if toggleon then
        safeAoBReplace(org, mod, byteLength)
        gg.toast("Activated: > Easy Skin Unlock")
    else
        safeAoBReplace(mod, org, byteLength)
        gg.toast("Deactivated: > Easy Skin Unlock")
    end
end

function safeAoBReplace(template, replacement, length)
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber(template, gg.TYPE_BYTE, false, gg.SIGN_EQUAL)
    local results = gg.getResults(length + 1)
    if #results == length then
        gg.editAll(replacement, gg.TYPE_BYTE)
        gg.clearResults()
    else
        errorExitScript()
    end
end

function xorBool(a, b)
    return (a or b) and not (a and b)
end

function exitScript()
    gg.toast("Script shutting down...")
    os.exit()
end

function errorExitScript()
    gg.toast("AoB template matching zero or dupilcated occurrences.\nThe script is either run twice or out-of-date!\nExiting script...")
    os.exit()
end

scriptInfo()
switch = {}
while true do
    if gg.isVisible(true) then
        gg_window_status = 1
        gg.setVisible(false)
    end

    gg.clearResults()
    if gg_window_status == 1 then
    Main()
    end
end