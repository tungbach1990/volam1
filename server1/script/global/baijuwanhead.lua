--baijuwanhead.lua
--���峣��

AEXP_SMALL_TIME_TASKID		= 1801;							-- ��¼ С�׾ԣ��Դ�Ϊ�����ģ� ����һ�ʣ��ʱ��
AEXP_TASKID 				= 605;							-- ��¼ ��׾ԣ�С�׾Ե�1.5����ʣ��һ�ʱ���������
AEXP_SPECIAL_TIME_TASKID	= 2317;							-- ��¼ ��Ч��׾ԣ�С�׾Ե�2��Ч��������һ�ʣ��ʱ��
AEXP_TIANXING_TIME_TASKID	= 2655;							-- ��¼ ���ǰ׾��裨С�׾Ե�5����ʣ��һ�ʱ���������

AEXP_SMALL_SKILL_TASKID 	= 1802							-- ��¼ ����С�׾ԣ��Դ�Ϊ�����ģ� ���ܹһ�ʣ��ʱ��
AEXP_SKILL_TIME_TASKID		= 2315;							-- ��¼ ���ܴ�׾ԣ�����С�׾Ե�1.5��Ч����ʣ��Ҽ���ʱ���������
AEXP_SPECIAL_SKILL_TASKID	= 2318;							-- ��¼ ��Ч���ܴ�׾ԣ�����С�׾Ե�2��Ч�������ܹһ�ʣ��ʱ��

AEXP_SKILL_ID_TASKID		= 2316;							-- ��¼���߹Ҽ��������ļ���ID�������

AEXP_FREQ					= 5;							-- �۳�ʱÿ��ѭ���۳�ʱ�䣬����ÿ5��������һ��
FRAME2TIME					= 18;							-- ��ʱ��ת��Ϊ������18���൱����Ϸ��1����
AEXP_MAXTIME				= 10000 * 3600 * FRAME2TIME;	-- �û������ۻ������ʱ��
AEXP_BIGCHANGE				= 8 * 3600 * FRAME2TIME;	    -- һ����׾������ӵ�ʱ��	8Сʱ
AEXP_SMALLCHANGE 			= AEXP_BIGCHANGE	    		-- һ���׾������ӵ�ʱ��
AEXP_SKILLCHANGE			= AEXP_BIGCHANGE				-- һ�����ܴ�׾������ӵ�ʱ��
AEXP_SPECIALCHANGE			= AEXP_BIGCHANGE				-- һ����Ч�׾������ӵ�ʱ��
AEXP_SPECIALSKILLCHANGE 	= AEXP_BIGCHANGE				-- һ����Ч���ܴ�׾������ӵ�ʱ��

AEXP_INTERVAL		= 5 * 60 * FRAME2TIME;		    -- ���Ӿ��������
--��׾������ϸ��Ϣ
AEXP_BIG_NGENTYPE 	= 6;
AEXP_BIG_DETAILTYPE	= 1;
AEXP_BIG_PARTYPE 	= 130;
--�׾������ϸ��Ϣ
AEXP_SMALL_NGENTYPE 	= 6;
AEXP_SMALL_DETAILTYPE	= 1;
AEXP_SMALL_PARTYPE		= 74;
--�Ӿ���ĵȼ�����
AEXP_NEEDLEVEL					= 50;
AEXP_NEEDLEVEL_PARTNER	= 10;	--ͬ�����й�ʱ��þ������͵ȼ�
AEXP_OFFLINE_PLAYERCOUNT_LIMIT	= 600;				-- ��һ̨��������������������Ŀ���������������̨�������ڽ��������й�
AEXP_OFFLINE_PLAYERCOUNT_SPECIAL = 750;				--ר���йܷ����������йܵ�����
AEXP_INVALIDTIMEBEGIN 			= 18;		        --���߹һ���Ч����ʼʱ��
AEXP_INVALIDTIMEEND 			= 24;		        --���߹һ���Ч����ֹʱ��

AEXP_TEMPOFFLINETASKID 			= 170;				--ʹ�ð׾���ʱ���������

AEXP_120SKILL_UPGRADE_EXP = 137500;					--120��������������Ϊ��ֵ

