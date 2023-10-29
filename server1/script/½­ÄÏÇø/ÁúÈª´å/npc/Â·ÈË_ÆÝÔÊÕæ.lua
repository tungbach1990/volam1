-- ��Ȫ�塡·�ˡ�������
-- by��Dan_Deng(2003-09-16)
-- �嶾��90������
-- update by xiaoyang(2004\4\13)

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	Uworld124 = GetTask(124)
	Uworld37 = GetByte(GetTask(37),2)
	if(Uworld124 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld37 == 127) and (GetFaction() ~= "wudu") then
		Talk(6,"Uworld_wuget","T�i Long Tuy�n th�n, b�n g�p ���c Uy Du�n Ch�nph�t hi�n ra �i�n m�o c�a h�n r�t k� qu�i. Da tr�n m�t c�a h�n xanh x�m, nh�n nh�m l�i trong th�t g�m ghi�c. Nh�ng h�nh nh� v�n l� v� bi th��ng, c�ng kh� ","V� ��i ca n�y! Ph�i ch�ng �ang c� chuy�n kh�ng vui?","Kh�! Kh�! B�ng h�u h�y mau �i �i! Kh�! Kh�!","Ta nh�n th�y da m�t c�a ng��i t�i xanh, to�n th�n co r�m, ph�i ch�ng �� b� tr�ng ��c?","�� b� ng��i nh�n ra nh� v�y r�i th� ta c�ng kh�ng c�n g� ph�i gi�u. T�i h� b� tr�ng ��c �m d��ng Ti�u c�a �m Lang ��c d��c. B�y gi� c� 3 gi� th� l�i ph�t t�n m�t l�n, c��i ��n to�n th�n bi�n d�ng, nam n� b�t ph�n, h�nh d�ng qu�i th�, s�c v�t c�ng kh�ng d�m ��n g�n. C��i ��n khi th�n kh� kh�c l�i, s�ng kh�ng b�ng ch�t ","R�t cu�c l� ai �� d�ng th� k�ch ��c n�y �� h�i ng��i?")
	elseif(Uworld124 == 40) and (HaveItem(387) == 1) then
		Talk(5,"Uworld_wufinish","Uy Huynh thu�c gi�i � ��y, h�y mau u�ng �i!","Oa! �� tho�i m�i nhi�u! �a t� ��i hi�p c�u m�ng. Uy m� n�y l�m tr�u l�m ng�a c�ng kh� m� b�o ��p! ","Di�t tr� b�n �c,l� b�n ph�n c�a nh�ng ng��i h�nh t�u giang h�. Kh�ng c�n ph�i l�u t�m! ","Ng�y nay nh�n t�m th�c lo�n. Nh�ng ng��i hi�p ngh�a nh� huynh l�i c�ng hi�m th�y. Kh�ng gi�u g� huynh, ta ch�nh l� �� t� c�a Ng� ��c gi�o, ti�p tay cho b�n �c. Cu�i c�ng l�i b� t�n V�n L�o t�c bi�n ta th�nh m�t c�ng c� �� cho h�n th� ��c. Nh�n sinh b�ch kh� ta ��u �� n�m qua h�t ","Ng��i t�t h�i t�m v�n ch�a mu�n, mong ng��i sao n�y s� d�ng l�ng t� bi m� ��i nh�n s� th� ","��i hi�p y�n t�m! Tr�i qua chuy�n n�y, ta nh�t ��nh s� kh�ng �c t�m h�i ng��i n�a ")
	elseif(Uworld124 > 10) and (Uworld124 < 40) then
		Talk(1,"","Kh� kh� kh� kh�. ")
	else
		Talk(1,"","Ng��i c� nghe n�i ��n chuy�n b�c '��a �� s�n h� x� t�c' g� �� kh�ng? C� th�t l� c� b�c ��a �� �� kh�ng? N�u nh� c� ���c n� trong tay r�i th� vinh hoa ph� qu� h��ng c� m�y ��i c�ng kh�ng h�t ")
	end
end

function Uworld_wuget()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Kh� kh�!. xem c�i t��ng �i kh�ng c�n ���c gi� c�a ng��i, n�i ra chuy�n n�y c� h�u �ch g� ��u, hay l� th�i v�y. Kh� kh�... ")
	else
		Say("Ng� ��c gi�o, V�n B�t T�...",2,"Ng��i ��i ��y, ta s� d�y cho ng��i bi�t th� n�o l� ch�nh ��o /Uworld_wduok","V�n B�t T� c� ��i d�ng ��c, ta kh�ng mu�n g�y t�i h�n �� ch�t, ng��i t� gi� m�nh �� /Uworld_wduno")
	end
end

function Uworld_wduok()
	SetTask(124,10)
	Msg2Player("��p �ng Uy Du�n Ch�n, �i t�m V�n B�t T� �� l�y thu�c gi�i ��c �m D��ng Ti�u ")
	AddNote("��p �ng Uy Du�n Ch�n, �i t�m V�n B�t T� �� l�y thu�c gi�i ��c �m D��ng Ti�u ")
end

function Uworld_wduno()
end

function Uworld_wufinish()
	DelItem(387)
	if (GetTask(10) >= 70*256) and (GetTask(10) ~= 75*256) then				-- ���嶾��ʦ�ģ�����ѧ������
		Talk(2,"","� ��y c� m�t quy�n 'M�t d��c Kinh 'c�a Ng� ��c gi�o, xin t�ng cho ��i hi�p, xin ch� ch�i t� ","V�y th� ta c�ng kh�ng kh�ch s�o! Ta s� nghi�n c�u quy�n m�t kinh n�y, �� c� th� gi�i c�u cho thi�n h� ")
		if (HaveMagic(353) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(353,1)
		end
		if (HaveMagic(355) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(355,1)
		end
		if (HaveMagic(390) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(390)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Luy�n ���c k� n�ng: �m D��ng Th�c C�t, Huy�n �m Tr�m, �o�n C�n H� C�t ")
		SetTask(124,255)
	else
		SetTask(124,245)								--������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("�em ���c thu�c gi�i v� cho Uy Du�n Ch�n, ho�n th�nh nhi�m v�, danh v�ng c�a b�n t�ng th�m "..add_repute.."�i�m.")
   AddNote("�em ���c thu�c gi�i v� cho Uy Du�n Ch�n, ho�n th�nh nhi�m v� ")
end
