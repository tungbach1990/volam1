--Edit by Youtube PGaming --
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(169) == 64) then
Msg2Player("Nh�n ���c B�ch H� Huy�t.") 
AddNote("Nh�n ���c B�ch H� Huy�t.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3956,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,65)
end
end 


