--Edit    by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 30) and (GetLevel() >=30) then
Say("L�n V�n Mi: C�ch ��y v�i ng�y c� ng��i c�a Thi�n Nh�n Gi�o xu�t hi�n t�i V�nh L�c Tr�n, d��ng nh� l� c� �m m�u g� ��, cha th�y th� li�n mang theo m�t s� s� huynh �� ��n ng�n c�n, m�c d� �� ��nh l�i Thi�n Nh�n Gi�o, nh�ng c�ng c� nhi�u s� huynh �� b� th��ng, ta c� tr�ch nhi�m ch�m s�c h�. Nh�ng m�y h�m nay thu�c tr� th��ng s�p d�ng h�t r�i.",2,"�i mua thu�c gi�p./L30_get_yes","Ta c� vi�c kh�c ph�i l�m/L30_get_no")
elseif (GetTask(169) > 30) and (GetTask(169) < 34)then
Talk(1,"","L�n V�n Mi: C�c s� huynh �� �ang r�t c�n thu�c tr� th��ng, ng��i mau �i �i.")
elseif (GetTask(169) == 35) and (HaveCommonItem(6,1,3949)>0) then
Talk(2,"nvL30","L�n V�n Mi: T�t qu�, s� thu�c n�y �� d�ng r�i, c�m �n ��i hi�p.")
elseif (HaveMagic(1351) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","L�n V�n Mi: ng��i ta kh�m ph�c nh�t, ch�nh l� s� huynh ��.")	
elseif (HaveMagic(1351) >= 0) then
Talk(1,"","L�n V�n Mi: ng��i �� gi�p ta m�t vi�c l�n, c�c s� huynh �� b� th��ng ��u r�t c�m k�ch.")	
else 
Talk(1,"","L�n V�n Mi: �� t� Hoa S�n ta h�c v� nho thu�t, thi th�, t� h�a, k� ngh� ��u r�t am hi�u.")	
end
end

function nvL30()
SetRank(85)  
DelCommonItem(6,1,3949)
SetTask(169,40)
AddNote("H�i ��p L�n V�n Mi, ho�n th�nh nhi�m v� B�ng T�m Ng�c L� Cao ��i hi�p t�ng c�p th�nh �� t� ch�p ki�m, h�c ���c v� c�ng Kim Nh�n Ho�nh Kh�ng, Long Huy�n Ki�m Kh�.") 
Msg2Player("H�i ��p L�n V�n Mi, ho�n th�nh nhi�m v� B�ng T�m Ng�c L� Cao ��i hi�p t�ng c�p th�nh �� t� ch�p ki�m, h�c ���c v� c�ng Kim Nh�n Ho�nh Kh�ng, Long Huy�n Ki�m Kh�.") 
AddMagic(1351)
AddMagic(1376)
AddGoldItem(0, 4635)
AddGoldItem(0, 4636)
AddGoldItem(0, 4645)
AddGoldItem(0, 4646)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end; 


function L30_get_yes()  
	SetTask(169,31)
AddNote("G�p L�n V�n Mi, nh�n nhi�m v� B�ng T�m Ng�c L� Cao, ��n ti�m thu�c Ph��ng T��ng mua B�ng T�m Ng�c L� Cao.") 
Msg2Player("G�p L�n V�n Mi, nh�n nhi�m v� B�ng T�m Ng�c L� Cao, ��n ti�m thu�c Ph��ng T��ng mua B�ng T�m Ng�c L� Cao.") 
end; 

function L30_get_no() 
end; 



