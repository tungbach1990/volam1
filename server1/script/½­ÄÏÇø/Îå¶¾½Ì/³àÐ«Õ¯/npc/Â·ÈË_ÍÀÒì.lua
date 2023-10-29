-- �嶾 ·��NPC ��Ыկ������ 30������
-- by��Dan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 30*256+10) then		-- ���������
			if (HaveItem(87) == 1) then
				Talk(2,"L30_step1","Ng�c th�t! M�c H��ng ��nh n�y l� gi�!","Kh�ng sao! C�ng kh�ng tr�ch ���c ng��i! Ng��i ch�a t�ng th�y qua M�c H��ng ��nh. M�c H��ng ��nh th�t s� s� ph�t ra �nh s�ng xanh lam. C�n th� n�y l�i ph�t ra �nh s�ng v�ng")
			else
				Talk(1,"","�� ta t� tay �i b�t ph�n ��. Ta mu�n b�t h�n mang v�o trong Ng� ��c ��ng, cho ��c tr�ng c�n ch�t h�n ")
			end
		elseif (UTask_wu == 30*256+20) then		-- �������
			if (HaveItem(221) == 1) then
				DelItem(221)
				L30_prise()
			else
				Talk(1,"","Nh� ��y! M�c H��ng ��nh th�t s� s� ph�t ra �nh s�ng xanh lam. ")
			end
		elseif ((UTask_wu == 30*256) and (GetLevel() >= 30)) then		--30������
			Talk(4,"L30_get","Gi�o quy c�a b�n gi�o, ph�n �� ph�i ch�t. V�y m� v�n c�n nh�ng k� cu�ng v�ng ","L� n�o v�n c�n nh�ng k� mu�n t� �i t�m ch� ch�t �?","Kh�ng ng� k� th�n t�n nh�t m� ta tin t��ng l�i d�m ��nh c�p b�u v�t luy�n c�ng M�c H��ng ��nh c�a ta. H�n �� ch�y l�n V� di s�n! H�! H�n t��ng l� c� th� tho�t kh�i Th� T�m Ch��ng c�a ta �? ","�� Tr�i Ch� d� ��nh s� x� tr� h�n th� n�o?")
		else							-- ����Ի�
			Talk(1,"","Kh�ng ph�i l� ta kh�ng tin t��ng �� t�, nh�ng m� c�i b�n n�y c� r�nh ta c� m�n n�o l� l� tr�m. M�n b�o b�i n�y ta �� c�c kh� l�m m�i c� ���c n� ")
		end
	else
		Talk(1,"","Ta b�nh sinh r�t h�n nh�ng k� b�i t�n b�i ngh�a")
	end
end;

function L30_get()
	Say("B�y gi� ta cho ng��i m�t c� h�i l�p c�ng, h�y �i ��n V� di s�n �� b�t b�n ph�n �� ��, l�y l�i M�c ��nh H��ng. Ng��i c� ��ng � �i kh�ng? ",2,"Xin ph�ng m�nh c�a �� tr�i ch�. /L30_get_yes","Thu�c h� c�ng l�c c�n y�u, ch� s� kh�ng ho�n th�nh ���c nhi�m v�. /L30_get_no")
end;

function L30_get_yes()
	Talk(1, "", "���c! N�u ng��i c� th� �o�t l�i M�c H��ng ��nh, ta s� th�ng ng��i l�: H�c �m Di�m La ")
	SetTask(10,30*256+10)
	AddNote("L�i l�n V� Di s�n �� l�y l�i M�c H��ng ��nh ")
	Msg2Player("L�i l�n V� Di s�n �� l�y l�i M�c H��ng ��nh ")
end;

function L30_get_no()
end;

function L30_step1()
	Talk(1,"","D�! Thu�c h� l�n n�y nh�t ��nh s� �em ���c M�c H��ng ��nh th�t v� ")
	SetTask(10,30*256+20)
	DelItem(87)
	AddNote("L�i l�n V� Di s�n �� l�y l�i M�c H��ng ��nh th�t ")
	Msg2Player("L�i l�n V� Di s�n �� l�y l�i M�c H��ng ��nh th�t ")
end;

function L30_prise()
	Talk(2,"","M�c H��ng ��nh! T�t! T�t! Ta s� th��ng ph�t ph�n minh. L�n n�y ng��i l�p ��i c�ng. B�t ��u th� h�m nay, ng��i s� ���c th�ng l�: H�c �m Di�m La ","�a t� �� tr�i ch�!")
	SetTask(10,40*256)
	SetRank(52)
--	AddMagic(68)
--	AddMagic(384)
--	AddMagic(64)
--	AddMagic(69)
	add_wu(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng l� H�c �m Di�m La. H�c ���c v� c�ng: U Minh Kh� L�u, B�ch ��c Xuy�n T�m, B�ng Lam Huy�n Tinh, V� H�nh ��c ")
	AddNote("�o�t ���c M�c H��ng ��nh v� cho �� D�, ���c th�ng l� H�c �m Di�m La ")
end;
