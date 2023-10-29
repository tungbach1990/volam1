-- �ļ�������chuangongdan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("Ch� c� nh�n v�t �� tr�ng sinh m�i c� th� s� d�ng T� Kim Ch�n ��n", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d�ng ch�n �an n�y kh�ng th� nh�n ���c kinh nghi�m.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ng�y %d gi� %d ph�t %d gi�y<color>",nDay,nHour,nMin,nSec);
	end
		
	local szTitle;
	local tbOpt;
	
	if szMsg_ZiJin ~= nil then
		szTitle	= format("Xin ch�o <color=yellow>%s<color>, trong th�i gian 60 ng�y ch� ���c s� d�ng 1 l�n T� Kim Ch�n ��n, ��i hi�p ��i th�m %s r�i h�y th� l�i.",GetName(),szMsg_ZiJin)
		tbOpt = 
		{
			"X�c nh�n/OnCancel"
		}
	else
		szTitle	= format("Xin ch�o <color=yellow>%s<color>, s� d�ng ti�n ��n n�y c� th� nh�n ���c <color=yellow>%s<color> kinh nghi�m. X�c nh�n mu�n s� d�ng?",GetName(), nContainExp)
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
	
	if ST_GetTransLifeCount() <= 0  then
		Say("Ch� c� nh�n v�t �� tr�ng sinh m�i c� th� s� d�ng T� Kim Ch�n ��n", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("S� d�ng ch�n �an n�y kh�ng th� nh�n ���c kinh nghi�m.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d ng�y %d gi� %d ph�t %d gi�y<color>",nDay,nHour,nMin,nSec);
	end	
	
	
	if szMsg_ZiJin ~= nil then
		local szTitle = format("Xin ch�o <color=yellow>%s<color>, trong th�i gian 60 ng�y ch� ���c s� d�ng 1 l�n T� Kim Ch�n ��n, ��i hi�p ��i th�m %s r�i h�y th� l�i.",GetName(),szMsg_ZiJin)
		local tbOpt = 
		{
			"X�c nh�n/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			
			tbAwardTemplet:GiveAwardByList({nExp_tl = nContainExp;}, format("%s s� d�ng T� Kim Ch�n ��n", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
			
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\nCh�a <color=yellow>%s<color> kinh nghi�m", nContainExp);
end
