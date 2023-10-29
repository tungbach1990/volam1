--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 40) and (GetLevel() >=40) then
Talk(1,"nvL40","Th�m M�c: Kh�ng l�u n�a l� ��n sinh nh�t s� ph� r�i, s� ph� b�nh th��ng r�t nghi�m ngh�, ch� c� s� th�ch ��nh c�, ta v� T� s� huynh b�n v�i nhau l�m m�t d�ng c� ��nh c� tinh t� t�ng cho s� ph�.")
elseif (GetTask(169) > 40) and (GetTask(169) < 45)then
Talk(1,"","Th�m M�c: Ng��i c� th� ��n Ph��ng T��ng Ph� t�m th�.")
elseif (GetTask(169) == 45) and (HaveCommonItem(6,1,3950)>0) then
Talk(3,"nvL402","Ng��i ch�i: b� V�n T� Tr�c Thu B�nh n�y d�ng �� l�m qu� cho L�n s� th�c.","Th�m M�c: ��y l� m�n �� qu� gi� s� ph� s� th�ch l�m ��y, c�m �n!")
elseif (GetTask(69) == 53) then
Say("Th�m M�c: Th� gi�i v� l�m...r�t h�n lo�n!",2,"Nhi�m v� k� n�ng c�p 150/nv15x","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) > 53 ) and (GetTask(69) < 55) then 
Say("Th�m M�c: Th� gi�i v� l�m...r�t h�n lo�n!",2,"Nhi�m v� k� n�ng c�p 150/nv15x4","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif  (HaveMagic(1354) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","Th�m M�c: S� ph� lu�n qu� tr�ch ta nh�t gan, trong m�t ng��i, ta v�n kh�ng b�ng T� S� huynh...")	
elseif  (HaveMagic(1354) >= 0) then
Talk(1,"","Th�m M�c: M�c d� s� ph� ch�a bao gi� n�i ra, nh�ng ch�ng ta ��u bi�t ng��i r�t th�ch ch�i c�.")	
else
Talk(1,"","Th�m M�c: Th� gi�i v� l�m...r�t h�n lo�n!")	
end
end

function nv15x4() 
Talk(1,"","Th�m M�c: ta s� h�nh ��ng ngay.")
end; 

function nv15x() 
Talk(2,"","Ng��i ch�i: T� S� huynh h� s�n �i Chu Ti�n Tr�n, Ph��ng S� huynh �� �i r�i, b�o ta ��n n�i v�i ng��i m�t ti�ng.","Th�m M�c: Sao? v�y ta c�ng ph�i �i theo ti�p �ng.")
SetTask(69,54)
AddNote("��n ch� Chu Ti�n Tr�n t�m Th�m M�c.") 
Msg2Player("��n ch� Chu Ti�n Tr�n t�m Th�m M�c.") 
end; 

function L50_get_no() 
end; 	





function nvL402()
DelCommonItem(6,1,3950)
AddMagic(1354)
AddMagic(1378)
SetTask(169,50)
SetRank(86)
 AddNote("H�i ��p Th�m M�c, ho�n th�nh V�n T� Tr�c Thu B�nh nhi�m v� ��i hi�p t�ng c�p th�nh �an Thanh S�, h�c ���c v� c�ng Hi Di Ki�m Ph�p, Kh� Ch�n S�n H�.") 
Msg2Player("H�i ��p Th�m M�c, ho�n th�nh V�n T� Tr�c Thu B�nh nhi�m v� ��i hi�p t�ng c�p th�nh �an Thanh S�, h�c ���c v� c�ng Hi Di Ki�m Ph�p, Kh� Ch�n S�n H�.") 
AddGoldItem(0, 4637)
AddGoldItem(0, 4638)
AddGoldItem(0, 4647)
AddGoldItem(0, 4648)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end; 

function nvL40()
Say("Th�m M�c: V�n d� ��nh m�y h�m nay s� xu�ng n�i t�m, k�t qu� l� T� S� huynh nghe n�i � l�n c�n Bi�n Kinh c� v� c��p ti�u li�n quan ��n Thi�n Nh�n Gi�o, b�n ��ch th�n xu�ng n�i, c��i ng�a kh�ng ng�ng ngh� �� ��n Bi�n Kinh, l�n n�y e r�ng kh� m� quay v�, ch� c� m�nh ta, xu�ng n�i m�t m�nh c� nhi�u b�t ti�n, ng��i c� th� �i v�i ta kh�ng.",2,"Ta s� gi�p ng��i./L40_get_yes","Ng��i t�m ng��i kh�c �i./L40_get_no") 
end; 


function L40_get_yes()  
	SetTask(169,41)
	Talk(1,"","Th�m M�c: Ng��i c� th� ��n Ph��ng T��ng Ph� t�m th�.")	
AddNote("G�p Th�m M�c, ti�p nh�n nhi�m v� V�n T� Tr�c Thu B�nh, ��n ti�m t�p h�a Ph��ng T��ng h�i th�m.") 
Msg2Player("G�p Th�m M�c, ti�p nh�n nhi�m v� V�n T� Tr�c Thu B�nh, ��n ti�m t�p h�a Ph��ng T��ng h�i th�m.") 
end; 

function L40_get_no() 
end; 



