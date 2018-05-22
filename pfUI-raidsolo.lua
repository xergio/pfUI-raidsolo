
local HookRefreshUnit = pfUI.uf.RefreshUnit
function pfUI.uf:RefreshUnit(unit, component)
  local raidforgroup = pfUI_config["unitframes"]["raidforgroup"]

  if unit:GetName() == "pfRaid1" 
    and GetNumPartyMembers() == 0 
    and not UnitInRaid("player") 
  then
    -- conflict with line api/unitframes.lua:884, I know this is shit,
    -- but I need to intercept this block
    pfUI_config["unitframes"]["raidforgroup"] = "0"

    unit.id = ""
    unit.label = "player"
  end

  HookRefreshUnit(this, unit, component)

  pfUI_config["unitframes"]["raidforgroup"] = raidforgroup
end