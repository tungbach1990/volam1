--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(69) == 54) then
Talk(5,"nv15x","Th�m M�c: Ng��i �� quay tr� v�.","Chuy�n g� v�y?","Th�m M�c: um...h�y ti�u di�t b�n ch�ng tr��c.","Ng��i ch�i: Ta ��n gi�p ��y.")
elseif  (GetTask(69) == 60) then
Talk(9,"nv15x2","Ng��i ch�i: c�c h� kh�ng sao ch�, �� x�y ra chuy�n g�?","Th�m M�c: qu� nhi�n l� Thi�n Nh�n Gi�o ��t b�y! T� S� huynh �� tr�ng b�y, khi ta ��n ��y S� huynh �� v�o trong c�u ng��i, v� c�ng ta k�m c�i, kh�ng th� gi�p...","Ng��i ch�i: hi�n t�i h� �ang � ��u?","Th�m M�c: Ph��ng S� huynh �� ti�u di�t ���c m�t s� k� th�, sau �� do b� t�m ��c m�t kh�ng c�n nh�n th�y ���ng n�a.","Ng��i ch�i: Sao?!","Th�m M�c: ta gi�p h� nhanh ch�ng mang T� S� huynh r�i kh�i, sau �� li�u m�t phen � l�i ch�ng ch�i v�i b�n �m �en, th�t may c�c h� ��n k�p l�c.","Ng��i ch�i: ch�ng ta mau �u�i theo h�!","Th�m M�c: �i th�i!")
elseif (GetTask(69) > 60 ) and (GetTask(69) < 62) then 
Talk(1,"","Th�m M�c: ch�ng ta �i th�i")	
else 
Talk(1,"","Th�m M�c: ...")	
end
end

function nv15x2() 
SetTask(69,61)
AddNote("Tr� v� m�n ph�i t�m V�n T� Vi�n.") 
Msg2Player("Tr� v� m�n ph�i t�m V�n T� Vi�n.") 
end; 

function nv15x() 
SetTask(69,55)
AddNote("Ti�u di�t 5 Gi�o ch�ng Thi�n Nh�n Gi�o.") 
Msg2Player("Ti�u di�t 5 Gi�o ch�ng Thi�n Nh�n Gi�o.") 
end; 

