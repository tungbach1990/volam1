-- Edit by Youtube PGaming --

function OnDeath () 
if (GetTask(69) == 26) then
SetTask(69,27)
elseif (GetTask(69) == 27) then
SetTask(69,28)
elseif (GetTask(69) == 28) then
SetTask(69,29)
elseif (GetTask(69) == 29) then
SetTask(69,30)
elseif (GetTask(69) == 30) then
Msg2Player("��i hi�p �� ti�u di�t to�n b� S�t Th� Thi�n Nh�n Gi�o.") 
AddNote("��i hi�p �� ti�u di�t to�n b� S�t Th� Thi�n Nh�n Gi�o.")
SetTask(69,31)
end
end 