--���߹Ҽ��ܸ����ܼ����Ӧ����������������
ARY_UPGRADE_SKILL_EXP_PERCENT = {	0.0775,	0.0388,	0.0258,	0.0194,	0.0155,	0.013,	0.0111,	0.0097,	0.0086,	0.0039,
									0.0035,	0.0032,	0.0030,	0.0028,	0.0026,	0.0024,	0.0023,	0.0022,	0.0020	};
--���߹Ҽ��ܿ������ļ���ID
ARY_UPGRADE_SKILL = { 318, 319, 321, 322, 323, 325, 339, 302, 342, 353, 355, 328, 380, 336, 337, 357, 359, 362, 361, 368, 365, 375, 372, 709, 708, 710, 711, 712, 713, 714, 715, 716, 717 };

		--��Ӧ����			1   0    2    3    4    5    6    7    8    9
ARY_120SKILLID = { 708, 709, 710, 711, 712, 713, 714, 715, 716, 717 };
-- 150������
ARY_UPGRADE_SKILL_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}

--Include("\\script\\missions\\boss\\makeboss_head.lua")
IncludeLib("SETTING")

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\item\\ib\\zimudai.lua");
end

--��ѯʣ��ʱ��
function get_left_time()
	--�׾���
	local nSmallExpSpareTime = GetTask(AEXP_SMALL_TIME_TASKID);
	local nSmallExpSpareTime_Hours, nSamllExpSpareTime_Minutes = getFrame2MinAndSec(nSmallExpSpareTime);					--���û���ʾ��ʾ������
	
	--���ܰ׾���
	local nSamllSkillSpareTime = GetTask(AEXP_SMALL_SKILL_TASKID);
	local nSamllSkillSpareTime_Hours, nSamlllSkillSpareTime_Minutes = getFrame2MinAndSec(nSamllSkillSpareTime);	--���û���ʾ��ʾ������
	
	--��ͨ��׾���
	local nExpSpareTime = GetTask(AEXP_TASKID);
	local nExpSpareTime_Hours, nExpSpareTime_Minutes = getFrame2MinAndSec(nExpSpareTime);					--���û���ʾ��ʾ������
	
	--���ܴ�׾���
	local nSkillExpSpareTime = GetTask(AEXP_SKILL_TIME_TASKID);
	local nSkillExpSpareTime_Hours, nSkillExpSpareTime_Minutes = getFrame2MinAndSec(nSkillExpSpareTime);	--���û���ʾ��ʾ������
	
	--��Ч��׾���
	local nSpecialExpSpareTime = GetTask(AEXP_SPECIAL_TIME_TASKID);
	local nSpecialExpSpareTime_Hours, nSpecialExpSpareTime_Minutes = getFrame2MinAndSec(nSpecialExpSpareTime);
	
	--��Ч���ܴ�׾���
	local nSpecialSkillSpareTime = GetTask(AEXP_SPECIAL_SKILL_TASKID);
	local nSpecialSkillSpareTime_Hours, nSpecialSkillSpareTime_Minutes = getFrame2MinAndSec(nSpecialSkillSpareTime);
	
	-- ���ǰ׾���
	local nTianxingExpSpareTime = GetTask(AEXP_TIANXING_TIME_TASKID);
	local nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes = getFrame2MinAndSec(nTianxingExpSpareTime);
	

if (GetProductRegion() == "cn_ib") then
	--��̯
	local restStall = GetTask(AEXP_STALL_TIME_TASKID)
	local nStall_Hour, nStall_Min = getFrame2MinAndSec(restStall)

	--�����ɲ�¶
	local nXianCaoTime = GetTask(AEXP_XIANCAO_TIME_TASKID);
	local nXianCao_Hour, nXianCao_Min = getFrame2MinAndSec(nXianCaoTime);
