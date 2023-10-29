-- ���� ·��NPC �޺����������� ���ֳ�ʦ����
-- by��Dan_Deng(2003-08-04)
-- update by xiaoyang(2004\4\15) ����90������

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	if allbrother_0801_CheckIsDialog(206) == 1 then
		allbrother_0801_FindNpcTaskDialog(206)
		return 0;
	end
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
--	if (UTask_sl == 70*256) and (Uworld122 == 245) then		-- ��������90����������������ɵģ�ֱ�Ӹ�����
--		Talk(1,"","���ѣ������ӷ�ʩ����ȻӢ�۳��ڣ����������־���һ���������ڼ���ϰ������Ҫ��Ϊ���£���Ҫ��Ϊ��ԭ���ֵĶ�����")
--		AddMagic("����̽צ")
--		AddMagic("��ɨǧ��")
--		AddMagic("����ն")
--		Msg2Player("ѧ�����ּ��ܽ���̽צ����ɨǧ��������ն")
--		SetTask(122,255)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if((UTask_sl == 60*256+10) and (HaveItem(217) == 1) and (HaveItem(215) == 1) and (HaveItem(216) == 1) and (HaveItem(214) == 1)) then		-- �������
			L60_prise()
		elseif((UTask_sl == 60*256) and (GetLevel() >= 50)) then		--��ʦ��������
			Say("Theo quy t�c b�n m�n, ph�m �� t� mu�n xu�t s� c�a b�n m�n ��u ph�i tr�i qua th� nghi�m 108 La H�n Tr�n, ng��i c� mu�n x�ng �i kh�ng?",2,"��ng � /L60_get_yes","Kh�ng mu�n luy�n /L60_get_no")
		else							-- ����Ի�
			Talk(1,"","Thi�u L�m th�n t�i Kim qu�c, h�n h��ng Nam tri�u. Ph��ng tr��ng s� huynh u u�t nh� v�y c�ng ��ng th�i!")
		end
	elseif (Uworld122 == 20) then
		Talk(4,"Uworld122_censure","Huy�n Nh�n ��i s�! �� t� Thi�u L�m �ang ��nh l�i ��i t�i Hoa S�n, nh� v�y s� l�m t�n h�i danh ti�ng c�a Thi�u L�m ��.","Ti�u t� n�o ��n ��y v�y? Chuy�n c�a Thi�u L�m kh�ng c�n ng��i xen v�o ��u. �i �i!","T�i h� ngang qua Hoa S�n th�y b�ng d�ng c�a cao th� Kim Qu�c, e r�ng qu� ph�i b� mai ph�c ��.","�� t� t�c gia c�a Thi�u L�m tr�i d�i kh�p Kim Qu�c, Qu�n Kim n�u c� ��ng th� tr��c kh�ng l� ta kh�ng bi�t sao? ��ng n�i nh�ng l�i s�m b�y n�a n�u kh�ng �i ta kh�ng kh�ch s�o ��u ��!")
   elseif (Uworld122 >= 30) and (Uworld122 < 60) then
   	Talk(1,"","C�n ��ng ��y n�a �! Mu�n ta ra tay h�?") 
   elseif (Uworld122 == 70) then
   	Talk(7,"U122_prise","��i s����","��","��i s�?","Th�i th�i! L� ta sai r�i! Huy�n Nan x�a nay kh�ng c�i ��u v�i ai! Nay xin nh�n l�i v�i ti�u huynh �� ��y!","Ai da! ��i s�! Ta kh�ng d�m nh�n ��u!","Sao l�i kh�ng? C�c h� �� c� c�ng c�u c�c �� t� trong l�c d�u s�i l�a b�ng, th�t c� �n t�i t�o.","��i s� d�m l�m d�m nh�n, ti�u t� ��y b�i ph�c.")
	else
		Talk(1,"","Ng��i bi�t th� n�o l� 'Thi�n Quy�n Quy Nh�t' kh�ng? �� l� ch� v� h�c Thi�u L�m b�t ��i tinh th�ng, l�y v� tu thi�n!")
	end
