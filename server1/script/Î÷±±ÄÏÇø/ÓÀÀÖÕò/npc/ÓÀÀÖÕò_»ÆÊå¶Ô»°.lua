
function main(sel)
if (GetTask(169) == 51) then
Talk(2,"nv5xHS","Ho�ng Th�c: �i... Th�ng ng�y c�ng kh� kh�n r�i.")
elseif (GetTask(169) > 51) and (GetTask(169) < 57) then
Talk(1,"","Ho�ng Th�c: �i... Th�ng ng�y c�ng kh� kh�n r�i.")
elseif (GetTask(169) == 57) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","Ho�ng Th�c: a, ��y kh�ng ph�i l� t�i s�n c�a ta sao, �a t�, �a t�!")
else
Say("Tr�n c�a ch�ng ta n�m c�nh Hoa S�n, th��ng c� nh�n s� v� l�m qua l�i, mu�n h�c v� c�ng c�ng kh�ng kh�.",0)
end
end;

function nv5xHS()  
	SetTask(169,52)
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,58)
end; 