end	

	local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
	local szSkillExpName = "";
	if (nSkillExpID ~= 0) then
		szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
	else
		szSkillExpName = "<color=blue>Ch�a ch�n k� n�ng<color>";
	end
	
	local szmsg = format("Th�i gian �y th�c r�i m�ng c�n: Thi�n tinh b�ch c�u ho�n <color=red>%d<color>ti�ng <color=red>%d<color> ph�t"..
	"<enter>��i B�ch C�u Ho�n ��c Bi�t<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>��i B�ch C�u Ho�n �y th�c<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>B�ch C�u Ho�n �y th�c<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>�� thu�n th�c k� n�ng(%s): �ai B�ch C�u Ho�n k� n�ng ��c hi�u<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>��i B�ch C�u Ho�n K� N�ng<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>Bach C�u Ho�n K� N�ng<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>Khi �y th�c n�u nh� c� hi�u qu� cu� Thi�n Tinh B�ch C�u Ho�n, �u ti�n hi�u qu� c�a lo�i B�ch c�u Ho�n n�y v� kinh nghi�m v� s� tr� �i th�i gian hi�u qu� t��ng �ng.",
	 				nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes,
					nSpecialExpSpareTime_Hours,nSpecialExpSpareTime_Minutes,
					nExpSpareTime_Hours,nSamllExpSpareTime_Minutes,
					nSmallExpSpareTime_Hours,nExpSpareTime_Minutes,
					szSkillExpName, nSpecialSkillSpareTime_Hours,nSpecialSkillSpareTime_Minutes,
					nSkillExpSpareTime_Hours,nSkillExpSpareTime_Minutes,
					nSamllSkillSpareTime_Hours,nSamlllSkillSpareTime_Minutes);
	
	Describe(szmsg, 1, "K�t th�c ��i tho�i/cancel");
end


--��������
function help()
	Talk(1,"help1","H��ng d�n �y th�c: B�n c� th� v�o K� Tr�n C�c �� mua B�ch C�u Ho�n (t�ng kinh nghi�m) v� B�ch C�u Ho�n k� n�ng (t�ng th�c luy�n k� n�ng).");
end
function help1()
	Talk(1,"help2","1 vi�n <color=blue>B�ch C�u Ho�n<color> c� th� �y th�c trong <color=red>8 gi�<color>. Th�i gian �y th�c c� th� c�ng d�n. B�n c�ng c� th� xem th�ng tin th�i gian c�a m�nh tr�n v�t ph�m c�ng nh� � giao di�n �y th�c.");
end

function help2()
	Talk(1,"help3","H�n ch� s� d�ng: B�n c� th� � c�c th�nh th�, th�n tr�n v� th�p ��i m�n ph�i, ch�n tho�t ra giao di�n (B�ng c�ch nh�n Esc hi�n ra ra giao di�n) trong �� ta ch�n r�i m�ng v�n t�ng kinh nghi�m, l�p t�c v�o tr�ng th�i r�i m�ng v�n t�ng kinh nghi�m.");
end
function help3()
	Talk(2,"help4", "Hi�u qu� s� d�ng B�ch C�u Ho�n: Sau khi b��c v�o tr�ng th�i �y th�c r�i m�ng, th�i gian �y th�c b�t ��u ���c t�nh. H� th�ng s� ghi nh� tr�ng th�i hi�n t�i c�a b�n (bao g�m tr�ng th�i ng�i b�n h�ng). Khi �y th�c, ng��i ch�i c�p <color=red>d��i 50<color> s� kh�ng nh�n ���c kinh nghi�m.","<color=red>Ng��i ch�i <color=red>c�p t� 50 tr� l�n<color>, c� m�i <color=red>5 ph�t<color> s� nh�n ���c �i�m kinh nghi�m t��ng �ng. � tr�ng th�i �y th�c r�i m�ng, c� th� s� d�ng c�c v�t ph�m t�ng kinh nghi�m kh�c (nh� Ti�n Th�o L�, b�nh B�t Tr�n Ph�c Nguy�t), th�i gian hi�u qu� c�a nh�ng v�t ph�m v�n b� gi�m �i. ��ng th�i, � tr�ng th�i �y th�c, th�i gian th�i ch�i c�a b�n v�n b� kh�u tr�.");
end
function help4()
	Talk(2,"help5", "Hi�u qu� s� d�ng B�ch C�u Ho�n k� n�ng: Sau khi b��c v�o tr�ng th�i �y th�c, th�i gian �y th�c s� b�t ��u ���c t�nh. H� th�ng s� ghi nh� tr�ng th�i hi�n t�i c�a b�n (bao g�m tr�ng th�i ng�i b�n h�ng). � tr�ng th�i �y th�c, m�c �� luy�n k� n�ng c�p 90 c�a b�n c� m�i 5 ph�t s� t� ��ng t�ng l�n 1 l�n.","Trong th�i gian n�y b�n v�n c� th� ch�n ch�c n�ng '�� thu�n th�c k� n�ng c�p 90'");
