--description: �������커��·��Զ ������40������
--author: yuanlan	
--date: 2003/4/26
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-25), �����ط���������
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 40*256) and (GetLevel() >= 40) then
			Talk(2, "L40_get", "L� l�o h� ph�p, nh�n v� m�t c�a ng��i d��ng nh� c� chuy�n g� bu�n r�u?", "�� t� ta Ng� C��ng Th�ch m�i v�a r�i � b�n h� kh�ng c�n th�n �� b� r�n X�ch Luy�n c�n, b�y gi� t�nh m�ng nh� ng�n c�n treo s�i t�c. Ch�t ��c �� lang ��n l�c ph� ng� t�ng r�i, kh�ng th� l�m g� ���c. Nghe n�i <color=Red>Ng� Th�n Y<color> � <color=Red>Ba L�ng huy�n<color> c� th� c�u ���c! Ng��i....")
		elseif (UTask_tw == 40*256+50) and (HaveItem(93) == 1) and (HaveItem(94) == 1) then
			L40_prise()
		elseif (UTask_tw > 40*256+20) and (UTask_tw < 50*256) then					--�Ѿ��ӵ�40��������δ���
			Talk(1,"","Xin ���c thu�c gi�i r�i �?")
		elseif (UTask_tw >= 50*256) then					--�Ѿ����40��������δ��ʦ
			Talk(1,"","Ng��i kh�ng nh�ng gi�i v� c�ng m� t�m t�nh l�i c�n r�t t�t! Ta th�ch ng��i��!")
		else										--��δ��40������
			Talk(1,"","��ng l� Tr��ng Giang s�ng sau x� s�ng tr��c, nh�ng l�o gia nh� ch�ng ta kh�ng ph�c c�ng kh�ng ���c!")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Th�i th� t�o anh h�ng, ng�y nay anh h�ng�� t� t�, ng��i t�i c� nhi�u, mong ng��i sau nay c� th� l�m ���c m�t vi�c g� �� kinh thi�n ��ng ��a, �� vang danh thi�n h� ")
	else
		Talk(1,"","B�n bang Nam kh�ng Tri�u T�ng, B�c ch�ng Kim binh. D��ng bang ch� th�n l� n� nhi m� l�i l�nh ��o bang ch�ng ta c� ���c m�t c� �� l�n nh� h�m nay qu� th�t l� kh�ng ��n gi�n!")
	end
end;

function L40_get()
	Say("Ng��i c� th� ��n Ba L�ng huy�n t�m <color=Red>Ng� Th�n y<color> xin thu�c gi�i kh�ng?", 2, "Thu�c h� ��ng � /L40_get_yes", "Thu�c h� c� vi�c kh�c /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","T�t l�m! Mau �i mau v�!")
	SetTask(3, 40*256+20)
	SetTask(14,0)
	AddNote("T�i Thi�n V��ng ��i �i�n g�p L� V�n Vi�n ti�p nh�n <color=red>nhi�m v� �i t�m thu�c gi�i<color>, �i ��n Ba L�ng huy�n t�m Ng� Th�n y xin thu�c. ")
	Msg2Player("T�i Thi�n V��ng ��i �i�n g�p L� V�n Vi�n ti�p nh�n nhi�m v� �i t�m thu�c gi�i, �i ��n Ba L�ng huy�n t�m Ng� Th�n y xin thu�c. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","T�t qu�! C� nh�ng d��c li�u n�y th� Ng� C��ng s� ���c c�u! Th�t kh�ng bi�t ph�i c�m �n ng��i th� n�o ��y?!")
	DelItem(93)
	DelItem(94)
	SetRank(47)
	SetTask(3, 50*256)
--	AddMagic(40)
	add_tw(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Mang hai v� thu�c giao cho L� V�n Vi�n, ho�n th�nh nhi�m v�, ���c phong l�m Thu� ��o th�ng l�nh. H�c ���c: �o�n H�n Th�ch ")
	AddNote("Quay v� ��i �i�n Thi�n V��ng mang hai v� thu�c giao cho L� V�n Vi�n, ho�n th�nh nhi�m v�. ���c phong l�: Thu� ��o th�ng l�nh ")
end;
