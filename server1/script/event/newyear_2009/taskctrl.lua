
--������������ͽ���һ��
--TSK_ �������ǰ׺ TASK
--TSKG_ ���������ǰ׺ TASK GROUP
--Ϊ�����������ͻ��ʹ���ļ�·����shendan0811_ǰ׺ \shengdan_jieri\200811\

local nACT_VERSION = 20090116 --�ֲ�����������������ͻ���ⲿ�ļ����ɶ�

--------------����Ϊ���˺�������TASK����ID
newyear0901_TSK_Version			= 1760;		-- �汾��
newyear0901_TSK_GetExp_Hongbao	= 1761;		-- ʹ�÷��ƺ������ʢ�����õľ��飨��λΪ��
newyear0901_TSK_GetExp_Wuguo	= 1762;		-- ʹ������5����õľ��飨��λΪ��
newyear0901_TSK_GetExpUpLimit	= 1763;		-- ��õľ������ޣ���λΪ��
newyear0901_TSK_GetYanhuaDate	= 1764;		-- �����Ƿ��Ѿ���������̻�
newyear0901_TSK_GetExp_Yanhua	= 1765;		-- ʹ�������̻���õľ��飨��λΪ��
newyear0901_TSK_GetSpAwardDate	= 1766;		-- �Ƿ��Ѿ���ȡ�����յ��ر����������ݻ����

function newyear0901_ResetTask()
	--ֻ�ڻ����ǰ��Ҫ�ѱ������ã��������»��֮��ͻ
	--��Ϊ�˱��ն�Ϊ2��1�գ�Ӧ���ǻһ���¼���������ʹ�õȵ��������һ��
	if tonumber(GetLocalDate("%Y%m%d")) <= 20090224 then
		if (GetTask(newyear0901_TSK_Version) ~= %nACT_VERSION) then
			SetTask(newyear0901_TSK_Version, %nACT_VERSION);
			SetTask(newyear0901_TSK_GetExpUpLimit, 150000);
			SetTask(newyear0901_TSK_GetExp_Hongbao, 0);
			SetTask(newyear0901_TSK_GetExp_Wuguo, 0);
			SetTask(newyear0901_TSK_GetExp_Yanhua, 0);
		end
	end
end
