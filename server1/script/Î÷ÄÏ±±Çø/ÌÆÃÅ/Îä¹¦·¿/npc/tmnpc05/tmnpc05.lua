--description: �����ƺ� 10������ 
--author: yuanlan	
--date: 2003/3/10
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
	if (Uworld51 == 40) then		-- ϴ��ԩ�����������
		Talk(6,"Uworld51_50","Chuy�n ng��i mu�n gi�p Nh�t Tr�n ta �� bi�t r�i.","T�i sao ���ng C�u m�n ch� l�i c� th�nh ki�n v�i Nh�t Tr�n c�ng t� v�y? T�t x�u g� c�ng l� con ru�t c�a m�nh?","Nh�t Tr�n nhi�u l�n mu�n thay ��i gia quy, l�m cho M�n ch� kh�ng vui, l�i th�m B�t Nhi�m mu�n tranh quy�n, hay n�i x�u Nh�t Tr�n tr��c m�t M�n ch�.","Th�t ra chuy�n Cao t�ng Thi�u L�m g�p n�n l�n n�y theo ta ngh� c� li�n quan v�i Kim qu�c. Kim qu�c lu�n xem ph�i Thi�u L�m l� c�i gai trong m�t. M�y ng�y tr��c ta nh�n ���c th�ng b�o n�i Thi�n Nh�n gi�o b� m�t th�u t�m c�c b� c�p tuy�t h�c m�n ph�i � Trung Nguy�n.","C� chuy�n n�y �? V�y Thi�n Nh�n gi�o l� ��i t��ng b� nghi ng� nhi�u nh�t?","��ng v�y! Ta ph�i � ��y, vi�c d� la tin t�c giao cho ng��i.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 10*256+80) and (HaveItem(36) == 1) then		--10���������
			L10_prise()
		elseif (UTask_tm == 10*256) and (GetLevel() >= 10) then				--10����������
--			DelItem(36)							--��ֹ�ؽ��������Ҽ����������
			Say("T�i qua khi �� t� B�n t�a ��n <color=Red>Th�nh �� Ph�<color> h�nh s�, �� k� tr�m l�y m�t �m kh� ��c m�n <color=Red>Ma V� ch�m<color>, chuy�n n�y khi�n Ch��ng m�n n�i tr�n l�i ��nh, ai gi�p B�n toa l�y l�i Ma V� ch�m s� ���c tr�ng th��ng! ", 2, "T�m gi�p /L10_get_yes", "Ta kh�ng quan t�m!/L10_get_no")
		elseif (UTask_tm > 10*256) and (UTask_tm < 20*256) then					--�Ѿ��ӵ�10��������δ���
			Talk(1,"","<color=Red>Ma V� ch�m<color> b� m�t � <color=Red>Th�nh �� Ph�<color>, ng��i c� th� v�o th�nh �m th�m �i�u tra. ��ng r�i! Ng��i v�n ch�a th�y qua <color=Red>Ma V� ch�m<color> ph�i kh�ng? To�n th�n n� c� m�u �en, gi�ng nh� c�y kim c�a con mu�i.")
		elseif (UTask_tm >= 20*256) then					--�Ѿ����10��������δ��ʦ
			Talk(1,"","Ng��i qu� l� c� b�n l�nh, c� th� gi�p ���ng M�n t�m l�i Ma V� ch�m, ch� c�n ng��i c� g�ng t��ng lai nh�t ��nh s� r�ng m�.")
		else
			Talk(1,"","Hai v� c�ng t� B�n m�n b�t h�a, m�c d� kh�ng n�i ra nh�ng vi�c n�y kh�ng x� l� t�t nh�t ��nh s� c� h�u ho�n. Kh�ng bi�t M�n ch� c� d� t�nh g�?")
		end
	else								--��ͨ�Ի�
		Talk(1,"","�m kh� B�n m�n vang danh giang h�, lu�n v� v� c�ng c�ng kh�ng thua k�m ph�i kh�c.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>Ma V� ch�m<color> b� m�t � <color=Red>Th�nh �� Ph�<color>, ng��i c� th� v�o th�nh �m th�m �i�u tra. ��ng r�i! Ng��i v�n ch�a th�y qua <color=Red>Ma V� ch�m<color> ph�i kh�ng? To�n th�n n� c� m�u �en, gi�ng nh� c�y kim c�a con mu�i.")
	SetTask(2, 10*256+20)
	AddNote("G�p ���ng H�c � V� C�ng ph�ng, nh�n nhi�m v� <color=Red>�i Th�nh �� t�m Ma V� Ch�m.<color> ")
	Msg2Player("Nh�n nhi�m v� Ma V� Ch�m, �i Th�nh �� t�m Ma V� Ch�m. ")
end;

function refuse()
	Talk(1,"","�m kh� B�n m�n b� m�t, l�m sao n�i kh�ng li�n quan ��n ng��i?")
end;

function L10_prise()
	Talk(1,"","Ng��i qu� nhi�n c� b�n l�nh, c� th� gi�p B�n m�n t�m l�i Ma V� ch�m. ���c! B�n t�a s� d�y ng��i v�i chi�u, nh�n k� ��y! ")
	DelItem(36)
	SetRank(26)
	SetTask(2, 20*256)
--	AddMagic(43)
--	AddMagic(347)
	add_tm(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("Tr� v� V� C�ng ph�ng, giao Ma V� Ch�m cho ���ng H�c, ho�n th�nh nhi�m v�, th�ng l�m Tr�ng �inh. ")
	Msg2Player("Giao Ma V� Ch�m t�m ���c cho ���ng H�c, ho�n th�nh nhi�m v� Ma V� Ch�m, th�ng l� ���ng M�n Tr�ng �inh. H�c ���c ���ng M�n �m kh�, ��a Di�m H�a. ")
end;

----------------------- �������� --------------------------
function Uworld51_50()
	SetTask(51,50)
	Msg2Player("���ng H�c suy �o�n l� vi�c n�y c� li�n quan v�i Thi�n Nh�n Gi�o, nh� b�n �i d� la tin t�c. ")
end
