--���ϱ��� �ɶ��� ·��2Ф���ŶԻ�
-- update by xiaoyang(2004\4\16) ��ü90������

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld125 = GetTask(125)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld125 < 10) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~= "emei") then
		Talk(8,"Uworld125_task","��o l� xu�n phong nh�t b�i t�u, giang h� d� v� th�p ni�n ��ng. C�c h� l�u l�c trong giang h� kh�ng th�y m�t sao?","Th� gian v�n c�n nhi�u kh� �i, d� c� m�t m�i c�ng ph�i ki�n tr�. Ch�ng l� ��ng nh�n xem th� ��o lu�n h�i, cam t�m n��c ch�y b�o tr�i, th�n n�y v� c�ng kh�ng c�n � ngh�a g� n�a!","T�t! Tu�i tr� nh�ng c� ch� kh�! Ta c� m�t nhi�m v� n�y, ng��ic� d�m l�m kh�ng?","L� nhi�m v� g�?","Nga Mi ph�i s�ng ch� ra m�t b� V� T� Thi�n Th� c� tuy�t th� v� c�ng �� t�ng ���c l�u truy�n. Tr��c ��y kh�ng l�u ta nh�n ���c tin b� Thi�n Th� n�y �� xu�t hi�n � g�n khu v�c n�i Thanh Th�nh, nh�ng ch�a c� ai t�m ���c. Ng��i c� th� �i m�t chuy�n ���c kh�ng?","B� kh�ng s� sau khi l�y ���c b� ki�p ta s� chi�m l�m c�a ri�ng sao?","Ha! Ha! Ha!...V� T� Thi�n Th� ch� ai c� duy�n m�i ��c ���c. Cho d� t�m ���c r�i, kh�ng c� c�ch �� m� ra c�ng ch� l� u�ng c�ng. C� thi�n h� n�y, e r�ng ch� c� b� b� ta m�i ��c ���c!","H�a ra nh� th�.")
   elseif (Uworld125 == 15) and (HaveItem(388) == 1) then
   	Talk(10,"Uworld125_fire","Th� n�o? Kh�ng u�ng ph� c�ng s�c ch�?","�� t� �� l�y ���c r�i.","��a ta xem...Qu� l� V� T� Thi�n Th� r�i.","Xem ra t�i h� l� ng��i th�t c� duy�n.","M�t t�ch m� ng��i �ang gi�, giang h� kh�ng bi�t bao nhi�u ng��i th�m mu�n!","Cu�i c�ng c�ng ��a v� an to�n.","V�n ch�a xong! Ta n�i cho ng��i bi�t, ta ch�nh l� �� t� c�a Nga Mi ph�i �n n�u t�i Th�nh �� n�y. Ch��ng m�n Thanh Hi�u S� Th�i v�a c� m�t l�nh giao nhi�m v� m�i cho ng��i! H�y mau thi h�nh!","T�n b� b� th� sao?","Ta s� gi�p ng��i ng�n c�n nh�ng t�n ��o t�c mu�n c��p m�t t�ch!","Tu�n l�nh!")
   elseif (Uworld125 == 30) and (HaveItem(389) == 1) then
   	Talk(6,"Uworld125_change","R�t cu�c ng��i c�ng �� ��n?","Sao?","V�a nh�n ���c b� c�u ��a th� c�a ch��ng m�n, g�i ng��i l�p t�c quay v� Nga Mi","L�i c� vi�c g� �?","Trong th� kh�ng n�i r�, nh�ng theo l�i c�a Ch��ng m�n, th� vi�c n�y r�t c�n k�p!","Ta l�p t�c �i ngay!")
   elseif (Uworld125 == 10) then
   	Talk(2,"","Th� n�o? Kh�ng t�m ���c Thi�n Th� h�?","Xin ��ng t�c gi�n! �� t� nh�t ��nh s� t�m ���c!")
   elseif (Uworld125 == 20) and (HaveItem(388) == 0) then
   	Talk(1,"","Thi�n Th� ph�i giao v� cho ch��ng m�n Thanh Hi�u s� th�i Nga Mi, kh�ng ph�i giao cho l�o l� xong vi�c")
		AddEventItem(388)
		Msg2Player("�o�t ���c V� T� Thi�n Th� c�a Nga Mi ")
   elseif (Uworld125 == 30) then
   	Talk(1,"","Ng��i kh�ng c� Nga mi l�nh ti�n,l�m sao ch�ng minh ng��i �� giao cho ch��ng m�n?")
   elseif (Uworld125 >= 50) then
   	Talk (1,"","Ti�u t�, giang h� hi�m �c, c�n ph�i b�o tr�ng th�n m�nh. ")
   else
		Talk(1,"","Ti�u H�n H�n �� th�t l� m�t con ng�a l�m h�i c� ��n, kh�ng tr�m g� b�t ch�, th� �c hi�p n� nhi, g�y phi�n ph�c cho m�i ng��i, g� ch� g�c�ng kh�ng y�n, c�ng kh�ng c� ng��i qu�n.")
	end
end

function Uworld125_task()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Xem d�ng ng��i nhu nh��c y�u �u�i, kh�ng ch�u n�i gi� s��ng! Ta ch� n�i ��a th�i, ng��i n�n luy�n v� c�ng, sau �� r�i h�y n�i. ")
	else
		Say("Sau khi xong vi�c, ta s� h�u t�! Ra giang h� c�n ph�i c� l� ph�.",2,"���c, �� t� s� �i m�t chuy�n ��n Thanh Th�nh. /Uworld125_yes","K� h�n n�y c�n c� vi�c, e r�ng kh� m� tu�n m�nh ���c. /Uworld125_no")
	end
end

function Uworld125_yes()
	SetTask(125,10)
	Msg2Player("Tu�n l�nh Ti�u b� b� �i thanh Th�nh t�m b� ki�p ")
	AddNote("Tu�n l�nh Ti�u b� b� �i thanh Th�nh t�m b� ki�p ")
end

function Uworld125_no()
end

function Uworld125_fire()
	SetTask(125,20)
	Earn(10000)
	Msg2Player("Ti�u b� b� ��p t� b�n 10000 l��ng b�c, ��ng th�i nh� b�n h�y �em Thi�n Th� ��n t�ng cho Nga Mi. ")
	AddNote("Thay Ti�u b� b� t�ng Thi�n Th� cho Nga Mi ")
end

function Uworld125_change()
	SetTask(125,40)
	DelItem(389)
	Msg2Player("Nh�n ���c chim b� c�u ��a th� c�a Thanh Hi�u s� th�i, tr� l�n Nga Mi ")
	AddNote("Nh�n ���c chim b� c�u ��a th� c�a Thanh Hi�u s� th�i, tr� l�n Nga Mi ")
end
