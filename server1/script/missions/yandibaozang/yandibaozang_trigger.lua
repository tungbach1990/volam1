-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..


Include("\\script\\missions\\yandibaozang\\trigger_include.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")

function YDBZ_OnTrigger()
	-- DEBUG
	print("yandibaozang_tigger start...");
	-- TODO: �޸��������
	-- ����missions
	YDBZ_ready_close_missions(YDBZ_MAP_MAP,YDBZ_MISSION_MATCH, YDBZ_VARV_STATE);
	YDBZ_ready_close_missions(YDBZ_READY_MAP, YDBZ_READY_MISSION, YDBZ_READY_STATE);
	YDBZ_ready_missions(YDBZ_READY_MAP, YDBZ_READY_MISSION);
end

--OnTrigger();