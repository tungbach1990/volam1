tbCOT_Party = {}
DescLink_NhiepThiTran = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>Nhi�p Th� Tr�n:<link>";
function tbCOT_Party:CheckCondition()
	if IsCaptain() ~= 1 then
		Talk(1, "", "Xin l�i, ch� c� ��i tr��ng m�i c� quy�n ki�m tra �i�u ki�n tham gia c�a t� ��i!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()
	local nOldPlayer = PlayerIndex
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nFlag1 = DynamicExecuteByPlayer(PlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color> kh�ng th�a �i�u ki�n �� tham gia", GetName()))
		end
		--Ki�m tra s�t th� gi�n
		if self:CalcSword() < 1 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Kh�ng c� S�t Th� Gi�n"))
		end
	
		--Ki�m tra s� l�n v��t �i trong ng�y
		local nDailyTaskCount = self:GetDailyTaskCount()
		if ( nDailyTaskCount >= 3) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "�� v��t �i �� 3 l�n"))
		else
			local nLHHUse = self:GetLHHUseCount()
			if (nDailyTaskCount == 1 and nLHHUse < 1) or (nDailyTaskCount == 2 and nLHHUse < 2) then
				tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Ch�a s� d�ng Long Huy�t Ho�n"))
			end
		end
		
	end -- loop whole party
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then
		local strTittle = DescLink_NhiepThiTran.."T� ��i hi�n t�i kh�ng th� tham gia\n khi�u chi�n:"
		for i = 1, getn(tbDialog) do
			strTittle = strTittle.."\n"..tbDialog[i]
		end
		Describe(strTittle, 1, "��ng/OnCancel")
	else
		local strTittle = DescLink_NhiepThiTran.."T� ��i hi�n t�i c� th� tham gia khi�u chi�n"
		Describe(strTittle, 1, "��ng/OnCancel")
	end
end

function tbCOT_Party:CalcSword()
	local nHaveSword = 0
	for j =  20, 90, 10 do
		if nHaveSword > 1 then
			break
		else
			nHaveSword = CalcEquiproomItemCount( 6, 1, 400, j ) + nHaveSword
		end
	end
	return nHaveSword	
end

function tbCOT_Party:GetDailyTaskCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if (ndate ~= GetTask(1551)) then --ch�a �i v��t �i trong ng�y
			nResult = 0
	else		
		if ndate ~= GetTask(2641) then --ch�a s� d�ng long huy�t ho�n
			if GetTask(1550) <= 0 then --s� l�n v��t �i c� th� tham gia
				nResult = nResult + 1
			end
		else
			nResult = 1 + GetTask(2642) - GetTask(1550)
			if nResult < 0 then
				nResult = 0
			end
		end
	end
	return nResult
end

--s� l�n s� d�ng long huy�t ho�n
function tbCOT_Party:GetLHHUseCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if ndate ~= GetTask(2641) then 
		nResult = 0
	else
		nResult = GetTask(2642)
	end
	return nResult
end

function OnCancel()

end