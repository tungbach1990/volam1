--��������
--1��������ڵ�Npc�Ի���ѡ�����ڼ���ս��
--2��������ϲ������������ս���ڣ���һ�ŵ�ͼ��������0��Ӫģʽ����
--3����������ߵ�Npc�Ի�������ѡ��������Ӫ��
--4�����Pk�������Զ����Գ����⣬���ڱ���ͼ��
--5�����������ʱ�����Զ���ͬ��ͼ��������ҹ�����ǰ��ս����
--6��������ԣ����Դ�Npc�Ի����˽⵱ǰ��������
--7���������԰��յȼ��ֳɸ�������
--��ս����Npc��ѡ����Ӫ��Npc
Include("\\script\\missions\\citywar_arena\\head.lua");
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

function main()
	--���÷��ص�
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);
	Say("Ng��i mu�n v�o ��u tr��ng khi�u chi�n �?", 9, "��u tr��ng 1 /EnterBattle", "��u tr��ng 2 /EnterBattle", "��u tr��ng 3 /EnterBattle", "��u tr��ng 4 /EnterBattle", "��u tr��ng 5 /EnterBattle", "��u tr��ng 6 /EnterBattle", "��u tr��ng 7 /EnterBattle", "��u tr��ng 8 /EnterBattle","Kh�ng �i n�a/OnCancel");
end;

function EnterBattle(nBattleId)
	SetFightState(0)
	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;

function OnHelp()
	Talk(8, "",	"L�i ��i bang h�i l� n�i h�c h�i v� ngh� gi�a c�c bang h�i tr�n giang h�! ��y s� l� n�i thi ��u c�ng b�ng",	"Mu�n tham gia L�i ��i bang h�i, tr��c h�t ph�i g�p ta �� xin ph�p! Ng��i xin ph�p ph�i l� bang ch� c�a bang h�i thi ��u!",	"Sau khi t� ��i, ��i tr��ng 2 b�n s� ��n b�o danh. Bang ch� hai b�n  m�i ng��i ph�i ��t c��c thi ��u 1000 v�n l��ng. ",	"Sau khi ��t c��c xong, xin ph�p thi ��u �� ho�n th�nh. Trong l�c c� 2 bang h�i kh�c �ang thi ��u, kh�ng cho ph�p b�o danh",	"Xin ph�p th�nh c�ng xong, th�nh vi�n c�a hai bang h�i c�10 ph�t gia nh�p ��u tr��ng. Sau �� thi ��u s� ch�nh th�c b�t ��u!" ,"Th�ng b�i ph� thu�c v�o �i�m t�ch l�y thi ��u c�a hai b�n. M�i th�nh vi�n bang h�i l�m tr�ng th��ng ��i ph��ng s� ���c 3 �i�m, ��i ph��ng b� tr� 1 �i�m", 	"K�t th�c thi ��u, bang h�i n�o t�ch l�y �i�m cao h�n s� gi�nh th�ng l�i!",	"Ngo�i ra, trong l�c thi ��u m�t b�n n�o kh�ng c�n th�nh vi�n n�o � l�i ��u tr��ng th� th�ng l�i s� thu�c v� b�n kia. ","Bang h�i chi�n th�ng c� th� thu h�i 1000 v�n l��ng �� ��ng, ngo�i ra c�n ���c 800 v�n l��ng ti�n th��ng v� 12.000 �i�m kinh nghi�m bang h�i. Bang h�i thua cu�c s� kh�ng l�y l�i ���c ti�n �� ��ng, m� c�n b� tr� 14.000 �i�m kinh nghi�m bang h�i");
end;

function OnCancel()

end;
