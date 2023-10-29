--ѡ������
IL("LEAGUE")
Include("\\script\\event\\wulin_2nd\\data.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\common.lua")

CP_TASKID_TITLE = 1085
WULIN_TASK_LOGIN = 1570
--Const Value--
WULIN_LGTYPE_REGISTER = 7
WULIN_LGTYPE_ELECTOR = 8
WULIN_LGTYPE_ACCOUNT = 9
WULIN_FILE_MEMBERS_REGISTER = "relay_log\\wulin_2nd\\register.log"
WULIN_FILE_MEMBERS_ALL = "relay_log\\wulin_2nd\\wulin_finalmember.log"
WULIN_FILE_TONGMASTER = "relay_log\\wulin_2nd\\wulin_tongmaster.log"
WULIN_MAXMEMBER = 100		--ÿ���������100��ѡ��
WULIN_MAXLEADER = 8		--����������
WULIN_GB_NAME = "�ڶ������ִ��"
WULIN_MONEYBASE = 1000000
WULIN_TB_TIME = {
	register = {open = 03030000, close = 03162400},	--ȷ���ʸ�ʱ��
	elector = {open = 03100000, close = 03162400},		--��ѡʱ��
	leader = {open = 03162400, close = 03232400}		--Ʊѡ�����
}

--LG Value--ELECTOR		--��Ͷ�������Ϣ
WULIN_LGTASK_MONEY = 1	--Ͷע���
WULIN_LGTASK_RANK = 3	--��ǰ����
WULIN_LGTASK_DATE = 4	--Ͷע����
WULIN_LGTASK_TIME = 5	--Ͷעʱ��

--LG Value--REGISTER
WULIN_LGTASK_VOTEDCNT = 1
WULIN_LGTASK_CANVOTE = 2
WULIN_LGTASK_LEADER = 3
WULIN_LGTASK_DATE = 4	--Ͷע����
WULIN_LGTASK_TIME = 5	--Ͷעʱ��
WULIN_LGTASK_FACTION = 6	--����Number
WULIN_LGTASK_LEVEL = 7	--�ȼ�

--GB Value--
WULIN_GBTASK_SWITH = 1	--ִ�й��� 0δ��ʼ��1��ʼ��������Ͷ��2�����������Կ�ʼѡȡ��Ͷ�ɹ�ѡ�֣�3���ִ��ѡ��������ȷ�����Կ�ʼѡ���
WULIN_GBTASK_REGCNT = 2	--��ǰ��ѡ�ѱ�������

--�õ��Ի�Npc����
function wulin_npcname()
	return "���ִ���Ա"
end

--Describe�Ի�
function wlls_descript(str, ...)
	str = "<link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>"..wulin_npcname().."<link>\n����"..str
	if (type(arg[1]) == "table") then
		arg = arg[1]
	end
	if (getn(arg) <= 0) then
		Describe(str, 1, "�����Ի�/OnCancel")
	else
		Describe(str, getn(arg), arg)
	end
end

--���Ϊnil��0������1�����򷵻�0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--�������ID
function wl_GetZone()
	return WULIN_TB_ZONEID[GetGateWayClientID()]
end

function wl_GetMember()
	return WULIN_TB_ROLES[GetGateWayClientID()].n
end

function ascend(tb_lg1, tb_lg2)--jiang
	if (tb_lg1[2] == tb_lg2[2]) then
		if (tb_lg1[3] == nil) then
			return nil
		else
			return (tb_lg1[3] < tb_lg2[3])
		end
	else
		return (tb_lg1[2] > tb_lg2[2])
	end
end