
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ������񴥷���ڽű�
-- Edited by peres
-- 2005/09/01 PM 16:40

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

-- ��������ϵͳͷ�ļ��������������
Include("\\script\\task\\system\\task_main.lua");


-- ��ĸ��ͷ�ļ�
Include("\\script\\item\\ib\\zimudai.lua");


function main()
	local szRegion = GetProductRegion();

	if (szRegion == "vn") then	--Խ��û���������
		do return end
	end;

	if (szRegion == "cn_ib") then
		-- IB ��ĸ����ʱ�����Ч��
		zmd_check_expire_timer();
		do return end
	end	
	
	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local nResult = 0;

	local nRandomMax = 8;  -- ��������ʵ�������ֵ

	-- û��ͬ��ĸ����޷���������
	if partnerindex==0 or partnerstate==0 then
		return
	end;
	

	if (szRegion == "cn") then
		-- �����xx�����Ӵ�һ���ĸ���
		--if isEventDay()==1 then nRandomMax = 4; end;
	end
	
	-- ����������������� 1/8 �ļ��ʴ����������
	if random(1,nRandomMax)==1 then
	
		nResult = initRandomTask();
		
		if nResult==0 then
			CDebug:MessageOut("T�y theo nhi�m v� b�n s� ch�n s� ID t��ng �ng!");
		end;
		
	end;

	return 0;

end;

-- ��ȡÿ���������Ĵ���ʱ�䣬ÿ 12 ���Ӵ���
function GetRandomTimer()
	return 720;
end;
