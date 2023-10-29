Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\killmonster.lua");
Include("\\script\\task\\task_addplayerexp.lua");
tbQuest=
{
	tbQuest2=
	{
		{szQuestName = "Quy�t chi�n T�ng Kim", nId = 1},
		{szQuestName = "Truy t�m Th�y T�c", nId = 2},
		{szQuestName = "N�ng c�p Danh V�ng", nId = 3},
		{szQuestName = "Ti�u di�t �ao Y�u", nId = 4}
	},
	tbQuest3=
	{
		{szQuestName = "Thu gom Huy�n Tinh", nId = 1},
		{szQuestName = "Thu gom M�t ��", nId = 2},
		{szQuestName = "Thu gom Ph�c Duy�n", nId = 3},
		{szQuestName = "Thu gom Khi�u Chi�n L�nh", nId = 4}
	}
};
function AcceptFirstQuest()
	SetTask(Task_IsQuest, 1)
	tbAnBangHKL:AcceptTask(1, 21)
end

function FinishFirstQuest()
	if (tbAnBangHKL:CheckTaskComplete() ~= 1) then
		return
	end
	 tbAnBangHKL:CompleteTask()
	 SetTask(Task_IsFinishQuest, 1)
end

function GetSecondQuest()
	SetTask(Task_IsQuest, 2)
	local nTskRandom = random(1, getn(tbQuest.tbQuest2))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest2[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestTongKim()
	elseif (nTskID == 2) then
		QuestThuyTac()
	elseif (nTskID == 3) then
		QuestDanhVong()
	elseif (nTskID == 4) then
		QuestDaoYeu()
	end
end
function QuestTongKim()
	SetTask(Task_lag_TskID, 1)
	local nCurScoreTK = GetTask(747)
	SetTask(Task_SCore,nCurScoreTK)
	Msg2Player("��i hi�p h�y t�ng �i�m t�ch l�y t�ng Kim 1000 �i�m")
end
function QuestThuyTac()
	SetTask(Task_lag_TskID, 2)
	SetTask(Task_KillNPC, 0)
	Msg2Player("��i hi�p h�y ti�u di�t Th�y T�c ��u l�nh")
end
function QuestDanhVong()
	SetTask(Task_lag_TskID, 3)
	SetTask(Task_SCore, GetRepute())
	Msg2Player("��i hi�p h�y t�ng �i�m Danh V�ng 50 �i�m")
end
function QuestDaoYeu()
	SetTask(Task_lag_TskID, 4)
	SetTask(Task_KillNPC, 0)
	Msg2Player("��i hi�p h�y ti�u di�t 4 t�n �ao Y�u � S�n Th�n Mi�u")
end

function FinishSecondQuest()
		if (GetTask(Task_lag_TskID) == 1) then --hoan thanh nhiem vu tong kim
			if (GetTask(747) >= GetTask(Task_SCore) + 1000) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� li�n ho�n th� 2, ��i hi�p c� th� nh�n ti�p nhi�m v� li�n ho�n th� 3")
			else
				Talk(1, "", "��i hi�p ch�a ho�n th�nh nhi�m v� !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 2) then  --hoan thanh nhiem vu thuy tac
			if (GetTask(Task_KillNPC) == 1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� li�n ho�n th� 2, ��i hi�p c� th� nh�n ti�p nhi�m v� li�n ho�n th� 3")
			else
				Talk(1, "", "��i hi�p ch�a ho�n th�nh nhi�m v� !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 3) then
			if (GetRepute() >= GetTask(Task_SCore)+50) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� li�n ho�n th� 2, ��i hi�p c� th� nh�n ti�p nhi�m v� li�n ho�n th� 3")
			else
				Talk(1, "", "��i hi�p ch�a ho�n th�nh nhi�m v� !");
				return
			end
		end
		if (GetTask(Task_lag_TskID) == 4) then
			if (GetTask(Task_KillNPC) >= 4) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 2)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� li�n ho�n th� 2, ��i hi�p c� th� nh�n ti�p nhi�m v� li�n ho�n th� 3")
			else
				Talk(1, "", "��i hi�p ch�a ho�n th�nh nhi�m v� !");
				return
			end
		end
		
end

function GetThirdQuest()
	SetTask(Task_IsQuest, 3)
	local nTskRandom = random(1, getn(tbQuest.tbQuest3))
	if (nTskRandom == nil) then
		nTskRandom = 1
	end
	local nTskID = tbQuest.tbQuest3[nTskRandom].nId
	if (nTskID == nil) then
		nTskID = 1
	end
	if (nTskID == 1) then
		QuestHuyenTinh()
	elseif (nTskID == 2) then
		QuestMatDo()
	elseif (nTskID == 3) then
		QuestPhucDuyen()
	elseif (nTskID == 4) then
		QuestKCL()
	end
end

function QuestHuyenTinh()
		SetTask(Task_lag_TskID, 1)
		Msg2Player("��i hi�p h�y giao n�p 1 Huy�n Tinh c�p 5")
end
function QuestMatDo()
		SetTask(Task_lag_TskID, 2)
		Msg2Player("��i hi�p h�y giao n�p 10 M�t �� Th�n B�")
end
function QuestPhucDuyen()
		SetTask(Task_lag_TskID, 3)
		Msg2Player("��i hi�p h�y giao n�p 1 Ph�c Duy�n L�(l�n)")
end
function QuestKCL()
		SetTask(Task_lag_TskID, 4)
		Msg2Player("��i hi�p h�y giao n�p 2 Khi�u Chi�n L�nh")
end

function FinishThirdQuest()
		--check cue Exp
		local curexp = GetExp()
		if (curexp < 0) then
			Talk(1, "", "��i hi�p �ang b� �m �i�m kinh nghi�m, kh�ng th� nh�n th��ng !.");
			return
		end
		GiveItemUI( "Nhi�m v� giao v�t ph�m", "Nh�ng th� ta c�n ng��i t�m ���c ch�a", "yestask", "no" );
end
function yestask(nCount)
		if (GetTask(Task_lag_TskID)==1) then
			if (CheckIQuestItem(nCount,6,1,147,5,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh chu�i nhi�m v� li�n ho�n c�a ng�y h�m nay! C�c h� nh�n  2000000000 �i�m kinh nghi�m")
				--Bonus 2 t� exp c� c�ng d�n
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."ho�n th�nh chu�i nhi�m v� nh�n nh�n  2000000000 �i�m kinh nghi�m")
			end
		end
		if (GetTask(Task_lag_TskID)==2) then
			if (CheckIQuestItem(nCount,6,1,196,0,10)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh chu�i nhi�m v� li�n ho�n c�a ng�y h�m nay! C�c h� nh�n  2000000000 �i�m kinh nghi�m")
				--Bonus 2 t� exp c� c�ng d�n
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."ho�n th�nh chu�i nhi�m v� nh�n nh�n  2000000000 �i�m kinh nghi�m")
			end
		end
		if (GetTask(Task_lag_TskID)==3) then
			if (CheckIQuestItem(nCount,6,1,124,0,1)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh chu�i nhi�m v� li�n ho�n c�a ng�y h�m nay! C�c h� nh�n  2000000000 �i�m kinh nghi�m")
				--Bonus 2 t� exp c� c�ng d�n
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."ho�n th�nh chu�i nhi�m v� nh�n nh�n  2000000000 �i�m kinh nghi�m")
			end
		end
		if (GetTask(Task_lag_TskID)==4) then
			if (CheckIQuestItem(nCount,6,1,1499,0,2)==1) then
				SetTask(Task_lag_TskID, 0)
				SetTask(Task_IsFinishQuest, 3)
				Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh chu�i nhi�m v� li�n ho�n c�a ng�y h�m nay! C�c h� nh�n  2000000000 �i�m kinh nghi�m")
				--Bonus 2 t� exp c� c�ng d�n
				tl_addPlayerExp(2000000000);
				WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."ho�n th�nh chu�i nhi�m v� nh�n nh�n  2000000000 �i�m kinh nghi�m")
			end
		end
			
end
function CheckIQuestItem(nCount,nG,nD,nP,nLevel,nItemNeedCount)
		local nItemCount =0
		for i=1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
			if (itemgenre ~= nG or detailtype ~= nD or parttype ~= nP or GetItemLevel(nItemIdx) < nLevel) then	
				Talk(1, "", "��i hi�p xin h�y giao ��ng v�t ph�m ta c�n !");
				return 0
			end--if
			nItemCount = nItemCount + GetItemStackCount(nItemIdx)
		end --for
		if (nItemCount ~= nItemNeedCount) then
			Talk(1, "", "��i hi�p xin h�y giao ��ng s� l��ng v�t ph�m ta c�n !");
			return 0
		end
		for i = 1, nCount do
			local nItemIdx = GetGiveItemUnit(i);
			RemoveItemByIndex(nItemIdx)
		end
		return 1
end

function ReviewCurQuest()
	local IsQ, _ = GetCurQuest()
	if (IsQ == 1) then
		 tbAnBangHKL:ReviewCurKillMonsterTask()
	elseif (IsQ == 2) then
		ReviewQuest2()
	elseif (IsQ == 3) then
		ReviewQuest3()
	else
	
	end
end

function ReviewQuest2()
	local nTskID = tbQuest.tbQuest2[GetTask(Task_lag_TskID)].nId
	local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow = "��i hi�p h�y t�ng �i�m t�ch l�y t�ng Kim 1000 �i�m"
		elseif (nTskID == 2) then
			szShow = "��i hi�p h�y ti�u di�t Th�y T�c ��u l�nh"
		elseif (nTskID == 3) then
			szShow = "��i hi�p h�y t�ng �i�m Danh V�ng 50 �i�m"
		elseif (nTskID == 4) then
			szShow = "��i hi�p h�y ti�u di�t 4 t�n �ao Y�u � S�n Th�n Mi�u"
		end
		Talk(1, "", szShow);
end

function ReviewQuest3()
	local nTskID = tbQuest.tbQuest3[GetTask(Task_lag_TskID)].nId
		local szShow = ""
		if (nTskID == nil) then
			return
		elseif (nTskID == 1) then 
			szShow ="��i hi�p h�y giao n�p 1 Huy�n Tinh c�p 5"
		elseif (nTskID == 2) then
			szShow = "��i hi�p h�y giao n�p 10 M�t �� Th�n B�"
		elseif (nTskID == 3) then
			szShow = "��i hi�p h�y giao n�p 1 Ph�c Duy�n L�(l�n)"
		elseif (nTskID == 4) then
			szShow = "��i hi�p h�y giao n�p 2 Khi�u Chi�n L�nh"
		end
		Talk(1, "", szShow);
end

function no()
end
