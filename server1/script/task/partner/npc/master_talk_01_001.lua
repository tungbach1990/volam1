
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - ����֮�� - ����ʦ̫
-- Edited by peres
-- 2005/09/09 PM 11:19

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

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main_01.lua");

function main()

	-- ͬ����������
	if taskProcess_001_02:doTaskEntity()~=0 then return end;
	if taskProcess_001_02_06:doTaskEntity()~=0 then return end;
	if taskProcess_001_02_08:doTaskEntity()~=0 then return end;

	-- ͬ����������ƪ
	if rewindProcess_001_02:doTaskEntity()~=0 then return end;
	if rewindProcess_001_02_06:doTaskEntity()~=0 then return end;
	if rewindProcess_001_02_08:doTaskEntity()~=0 then return end;
	
	SelectDescribe({"<npc>�����ӷ����ؽ����ߺ�Ȼ���֣�ϣ�����汣����ǧ����ɽ�����һ���ƽٰ���",
				"�����Ի�/OnTaskExit"
				});

end;