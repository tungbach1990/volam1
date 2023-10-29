--  Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetLevel() >=10 and (GetTask(69) < 10)) then
Say("Ti�u Ng�c: T� khi b�n ph�i truy�n tin thu nh�n �� t� ra kh�p giang h�, m�i ng�y l��ng ng��i ��n ��u s� ��ng nh� tr�y h�i, ng��i c�ng nghe tin n�y ph�i kh�ng?",2,"Mu�n/L10_get_yes","Ta ch� qua ���ng/L10_get_no") 
elseif (GetTask(69) > 10) and (GetTask(69) < 12)then
Talk(1,"","Ti�u Ng�c: Thu th�p �� H�ng M�c th� ��n t�m ta.")
elseif (GetTask(69) == 12) and (HaveCommonItem(6,1,3957)>0) then
Talk(3,"kidanhdetu","Ng��i ch�i: Ta �� �em H�ng M�c v� nh� �� h�a.","Ti�u Ng�c: Uhm...H�ng M�c th��ng h�ng qu� l� t�t th�t, ng��i �� gi�p b�n m�n m�t vi�c l�n, nh�ng mu�n gia nh�p b�n ph�i c�n ph�i ki�m tra t� ch�t. Th� n�y, ��i ta b�o l�i v�i s� ph�, nh�n ng��i l�m �� t� ghi danh tr��c nh�!")
else 
Talk(1,"","Ti�u Ng�c: T�i h� ch� l� m�t ng��i nh�n r�i � Hoa S�n, c�c h� t�m c� g� kh�ng?")	
end
end

function kidanhdetu()  
	DelCommonItem(6,1,3957)  
	AddNote("Ho�n th�nh nhi�m v� ch�t c�y l�m ki�m, ng��i �� tr� th�nh �� t� ghi danh c�a ph�i Hoa S�n. Nh�n ���c 1 �i�m danh v�ng.") 
	Msg2Player("Ho�n th�nh nhi�m v� ch�t c�y l�m ki�m, ng��i �� tr� th�nh �� t� ghi danh c�a ph�i Hoa S�n. Nh�n ���c 1 �i�m danh v�ng.") 
	SetTask(69,13)
	AddRepute(1)
	if GetLastFactionNumber()==10 then
		AddGoldItem(0, 4658)
		AddGoldItem(0, 4668)
		Msg2Player("Ng��i nh�n ���c <color=yellow>trang b� ho�ng kim Hoa S�n c�p V�n L�c.")
	end
end; 



function L10_get_yes()  
Talk(2,"","Ti�u Ng�c: Mu�n gia nh�p v�o b�n ph�i, kh�ng th� ch� n�i su�ng l� ���c, nh�n d�p c� l�p �� t� m�i quy n�p, c�n c�p v� kh� cho ch�ng, v� hi�n t�i ch�ng v�n ch�a tu th�n, ki�m ph�p c�a b�n ph�i n�i ti�ng l� nhanh v� ch�nh x�c, kh�ng g�y ng� th��ng, c�c v� s","Ti�u Ng�c: Nghe n�i lo�i c�y n�y c� linh v�t th� h�, ng��i �i l�n n�y ph�i c�n th�n ��y.") 
AddNote("Nh�n nhi�m v� ch�t c�y l�m ki�m. ��n �i�m Th��ng S�n thu th�p H�ng M�c.") 
Msg2Player("Nh�n nhi�m v� ch�t c�y l�m ki�m. ��n �i�m Th��ng S�n thu th�p H�ng M�c.") 
SetTask(69,10)
end; 

function L10_get_no() 
end; 



