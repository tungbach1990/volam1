
--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 80;
CS_RevData = 36;

--�뿪������Ϸ���λ��worldid, x, y,һ����Ǳ�����
--CS_LeavePos = {20, 3546, 6226};

--�᳡���λ��
CS_OuterPos = {209, 1548, 3297};


--����˫����Ӫʱ��λ��
CS_CampPos0 = {209, 1631, 3203};   	--��ɫ
CS_CampPos1 = {209, 1608, 3167}; 	--��ɫ
CS_CampPos2 = {209, 1674, 3246}; 	--��ɫ


--��Ϸ��ÿһ��Ӫ���������
MAX_MEMBER_COUNT = 20;



MS_CAMP1 = 1; --˫������Ӫ��
MS_CAMP2 = 2;

MS_SIGN_MONEY = 5000; --������
MS_WIN_MONEY = 3000; -- ÿ��ʤ��ʱ����õ�����


function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;
