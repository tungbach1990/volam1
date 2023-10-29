Include("\\script\\vng_event\\20120619_hk_bao_ruong\\main.lua")
Include("\\script\\lib\\progressbar.lua")

function tbVnHKBaoRuong:_OnBreak()
	Msg2Player("M� r��ng ��t �o�n")
end

function tbVnHKBaoRuong:InitProgressbar()
	local tbEventSring2 = 
	{
		"EVENT_MOVE",	-- �ƶ�
		"EVENT_ATTACK",-- ��������(ʹ�ò��ּ���)
		"EVENT_SITE",	-- ����
		"EVENT_RIDE",	-- ������
		"EVENT_USEITEM",-- ʹ�õ���
		"EVENT_ARRANGEITEM",	-- �ƶ���Ʒ���еĵ���
		"EVENT_DROPITEM",-- ������Ʒ
		"EVENT_CHANGEEQUIP",	-- ����װ��
		"EVENT_TRADE",-- ����
		"EVENT_CHANGEFIGHTSTATE",-- �ı�ս��״̬
		"EVENT_ATTACKED",-- ������
		"EVENT_DEATH",-- ����
		"EVENT_REVIVE",-- �������
		"EVENT_BUYITEM",-- ��Npc������
		"EVENT_SELLITEM",-- ��Npc��������
		"EVENT_TALK",	-- NPC�Ի�
	}
	local nEvent = 0
	for j=1, getn(tbEventSring2) do
		local szKey = tbEventSring2[j]		
		nEvent = SetBit(nEvent, tbProgressBar.tbEventType[szKey], 1)
	end
	tbProgressBar.tbConfig[20] = 
	{
		nId = 20,
		szTitle = "�ang m�",
		nTime = 2,
		nEvent = nEvent,
		bDesc = 0,
	}
end

function main()
	if CalcFreeItemCellCount() < 4 then
		Talk(1, "", "�� b�o ��m t�i s�n, xin h�y ch�a �t nh�t 4 � tr�ng trong h�nh trang r�i m�i m� r��ng.")
		return
	end
	if tbVnHKBaoRuong:CheckCondition() ~= 1 then		
		return
	end
	if GetTask(tbVnHKBaoRuong.nTSK_Limit_Use_Time) >=2000 then
		Talk(1, "", "S� l�n s� d�ng Ch�a Kh�a Ho�ng Kim �� ��t gi�i h�n.")
		return
	end
	if not tbProgressBar.tbConfig[20] then
		tbVnHKBaoRuong:InitProgressbar()
	end
	Msg2Player("B�t ��u m� r��ng")
	tbProgressBar:OpenByConfig(20, tbVnHKBaoRuong._GetAward, {}, %_OnBreak)
end

function tbVnHKBaoRuong:_GetAward()
	if tbVnHKBaoRuong:CheckCondition() ~= 1 then		
		return
	end
	if GetFightState() ~= 0 then
		Talk(1, "", "Ch�c n�ng n�y ch� ho�t ��ng trong khu v�c phi chi�n ��u.")
		return
	end
	if CalcFreeItemCellCount() < 4 then
		Talk(1, "", "�� b�o ��m t�i s�n, xin h�y ch�a �t nh�t 4 � tr�ng trong h�nh trang r�i m�i m� r��ng.")
		return
	end
	if ConsumeEquiproomItem(1,6,1,30226,1) ~= 1 then
		Msg2Player("Kh�ng c� Ch�a Kh�a Ho�ng Kim, m� r��ng th�t b�i!!!")
		return
	end	
	SetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time, GetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time) + 1)
	local nUsedCount = GetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time)	
	if nUsedCount > 2000 then
		return
	end
	Msg2Player("<color=green>Ti�u hao 1 Ch�a Kh�a Ho�ng Kim m� r��ng th�nh c�ng, nh�n ���c 6000000 kinh nghi�m kh�ng c�ng d�n v� ph�n th��ng<color>")
	local tbExpAward = {szName = "�i�m kinh nghi�m", nExp = 6000000}
	tbAwardTemplet:Give(tbExpAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "S� l�n s� d�ng: "..nUsedCount})
	--ph�n th��ng ��t m�c 2000
	if nUsedCount == 2000 then		
		local tbSpecialAward = {szName = "B�ch H� L�nh", tbProp={6,1,2357,1,0,0},nCount=1,}
		tbAwardTemplet:Give(tbSpecialAward, 1 , {"EventHKBaoRuong", "PhanThuongSuDung2000ChiaKhoaHK"})
	end
	if mod(nUsedCount, 100) == 0 then
		tbAwardTemplet:Give(%tbVnHKBaoRuong.tbSpecialAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "S� l�n s� d�ng: "..nUsedCount})
	else
		tbAwardTemplet:Give(%tbVnHKBaoRuong.tbNormalAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "S� l�n s� d�ng: "..nUsedCount})
	end
	if CalcFreeItemCellCount() >= 1 then
		tbMeridanMaterial = {szName = "H� M�ch ��n", tbProp={6,1,3203,1,0,0},nCount=2,}
		tbAwardTemplet:Give(tbMeridanMaterial, 1 , {"EventHKBaoRuong", "PhanThuongHoMachDon", "S� l�n s� d�ng: "..nUsedCount})		
	end
end