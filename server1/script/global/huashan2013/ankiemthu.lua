--Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 63)  then
Talk(3,"L50_hs","Ng��i ch�i: ta ��n �� h� tr� tu s�a Th�n Ki�m c�a b�n m�n.","�n Ki�m Thu: 2 thanh huy li ki�m n�y v�n l� th�n ki�m c�a Ch��ng m�n c�c ��i truy�n l�i, nh�ng �� b� t�n h�i t� cu�c chi�n nhi�u n�m tr��c, ta ph�ng m�nh tu s�a �� l�u, nh�ng v�n ch�a th� ho�n th�nh, v�n c�n th�m m�nh th� hung d� nh�t thi�n h� d�ng m�u ��") 
elseif (GetTask(169) > 63) and (GetTask(169) < 65)then
Talk(1,"","�n Ki�m Thu: B�ch H� huy�t m� ta c�n ��u?")
elseif (GetTask(169) == 65) and (HaveCommonItem(6,1,3956)>0) then
Talk(2,"L50_hs2","�n Ki�m Thu: Ng��i l�m t�t l�m! Th�n binh Huy Li t�i xu�t s� kh�ng c�n xa n�a.")
else 
Talk(1,"","�n Ki�m Thu: c�c h� c�n g�?")	
end
end

function L50_hs() 
SetTask(169,64)
AddNote("��n khu v�c Tuy�t B�o ��ng (190/207) ti�u di�t �i�u T�nh B�ch H� �� �o�t l�y m�u.") 
Msg2Player("��n khu v�c Tuy�t B�o ��ng (190/207) ti�u di�t �i�u T�nh B�ch H� �� �o�t l�y m�u.") 
end 

function L50_hs2() 
DelCommonItem(6,1,3956)
DelCommonItem(6,1,3953)
SetTask(169,66)
AddNote("�� h� tr� �n Ki�m Thu, c� th� ki�m tra c�m nang r�i.") 
Msg2Player("�� h� tr� �n Ki�m Thu, c� th� ki�m tra c�m nang r�i.") 
end 

