
--������������ͽ���һ��
--TSK_ �������ǰ׺ TASK
--TSKG_ ���������ǰ׺ TASK GROUP
--Ϊ�����������ͻ��ʹ���ļ�·����shendan0811_ǰ׺ \shengdan_jieri\200811\

local nACT_VERSION = 20081205 --�ֲ�����������������ͻ���ⲿ�ļ����ɶ�

shengdan0811_TSK_Version		= 1909;
shengdan0811_TSK_BingJing		= 1863;
shengdan0811_TSK_GetExp			= 1864;
shengdan0811_TSK_YuPei			= 1866;

------------�� ����Ϊ��boss��С������������id
shengdan0811_TSK_GetNewBossAwardState = 1911  --�õ�(��boss�ģ��������
shengdan0811_TSK_UseCakeState = 1912  --ʹ��ѩ����������
shengdan0811_TSK_UseCakeExp = 1913 --ʹ��ѩ�������״̬
-------------�� ����Ϊ��boss��С������������id


function shengdan0811_ResetTask()
	--ֻ�ڻ����ǰ��Ҫ�ѱ������ã��������»��֮��ͻ
	--��Ϊ�˱��ն�Ϊ2��1�գ�Ӧ���ǻһ���¼���������ʹ�õȵ��������һ��
	if tonumber(GetLocalDate("%Y%m%d")) <= 20090201 then
		if (GetTask(shengdan0811_TSK_Version) ~= %nACT_VERSION) then
			SetTask(shengdan0811_TSK_Version, %nACT_VERSION);
			SetTask(shengdan0811_TSK_BingJing, 150000);
			SetTask(shengdan0811_TSK_GetExp, 0);
			SetTask(shengdan0811_TSK_YuPei, 0);
			
			SetTask(shengdan0811_TSK_GetNewBossAwardState, 0);
			SetTask(shengdan0811_TSK_UseCakeState, 0);
			SetTask(shengdan0811_TSK_UseCakeExp, 0);
		end
	end
end
