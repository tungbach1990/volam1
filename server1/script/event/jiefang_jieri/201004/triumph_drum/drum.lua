-- ������
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\drum_npc.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\global\\judgeoffline_limit.lua");
IncludeLib("TONG");

function main(nItemIndex)
	return tbTriumphDrum:OnUse(nItemIndex);
end

-- ʹ��
function tbTriumphDrum:OnUse(nItemIndex)
	
	-- �����
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		Msg2Player("Tr�ng kh�i ho�n b� h� b�i v� l�u gi� qu� l�u");
		return 0;
	end
	
	-- �ȼ�����
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"��ng c�p c�a c�c h� kh�ng ��!",  "���c r�i./Cancel",});
		return 1;
	end 
	
	-- û�а��
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		CreateTaskSay({"C�c h� v�n ch�a gia nh�p bang h�i!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- û��ְλ
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		CreateTaskSay({"��i hi�p kh�ng ph�i l� bang ch� ho�c l� tr��ng l�o!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- ս��״̬
	if GetFightState() == 1 then
		CreateTaskSay({"Xin h�y s� d�ng t�i khu v�c phi chi�n ��u!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- ��������
	if offlineCheckPermitRegion() ~= 1 then
		CreateTaskSay({"Xin h�y s� d�ng t�i khu v�c �t ng��i!",  "���c r�i./Cancel",});
		return 1;
	end	
	
	-- ��ʹ��ʱ��
	local nTime = tonumber(GetLocalDate("%H%M"));
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		CreateTaskSay({"Xinh h�y s� d�ng trong th�i gian ho�t ��ng!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- �������ʹ�ù�
	local nTask_LastUseDay = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay);
	local nTask_BeUsed = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	
	if nCurDay ~= nTask_LastUseDay then 
		nTask_LastUseDay = nCurDay;
		nTask_BeUsed = 0;
	end
	
	if nTask_BeUsed >= self.nLimit_DayUse then
		CreateTaskSay({"V��t qu� gi�i h�n s� d�ng cho ph�p",  "���c r�i./Cancel",});
		return 1;		
	end
	
	nTask_BeUsed = nTask_BeUsed + 1;
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay, nTask_LastUseDay);
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed, nTask_BeUsed);
	
	-- ���ֹ�
	tbDrumNpc:New(szTongName, nTongId);
	return 0;
end
