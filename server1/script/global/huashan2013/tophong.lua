--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if  (GetTask(69) == 23) and (HaveCommonItem(6,1,3959)>0) then
Talk(5,"L90_hs","Ng��i ch�i: ��y l� c�a Minh Phi huynh nh� ta ��a cho ng��i...","Ng��i ch�i: ...S� t�nh ��i �� l� nh� v�y.","T� Ph�ng: ��ng gh�t, Thi�n Nh�n Gi�o qu� l� ng�o m�n!","T� Ph�ng: M�y h�m nay ta b� s� ph� nh�t trong T� Qu� Nhai, t�m th�i kh�ng th� ra ngo�i, ng��i h�y �em phong th� n�y ��a cho L�n s� th�c, �ng �y t� quy�t �o�n.")
elseif ((GetLevel() >=150) and (HaveMagic(1365) >= 0) and (GetTask(69) < 50) and (HaveMagic(1369) < 0)) then 
Say("T� Ph�ng: Chuy�n g�?",2,"Nhi�m v� k� n�ng c�p 150/nv15x","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) > 49 ) and (GetTask(69) < 51) then 
Say("T� Ph�ng: Chuy�n g�?",2,"Nhi�m v� k� n�ng c�p 150/nv15x3","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) > 51 ) and (GetTask(69) < 54) then 
Say("T� Ph�ng: Chuy�n g�?",2,"Nhi�m v� k� n�ng c�p 150/nv15x4","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) == 51) then
Say("T� Ph�ng: Chuy�n g�?",2,"Nhi�m v� k� n�ng c�p 150/nv15x2","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
else
Talk(1,"","Chuy�n g�?")

end
end; 

function nv15x4() 
Talk(1,"","T� Ph�ng: Tuy�t ��i kh�ng ���c n�i v�i ng��i kh�c.")
end; 

function nv15x3() 
Talk(1,"","T� Ph�ng: c�y nh� ��i hi�p.")
end; 

function nv15x2() 
Talk(4,"","��i hi�p k� l�i c�u chuy�n...","T� Ph�ng: ��y ch�c ch�n l� �m m�u c�a Thi�n Nh�n Gi�o, ch� do m�t c� g�i ��a tin, xem nh� ta xui x�o.","T� Ph�ng: Vi�c quan tr�ng nh� v�y, ta ph�i �i m�t chuy�n, ph� v� � �� c�a ch�ng, nh�n d�p s� ph� �ang b� quan tu h�nh, ta s� l�n ra ngo�i m�t chuy�n! Ng��i kh�ng ���c n�i chuy�n n�y cho ng��i kh�c bi�t.","Ng��i ch�i: (N�i t�m) Sao l�i c�m th�y b�t an nh� th� n�y, hay l� ta n�i cho s� huynh bi�t nh�.")
SetTask(69,52)
AddNote("k� l�i s� t�nh cho V�n T� Vi�n.") 
Msg2Player("k� l�i s� t�nh cho V�n T� Vi�n.") 
end; 


function nv15x() 
Talk(4,"","T� Ph�ng: C� h�i l�n, ta �� b� nh�t trong T� Qu� Nhai n�y l�u l�m r�i...","Ng��i ch�i: Xem ra S� huynh ch�c gi�n T� s� th�c r�i, c� chuy�n g� c�n ta gi�p kh�ng?","T� Ph�ng: Ta nghe �� t� ��a c�m h�m qua c� n�i, ��m c�n b� Thi�n Nh�n Gi�o �ang l�m g� �� � Chu Ti�n Tr�n, ti�c l� ta kh�ng �i ���c, ng��i c� th� gi�p ta t�m hi�u chuy�n n�y kh�ng?","Ng��i ch�i: ���ng nhi�n r�i, ta �i ngay.")
SetTask(69,50)
AddNote("��n ch� Chu Ti�n Tr�n t�m C� g�i kh�c.") 
Msg2Player("��n ch� Chu Ti�n Tr�n t�m C� g�i kh�c.") 
end; 


function L90_hs() 
DelCommonItem(6,1,3959)
SetTask(69,24)
AddNote("N�i cho L�n H�o Thi�n.") 
Msg2Player("N�i cho L�n H�o Thi�n.") 
end; 

function L50_get_no() 
end; 	