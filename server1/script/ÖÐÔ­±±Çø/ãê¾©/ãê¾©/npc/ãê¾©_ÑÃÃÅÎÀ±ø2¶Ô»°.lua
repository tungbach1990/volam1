--��ԭ���� �꾩�� ��������2�Ի�

--function main(sel)
--Say("��������������е��ϰ�����Ͷ����ǽ��˸��׳Ƴ����ѵ��������²��ɣ�", 0);
--end;

--ͨ��ϵͳר�������ű�(BlackBay.2003.12.30)

FESTIVAL06_NPCNAME = "<color=yellow>V� binh Nha m�n:<color>";
Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	--�������ָ����ϵͳѯ�ʵ�ǰPlayer��ͨ�����״̬��Ϣ
	--��ѯ�Ľ�������Ժ�ϵͳ�ص�������ָ���ĺ�����
	--AskRelayForKillerStatus("KillerCallBack")
	Say("L�o b� t�nh � trong th�nh n�y �� s�m ph�c t�ng ng��i Kim c�a ch�ng ta, l� n�o ng��i c�n mu�n l�m n�o lo�n?", 0);
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
		Say("Gan ng��i to th� �? T�i danh x�ng v�o C�ng ���ng v� Nha m�n ng��i g�nh n�i kh�ng v�y?", 4, "Thi�t l�p nhi�m v� truy n� /CreateTask", "Ti�p nh�n nhi�m v� truy n� /QueryTask", "Xem l�i nhi�m v� c�a m�nh /ModifyTask", "Kh�ng l�m g� c� /DoNothing")
	else
		Say("Gan ng��i to th� �? T�i danh x�ng v�o C�ng ���ng v� Nha m�n ng��i g�nh n�i kh�ng v�y?", 3, "Thi�t l�p nhi�m v� truy n� /CreateTask", "Ti�p nh�n nhi�m v� truy n� /QueryTask", "Kh�ng l�m g� c� /DoNothing")
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
	Say("L�o b� t�nh � trong th�nh n�y �� s�m ph�c t�ng ng��i Kim c�a ch�ng ta, l� n�o ng��i c�n mu�n l�m n�o lo�n?", 0)
end;