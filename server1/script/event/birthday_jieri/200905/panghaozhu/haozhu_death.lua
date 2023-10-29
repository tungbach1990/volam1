-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �ֺ��������ű�
-- �ļ�������haozhu_death.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-31 10:58:17

-- ======================================================

Include("\\script\\task\\task_addplayerexp.lua");	-- ���ڵ��Ӿ���
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- 

local tbAwardItem = 
{
	{szName="Ti�n Th�o L� ", nRate=10, tbProp={6, 1, 71, 1, 0, 0}},
	{szName="B�ch Qu� L� ", nRate=10, tbProp={6, 1, 73, 1, 0, 0}},
	{szName="Qu� Hoa T�u", nRate=10, tbProp={6, 1, 125, 1, 0, 0}},
};


local tbDropItem = {}
function tbDropItem:DropItemdByRate(tbItem, szLogTitle, nMapId, nPosX32, nPosY32, nSeries)
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			return self:DropItemByList(tbItem[i], szLogTitle, nMapId, nPosX32, nPosY32, nSeries)
		end
	end
end

function tbDropItem:DropItemByList(tbItem, szLogTitle, nMapId, nPosX32, nPosY32, nSeries)
	if not tbItem then --��Ʒ��Ϊ��
		self:Debug("B�ng v�t ph�m tr�ng.")
		return 0
	end
	if type(tbItem[1]) == "table" then -- ����Ƕ����Ʒ
		if tbItem[1].nRate then --�����ʸ�ĳһ��
			return self:DropItemdByRate(tbItem, szLogTitle, nMapId, nPosX32, nPosY32, nSeries)
		else --��˳���ȫ��
			for i = 1,  getn(tbItem) do
				self:DropItemByList(tbItem[i], szLogTitle, nMapId, nPosX32, nPosY32, nSeries)
			end	
			return 1;
		end
	end
	local tbItemProp	= tbItem.tbProp;
	local nItemCount	= tbItem.nCount or 1
	if tbItemProp then --��Ʒ
		local nItemIndex	= 0;
		for i = 1, nItemCount do
			local nQuality		= tbItem.nQuality or 0
			if nQuality == 0 then
				tbItemProp[4] = tbItemProp[4] or 1 --Ĭ�ϵȼ�
				tbItemProp[5] = tbItemProp[5] or 0
				tbItemProp[6] = tbItemProp[6] or 0
			end
			nItemIndex = DropItemEx( SubWorldID2Idx(nMapId), nPosX32, nPosY32, -1,4, 0, nQuality, tbItemProp[1], tbItemProp[2], tbItemProp[3] or 0, tbItemProp[4] or 1, tbItemProp[5] or nSeries or 0, tbItemProp[6] or 0,0,0,0,0,0)
			if nItemIndex <= 0 then
				return 0
			end
			if type(tbItem.CallBack) == "function" then
				tbItem.CallBack(nItemIndex)
			end
		end
		local szItemName = tbItem.szName or GetItemName(nItemIndex) --ͬ����Ʒ���ѡ����Index����Ҳһ��
		self:WriteLog(szLogTitle, format("get %d item %s", nItemCount, szItemName))
	end
	if tbItem.nJxb then --������
		
	end
	return 1
end

function tbDropItem:WriteLog(szLogTitle, szMsg)
--	if szLogTitle then
--		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szMsg))
--	else
--		self:Debug("�����Ʒ����û����־��")
--	end
end

function OnDeath( nNpcIndex )
	if (tbBirthday0905:IsActDate() ~= 1) then
		return
	end
	
	tbBirthday0905.tbTask:reset_task();
	
	if (GetTeamSize() ~= 0) then
		return
	end
	
	if (tbBirthday0905.tbTask:get_shoulie_count() >= 20) then
		Msg2Player("H�m nay �� s�n b�t 20 Nh�m b�o ph� r�i, ng�y mai h�y ��n l�i nh�.");
		return
	end
	
	local x, y, nMapIndex = GetNpcPos(nNpcIndex);
	local nSeries = GetNpcSeries();
	
	%tbDropItem:DropItemByList(%tbAwardItem, "Birthday_0905_PangHaozhu_death", SubWorldIdx2ID(nMapIndex),x, y, nSeries);
	
	if (tbBirthday0905.tbTask:get_task(tbBirthday0905.tbTask.tsk_shoulie_curexp) < tbBirthday0905.tbTask.nmaxexpfromshoulie) then
		tl_addPlayerExp(3000000);
		tbBirthday0905.tbTask:add_task(tbBirthday0905.tbTask.tsk_shoulie_curexp, 3000);
	end
	
	Earn(10000)
	
	tbBirthday0905.tbTask:add_shoulie_count(1);
end



function OnTimer(nNpcIndex, nTimeOut)
	DelNpc(nNpcIndex)
end
