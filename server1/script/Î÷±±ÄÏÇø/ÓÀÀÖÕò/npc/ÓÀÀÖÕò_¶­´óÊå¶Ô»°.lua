
function main(sel)
if (GetTask(169) == 52) then
Talk(2,"nv5xHS","��ng ��i Th�c: S�n Ph� ��ng gh�t, ta nh�t ��nh ph�i th��ng c�o quan ph�!")
elseif (GetTask(169) > 52) and (GetTask(169) < 58) then
Talk(1,"","��ng ��i Th�c: S�n Ph� ��ng gh�t, ta nh�t ��nh ph�i th��ng c�o quan ph�!")
elseif (GetTask(169) == 58) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","��ng ��i Th�c: �i, ��y ch�nh l� v�t ph�m �� b� c��p c�a ch�ng t�i, xin �a t�, �a t�!")
else
Say("L�m ng��i ���c m�y l�n say, n�n l�c h� �� th� c� h� ��!",0)
end
end;

function nv5xHS()  
	SetTask(169,53)
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,59)
end; 