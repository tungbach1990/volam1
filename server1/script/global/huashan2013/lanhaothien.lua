--  Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 50)  and (GetLevel() >=50)then
Say("L�n H�o Thi�n: G�n ��y b�ch t�nh � V�nh L�c Tr�n b� ��o t�c qu�y nhi�u, m� c�ng ch�ng coi ph�i Hoa S�n ta ra g�, ng��i �� gia nh�p ph�i c�ng l�u r�i, c�ng �� ��n l�c xu�ng n�i r�i, vi�c n�y giao cho ng��i gi�i quy�t.",2,"�� t� tu�n m�nh./L50_get_yes","�� t� n�ng l�c kh�ng ��/L50_get_no")
elseif (GetTask(169) > 50) and (GetTask(169) < 60)then
Talk(1,"","L�n H�o Thi�n: mau �i �i.")
elseif (GetTask(169) == 60) then
Talk(4,"nv5xHS","L�n H�o Thi�n: �� l�m xong vi�c ch�a?","Ng��i ch�i: V�ng, �� t� �� r�i kh�i S�n Ph�, �� l�y nh�ng v�t b� c��p tr� l�i cho d�n r�i.","L�n H�o Thi�n: T�t l�m, kh�ng h� danh �� t� ph�i Hoa S�n.")
elseif (GetTask(69) == 24) then
Talk(9,"nv9xHS","Ng��i ch�i: L�n ti�n b�i, ��y l� tin c�a Nh�c Minh Phi � T��ng D��ng nh� ta ��a t�i, �ng ta b� ��nh l�n b� th��ng, kh�ng ti�n tr� v�.","L�n H�o Thi�n: Thi�n Nh�n Gi�o c� � �� m�u h�i quan vi�n tri�u ��nh.","L�n H�o Thi�n: �� l� ng��i c�a Thi�n Nh�n Gi�o, ph�i Hoa S�n kh�ng th� kh�ng qu�n, ta v�n mu�n cho T� Ph�ng �i gi�p �� Nh�c Minh Phi, nh�ng h�n b� S� huynh nh�t t�i T� Qu� Nhai r�i.","Ng��i ch�i: H�n sao r�i?","L�n H�o Thi�n: ��ng nh�t chuy�n n�y n�a. S� huynh th�c s� �� suy ngh� qu� nhi�u r�i, ��i hi�p, kh�ng bi�t c� th� nh� ng��i m�t vi�c kh�ng?","Ng��i ch�i: L�n ti�n b�i c� sai b�o.","L�n H�o Thi�n: Ta v� Minh Phi v�n l� t�m giao, b�n nh� T� Ph�ng gi�p chuy�n n�y, ph� tan �m m�u c�a Thi�n Nh�n gi�o.","Ng��i ch�i: Ti�n b�i y�n t�m, ta �i ngay.")
elseif (HaveMagic(1355) < 0) and (HaveMagic(1347) >= 0) then
Talk(4,"","L�n H�o Thi�n: N�u c� th�i gian th� h�y r�n luy�n b�n th�n th�m nh�!")
elseif (HaveMagic(1355) >= 0) and GetCurCamp() == 1 and GetCamp() == 1 or (HaveMagic(1355) >= 0) and GetCurCamp() == 2 and GetCamp() == 2 or (HaveMagic(1355) >= 0) and GetCurCamp() == 3 and GetCamp() == 3 then
Talk(1,"","L�n H�o Thi�n: D�a v�o t� ch�t c�a ng��i, th�nh t�u sau n�y kh�ng ch� d�ng � ��.")
elseif (GetTask(69) > 24) and (GetTask(69) < 31)then
Talk(1,"","L�n H�o Thi�n: mau �i �i.")
elseif GetCurCamp() == 4 and GetCamp() == 4  and  (HaveMagic(1355) >= 0) then 
Talk(1,"","L�n H�o Thi�n: D�m l�a ph�i Hoa S�n ta, ��ng b� tr�ng ph�t!")	
else 
Talk(1,"","L�n H�o Thi�n: D�m l�a ph�i Hoa S�n ta, ��ng b� tr�ng ph�t!")	
end
end

function nv9xHS()  
	SetTask(69,25)
	AddNote("��n T��ng D��ng gi�p Nh�c Minh Phi.") 
Msg2Player("��n T��ng D��ng gi�p Nh�c Minh Phi.") 
end; 

function nv5xHS()  

AddMagic(1355)
AddMagic(1379)
	SetTask(169,61)
	SetRank(87)
	AddNote("H�i ��p L�n H�o Thi�n, ho�n th�nh nhi�m v� V�nh L�c Phong V�n, ng��i th�ng c�p th�nh D�ch Thu S�, h�c ���c v� c�ng C�n Kh�n ��o Huy�n, Kh� Qu�n Tr��ng H�ng.") 
Msg2Player("H�i ��p L�n H�o Thi�n, ho�n th�nh nhi�m v� V�nh L�c Phong V�n, ng��i th�ng c�p th�nh D�ch Thu S�, h�c ���c v� c�ng C�n Kh�n ��o Huy�n, Kh� Qu�n Tr��ng H�ng.") 
AddGoldItem(0, 4640)
AddGoldItem(0, 4650)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end; 

function L50_get_yes()  
	SetTask(169,51)
	AddNote("G�p L�n H�o Thi�n, nh�n nhi�m v� V�nh L�c Phong V�n, h�y ��n gi�p �� d�n c� V�nh L�c Tr�n.") 
	Msg2Player("Nh�n nhi�m v� V�nh L�c Phong V�n, h�y ��n gi�p �� d�n c� V�nh L�c Tr�n.") 
	Msg2Player("��n V�nh L�c Tr�n t�m Ho�ng th�c <color=yellow>202/198<color>, ��ng ��i th�c <color=yellow>198/200<color> v� b� Th� <color=yellow>204/206<color>.") 
end; 

function L50_get_no() 
end; 

