-- Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 24) then
Talk(3,"L20_hs","Ng��i ch�i: S� huynh, c� th� th�nh gi�o huynh v�i chi�u kh�ng?","�� t� luy�n ki�m Hoa S�n: ���ng nhi�n l� ���c, Ng��i ��n Di�n V� ���ng t�m ta, c�c s� huynh kh�c c�ng � ��, ng��i c� th� ��u v�i 1 ng��i b�t k�.")
elseif (GetTask(169) > 24) and (GetTask(169) < 26)then
Talk(2,"","Ng��i ch�i: S� huynh, c� th� th�nh gi�o huynh v�i chi�u kh�ng?","�� t� luy�n ki�m Hoa S�n: ���ng nhi�n r�i, ta � Di�n V� tr��ng ��i ng��i.")
elseif (HaveMagic(1350) < 0) and HaveMagic(1347) >= 0 then
Talk(1,"","�� t� luy�n ki�m Hoa S�n: V� s� �� n�y c� mu�n ��u v�i ta v�i chi�u?")
elseif (HaveMagic(1375) >= 0) then
Talk(1,"","Ng��i ch�i: S� huynh khi�m nh��ng r�i")
else
Talk(1,"","�� t� luy�n ki�m Hoa S�n: ki�m ph�p ph�i Hoa S�n ta tinh di�u v� ph�, kh�p n�i ��t t�i c�nh gi�i 'Ch�nh h�p k� th�ng, ki�m tung c�u th�ng'")

end
end; 


function L20_hs()	
	SetFightState(1) 
	SetTask(169,25)
AddNote("�� t� luy�n ki�m mu�n ng��i ��n ch� Di�n V� ���ng thi ��u v�i h�n.") 
Msg2Player("�� t� luy�n ki�m mu�n ng��i ��n ch� Di�n V� ���ng thi ��u v�i h�n.") 
end; 



