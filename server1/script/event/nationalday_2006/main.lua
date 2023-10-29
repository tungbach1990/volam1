
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 �����ڻNpc�Ի��ļ�
-- Edited by peres
-- 2006/09/26 PM 14:52

-- ����ͬ����Ц���������Ǵ�����֣�
-- ���Ŀ���Ҳû���κ���ζ��
-- ��˵�����ˡ�
-- ����˵������ɡ�
-- ����ȹ�Ӻ����£��ǳ�������һ��һ�����ϡ�
-- ̬�������Ե����裬�·����˻ص�����������ȥ��

-- ======================================================

-- �������ڻͷ�ļ�
Include("\\script\\event\\nationalday_2006\\head.lua");

-- ����Ի��ַ������ļ�
Include("\\script\\task\\system\\task_string.lua");

-- 2006 �����ڶԻ����
function nationalday_2006_main()

	local aryTalk = {
			"<dec><npc>�������֣��˽ܱ��������������¾�ͼǿ��������������λ��Ϊ�����˾��Ľ�����ǡ��ѽڣ�����������Ϊ��λ��ʿ��Ů���Ͻ��պ��񣬴�ҿ�����<color=yellow>10��01����10��03��<color>��ȡ�����ף�ϼҰ������������⣡",
			"��ȡÿ�յľ��齱��/getMoreExp_Confirm",
			"����������񴥷����ʷ�������Ϣ/getRandomTaskInfo",
			"���ڸ��ְ׾���Ч�÷�������Ϣ/getBaijuInfo",
			"�����Ի�/OnExit",
		};
	
	CreateTaskSay(aryTalk);
	
	return 1;

end;

function getDoubleExp()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNationalDay()==0 then
		Say("�����Ѿ����ǹ���ڵ�ǰ������Ŷ��", 0);
		return
	end;

	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("������Ѿ���ȡ����˫��������Ŷ��", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 �����ϵ���ÿ�������ȡһ�� 8 Сʱ����˫��
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("���õ���<color=green> 8 Сʱ��˫�����飡<color>");
		WriteTaskLog("�õ��� 8 Сʱ��˫�����飡");
		
	else
		Say("ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNationalDay()==0 then
		Say("�����Ѿ����ǹ���ڵ�ǰ������Ŷ��", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("���ι���ڻֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("ֻ�� 80 �����ϵ��˲�����ȡ����������Ŷ��", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("������Ѿ���ȡ����һ���������Ŷ��", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);

	Msg2Player("���õ���<color=green>�������һ����<color>");
	
	WriteTaskLog("�õ���һ��������ᣬ���Ϊ��"..nRandomTaskID);
	
end;


-- ѯ������Ƿ���ȡ����
function getMoreExp_Confirm()
	Say("����<color=yellow>2006��10��01����2006��10��03��<color>�ڼ䣬ÿ�����߶����ö����������͵Ĵ������顣<color=yellow>������֮��ÿ������һ��<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>����Ҫ������ȡ��",2,
		"�ð�����Ҫ��ȡ/getMoreExpMain",
		"�����ٵ�һ�°�/OnExit");
	return
end;


-- ��ȡÿ�յľ���
function getMoreExpMain()

local nExp = countMoreExpNum();

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNationalDay()==0 then
		Say("�����Ѿ����ǹ���ڵ�ǰ������Ŷ��", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("���ι���ڻֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- ����ֻ���� 5 ��
		else
			addPlayerExpForLimit(nExp, 0); -- ������
		end;
		
		Msg2Player("���õ���Ԫ����ľ��齱����<color=yellow>"..nExp.."<color> �㾭�飡");
		
		writeMoreExpData();  -- ��¼��ȡ������������
	
		WriteTaskLog("�õ�ÿ�յĽ������飺"..nExp);
		
	else
		Say("�����ڵ��������ܹ���ȡÿ�յľ��飬��10��01����10��03���ڼ䣬ÿ�����߶����ö����������͵Ĵ������顣<color=yellow>������֮��ÿ������һ��<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>Ŷ��", 0);
		return
	end;


end;


function getRandomTaskInfo()

	Say("���� <color=yellow>2006��10��01����2006��10��03��<color> �����������񴥷����ʷ����ĺ���", 0);
	return

end;


function getBaijuInfo()

	Say("���� <color=yellow>2006��10��01����2006��10��03��<color>��ʹ�ð׾���һ���õľ��顢���ܰ׾���һ���������Ƚ��� 1.5 ��������<color=yellow>����йܵľ��鲻�ڴ���<color>��", 0);
	return

end;