end;

function L60_get_yes()
	Talk(1,"","L�i v�o La H�n Tr�n n�m ph�a sau t��ng Ph�t, h�y v�o �� l�y: tr�ng h�t, thi�n tr��ng, M�c ng�, b�t nh� s� 4 t�n v�t n�y sau �� theo l�i v�o tr� ra. T� m�nh lo li�u nh�!")
	SetTask(7,60*256+10)
	AddNote("Nh�n nhi�m v� xu�t s� Thi�u L�m: V�o La H�n Tr�n t�m 4 m�n t�n v�t: Ni�m Ch�u, Thi�n tr��ng, M�c Ng�, B�t Vu. ")
	Msg2Player("Nh�n nhi�m v� xu�t s� Thi�u L�m: V�o La H�n Tr�n t�m 4 m�n t�n v�t: Ni�m Ch�u, Thi�n tr��ng, M�c Ng�, B�t Vu. ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(2,"","Ch�c m�ng ng��i �� x�ng qua ���c 108 La H�n Tr�n, ng��i c� th� xu�t s�, v� sau h�nh t�u giang h�, c�u t� gi�p ng��i, h�nh hi�p tr��ng ngh�a, kh�ng ���c c� v� sanh ki�u, nh� l�y ��!","�� t� xin ghi nh�!")
	DelItem(217)
	DelItem(215)
	DelItem(216)
	DelItem(214)
	SetRank(62)
	SetTask(7,70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Trong La H�n Tr�n t�m ���c 4 m�n t�n v�t giao cho Huy�n Nan, ho�n th�nh nhi�m v� xu�t s�. Th�ng ch�c V� L��ng Th�ch T�n, thu�n l�i xu�t s�. ")
	Msg2Player("Ch�c m�ng B�n xu�t s�! B�n �� ���c phong l�m V� L��ng Th�ch T�n ")
end;

function Uworld122_censure()
	SetTask(122,30)  --�����������Ϊ30
	Msg2Player("Huy�n Nan kh�ng ch� � ��n b�n, b�n ch� c� th� �i t�m Huy�n Bi. ")
	AddNote("Huy�n Nan kh�ng ch� � ��n b�n, b�n ch� c� th� �i t�m Huy�n Bi. ")
end

function U122_prise()
   if(GetTask(7) >= 70*256) and (GetTask(7) ~= 75*256) then			-- ���������ӻ��ʦ����
		Talk(2,"Huy�n Nan: Kim qu�c �ang ti�p t�c ��ng binh, v� l�m Trung Nguy�n s� l�i c� m�t phen kinh thi�n ��ng ��a. � ��y l�o t�ng c� m�t quy�n 'Thi�u L�m Tuy�t k�', t�ng cho ti�u h�u, hy v�ng ng��i ch�m ch� luy�n c�ng, kh�ng ch� tr� th�nh �� t� c�a b�n t� m� c� c� th� l� ","S� r�n d�y c�a ��i s�, ti�u t� sao kh�ng d�m tu�n theo!")
		if (HaveMagic(318) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(318,1)
		end
		if (HaveMagic(319) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(319,1)
		end
		if (HaveMagic(321) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(321,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H�c ���c k� n�ng Thi�u L�m: ��t Ma �� Giang, Ho�nh T�o Thi�n Qu�n, V� T��ng Tr�m. ")
		SetTask(122,255)
	else
	   SetTask(122,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("")
   Msg2Player("C�u Th��ng, L� hai ng��i, h�p gi�i c�ng thi�n t�ng, ho�n th�nh nhi�m v� Thi�u L�m. Danh v�ng c�a b�n t�ng th�m. "..add_repute.."�i�m.")
   AddNote("C�u xu�t Th��ng, L� hai ng��i, h�p gi�i c�ng thi�n t�ng, ho�n th�nh nhi�m v� Thi�u L�m. ")
end
