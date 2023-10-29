-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - JxWeb��ͨʹ��
-- �ļ�������npc_jxweb.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-13 15:24:37

-- ======================================================
IncludeLib("ITEM");
Include("\\script\\event\\other\\jxweb_npc\\jxweb_head.lua");		-- ͷ�ļ�

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {};
	
	if (n_date >= JxWeb_Start_Date and n_date <= JxWeb_End_Date) then
		tb_Msg = {"<dec><npc>".."Hi�n �ang trong th�i gian di�n ra ho�t ��ng Open Beta c�a JX WebC�c v� ��i hi�p nhanh ch�n tham gia v�o th� gi�i c�a JX Web �� nh�n l�y nhi�u ph�n th��ng h�p d�n."};
		tinsert(tb_Msg, "Ho�t ��ng H� tr� t�n th�/jxweb_take_bag_1");
		tinsert(tb_Msg, "Ho�t ��ng �ua TOP ph�n vinh/jxweb_other_dec");
	else
		jxweb_other_dec()
		return 0;
	end
	
	tinsert(tb_Msg, "K�t th�c ��i tho�i/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end


function jxweb_take_bag_1()
	CreateTaskSay({"<dec><npc>".."Ho�t ��ng {{H� tr� t�n th�}}:di�n ra t� ng�y 01-05-2009 ��n 24:00 22-05-2009. Trong th�i gian ho�t ��ng, ng�y h�m tr��c ho�n th�nh 1 nhi�m v� thu th�p th� b�t ��u 10h-24h ng�y h�m sau ��i hi�p s� c� th� nh�n ���c {{Li�n T�m �an}}.", 
					format("Nh�n %s/jxweb_take_bag_2", "Li�n T�m ��n"), 
					"K�t th�c ��i tho�i/OnCancel"});
end

function jxweb_take_bag_2()
	local ext_pointid = 5;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C�c h� ch�a th� nh�n th��ng l�n n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 2) then
		Talk(1, "", "H�nh trang ph�i c� hai � tr�ng.");
		return
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,2023,1,1,0);
	ITEM_SetExpiredTime(nIdx, JxWeb_Item_Expire_Date);
	SyncItem(nIdx);
	SetItemBindState(nIdx, -2);
	
	local szMsg = format("Thu ���c 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	CreateTaskSay({"<dec><npc>"..szMsg, "�a t� huynh ".."/OnCancel"});
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end


function jxweb_other_dec()
	CreateTaskSay({"<dec><npc>".."Ho�t ��ng {{�ua Top �i�m ph�n vinh}}:di�n ra t� ng�y 01-05-2009 ��n 24:00 22-05-2009. 10 ng��i c� �i�m ph�n vinh cao nh�t s� c� th� nh�n ���c ph�n th��ng h�p d�n.", 
					"K�t th�c ��i tho�i/OnCancel"});
end
