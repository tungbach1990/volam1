--˫���������Ϊ�ű�

tbPlayer = {}

function tbPlayer:OnEnterMap()
	
	--print("tbPlayer:OnEnterMap")
	
	Msg2Player("Ng��i �� v�o b�n �� Chi�n Long ��ng")
	local nProtectTime = 4*18--4�뱣��
	SetProtectTime(nProtectTime)
	AddSkillState(963, 1, 0, nProtectTime)
	SetLogoutRV(1)--���ߴ�������ͼ
	--DisabledStall(1)	--��̯
	SetFightState(1)--ս��״̬
	SetPKFlag(1)--ս��ģʽ
	ForbidChangePK(1)--��ֹ��ս��ģʽ
	DisabledUseTownP(0)	--����ʹ�ûسǣ����ֹ��ս��ģʽ��ͻ������ʹ�ûسǷ���������״
end

function tbPlayer:OnLeaveMap()
	
	--print("tbPlayer:OnLeaveMap")
	
	Msg2Player("Ng��I �� r�i kh�i Chi�n Long ��ng")
	--SetLogoutRV(0)--���߸�������ͬһ���㣬���ﲻ�ܸĳ�0���������߻������ŵ�ͼ
	--DisabledStall(0)	--��̯
	SetFightState(0)--��ս��״̬
	ForbidChangePK(0)--���Ը�ս��ģʽ
	SetPKFlag(0)
end

