--   Edit by Youtube PGaming  --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 10)  then
Talk(4,"L10_hs","V�n T� Vi�n: tr� ngon, ti�c l�...","Ng��i ch�i: S� huynh, tr� n�y c� g� kh�ng th�a ��ng?") 
elseif (GetTask(169) == 12) and (HaveCommonItem(6,1,3943)>0) then
Talk(2,"L10_prise","Ng��i ch�i: S� huynh, huynh xem n��c su�i n�y s�ch th�t.","V�n T� Vi�n: N��c su�i n�y th�t trong l�nh thu�n khi�t, ��ng l� th��ng ph�m, r�t h�p �� pha tr�, �a t�!") 
elseif (GetTask(169) > 10) and (GetTask(169) < 12)then
Talk(1,"","V�n T� Vi�n: ��n d�ng su�i l� c� th� nh�n ���c Thanh Tuy�n Kho�ng Th�y")
elseif (GetTask(69) == 52) then
Say("V�n T� Vi�n: Ti�u Ph�ng t�nh t�nh l� m�ng k�ch ��ng, haizz...",2,"Nhi�m v� k� n�ng c�p 150/nv15x","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) > 52 ) and (GetTask(69) < 54) then 
Say("V�n T� Vi�n: Ti�u Ph�ng t�nh t�nh l� m�ng k�ch ��ng, haizz...",2,"Nhi�m v� k� n�ng c�p 150/nv15x4","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no")
elseif (GetTask(69) == 61) then
Say("V�n T� Vi�n: Ti�u Ph�ng t�nh t�nh l� m�ng k�ch ��ng, haizz...",2,"Nhi�m v� k� n�ng c�p 150/nv15x2","Ta ��n t�m �ng c� vi�c kh�c/L50_get_no") 
elseif (HaveMagic(1349) >= 0) then
Talk(1,"","V�n T� Vi�n: K� th�y, d�ng s�n th�y th��ng, giang th�y trung, c�nh th�y h�. K� s�n th�y luy�n kh�ng tuy�n, th�ch tr� m�n l�u gi� th��ng, v�t th�c chi...")	
else 
Talk(1,"","V�n T� Vi�n: Ti�u Ph�ng t�nh t�nh l� m�ng k�ch ��ng, haizz...")	
end
end


function nv15x4() 
Talk(1,"","V�n T� Vi�n: Mau �i �i.")	
end; 


function nv15x2() 
if CalcFreeItemCellCount() < 6 then
CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang! Nh� �� tr�ng 6 � tr� l�n nh�!",  "���c r�i./Cancel",});
return 1;
end
Talk(5,"","Ng��i ch�i: S� huynh! m�t huynh l�m sao th�?","V�n T� Vi�n: ...��ng lo, V�n Mi �� gi�p ta �i t�m thu�c r�i.","Ng��i ch�i: ...S� huynh, l� do l�i c�a ��.","V�n T� Vi�n: Kh�ng c�n �y n�y, vi�c n�y kh�ng ph�i l�i c�a ��, ng��c l�i ta ph�i c�m �n �� �� c�u Th�m M�c.","Ng��i ch�i: Kh�ng c� g� ��u, t��ng tr� ��ng m�n l� chuy�n n�n l�m.","V�n T� Vi�n: K� th�c chuy�n n�y l� trong h�a c� may, Ti�u Ph�ng sau n�y s� kh�ng c�n l� m�ng n�a. Ch� l� tr��c ��y v�i ng�y ta c� nh�n ���c 1 l�nh b�i, t�nh h�nh th� n�y th� e l� kh�ng th�c hi�n ���c, ph�i nh� �� thay ta chuy�n n�y v�y.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2908,1,0,0}, nBindState=-2}, "test", 1);
AddNote("Nh�n ���c Nguy�t Ca L�nh.") 
Msg2Player("Nh�n ���c Nguy�t Ca L�nh.") 
AddNote("��n ch� D��ng Ch�u t�m thuy�n phu l�n ��o.") 
Msg2Player("��n ch� D��ng Ch�u t�m thuy�n phu l�n ��o.") 
SetTask(2885,1) 
SetTask(69,62) 
AddGoldItem(0, 4660)
AddGoldItem(0, 4670)
Talk(1,"","�� h�y nh�n ch�t l�ng th�nh n�y.")
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p V�n L�c.") 
end; 


function nv15x() 
Talk(5,"","Ng��i ch�i: T� S� huynh nghe n�i Chu Ti�n Tr�n c� tung t�ch c�a Thi�n Nh�n Gi�o, �� ��ch th�n xu�ng n�i t�m hi�u.","V�n T� Vi�n: C�i g�?! H�n nghe ���c t� ��u?","Ng��i ch�i: l�...l� do ta n�i v�i h�n, chuy�n l� nh� th� n�y.","V�n T� Vi�n: ...uh, c�ng kh�ng tr�ch ng��i ���c, ��u ti�n l� �� t� ��a c�m n�i l�. Ch� l� chuy�n c�a Chu Ti�n Tr�n c�n m�t s� �i�m ��ng nghi, ta e r�ng c� s� l�a g�t...","V�n T� Vi�n: S� ph� �ang b� quan, ch� c� th� �i theo xem, c�ng c�n ph�i ph�i h�p v�i ta, chuy�n ch�ng ta xu�ng n�i, ng��i h�y n�i v�i Th�m M�c S� �� m�t ti�ng.")
SetTask(69,53)
AddNote("k� l�i s� t�nh cho Th�m M�c.") 
Msg2Player("k� l�i s� t�nh cho Th�m M�c.") 
end; 

function L50_get_no() 
end; 	

function L10_hs() 
Say("V�n T� Vi�n: ��y l� tr� T� D��ng Ng�n Ch�m l�n tr��c ta xu�ng n�i mang v�, v�n l� tr� ngon, nh�ng ph�i d�ng n��c gi�ng �� n�u, N�u d�ng n��c kh�c s� m�t v� ngon. ��i hi�p s� ��, ��i hi�p c� th� �i l�y �t n��c su�i trong n�i v� ��y kh�ng?",2,"Ta �i ngay./L10_get_yes","Ta c� vi�c kh�c ph�i l�m/L10_get_no") 
end 

function L10_get_yes()  
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3942,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(169,11)
	AddNote("G�p V�n T� Vi�n, nh�n nhi�m v� l�y n��c pha tr�, ��n khe su�i �� l�y n��c.") 
	Msg2Player("G�p V�n T� Vi�n, nh�n nhi�m v� l�y n��c pha tr�, ��n khe su�i �� l�y n��c.") 
end; 

function L10_get_no() 
end; 

function L10_prise() 
Talk("Ng��i ch�i: S� huynh, huynh xem n��c su�i n�y s�ch th�t.","V�n T� Vi�n: N��c su�i n�y th�t trong l�nh thu�n khi�t, ��ng l� th��ng ph�m, r�t h�p �� pha tr�, �a t�!") 
SetTask(169,20)
DelCommonItem(6,1,3943)
SetRank(83) 
AddMagic(1349,0)
AddMagic(1374,0)
Msg2Player("H�i ��p V�n T� Vi�n, ho�n th�nh nhi�m v� l�y n��c pha tr� ��i hi�p t�ng c�p th�nh �� t� ph�ng tr�, h�c ���c v� c�ng Ki�m T�ng T�ng Quy�t, Long Nhi�u Th�n.") 
AddGoldItem(0, 4633)
AddGoldItem(0, 4643)
Msg2Player("Nh�n ���c <color=yellow>d�y chuy�n ho�ng kim c�p Thanh C�u.") 
AddNote("H�i thu�c tr� l�i , th�y ti�u h�n ph�c m�nh , th�ng c�p th�nh ph�ng ki�m �� t� ") 
end; 

