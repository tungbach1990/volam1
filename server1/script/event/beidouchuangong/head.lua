-- �ļ�������head.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-25 16:39:37
TSK_BeiDouChuanGong_EXP				= 1967	-- ����������� ֵС����ʱʹ��
TSK_BeiDouChuanGong_EXP_EX			= 2303	-- ��չ������� ��λ����
TSK_BeiDouChuanGong_NIANYUE			= 1966	-- ��ͨ�浤���ϴ�ʹ��ʱ��
TSK_BeiDouChuanGong_USEDTIME_ZIJIN	= 2667	-- �Ͻ��浤���ϴ�ʹ��ʱ��
TSK_BeiDouChuanGong_USEDTIME_HUANG	= 2668	-- ���浤���ϴ�ʹ��ʱ��
TSKV_BeiDouChuanGong_UseLimit	=  60 * 60 * 24 * 60 --��λ�룬60��

-- ��ȡ���������ĵ�ǰ����ֵ
function GetBeiDouChuanGongExp()
	return GetTask(TSK_BeiDouChuanGong_EXP_EX)*1e8 + GetTask(TSK_BeiDouChuanGong_EXP);
end

-- ���ñ��������ĵ�ǰ����ֵ
function SetBeiDouChuanGongExp(nExp)
	SetTask(TSK_BeiDouChuanGong_EXP,	mod(nExp, 1e8));
	SetTask(TSK_BeiDouChuanGong_EXP_EX,	nExp / 1e8);
end