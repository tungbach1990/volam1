PREPARE_MAP = 961 --׼������ͼ
GAME_MAP = 958 --��������ͼ
MAXGAMETIME = 3 --ÿ�����μӳ���

----------------------����
MAXPLAYERCOUNT = 10 --ÿ�����������10�ˣ��ܹ�12��������
GAMECOUNT = 12 --ÿ����12�ŵ�ͼ,GAMECOUNT = 1 
ALL_MAXPLAYERCOUNT = 120 --ÿ�����120�ˣ�ÿ�ο������������кܶೡ
ALLPLAYERCOUNT = 360 --ÿ����һ���������360����Ҳμ�
LEASTPLAYERCOUNT = 6 --ÿ����������������
--------------------

-------------------------����
PREPARETIME = 5 --׼��ʱ�䣬��λ����
GAMETIME = 10 --����ʱ�䣬��λ����
-------------------------

MINLEVEL = 125   --��ҵȼ����ƣ�����125����ת�����Ƶȼ�
PREPAREPOSENDLINE = 15 --"\\settings\\maps\\chrismas\\player.txt"����׼�������͵�Ľ�����
GAMEPOSLINECOUNT = 7 --"\\settings\\maps\\chrismas\\player.txt"�����������������͵������
TSK_LEAVERMAPID = 2323	--�洢�뿪�������mapid
TSK_LEAVERPOSX = 2324	--�洢�뿪�������x�����
TSK_LEAVERPOSY = 2325	--�洢�뿪�������y�����

TSK_DAYKEY = 2326	--��¼����һ��
TSK_PLAYTIMES = 2327 --��¼һ������Ĵ���

TSK_COUNT_ONETIME = 2328	--��¼һ�����˶��ٸ�
TSK_RANK = 2329		--��¼һ����������

TSK_GROUPID = 2330	--��¼��ҵ�Group��

TSK_IS_AWARD = 2331 --��¼�Ƿ��Ѿ��콱
TSK_IS_AWARD_DAYKEY = 2332 --��¼��������콱

POSPATH = "\\settings\\maps\\chrismas\\player.txt"

function ResetTaskA(TSK_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		SetTask(TSK_DATE_A, nCurDate)
		SetTask(TSK_A, 0)
	end
end

function AddTaskA(TSK_A, TSK_DATE_A, nAddValue)
	ResetTaskA(TSK_A, TSK_DATE_A)
	local nValue = GetTask(TSK_A)
	return SetTask(TSK_A, nValue + nAddValue)	
end

function GetTaskA(TSK_A, TSK_DATE_A)
	ResetTaskA(TSK_A, TSK_DATE_A)
	return GetTask(TSK_A)
end

function setentermapstate()
		ForbitSkill(1)

		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1)
		--����ս��״̬
		SetFightState(0)
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(1)
		--�������ͷ�
		SetPunish(0)
		--�ر���ӹ���
		SetCreateTeam(0)
		
		--��ֹ�⻷
		ForbitAura(1)
		--���ó�ɱ
		ForbidEnmity(1)
		--��ֹpk
		SetPKFlag(0)
		--��ֹ����
		DisabledStall(1)
		ForbitTrade(0)
		--��ֹ�ı�PK״̬
		ForbidChangePK(1)
		--��ֹʹ�ûس�
		DisabledUseTownP(1)
end

function setleavemapstate()
		ForbitSkill(0)

		SetTaskTemp(200,0)
		SetFightState(0)
		SetPunish(1)
		SetCreateTeam(1)
		
		ForbitAura(0)
		ForbidEnmity(0)
		SetPKFlag(0)
		DisabledStall(0)
		ForbitTrade(0)
		
		ForbidChangePK(0)
		DisabledUseTownP(0)
end

function getplayermapid(nPlayerIndex)
	local _, _, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	return nMapId
end

