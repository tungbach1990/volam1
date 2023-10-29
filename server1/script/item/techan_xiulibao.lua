IncludeLib("SETTING"); --����SETTING�ű�ָ���
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

ITEMPARAM_LIMITDATE = 2
ITEMPARAM_TONGID = 1
function main(nItemIndex)
local szTongName , nTongID = GetTongName()

	if (xiulibao_checkdate(nItemIndex) == -1) then
		Say("<#>T�i �� ngh� �� qu� h�n s� d�ng!", 0)
		Msg2Player("T�i �� ngh� �� qu� h�n s� d�ng!")
		return
	end
	--������ָ��
	--��%d���RepairCallBackǰ�������������ص�ʱ����: nItemIdx, nPrice, nItemPrice������Ĳ�������Say(...)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..")")
	return 1
end

function xiulibao_checkdate(nItemIndex)
	local nItemdate = GetItemParam(nItemIndex, 1);
	if (GetCurServerTime() <= nItemdate) then
		return 1;
	else
		return -1;
	end;
end

function GetDesc(nItem)
	local nEndYear = GetItemParam(nItem, 2) + 2000;
	local nEndMMDD = GetItemParam(nItem, 3);
	local nEndMon = floor(nEndMMDD / 100);
	local nEndDay = mod(nEndMMDD, 100);
	local nEndHour = GetItemParam(nItem, 4);

	return format("\n Ng�y h�t h�n: <color=blue>%d-%d-%d-%d gi�<color>", nEndYear, nEndMon,nEndDay,nEndHour);
end

--�ο�ws_tiangong.lua
function RepairCallBack(nItemIdx, nPrice, nItemPrice, nParam)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local quality = GetItemQuality(nItemIdx)
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�	
	if (quality == 1 or quality == 4)then
		if (quality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
			Say("Ch� ti�m: T�i ti�m c�a ta ��y kh�ng th� s�a trang b� b�ch kim +6 tr� l�n", 0);
			return 1
		end
		
		local nItemLevel = GetItemLevel(nItemIdx);
		--ÿ�;öȵļ۸�
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur
		local nCostlyPrice = nCheapPrice * 3; -- ���޵�����
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("<#>", 3, 
		"S�a ��n gi�n: "..nCheapPrice.." l��ng, �� b�n gi�m "..nLostDur.."�i�m/#Cheap_Repair("..nItemIdx..","..nCheapPrice..")",
		"S�a k�: "..nCostlyPrice.." l��ng/#Costly_Repair("..nItemIdx..","..nCostlyPrice..")",
		"Kh�ng c�n ��u/cancel")
		return	
	end	
	Say("<#>S�a trang b� c�n ti�u t�n: "..nPrice.." l��ng, c� ��ng � kh�ng?", 2, 
	"S�a ch�a/#TG_Repair("..nItemIdx..","..nPrice..")",
	"Kh�ng c�n ��u/cancel")
end

--����
function Costly_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIdx, nCurMaxDur)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCostPrice..") l��ng b�c, s�a k� trang b� Ho�ng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>Ng�n l��ng kh�ng ��!", 0)
		return
	end
end
--����
function Cheap_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
	else
		Say("<#>Ng�n l��ng kh�ng ��, h�y mau t�m �� ng�n l��ng!", 0)
		return
	end
end
--����
function TG_Repair(nItemIdx, nCostPrice)
	if (GetCash() < nCostPrice) then
		Say("<#>Ng�n l��ng kh�ng ��, h�y mau t�m �� ng�n l��ng!", 0)
		return
	end
	Pay(nCostPrice)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
end