--description: ������ػ����ĳϡ�����50������
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 50*256) and (GetLevel() >= 50) then
			Say("G�n ��y trong Th�y tr�i c� l�i ��n l� ��ng ��nh H� xu�t hi�n <color=Red>Th�y Qu�i<color>, gi�t ch�t r�t nhi�u ng� d�n, khi�n cho l�ng ng��i lo s�, ng��ic� b�ng l�ng �i �i�u tra th� kh�ng? ", 2, "��ng �!/L50_get_yes", "Xin h�y ph�i ng��i kh�c /L50_get_no")
		elseif (UTask_tw == 50*256+20) and (HaveItem(95) == 1) then
			L50_prise()
		elseif (UTask_tw > 50*256) and (UTask_tw < 60*256) then					--�Ѿ��ӵ�50��������δ���
			Talk(1,"","C� v�i ng��i nh�n th�y <color=Red>Th�y Qu�i<color>th��ng xu�t hi�n � <color=Red>ph�a ��ng<color>. Ph�a ��ng c� m�t <color=Red>S�n ��ng th�ng qua ��y ��ng ��nh h�<color>. Ta nghi l� trong ��ng c� C� qu�i!")
		else					--�Ѿ����50��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","Thi�n h� ng�y nay r�t h�n ��n, nh�ng � tr�i �� ph� h� b�n bang ")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk("M�t ng�y l�m huynh �� th� su�t ��i l� huynh ��, ng��i n�n b�o tr�ng ")
	else
		Talk(1,"","Ta m�y ng�y nay th��ng nh�n th�y ng� s�c xu�t hi�n tr�n m�t h�! Kh�ng bi�t ��y l� �i�m l�nh hay d�!")
	end
end;

function L50_get_yes()
	Talk(1,"","C� v�i ng��i nh�n th�y <color=Red>Th�y Qu�i<color>th��ng xu�t hi�n � <color=Red>ph�a ��ng<color>. Ph�a ��ng c� m�t <color=Red>S�n ��ng th�ng qua ��y ��ng ��nh h�<color>. Ta nghi l� trong ��ng c� C� qu�i!")
	SetTask(3, 50*256+20)
	AddNote("��n ph�a ��ng Hi�u l�nh ��i g�p Ph�c Th�nh, nh�n<color=Red> nhi�m v� thu� qu�i<color>, �i xu�ng ��y ��ng ��nh H� xem h� th�c th� n�o. ")
	Msg2Player("��n ph�a ��ng Hi�u l�nh ��i g�p Ph�c Th�nh, nh�n nhi�m v� thu� qu�, �i xu�ng ��y ��ng ��nh H� xem h� th�c th� n�o ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","Ng� S�c th�ch n�y kh�ng ch� c� th� an ��nh l�ng ng��i m� c�n mang h�nh ph�c cho b�n bang. Th�t l� tr�imu�n gi�p ta!")
	DelItem(95)
	SetTask(3, 60*256)
	SetRank(48)
--	AddMagic(42)
	add_tw(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ho�n th�nh nhi�m v� th�y qu�i, tr� th�nh H� ��o T��ng qu�n, h�c ���c v� c�ng Kim Chung Tr�o. ")
	AddNote("Tr� l�i Thi�n V��ng Bang, giao Ng� s�c th�ch cho Ph�c Th�nh ho�n th�nh nhi�m v�, tr� th�nh H� ��o t��ng qu�n. ")
end;
