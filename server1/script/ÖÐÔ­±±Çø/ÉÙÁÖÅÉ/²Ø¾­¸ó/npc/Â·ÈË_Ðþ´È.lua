-- ���� ·��NPC ���� 50������
-- by��Dan_Deng(2003-08-04)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if ((UTask_sl == 50*256+30) and (HaveItem(28) == 1)) then		-- 50�����������
			L50_prise()
		elseif ((UTask_sl == 50*256) and (GetLevel() >= 50)) then		--50����������
			Talk(2,"L50_get","D�ch C�t Kinh, 'D�ch C�n kinh' v� 'T�y T�y Kinh' ���c g�i l� 'Thi�u L�m Tam Kinh', t��ng truy�n do ��t Ma S� T� vi�t, ch�nh l� tinh t�y v� h�c c�a b�n ph�i.","N�m x�a Kim binh Nam h�, �� tr�nh B�o �i�n r�i v�o tay gi�c, trong l�c h�n lo�n, �� t� c�a b�n t�a l� Tr�ng Vi�n �� �em tam kinh �i gi�u trong khu r�ng t�ng ph�a sau t�. Trong cu�c chi�n, Tr�ng Vi�n do b�o v� T�ng Kinh c�c n�n �� t� th��ng. V� sau c�c t�ng ch�ng v�o r�ng t�ng ch� t�m ���c 'D�ch C�n Kinh' v� 'T�y T�y Kinh' c�n 'D�ch C�t Kinh' th� v�n ch�a t�m th�y.")
--		elseif (UTask_sl == 70*256+10) then			-- �ط������������
--			Say("���ȣ�ʮ��ɮñ���ռ�������",2,"�Ѿ�׼������/return_completed","���ٵ�һ��ʱ��/return_sele_no")
--		elseif (UTask_sl == 70) then			-- �ط���������
--			Talk(1,"return_sele","��ң�ʦ�����ҳ�ʦ�˻����Խ��Ĳؾ����е��鼮��")
		else							-- ����Ի�
			Talk(1,"","C� t�ch b�o �i�n c�a b�n t� r�t nhi�u, Kim qu�c nh�m ng� �� l�u.")
		end
	else
		Talk(1,"","T�ng Kinh C�c c�n l� ph�p ���ng, l� n�i c�c cao t�ng thuy�t kinh gi�ng ph�p, T�ng Kinh C�c c�a b�n t� c� r�t nhi�u kinh Ph�t, r�t nhi�u tuy�t b�n tr�n ph�m.")
	end
end;

function L50_get()
	Say("N�u 'D�ch C�t Kinh' th�t s� �� b� �� t� ta l�m m�t, th� th�t h� th�n v�i Ph�t T�!",2,"T�m gi�p /L50_get_yes","Ta kh�ng quan t�m!/L50_get_no")
end

function L50_get_yes()
	SetTask(7,50*256+10)
	AddNote("Nh�n nhi�m v� t�m kinh c�a Thi�u L�m: T�m l�i quy�n D�ch C�t Kinh ���c Tr�ng Vi�n gi�u. ")
	Msg2Player("Nh�n nhi�m v� t�m kinh c�a Thi�u L�m: T�m l�i quy�n D�ch C�t Kinh ���c Tr�ng Vi�n gi�u. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","��y ��ng l� 'D�ch C�t Kinh'! Hay qu�.....")
	SetTask(7,60*256)
	DelItem(28)
	SetRank(6)
--	AddMagic(271)
--	AddMagic(11)
--	AddMagic(19)
	add_sl(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("T�m ���c D�ch C�t Kinh, ho�n th�nh nhi�m v� t�m kinh. Th�ng c�p Ph�c ma Thi�n V��ng. ")
	Msg2Player("Ch�c m�ng b�n! B�n �� th�ng ch�c Ph�c ma Thi�n V��ng c�a Thi�u L�m ph�i! H�c ���c v� c�ng Long Tr�o H� Tr�o, Ho�nh Quy L�c H�p, Ma Ha V� L��ng. ")
end;
