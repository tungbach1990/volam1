--Edit by Youtube PGaming- -
function OnDeath () 
if (GetTask(69) == 55) then
SetTask(69,56)
elseif (GetTask(69) == 56) then
SetTask(69,57)
elseif (GetTask(69) == 57) then
SetTask(69,58)
elseif (GetTask(69) == 58) then
SetTask(69,59)
elseif (GetTask(69) == 59) then
Msg2Player("��i hi�p �� tr�n tho�t kh�i s� t�n c�ng c�a Thi�n Nh�n Gi�o, h�y quay l�i xem v�t th��ng c�a Th�m M�c nh� th� n�o r�i.") 
AddNote("��i hi�p �� tr�n tho�t kh�i s� t�n c�ng c�a Thi�n Nh�n Gi�o, h�y quay l�i xem v�t th��ng c�a Th�m M�c nh� th� n�o r�i.")
SetTask(69,60)
end
end 


