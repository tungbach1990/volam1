--Edit by Youtube PGaming--


Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main()
		Say("<color=yellow>Nam Cung Tuy�t<color>: G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", 3, "Chuy�n m�n ph�i./chuyenphai","Mu�n th�nh gi�o vi�c kh�c./oldentence", "K�t th�c ��i tho�i./no");
		return
	end;

function oldentence()

if (GetTask(169) == 61)  and (GetLevel() >=50)then
Say("Nam Cung Tuy�t: �� t� b�n ph�i, ph�m t�c xu�t s�, c�n ph�i tr�i qua m�t lo�t c�c kh�o nghi�m, ng��i c� mu�n ti�p nh�n kh�o nghi�m kh�ng?",2,"Ti�p nh�n ki�m tra/L50_get_yes","�� ta suy ngh� l�i/L50_get_no")
elseif (GetTask(169) > 61) and (GetTask(169) <69)then
Talk(1,"","Nam Cung Tuy�t: Mau �i �i.")
elseif (GetTask(169) > 68) and (GetTask(169) <70) and (HaveCommonItem(6,1,3952) == 1)then
Talk(1,"","Nam Cung Tuy�t: Mau �i �i.")
elseif (GetTask(169) == 70) then
Talk(1,"L50_hs","Nam Cung Tuy�t: T�t l�m, xem ra ng��i �� ho�n th�nh kh�o nghi�m, c� th� su�t s� su�n s� r�i!")
elseif (GetTask(169) == 69) and (HaveCommonItem(6,1,3952) == 0) then
Talk(2,"L50222_hs","Nam Cung Tuy�t: M�n �� quan tr�ng th� n�y m� ng��i c�ng l�m m�t? L�n sau ph�i c�n th�n ��y.")
elseif (GetTask(169) == 71)  and (GetLevel() >=60) then
Talk(6,"L50_hs2","Ng��i ch�i: Ch��ng m�n ...","Nam Cung Tuy�t: Ng��i xu�ng n�i tr�i nghi�m l�u nh� v�y, c�m gi�c th� n�o?","Ng��i ch�i: �� t� t� khi xu�ng n�i, l� phi�u b�t giang h�, c�m nh�n s�u s�c con ng��i trong giang h�, th�n b�t do k�, l�ng lu�n nh� v� nh�ng ng�y th�ng t�i s� m�n...","Nam Cung Tuy�t: N�u �� nh� v�y, ta cho ph�p ng��i quay l�i m�n ph�i, ch� c�n ng��i mu�n, ph�i Hoa S�n lu�n m� c�a ��n nh�n.","Ng��i ch�i: �� t� ��ng �! Ngo�i ra, sau khi h� s�n, �� t� �� t�ch g�p ���c 1 �t, qu�n t� �i t�i, th� chi h�u ��o, s� ti�n n�y l� do c�c b�ng h�u trong giang h� t�ng trong nh�ng l�n �� t� h�nh hi�p tr��ng ngh�a. �� t� v�n kh�ng d�ng t�i, mu�n quy�n g�p cho")
elseif (GetTask(169) == 72) and (GetLevel() >=60) then
Say("Nam Cung Tuy�t: �� mang 50000 l��ng ��n ch�a?.",2,"�� mang ��n r�i./L503_get_yes","V�n ch�a ��/L50_get_no")
elseif (GetTask(169) == 73) and (GetLevel() >=60) then
Say("Nam Cung Tuy�t: L�i mu�n h� s�n tr�i nghi�m sao?",2,"V�ng, mong Ch��ng m�n cho ph�p./L504_get_yes","Kh�ng, ta t� th�y c�ng phut�p luy�n v�n ch�a ��./L50_get_no")
elseif (GetTask(169) == 74)  and (GetLevel() >=60) then
Talk(6,"L50_hs3","Ng��i ch�i: Ch��ng m�n ...","Nam Cung Tuy�t: Ng��i xu�ng n�i tr�i nghi�m l�u nh� v�y, c�m gi�c th� n�o?","Ng��i ch�i: �� t� t� khi xu�ng n�i, l� phi�u b�t giang h�, c�m nh�n s�u s�c con ng��i trong giang h�, th�n b�t do k�, l�ng lu�n nh� v� nh�ng ng�y th�ng t�i s� m�n...","Nam Cung Tuy�t: N�u �� nh� v�y, ta cho ph�p ng��i quay l�i m�n ph�i, ch� c�n ng��i mu�n, ph�i Hoa S�n lu�n m� c�a ��n nh�n.","Ng��i ch�i: �� t� ��ng �! Ngo�i ra, sau khi h� s�n, �� t� �� t�ch g�p ���c 1 �t, qu�n t� �i t�i, th� chi h�u ��o, s� ti�n n�y l� do c�c b�ng h�u trong giang h� t�ng trong nh�ng l�n �� t� h�nh hi�p tr��ng ngh�a. �� t� v�n kh�ng d�ng t�i, mu�n quy�n g�p cho")
elseif (GetTask(169) == 75) and (GetLevel() >=60) then
Say("Nam Cung Tuy�t: �� mang 50000 l��ng ��n ch�a?.",2,"�� mang ��n r�i./L5032_get_yes","V�n ch�a ��/L50_get_no")
elseif (HaveMagic(1379) < 0) and (HaveMagic(1347) >= 0) or ((GetTask(169) == 71) and (GetLevel() < 60) )then
Talk(1,"","Nam Cung Tuy�t: �� gia nh�p v�o ph�i Hoa S�n ta, th� ph�i ch�m ch� luy�n t�p, nh� v�y m�i x�ng danh l� �� t� Hoa S�n.")
else
Talk(1,"","Nam Cung Tuy�t: ph�i Hoa S�n ta v�n v� danh ti�ng �� l�u, l�n n�y t�i xu�t giang h�, ph�i cho th� nh�n th�y ���c thanh uy c�a Hoa S�n.")
end
end

