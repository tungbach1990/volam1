--Edit by Youtube PGaming  --
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(69) == 20) then
Msg2Player("��i hi�p �� ��nh b�i Ng��i Th�n B�, nh�n ���c 1 M�t l�nh.") 
AddNote("��i hi�p �� ��nh b�i Ng��i Th�n B�, nh�n ���c 1 M�t l�nh.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3958,0,0,0}, nBindState=-2}, "test", 1);
SetTask(69,21)
end
end 



