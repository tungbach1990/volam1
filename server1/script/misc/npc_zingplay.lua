-- ��ZingPlay��ý�Ʒ
-- ��ȡ����NPC������ZingPlayʹ��

Include("\\script\\task\\system\\task_string.lua");	-- �Ի�����ͷ�ļ�

-- COMMON ���� --
ZingPlay_Start_Date	= 20081018;		-- ���ʼʱ��
ZingPlay_End_Date	= 20081102;		-- ��ȡ����

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {"<dec><npc>T� 18-10-2008 ��n 31-10-2008, T�t c� nh�n s� v� l�m khi tham gia c�c tr� ch�i c�a ZingPlay, khi �� c�c y�u c�n thi�t (tham kh�o t�i trang ch� c�a ZingPlay) c� th� ��n g�p S� Gi� ZingPlay �� nh�n ph�n th��ng Bao L� X� ZingPlay. Th�i gian nh�n th��ng ��n h�t ng�y 02-11-2008."};
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		tinsert(tb_Msg, "Ta ��n nh�n bao l� x� ZingPlay./take_zingplay_bag");
	end
	
	tinsert(tb_Msg, "K�t th�c ��i tho�i/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end

function take_zingplay_bag()
	local ext_pointid = 4;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>C�c h� ch�a th� nh�n th��ng l�n n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,1826,1,1,0);
	local szMsg = format("Thu ���c 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end