function L50222_hs() 
 tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3952,0,0,0}, nBindState=-2}, "test", 1);
end


function L504_get_yes()  
SetCurCamp(4)
SetCamp(4) 
SetTask(169,74)
Msg2Player("Ta r�i ph�i Hoa S�n, t�i xu�t giang h�.") 
AddNote("Ta r�i ph�i Hoa S�n, t�i xu�t giang h�.") 
end

function L5032_get_yes()  
if GetCash() >= 50000 then
Pay(50000)
Talk(1,"","Nam Cung Tuy�t: Gi� con c� th� t� do ra v�o Hoa S�n ph�i.")
SetTask(169,73)
Msg2Player("Ng��i �� tr� l�i s� m�n, nh�n ���c danh hi�u Th�i H�c C�c Ch�.") 
AddNote("Ng��i �� tr� l�i s� m�n, nh�n ���c danh hi�u Th�i H�c C�c Ch�.") 
SetCurCamp(3)
SetCamp(3) 
SetRank(89)
else
Talk(2,"","Nam Cung Tuy�t: Ng��i ch�a mang �� 50000 l��ng.","Ng��i ch�i: Ta l�i t�m th� xem sao.")
end; 
end

function L503_get_yes()  
if GetCash() >= 50000 then
Pay(50000)
Talk(1,"","Nam Cung Tuy�t: Gi� ta phong con l�m Th�i H�c C�c Ch�, v� truy�n th� tuy�t h�c b�n m�n: Th��ng T�ng Ngh�nh Kh�ch, Ma V�n Ki�m Kh�, Huy�n Nh�n V�n y�n.")
SetTask(169,73)
Msg2Player("Ng��i �� tr� l�i s� m�n, nh�n ���c danh hi�u Th�i H�c C�c Ch�, h�c ���c v� c�ng Th��ng T�ng Ngh�nh Kh�ch, Ma V�n Ki�m Kh�, Huy�n Nh�n V�n Y�n.") 
AddNote("Ng��i �� tr� l�i s� m�n, nh�n ���c danh hi�u Th�i H�c C�c Ch�, h�c ���c v� c�ng Th��ng T�ng Ngh�nh Kh�ch, Ma V�n Ki�m Kh�, Huy�n Nh�n V�n Y�n.") 
SetCurCamp(3)
SetCamp(3) 
AddMagic(1358)
AddMagic(1360)
AddMagic(1380)
SetRank(89)
AddGoldItem(0, 4642)
AddGoldItem(0, 4652)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
else
Talk(2,"","Nam Cung Tuy�t: Ng��i ch�a mang �� 50000 l��ng.","Ng��i ch�i: Ta l�i t�m th� xem sao.")
end; 
end

