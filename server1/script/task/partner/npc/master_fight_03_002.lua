
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - �鱦���� - һƷ�ù���
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
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");

function OnDeath()
	DoTeamProcess(funDeath);
end;


function funDeath()
	-- ����ƪ
	if taskProcess_003_Kill_02:doTaskEntity(1)~=0 then return end;
	
	-- ����ƪ
	if rewindProcess_003_Kill_02:doTaskEntity(1)~=0 then return end;
end;