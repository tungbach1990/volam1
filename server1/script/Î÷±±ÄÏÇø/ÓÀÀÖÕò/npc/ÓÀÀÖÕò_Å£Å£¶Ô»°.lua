----description: ���ִ�_ţţ
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- �ȴ���Ⲣɾ�������ĺ�����������ֻ�����Ǯ

function main(sel)
	UTask_world37=GetTask(65)
	if (UTask_world37==2) then		--�Ѿ��ӵ�����
		Say("Ta mu�n l�m ��i hi�p, �i kh�p n�i h�nh hi�p tr��ng ngh�a, gi�p �� ng��i ngh�o kh�!",2,"Khuy�n can /reason", "�ng h� /help")
	elseif (UTask_world37==9) then		--ѡ��Ȱ˵
		Say("L�m ��i hi�p th�t kh�! Luy�n v� c�ng l�u qu�!",0)
	elseif (UTask_world37==10) then		--ѡ��֧��
		Say("Ta mu�n l�m ��i hi�p, �i kh�p n�i h�nh hi�p tr��ng ngh�a, gi�p �� ng��i ngh�o kh�!",0)	
	else
		Say("Nh�ng hi�p kh�ch trong s�ch th�t l� oai phong, n�u ���c gi�ng nh� h� th� hay qu�!",0)
	end
end;

function reason()		--ѡ��Ȱ˵ţţ
	Talk(3,"prise","Ng��i x�u r�t hung d�, �� c�n nh� nh� th�, v� c�ng c�ng luy�n kh�ng t�t th� l�m sao �i h�nh hi�p tr��ng ngh�a?","Ng��i n�i c�ng ��ng! ��i ta l�n l�n, luy�n th�m v� c�ng, s� �i h�nh hi�p tr��ng ngh�a!","��ng r�i! Luy�n t�t v� c�ng c� b�n, sau �� h�y �i ��nh ng��i x�u. ")
end;

function prise()
	Talk(1,"","V�y ta v� nh� ��y!C�m �n ��i hi�p! ��y c� ch�t thu�c tr� th��ng, xin nh�n cho!")
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	SetTask(65,9)
	AddRepute(6)		-- ������6��
	AddNote("T�m ���c Ng�u Ng�u, khuy�n h�n v� nh�, nhi�m v� ho�n th�nh. ")
	Msg2Player("Khuy�n gi�i Ng�u Ng�u v� nh�, nhi�m v� ho�n th�nh. ")
	Msg2Player("���c ba g�i Kim Th��ng d��c ")
	Msg2Player("Thanh th� giang h� c�a b�n ���c gia t�ng 6 �i�m. ")
end;

function help()			--ѡ�����ţţ
--	Say("��ң�СС��ͣ���ͦ��־����",3,"��һ������/arm","��һ������/money","��������/wait")
	Say("Tu�i c�n nh� nh�ng �� c� ch� l�n!",2,"T�ng m�t ch�t b�c /money","�� ta suy ngh� k� l�i xem/wait")		--���ܹ������������������䣬������ֻ��Ǯ
end

function arm()
	if x==0 then	--���û������
		Say("Ta hi�n t�i kh�ng c� v� kh�.",3,"T�ng m�t m�n v� kh� /arm","T�ng m�t ch�t b�c /money","�� ta suy ngh� k� l�i xem/wait")
	else 
		--������
		Talk(1,"","C�m �n ��i hi�p! Ng��i th�t l� t�t!")
		AddOwnExp(100)
		SetTask(65,10)
		AddNote("T�m ���c Ng�u Ng�u, cho �i m�t m�n v� kh�, �ng h� ��c m� l�m ��i hi�p c�a n�. ")
	end
end

function money()
	if (GetCash() < 100) then
--		Say("��ң���ѽ��������û��ʲôǮ��",3,"��һ������/arm","��һ������/money","��������/wait")
		Talk(1,"","Trong ng��i ta kh�ng c� mang ti�n, ��i ta quay l�i nh�!")		--���ܹ������������������䣬������ֻ��Ǯ
	else
		Pay(100)
		Talk(1,"","C�m �n ��i hi�p! Ng��i th�t l� t�t!")
		AddOwnExp(100)
		SetTask(65,11)
		AddRepute(4)
		AddNote("T�m ���c Ng�u Ng�u, cho �i m�t m�n v� kh�, �ng h� ��c m� l�m ��i hi�p c�a n�. Ho�n th�nh nhi�m v�. ")
		Msg2Player("T�m ���c Ng�u Ng�u, �ng h� ��c m� l�m ��i hi�p c�a n�, cho n� m�t �t b�c. Ho�n th�nh nhi�m v�. ")
		Msg2Player("Kinh nghi�m giang h� c�a b�n �� gia t�ng! ")
		Msg2Player("Thanh th� giang h� c�a b�n �� t�ng l�n 4 �i�m. ")
	end
end

function wait()
end
