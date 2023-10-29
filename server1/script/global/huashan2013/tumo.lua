--  Edit by Youtube PGaming--
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetLevel() >=20) and (GetTask(169) == 20) then
Talk(3,"L20_hs","T� M�: Ng��i gia nh�p ph�i Hoa S�n c�ng ���c m�t th�i gian r�i, ta th�y ng��i ng�y ��m kh� luy�n d�ng c�ng, hi�n gi� ng��i c� g� ch�a hi�u kh�ng?","Ng��i ch�i: �� t� g�n ��y c� t� th� v�i c�c v� S� huynh, th�ng �t thua nhi�u, �� t� th�y ��ng t�c xu�t chi�u c�a S� huynh th�t kh�ng gi�ng v�i �� t�, t�i sao uy l�c chi�u th�c l�i kh�c nhau nhi�u nh� v�y?")
elseif (GetTask(169) > 20) and (GetTask(169) <= 25)then
Talk(1,"","T� M�: C�n kh�ng mau �i?")
elseif (GetTask(169) == 26) and (HaveCommonItem(6,1,3945)>0) and (HaveCommonItem(6,1,3946)>0) and (HaveCommonItem(6,1,3947)>0) then
Talk(4,"L20_hs2","T� M�: B�y gi� ng��i suy ngh� nh� th� n�o?","Ng��i ch�i: v�ng, �� t� chi�u th�c �� t� ��nh ra Kh�ng h�u h�nh nh�ng v� th�n","Ng��i ch�i: ta th�y n�i Hoa S�n kh� th� h�ng v�, c�m th� s� uy d�ng c�a th� v�, n�u nh� c� th� b�t ��ng nh� s�n, ki�n c� nh� th�ch, cang khinh nh� t�ng, nhu nhuy�n nh� th�y nh�t ��nh s� ��t ���c ��nh cao c�a ki�m chi�u, hi�u qu� g�p b�i.","T� M�: r�t t�t, n�u nh� ng��i c� c�m th� nh� th�, sau n�y nh�t ��nh s� ti�n b� v��t b�c, ta s� t�ng c�p cho ng��i l� T� M�c �� t�")
elseif (HaveMagic(1375) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","T� M�: T�nh tr�ng c�a Ph�ng Nhi g�n ��y, l�m ta v� c�ng lo l�ng...")
elseif (HaveMagic(1375) >= 0)  then
Talk(1,"","T� M�: H�y nh� l�y c�m nh�n c�a ng��i, s� h�c ���c c�ng nhi�u th�")
else
Talk(1,"","T� M�: G�n ��y m�t s� �� t� trong ph�i s�i s�c mu�n b�o th�, vi�c n�y kh�ng th�a ��ng...")
end
end; 

function L20_hs() 
Say("T� M�: Nh� v�y, ng��i h�y �i m�t chuy�n ��n sau n�i, l�y Nhai B�ch Chi Th�ch, Dung Tuy�t Chi Th�y v� Th��ng T�ng Ch�m Di�p, �em ��n ch� s� huynh ��ng m�n c�a ng��i nh� ch� gi�o �i.",2,"�� t� �i ngay./L20_get_yes","�� t� s� �i sau./L20_get_no") 
end 


function L20_get_yes()  
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3944,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(169,21)
AddNote("G�p T� M�, nh�n nhi�m v� Ng� Ki�m, ��n ph�i Hoa S�n h�u s�n ��ot l�y Nhai B�ch Th�ch, Th�c Tuy�t Chi Th�y, Th��ng T�ng Ch�m Di�p.") 
Msg2Player("G�p T� M�, nh�n nhi�m v� Ng� Ki�m, ��n ph�i Hoa S�n h�u s�n ��ot l�y Nhai B�ch Th�ch, Th�c Tuy�t Chi Th�y, Th��ng T�ng Ch�m Di�p.") 
end; 

function L20_get_no() 
end;

function L20_hs2() 
DelCommonItem(6,1,3945)
DelCommonItem(6,1,3946)
DelCommonItem(6,1,3947)
SetRank(84)
SetTask(169,30)
AddNote("H�i ��p T� M�, ho�n th�nh nhi�m v� Ng� Ki�m, ��i hi�p t�ng c�p th�nh T� M�c �� t�, h�c ���c v� c�ng D��ng Ng� Ki�m Ph�i, H�i N�i B�ch Xuy�n.") 
Msg2Player("H�i ��p T� M�, ho�n th�nh nhi�m v� Ng� Ki�m, ��i hi�p t�ng c�p th�nh T� M�c �� t�, h�c ���c v� c�ng D��ng Ng� Ki�m Ph�i, H�i N�i B�ch Xuy�n.") 
AddMagic(1350)
AddMagic(1375)
AddGoldItem(0, 4634)
AddGoldItem(0, 4644)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end; 
