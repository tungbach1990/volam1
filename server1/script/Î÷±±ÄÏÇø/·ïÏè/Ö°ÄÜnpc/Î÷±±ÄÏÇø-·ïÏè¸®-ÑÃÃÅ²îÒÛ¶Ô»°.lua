--�������� ���踮 ���Ų��۶Ի�
--function main(sel)
--Say("���Ų��ۣ������صأ�û�¶���Ҫ�����Ϲת�ƣ�", 0)
--end;

--ͨ��ϵͳר�������ű�(BlackBay.2003.12.30)
FESTIVAL06_NPCNAME = "<color=yellow>:<color>";

Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	--�������ָ����ϵͳѯ�ʵ�ǰPlayer��ͨ�����״̬��Ϣ
	--��ѯ�Ľ�������Ժ�ϵͳ�ص�������ָ���ĺ�����
	--AskRelayForKillerStatus("KillerCallBack")
	Say("�i! �i! �i! ��ng c� �i qua �i l�i n�i ��y! 뮩y l� tr�ng ��a", 0)
end;

--������������ǲ�ѯ����Ļص�����������������˳������ı�
function KillerCallBack(RewardMoney, RewardTaskID, CancelMoney, CancelTaskID, OwnCount, MyTaskCount)
	if (RewardMoney > 0) then
		--�����������֪ͨϵͳ����Ѿ���ȡ���ͽ�ע���һ������0��ʾ���ͽ𣬵ڶ���������ʾΪ�ĸ��������ͽ�
		GetTaskMoney(0, RewardTaskID)
		Earn(RewardMoney)
	elseif (CancelMoney > 0) then
		--�����������֪ͨϵͳ����Ѿ���ȡ���˻صı�Ľ�ע���һ������1��ʾ���˽𣬵ڶ���������ʾΪ�ĸ��������˽�
		GetTaskMoney(1, CancelTaskID)
		Earn(CancelMoney)
	elseif (OwnCount + MyTaskCount > 0) then
		Say("Ng��i �n gan h�m m�t g�u r�i h�? T�i l�m n�o ��ng nha m�n ng��i g�nh n�i kh�ng?", 4, "Thi�t l�p nhi�m v� truy n� /CreateTask", "Ti�p nh�n nhi�m v� truy n� /QueryTask", "Xem l�i nhi�m v� c�a m�nh /ModifyTask", "Kh�ng l�m g� c� /DoNothing")
	else
		Say("Ng��i �n gan h�m m�t g�u r�i h�? T�i l�m n�o ��ng nha m�n ng��i g�nh n�i kh�ng?", 3, "Thi�t l�p nhi�m v� truy n� /CreateTask", "Ti�p nh�n nhi�m v� truy n� /QueryTask", "Kh�ng l�m g� c� /DoNothing")
	end
end;

function CreateTask()
	--�����������֪ͨ�ͻ��˴򿪴�������Ľ���
	OpenCreateTask()
end;

function QueryTask()
	--���������������������ȡ�������͸���ҿͻ���
	OpenAllTask()
end;

function ModifyTask()
	--�������������������ȡ�������Լ��Ѵ����������͸���ҿͻ���
	OpenOwnTask()
end;

function DoNothing()
	Say("�i! �i! �i! ��ng c� �i qua �i l�i n�i ��y! 뮩y l� tr�ng ��a", 0)
end;