
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(198) == 1 then
		allbrother_0801_FindNpcTaskDialog(198)
		return 0;
	end
	
if (GetTask(169) == 53) then
Talk(3,"nv5xHS","Th� N�i N�i: nghe n�i b�n S�n Ph� t�n c�ng th�n l�ng c� b�n doanh t�i ��ng Kim Quang, ��i hi�p xin h�y th��ng l�ng, gi�p ch�ng t�i �o�t l�i t�i v�t!","Ng��i ch�i: c�c v� h��ng th�n y�n t�m, t�i h� nh�t ��nh s� gi�p.")
elseif (GetTask(169) > 53) and (GetTask(169) < 59) then
Talk(1,"","Th� N�i N�i: ��i hi�p, m�i ��u trong mong nh� ng�i.")
elseif (GetTask(169) == 59) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","Th� B� B�: a, ��y kh�ng ph�i l� t�i s�n c�a ta sao, �a t�, �a t�!")
else
Say("Hai c�i l�o L� v� l�o C�t �� quanh n�m c� ��u �� v�i nhua nh� tr� con!",0)
end
end;

function nv5xHS()  
	SetTask(169,54)
	AddNote("��i tho�i v�i th�n d�n, quy�t ��nh ��n th�o ph�t b�n S�n Ph� t�i ��ng Kim Quang (197/194), �o�t l�i t�i v�t.") 
Msg2Player("��i tho�i v�i th�n d�n, quy�t ��nh ��n th�o ph�t b�n S�n Ph� t�i ��ng Kim Quang (197/194), �o�t l�i t�i v�t.") 
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,60)
	AddNote("mang t�i v�t tr� l�i cho c�c v� th�n l�o") 
Msg2Player("mang t�i v�t tr� l�i cho c�c v� th�n l�o") 
end; 