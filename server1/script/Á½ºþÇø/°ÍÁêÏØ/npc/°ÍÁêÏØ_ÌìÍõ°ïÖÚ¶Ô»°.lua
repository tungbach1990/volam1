--������ ������ ��������Ի� ����С��������������
--suyu
-- Update: Dan_Deng(2003-08-10)
-- Update: Dan_Deng(2003-08-21) ��������ͱ��ŵ��ӻ�����
-- Update��Dan_Deng(2003-09-05) �������������������

Include("\\script\\global\\���ɽ�������\\������������.lua")

function main(sel)
	UTask_world18 = GetTask(46);
	if(UTask_world18 == 1) and (HaveItem(180) == 0) then
		Talk(1,"","T� b� ho�n? D� nhi�n l� �� c�u ng��i! T�ng ng��i 1 vi�n")
		AddEventItem(180)
--		SetTask(46, 2)				-- Ϊ������������ֻ�����߲��ӱ���ֵ
		Msg2Player("B�n nh�n ���c m�t vi�n T� B� ho�n. ")
		AddNote("T�m g�p �� t� Thi�n V��ng, l�y ���c m�t vi�n T� B� ho�n. ")
	else
		default_talk()
	end
end;
