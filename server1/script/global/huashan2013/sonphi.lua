--  Edit by Youtube PGaming--

Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(169) == 54) then
AddNote("Nh�n ���c 1 t�i s�n c�a d�n l�ng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,55)
elseif (GetTask(169) == 55) then
AddNote("Nh�n ���c 1 t�i s�n c�a d�n l�ng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,56)
elseif (GetTask(169) == 56) then
AddNote("Nh�n ���c 1 t�i s�n c�a d�n l�ng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,57)
end
end 


