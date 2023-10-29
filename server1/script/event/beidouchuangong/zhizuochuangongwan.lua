-- �ļ�������zhizuochuangongwan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-22 17:16:36
--����������Ľű�
IncludeLib("SETTING");
Include("\\script\\event\\BeiDouChuanGong\\lib\\compose.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function BeiDouChuanGong_main(nStep)
	local tbSay 
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>��n t�m ta �� luy�n c�c lo�i Truy�n c�ng ti�n ��n c� ph�i kh�ng?",
			"Ta ��n luy�n c�c lo�i ti�n �an/#BeiDouChuanGong_main(2)",
			"V� B�c ��u truy�n c�ng thu�t/#BeiDouChuanGong_main(3)",
			"Th�ng tin th�i gian s� d�ng/#BeiDouChuanGong_main(4)",
			"K�t th�c ��i tho�i/OnCancel",
		}
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>Ng��i mu�n luy�n lo�i ti�n ��n n�o?",
			"B�ch Ch�n ��n/#BeiDouChuanGong_zuodan([[bai]])",
			"Huy�t Ch�n ��n/#BeiDouChuanGong_zuodan([[xue]])",
			"Huy�n Ch�n ��n/#BeiDouChuanGong_zuodan([[xuan]])",
			"T� Kim Ch�n ��n/#BeiDouChuanGong_zuodan([[zijin]])",
			"K�t th�c ��i tho�i/OnCancel",
		}
	elseif nStep == 3 then
		tbSay = 
		{
			format("<dec><npc>�i�u ki�n c�a ti�n ��n: l�c truy�n c�ng cho c�c lo�i ti�n ��n tr�n ng��i ph�i c� �� 1 tri�u kinh nghi�m. Ti�n ��n c�n nguy�n li�u nh� sau.<enter>B�ch Ch�n ��n: 1 b�c ��u truy�n c�ng thu�t, 1 th�t tinh th�o<enter>Huy�t Ch�n ��n: 1 b�c ��u truy�n c�ng thu�t, 1 b�ch ni�n th�t tinh th�o <enter>Huy�n Ch�n ��n: 1 b�c ��u truy�n c�ng thu�t, 1 thi�n ni�n th�t tinh th�o<enter>T� Kim Ch�n ��n: 1 b�c ��u truy�n c�ng thu�t, 1 v�n ni�n ng� th�i hoa<enter>Ho�ng Ch�n ��n:  b� truy�n<enter>3 lo�i ti�n ��n ��u, ch� c�n �� c�p 50 v� �� n�p th� m�i c� th� s� d�ng v� ch� nh�n ���c t�ng kinh nghi�m l� 3 t�, ��t ��n kinh nghi�m cao nh�t ph�i ��i %d ng�y m�i c� th� s� d�ng l�i. Ch� c� ng��i ch�i chuy�n sinh m�i c� th� s� d�ng T� Kim Ch�n ��n. T� Kim Ch�n ��n v� Ho�ng Kim Ch�n ��n nh�n �i�m kinh nghi�m c� th� c�ng d�n v� s� d�ng xong th� ph�i ��i 60 ng�y m�i c� th� s� d�ng ti�p",floor( TSKV_BeiDouChuanGong_UseLimit/(60*60*24) ) ),
			"K�t th�c ��i tho�i/OnCancel",
		}
	elseif nStep == 4 then
		
		local nCurTime			= GetCurServerTime()
		local nTSKVExp			= GetBeiDouChuanGongExp();
		local nTSKVTime			= GetTask(TSK_BeiDouChuanGong_NIANYUE);
		local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);
		local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
		
		local szMsg_Common = "V�i c�ng l�c hi�n t�i, ��i hi�p c� th� s� d�ng ph� th�ng truy�n c�ng ti�n ��n.";
		local szMsg_ZiJin  = "V�i c�ng l�c hi�n t�i, ��i hi�p c� th� s� d�ng T� Kim Ch�n ��n.";
		local szMsg_Huang  = "V�i c�ng l�c hi�n t�i, ��i hi�p c� th� s� d�ng Ho�ng Ch�n ��n.";
		
		-- ��ͨ�浤
		if nTSKVExp >= 30e8 and nTSKVTime + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Common = format("Hi�n t�i c�c h� c�n ��i th�m <color=yellow>%d ng�y %d gi� %d ph�t %d gi�y<color> m�i c� th� s� d�ng ph� th�ng truy�n c�ng ti�n ��n.",nDay,nHour,nMin,nSec);
		end
		
		-- �Ͻ��浤
		if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_ZiJin = format("Hi�n t�i c�c h� c�n ��i th�m <color=yellow>%d ng�y %d gi� %d ph�t %d gi�y<color> m�i c� th� s� d�ng T� Kim Ch�n ��n.",nDay,nHour,nMin,nSec);
		end
		
		-- ���浤
		if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Huang = format("Hi�n t�i c�c h� c�n ��i th�m <color=yellow>%d ng�y %d gi� %d ph�t %d gi�y<color> m�i c� th� s� d�ng Ho�ng Ch�n ��n.",nDay,nHour,nMin,nSec);
		end		
		
		tbSay = 
		{
			format("<dec><npc>%s<enter>%s<enter>%s", szMsg_Common, szMsg_ZiJin, szMsg_Huang),
			"K�t th�c ��i tho�i/OnCancel",
		}
	end
	CreateTaskSay(tbSay)
