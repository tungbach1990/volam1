-- �ذϻ����Ի��ű�

Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include([[\script\global\yuenan_feiyunrenwu.lua]]);	--by liaozhishan 11/15/2006

function main()
	local tab_Content = {
		"Ta ��n l�m nhi�m v� ph� tuy�n/branch_liuyungu", "Nh�n ti�n gh� qua th�i/no"
	};
	if (v_fy_is_active() == 1) then
		tinsert(tab_Content, "Nh�n ph�n th��ng c�p 100/v_fy_100_entrance")
		Say("Ta c� th� gi�p g�?", getn(tab_Content), tab_Content);
		return
	end;	
	branch_liuyungu();
end