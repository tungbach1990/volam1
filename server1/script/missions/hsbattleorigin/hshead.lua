--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 2
CS_RevData = 72;

--�뿪������Ϸ���λ��worldid, x, y,һ����Ǳ�����
--CS_LeavePos = {20, 3546, 6226};

--�᳡���λ��
CS_OuterPos = {209, 1568, 3278};

--����˫����Ӫʱ��λ��
CS_CampPos0 = {209, 1631, 3203};   	--��ɫ
CS_CampPos1 = {209, 1608, 3167}; 	--��ɫ
CS_CampPos2 = {209, 1674, 3246}; 	--��ɫ
CS_CampPos4 = {212, 1577, 3288};    --��ɫ


--��Ϸ���������
MAX_MEMBER_COUNT = 100;

MS_CAMP1 = 1; --˫������Ӫ��
MS_CAMP2 = 2;

MS_SIGN_MONEY = 10000; --������
MS_WIN_MONEY = 6000; -- ÿ��ʤ��ʱ����õ�����

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;