end
function help5()
	Talk(2,"", "Khi th�i gian r�i m�ng gi�m xu�ng <color=red>0<color>, th� b�n s� t� ��ng r�i m�ng. Trong l�c b�n v�o tr�ng th�i r�i m�ng v�n t�ng kinh nghi�m, n�u b� r�t m�ng ho�c Server b�o tr�, b�n s� t� ��ng r�i m�ng, ��ng th�i b�o l�u l�i th�i gian c�n l�i trong l�c r�i m�ng v�n t�ng kinh nghi�m, v� kh�ng c� k�t n�i l�i.","Khi b�n ��ng nh�p tr� ch�i s� t� ��ng k�t th�c tr�ng th�i r�i m�ng v�n t�ng kinh nghi�m, ��ng th�i b�o l�u l�i th�i gian c�n d� r�i m�ng v�n t�ng kinh nghi�m.");
end

-- ��ȡ��ҿ������߹Ҽ��������ļ���
function getexpskill()
	local aryExpSkill = {};
	local nExpSkillCount = 0;
	local nAllUpgradeSkillCount = getn(ARY_UPGRADE_SKILL);
	for i = 1, nAllUpgradeSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
			nExpSkillCount = nExpSkillCount + 1;
			aryExpSkill[nExpSkillCount] = {};
			aryExpSkill[nExpSkillCount][1] = nCurSkillID;
			aryExpSkill[nExpSkillCount][2] = GetSkillName(nCurSkillID);
		end
	end
	return aryExpSkill;
end

-- ѡ�������йܼ���
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "Xin l�a ch�n ch�c n�ng �y th�c:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr� l�i/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ���������йܼ���
function onSetUpgradeSkill(nUpgradeSkillID, funcCallBack)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	funcCallBack();
end

-- ���ݼ��ܼ����������Զ��������߹Ҽ��������ļ���ID
function autosetupgradeskill()
	local nSkillCount = getn(ARY_UPGRADE_SKILL);
	local nUpgradeSkillID = 0;
	local nUpgradeSkillLevel = 0;
	local nUpgradeSkillExp = 0;
	for i = 1, nSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		local nCurSkillExp = GetSkillExp(nCurSkillID);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT) and
			(nCurSkillLevel > nUpgradeSkillLevel or 
			(nCurSkillLevel == nUpgradeSkillLevel and nCurSkillExp > nUpgradeSkillExp))) then
			nUpgradeSkillID = nCurSkillID;
			nUpgradeSkillLevel = nCurSkillLevel;
			nUpgradeSkillExp = nCurSkillExp;
		end
	end
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
end

function getFrame2MinAndSec(nframe)
	local minutes = floor(nframe / (FRAME2TIME * 60));		--���û���ʾ��ʾ������
	local hours = floor(minutes / 60);
	local minutes = minutes - hours * 60; 
	return hours, minutes;
end;

--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end;

function cancel()
--do nothing
end;

function getBaiJutimeinfo()
										--��Ч��׾���	��ͨ��׾���	�׾���
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--��Ч���ܴ�׾���	���ܴ�׾���	���ܰ׾���
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local tbszItem = {"offlineitem_tianxing", "offlineitem_special",	"offlineitem_normal",	"offlineitem_small",
						"skillofflineitem_special",	"skillofflineitem_normal",	"skillofflineitem_small"};
	local szmsg = "";
	for i = 1, getn(tbAexpTask) do
		local nhour, nminite = getFrame2MinAndSec(GetTask(tbAexpTask[i]));	--���û���ʾ��ʾ������
		szmsg = format("%s\n          %s lasttime:%d hour %d minite", szmsg, tbszItem[i], nhour, nminite);
	end;
	return szmsg;
end;

function writeUseBaiJulog(szitem, nhour,nmin)
	local szlog = format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tuse<%s>, lasttime %d hour %d minite", 
		GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), szitem, nhour, nmin);
	WriteLog(szlog);
end;