end

BeiDouChuanGong_tbItem = 
{
	[1] = {szName="B�c ��u truy�n c�ng thu�t", tbProp={6, 1, 1672}, nCount = 1},      
	[2] = {szName="Th�t tinh th�o", tbProp={6, 1, 1673}, nCount = 1},          
	[3] = {szName="B�ch ni�n th�t tinh th�o", tbProp={6, 1, 1674}, nCount = 1},      
	[4] = {szName="Thi�n ni�n th�t tinh th�o", tbProp={6, 1, 1675}, nCount = 1},      
	[5] = {szName="B�ch Ch�n ��n", tbProp={6, 1, 1676, 1, 0, 0}, nCount = 1},          
	[6] = {szName="Huy�t Ch�n ��n", tbProp={6, 1, 1677, 1, 0, 0}, nCount = 1},          
	[7] = {szName="Huy�n Ch�n ��n", tbProp={6, 1, 1678, 1, 0, 0}, nCount = 1},
	[8] = {szName="V�n Ni�n Ng� Th�i Hoa", tbProp={6, 1, 2265, 1, 0, 0}, nCount = 1},
	[9] = {szName="T� Kim Ch�n ��n", tbProp={6, 1, 2263, 1, 0, 0}, nCount = 1},
}
BeiDouChuanGong_tbRecipe = 
{
	bai		= {tbItemList = {1,2}, nExp = 5e8, tbAwardItem = 5},
	xue		= {tbItemList = {1,3}, nExp = 10e8, tbAwardItem = 6},
	xuan	= {tbItemList = {1,4}, nExp = 15e8, tbAwardItem = 7},
	zijin	= {tbItemList = {1,8}, nExp = 20e8,tbAwardItem = 9},
}
function BeiDouChuanGong_zuodan(szDanType,nStep)
	local tbRecipe = BeiDouChuanGong_tbRecipe[szDanType]
	local tbAwardItem = BeiDouChuanGong_tbItem[tbRecipe.tbAwardItem]
	if nStep ~= 1 then
		local szTitle = format("C�c h� c� ��ng � luy�n <color=yellow>%s<color> kh�ng? N�u ch�p nh�n kinh nghi�m hi�n t�i c�a c�c h� s� b� t�n hao.", tbAwardItem.szName)
		local tbOpt = {}
		tbOpt[1] = format("��ng �!/#BeiDouChuanGong_zuodan([[%s]],1)", szDanType)
		tbOpt[2] = "H�y b� /OnCancel"
		return Say(szTitle,getn(tbOpt),tbOpt);
	end
	
	if GetExp() < 1000000 then
		return Say("Xin l�i, kinh nghi�m hi�n t�i v�n ch�a �� 1 tri�u, kh�ng th� luy�n �an.", 0)
	end
	
	local tbMaterial = {};
	for i=1, getn(tbRecipe.tbItemList) do
		tinsert(tbMaterial, i, BeiDouChuanGong_tbItem[tbRecipe.tbItemList[i]]);
	end
	BeiDouChuanGong_ComposeClass:Compose(tbMaterial,0,BeiDouChuanGong_zuodan_complished, tbRecipe.nExp, tbAwardItem)
	
end

function BeiDouChuanGong_zuodan_complished(nMaxExp, tbAwardItem)
	local nPlayerCurExp = GetExp();
	local nExp = nMaxExp;
	if nPlayerCurExp < nMaxExp then
		nExp = nPlayerCurExp
	end
	ReduceOwnExp(nExp);
	local nItemIndex = BeiDouChuanGong_lib_AddAward(tbAwardItem, "B�c ��u truy�n c�ng")
	SetSpecItemParam(nItemIndex, 1, mod(nExp, 1e8));	--������Ʒ�ܵõ��ľ���
	SetSpecItemParam(nItemIndex, 2, nExp / 1e8);		--������Ʒ�ܵõ��ľ���
	SyncItem(nItemIndex);
end
