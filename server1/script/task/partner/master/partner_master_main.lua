
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - �������ļ�
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

-- ͬ��ϵͳ��ͷ�ļ�
IncludeLib("PARTNER");

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main_01.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_02.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_04.lua");
Include ("\\script\\task\\partner\\master\\partner_master_main_05.lua");

-- ������Ի�����ѡ��
taskProcess_000 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
	
		local strMain = {
			"<npc>�ν���ս���ɹ�������������֮�ص��Ĺ����ܵ���ǰ��δ�е�Σ�����Ŵ������ΰ�ͨ��������ı����������ٻ����Ĺ������ڷ����Ҵ������������������ı�Ե����������ǲһƷ����ʿ������ԭ��Ѱ��һ��ʧ���ѾõĶ�����������ʲô�������ö�֪����������ȴ���������˳�������ҳ���һЩ������������������ɽ��׷��ڸ�ս���ϰ�����͢���������Ŀǰ��ʵ�����ֶ�ȱ��ϣ�����ܰ�æ���������顣��Щ����ֱ��о��������������������Ӧ��������󣬽��ÿ�죬ÿλͬ�鶼����ѡ����������ɵľ������������һ�Σ��һ������в����ģ����صĲ��������Ҵ���Σ��֮�У�ϣ����ǧ�����һ�ѣ�",
			"����֮��/#taskProcess_001:doTaskEntity()",
			"������֮��/#taskProcess_002_01:doTaskEntity()",
			"�鱦����/#taskProcess_003_Main:doTaskEntity()",
			"������ʿ/#taskProcess_004_Main:doTaskEntity()",
			"�Ҷ�����ӣ���Щ������/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	
	end,

});

