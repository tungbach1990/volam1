-- AEXP - Auto Experience
FRAME2TIME 		= 18;	--18֡��Ϸʱ���൱��1����
AEXP_FREQ		= 10;	-- 10����
AEXP_UPDATETIME		= AEXP_FREQ * 60 * FRAME2TIME; --300��(5����)����һ�ξ���ֵ
AEXP_MISSIONID		= 9;
AEXP_TIMERID		= 19;
AEXP_TASKID			= 136;
AEXP_OLTIME_TASKID	= 140; -- ��¼�뿪��ʱ������ʱ����������

AEXP_NEEDLEVEL		= 50;  		-- �һ��ȼ�����

AEXP_HOUR_MAX		= 24;		-- ����ͬʱʹ��24Сʱ

AEXP_TIME_ONE		= 60;		-- һ���ķ�����(����һСʱ)
AEXP_TIME_UPDATE	= AEXP_TIME_ONE * AEXP_FREQ / 60;  -- ÿ����һ�����۵ķ�����(���ݵ���ʱ����)
AEXP_TIME_MAX		= AEXP_TIME_ONE * AEXP_HOUR_MAX;  -- ����ͬʱʹ��24Сʱ

AEXP_TICKET			= 1800; -- �����һ�������Ʊ����

AEXP_STAT_FREQ		= 1 * AEXP_TIME_ONE / AEXP_FREQ;	-- ͳ��Ƶ��(ÿһСʱͳ��һ��)

-- ��Ѽӱ�����һ�ʱ��
AEXP_FREEDATE_BEGIN 	= 20040813 	-- ��������
AEXP_FREEDATE_END 		= 20040830 	-- �������������Ϊֹ
AEXP_SVRUPDATE_TIME		= 9 		-- ����������ʱ��
AEXP_FREEDATE_EXPFACTOR	= 1;	   	-- ������ǿ����

-- �Ƿ����˫����
function AEXP_IsFreeTimeDoubleExp()
--	return 1; -- ������ѣ������շ�
--	nCurDate = tonumber(date("%Y%m%d"));
--	nHour = tonumber(date("%H"))
--	if (nCurDate >= AEXP_FREEDATE_BEGIN and nCurDate <= AEXP_FREEDATE_END) then-- ���˫��������
--		if (nCurDate == AEXP_FREEDATE_END and nHour >= AEXP_SVRUPDATE_TIME) then -- �ѵ����һ��֮��ĸ���ʱ��
--			return 0;
--		end

--		return 1;
--	end
	return 0;
end;
