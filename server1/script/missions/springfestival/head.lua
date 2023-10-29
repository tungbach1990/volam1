if (not __FESTIVAL07_HEAD__) then
	__FESTIVAL07_HEAD__ = 1;
	
IncludeLib("BATTLE");
Include([[\script\lib\coordinate.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua") --
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\pay.lua")


--��ֵ����
--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>ʥ�����ˣ�<link>"	

CO_DATE_BEGIN = 20070209;
CO_DATE_END = 20070223;

CO_PREPAREMISSIONID = 30;
CO_MISSIONID = 31;
CO_MINIMUM = 5;

CO_FRAME = 18;	--ÿ��18֡
CO_REFRASHTIME = 15 * CO_FRAME; -- ÿ15����ˢһ�ι�
CO_VANISHTIME = 10 * CO_FRAME;	--ʥ������ͣ��3����
CO_RUNINTERVER = 30 * CO_FRAME; --30��һ�Σ����Թ�����Ϸ
CO_MAXPLAYTIMES = 5; --ÿ�����һ����5��
CO_LEVELLIMIT = 50; --��Ҳμ���Ҫ����С����

CO_PREPARETIME = 57; --׼������ʱ��
CO_FAIRY_SMALLTIMERID = 58;	--ˢ�ּ�ʱ��
CO_REPORT_SMALLTIMERID = 59;	--RunMission�õļ�ʱ����
CO_INTERVER = 5 * CO_FRAME;	--3���Ӵ���ˢ�ֺ�����ִ�����

--GLBֵ
GLB_CO_PHASE = 849; --���ڻ��ʱ��
--===============�͹����==================
CO_NPCID = 1256;	--ˢ���ֵ�NCP index
CO_MAPID = {584, 585};	--ʥ�����ͼId

CO_SMALLMAPCOUNT = 19;	--һ����12��С��ͼ
CO_MOUSECOUNT_MIN = 10;	--һ��С��ͼһ������ˢ������Ŀ
CO_MOUSECOUNT_MAX = 10;	--һ��С��ͼһ�����ˢ������Ŀ
CO_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
CO_NIANSHOU_XUANYUN = 10;   --����ÿ������10�ξͱ�ѣ��
CO_ALL_MAXPLAYERCOUNT = 100; --һ�����120�ˣ�
--=========================================

--=========�������===============
TK_CO_LEAVERMAPID = 1123;	--�洢�������mapid
TK_CO_LEAVERPOSX = 1124;	--�洢�뿪��Ϸ��x�����
TK_CO_LEAVERPOSY = 1125;	--�洢�뿪��Ϸ��y�����

TK_CO_DAYKEY = 1126;	--��¼����һ��
TK_CO_PLAYTIMES = 1127; --��¼һ������Ĵ���
TK_CO_TOTAL = 1794;		--��¼һ�����˶��ٴΣ�

TK_CO_COUNT_ONETIME = 1128;	--��¼һ�����˶��ٸ�

TK_CO_RANK = 1129;		--��¼һ����������

TK_CO_GROUPID = 1130;	--��¼��ҵ�Group��
TK_CO_EXP_BEISHU = 1131; -- ��þ���ı���
TK_CO_EXP_TIME = 1132;  -- ���˫����ʱ��
	
TK_CO_ATTACKED_TIMES = 1133;    --��¼���ޱ������Ĵ���
TK_CO_ATTACKED_INTERVER = 1134;     --��ͨ���ʹ�õ��߼��
--================================

--MS���֣�
MS_CO_STATE = 1;
MS_CO_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
MS_CO_NEWSVALUE = 3; --
MS_CO_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID
MS_CO_PREPARENEWSVALUE = 5; --׼������ʱ����
MS_CO_GAMECOUNT = 6;    --  ��¼һ����ʼ����Ϸ�ĸ���
--�������֣�
FESTIVAL_SHREWMOUSE = "springfestival07";
CO_ANIMALNAME = "�ng ba m��i";
CO_MOUSENAME = "Heo tr�ng"; --ʥ�����������
CO_GIFTNAME = "L� v�t �� l�i";       --����NPC������
CO_SIGNNPCNAME = "<color=yellow>Nha m�n sai d�ch<color>:";    --����ʥ�����˵�����
CO_MAPPOINTFLORDER = "springfestival2006";
FESTIVAL_OK = 1;    --����״̬�϶���ʾ
FESTIVAL_NO = 0;    --����״̬�񶨱�ʾ
FESTIVAL_ENTERSPEED = 16; --������Ϸ����ҵ��ٶ�
FESTIVAL_LEAVERSPEED = -1; --�뿪��Ϸ����ҵ��ٶ�

Include([[\script\missions\libfestival\head.lua]]);

--	�Ƿ��ڻʱ��
function sf06_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < CO_DATE_BEGIN or nDate > CO_DATE_END or gb_GetTask("shut_springfestival07", 1) == 1) then
		return 0
	end;
	return 1;
end;

--����һ������ڵ�ǰ��ҵ�ѡ��
function festival_make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--��������Ƿ�������Ϸ�У��ɹ�����PlayerIndex���򷵻�nil
function festival_check_pl(szPlayName)
	local nPlIdx = SearchPlayer(szPlayName)	--����Ƿ��ڵ�ǰ������
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(CO_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end
--�������Ƿ���Ա�ʹ��
function itemuseplacecheck(nType)   --nType :1�����������ߣ�2��������ר�õ��ߣ�3������ͨ���רҵ����
    local ww, xx, yy = GetWorldPos();
    if (CO_MAPID[2] ~= ww) then
	    Talk(1, "", "V�t ph�m n�y ch� d�ng trong ho�t ��ng ng�y Xu�n.");
        return 0;
    end;
    
    if (GetTask(TK_CO_GROUPID) <= CO_SMALLMAPCOUNT and 2 == nType) then
	    Talk(1, "", "Ch� c� ng��i ch�i '�ng ba m��i' m�i c� th� s� d�ng ��o c� n�y.");
        return 0;
    end;
    
    if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT and 3 == nType) then
	    Talk(1, "", "Ch� c� ng��i ch�i b�nh th��ng m�i s� d�ng ���c v�t ph�m n�y.");
        return 0;
    end;
    
    return 1
end;
--�ҵ�������Ӫ�����ޡ���>��ң���ҡ���>����
function festival_getgroupid(nGroupId)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > CO_SMALLMAPCOUNT) then
        return nGroupId - CO_SMALLMAPCOUNT;
    else
        return nGroupId + CO_SMALLMAPCOUNT;
    end;
end;

function festival_go_other_place()  --���������ʼ��
    local nBeginMapID = GetMissionV(MS_CO_BEGINGMAPID);
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
	local PosX, PosY = getadata(szFile);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_go_back(nBeginMapID)  --���������ʼ��
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];
	local PosX, PosY = getadatatow(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_checkinterver()
    local gametime = GetGameTime();
    if (GetTask(TK_CO_ATTACKED_INTERVER) > gametime) then
        return 0;
    else
        SetTask(TK_CO_ATTACKED_INTERVER, gametime + 2);
        return 1;
    end;
end;
end;
