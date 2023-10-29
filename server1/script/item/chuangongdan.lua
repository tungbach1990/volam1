-- �ļ�������chuangongdan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function main(nItemIndex)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	if (parttype == 30036 or parttype == 30037) then	
			return 1
	end

	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime		= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime		= GetCurServerTime()
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng c�c lo�i ch�n �an (b�ch ch�n �an, huy�t ch�n �an, huy�n ch�n �an).", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d�ng ch�n �an n�y kh�ng th� nh�n ���c kinh nghi�m.", 0)
		return 0
	end
	
	local szTime = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit < nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ng�y %d gi� %d ph�t %d gi�y", nDay, nHour, nMin, nSec);
		end
	end
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	
	
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin ch�o <color=yellow>%s<color>, ��i hi�p s� d�ng c�c lo�i ti�n ��n v� nh�n ���c t�ng kinh nghi�m cao nh�t l� 3 t� �i�m, v� v�y kh�ng th� s� d�ng th�m ti�n ��n ���c n�a. H�y ��i <color=yellow>%s<color> r�i th� l�i.",GetName(),szTime)
		tbOpt = 
		{
			"X�c nh�n/OnCancel"
		}
	else
		szTitle	= format("Xin ch�o <color=yellow>%s<color>, ��i hi�p s� d�ng c�c lo�i ti�n ��n nh�n ���c <color=yellow>%s<color> kinh nghi�m, c�n c� th� nh�n ���c th�m <color=yellow>%s<color> kinh nghi�m. <enter>Ti�n ��n n�y ch�a <color=yellow>%s<color> kinh nghi�m, n�u s� d�ng lo�i ti�n ��n n�y c� th� nh�n ���c <color=yellow>%s<color> kinh nghi�m, c�c h� c� mu�n s� d�ng kh�ng?",GetName(), nTSKVExp, nRemnant, nContainExp, nExp)
		tbOpt = 
		{
			format("X�c nh�n/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"H�y b� /OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime	= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime	= tonumber(GetLocalDate("%Y%m"));
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng c�c lo�i ch�n �an (b�ch ch�n �an, huy�t ch�n �an, huy�n ch�n �an).", 0)
		return 1;
	end
	
	
	if nContainExp <= 0 then
		Say("S� d�ng ch�n �an n�y kh�ng th� nh�n ���c kinh nghi�m.", 0)
		return 1
	end
	
	
	local nDay = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit <= nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d ng�y %d gi� %d ph�t %d gi�y", nDay, nHour, nMin, nSec);
		end
	end
	
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("Xin ch�o <color=yellow>%s<color>, ��i hi�p s� d�ng c�c lo�i ti�n ��n v� nh�n ���c t�ng kinh nghi�m cao nh�t l� 3 t� �i�m, v� v�y kh�ng th� s� d�ng th�m ti�n ��n ���c n�a. H�y ��i <color=yellow>%s<color> r�i th� l�i.",GetName(), szTime)
		tbOpt = 
		{
			"X�c nh�n/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tl_addPlayerExp(nExp);
			SetBeiDouChuanGongExp(nTSKVExp+nExp);
			if nTSKVExp+nExp >= 30e8 then 
				SetTask(TSK_BeiDouChuanGong_NIANYUE, GetCurServerTime());
			end
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local itemgenre, detailtype, parttype = GetItemProp(nItem)
	if (itemgenre == 6 and detailtype == 1 and parttype == 30003 or parttype == 30004) then	
			local nVar = GetItemParam(nItem, 1);
			return format("\nMang m� s� <color=yellow>%s<color>", nVar);
	end
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nCh�a <color=yellow>%s<color> kinh nghi�m", nContainExp);
end