function L50_hs3() 
Say("Nam Cung Tuy�t: T�t l�m, h�y �em 50000 l��ng t�i ��y.",2,"���c!/L5023_get_yes","�� ta suy ngh� l�i/L50_get_no")
end; 		
	
function L5023_get_yes()  
Talk(1,"","Ng��i ch�i: ���c, �� t� s� �i l�y 50000 l��ng.")
SetTask(169,75)
Msg2Player("C�ng hi�n 50000 l��ng l� c� th� tr� l�i s� m�n.") 
AddNote("C�ng hi�n 50000 l��ng l� c� th� tr� l�i s� m�n.") 
end; 	

function L50_hs2() 
Say("Nam Cung Tuy�t: T�t l�m, h�y �em 50000 l��ng t�i ��y.",2,"���c!/L502_get_yes","�� ta suy ngh� l�i/L50_get_no")
end; 		
	
function L502_get_yes()  
Talk(1,"","Ng��i ch�i: ���c, �� t� s� �i l�y 50000 l��ng.")
SetTask(169,72)
Msg2Player("C�ng hi�n 50000 l��ng l� c� th� tr� l�i s� m�n.") 
AddNote("C�ng hi�n 50000 l��ng l� c� th� tr� l�i s� m�n.") 
end; 	

function L50_hs() 
DelCommonItem(6,1,3952)
AddRepute(120)
SetCurCamp(4)
SetCamp(4) 
SetTask(169,71)
SetRank(88)
Msg2Player("H�i ��p Nam Cung Tuy�t, ho�n th�nh nhi�m v� xu�t s� Ng��i �� xu�t s� th�nh c�ng, Nh�n ���c danh hi�u L�c Ngh� Truy�n Nh�n.") 
AddNote("H�i ��p Nam Cung Tuy�t, ho�n th�nh nhi�m v� xu�t s� Ng��i �� xu�t s� th�nh c�ng, Nh�n ���c danh hi�u L�c Ngh� Truy�n Nh�n.") 
AddGoldItem(0, 4641)
AddGoldItem(0, 4651)
Msg2Player("Nh�n ���c <color=yellow>trang b� ho�ng kim c�p Thanh C�u.")
end; 	
	
function L50_get_yes()  
Talk(1,"","Nam Cung Tuy�t: trong c�m nang n�y c� 3 m�nh gi�y, m�i m�nh gi�y l� m�t nhi�m v�, sau khi ho�n th�nh m�t nhi�m v� m�i c� th� m� m�nh gi�y th� 2 c� nh� th� m� ho�n th�nh, ng��i mau �i �i.")
	SetTask(169,62)
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3952,0,0,0}, nBindState=-2}, "test", 1);
AddNote("G�p Nam Cung Tuy�t, ti�p nh�n nhi�m v� xu�t s� ki�m tra c�m nang.") 
Msg2Player("G�p Nam Cung Tuy�t, ti�p nh�n nhi�m v� xu�t s� ki�m tra c�m nang.") 

end; 

function no()
end

function L50_get_no() 
end; 	


---------------------chuyen phai test lai sau ---------------------------------------

function chuyenphai()
local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(10)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end





