--Edit by   Youtube PGaming--
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(169) == 32) then
if (random(1,100) < 20) then 
AddNote("��i hi�p �o�t l�i B�ng T�m Tu�.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3948,0,0,0}, nBindState=-2}, "test", 1);
Msg2Player("��i hi�p �o�t l�i B�ng T�m Tu�.") 
SetTask(169,33)

end
end 
end

