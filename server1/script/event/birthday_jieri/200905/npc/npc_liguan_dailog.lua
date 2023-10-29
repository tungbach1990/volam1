-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �۰��������NPC�Ի�
-- �ļ�������npc_dailog.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-20 18:30:39

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\task\\system\\task_string.lua");

tbZhuHe = 
{
	[1] = 
	{
		szComposeTitle =  "��i",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H�ng", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi�n", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "��ng C�", tbProp = {6,1,2067,1}},
		},
		tbProduct = 
		{szName = "T�n B�n C�", tbProp = {6,1,2068,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
	
	[2] = 
	{
		szComposeTitle =  "��i",
		nFreeItemCellLimit = 1,
		tbMaterial = 
		{
			{szName = "H�ng", tbProp = {6,1,2062,1}},
			{szName = "B�", tbProp = {6,1,2063,1}},
			{szName = "Thi�n", tbProp = {6,1,2064,1}},
			{szName = "H�", tbProp = {6,1,2065,1}},
			{szName = "Ho�ng K�", tbProp = {6,1,2066,1}},
		},
		tbProduct = 
		{szName = "T�n B�n K�", tbProp = {6,1,2069,1,0,0}, nExpiredTime = tbBirthday0905.tbTask.item_expiredtime2},
	},
}


tbBirthday0905.tbZhuHe = tbComposeListForJinNang:new("tbBirthday0905_Compose", tbZhuHe)
tbXinwu =
{
	[1] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H�ng T�m Ki�m", tbProp = {6, 1, 2070, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="50 v�n EXP (1 H�ng T�m Ki�m)",
			[1]	= {nExp = 500000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 500000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 500000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[2] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "B� V��ng Th��ng", tbProp = {6, 1, 2071, 1, 0, 0},	nCount = 1},
		},
		tbProduct = 
		{
			szName="200 v�n EXP (1 B� V��ng Th��ng)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[3] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "Thi�n T�n �ao", tbProp = {6, 1, 2072, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="200 v�n EXP (1 Thi�n T�n �ao)",
			[1]	= {nExp = 2000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 2000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 2000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[4] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H� Nh�t Cung", tbProp = {6, 1, 2073, 1, 0, 0},	nCount = 1},
			
		},
		tbProduct = 
		{
			szName="300 v�n EXP (1 H� Nh�t Cung)",
			[1]	= {nExp = 3000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 3000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 3000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0
			else
				return 1
			end
			
		end
	},
	[5] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H�ng T�m Ki�m", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� V��ng Th��ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			
		},
		tbProduct = 
		{
			szName="800 v�n EXP (5 H�ng T�m Ki�m + 2 B� V��ng Th��ng)",
			[1]	= {nExp = 8000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 8000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 8000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[6] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H�ng T�m Ki�m", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� V��ng Th��ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi�n T�n �ao", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="1200 v�n EXP (5 H�ng T�m Ki�m + 2 B� V��ng Th��ng + 1 Thi�n T�n �ao)",
			[1]	= {nExp = 12000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 12000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 12000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},
	[7] =
	{
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			[1]	= {szName = "H�ng T�m Ki�m", tbProp = {6, 1, 2070, 1, 0, 0}, nCount = 5},
			[2]	= {szName = "B� V��ng Th��ng", tbProp = {6, 1, 2071, 1, 0, 0}, nCount = 2},
			[3]	= {szName = "Thi�n T�n �ao", tbProp = {6, 1, 2072, 1, 0, 0}, nCount = 1},
			[4]	= {szName = "H� Nh�t Cung", tbProp = {6, 1, 2073, 1, 0, 0}, nCount = 1},
			
		},
		tbProduct = 
		{
			szName="2000 v�n EXP (5 H�ng T�m Ki�m+2 B� V��ng Th��ng+1 Thi�n T�n �ao+1 H� Nh�t Cung)",
			[1]	= {nExp = 20000000},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					SetTask(tbBirthday0905.tbTask.tsk_toll_explmt, 20000000 + GetTask(tbBirthday0905.tbTask.tsk_toll_explmt));
				end
			}
		},
		pLimitFun = function (self, nCount)
			if (GetTask(tbBirthday0905.tbTask.tsk_toll_explmt) + 20000000 > 1000000000) then
				Msg2Player("��i hi�p �� nh�n ���c kinh nghi�m gi�i h�n cao nh�t r�i, kh�ng th� ti�p t�c nh�n th�m n�a!");
				return 0;
			else
				return 1;
			end
			
		end
	},	
}

function tbBirthday0905:OnDailogMain2(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbZhuHe then
--		
--	end

	local szTitle = format("Ho�t ��ng �Ch�o m�ng phi�n b�n m�i� di�n ra t� %s ��n %s. Ng��i mu�n t�m hi�u ho�t ��ng n�o?", "19/06/2009", "19/07/2009");
	
	local tbSay = self.tbZhuHe:MakeOptByProductName("T�i h� mu�n ��i", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end

tbBirthday0905.tbXinwu = tbComposeListForJinNang:new("tbBirthday0905_Compose_chuangguan", tbXinwu)
function tbBirthday0905:OnDailogMain3(nItemIndex, szDescLink)
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.");
	end
	
	self.tbTask:reset_task();
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
--	if not self.tbXinwu then
--		
--	end

	local szTitle = "Ho�t ��ng �T�n v�t khai m�n� di�n ra t� ng�y 19/06/2009 ��n 24:00 19/07/2009.Trong th�i gian n�y c�c v� ��i hi�p c� th� thu th�p c�c t�n v�t �H�ng T�m Ki�m�, �B� V��ng Th��ng�, �Thi�n T�n �ao�, �H� Nh�t Cung� t� c�c ho�t ��ng v��t �i, t�n s�.D�ng c�c t�n v�t n�y �� ��i l�y nhi�u ph�n th��ng h�p d�n.";
	
	local tbSay = self.tbXinwu:MakeOptByProductName("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end

function tbBirthday0905:GetJinnang()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.");
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� nh�n v�t ph�m n�y")
		return
	end
	
	if self.tbTask:if_taked_jinnang() ~= 0 then
		Say("L� Quan"..":".."Ta nh� kh�ng nh�m th� ng��i �� nh�n r�i?",1, "Th�t ng�i qu�! T�i h� qu�n m�t./OnCancel")
		return 
	end
	local tbItem = {szName="C�m nang s� ki�n", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.tbTask.item_expiredtime1, tbParam = {self.tbTask.item_expiredtime1, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Birthday0905")
	self.tbTask:set_task(self.tbTask.tsk_jinnangsj,1);
end


function tbBirthday0905:OnDailogMain4()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.");
	end
	local tbSay = {};
	local szTitle = format("Ho�t ��ng {{s�n b�t nh�m b�o ph�}} di�n ra t� %s  ��n %s. Trong th�i gian n�y ��i hi�p ��nh {{Nh�m b�o ph�}} s� c� th� nh�n ���c nhi�u ph�n th��ng h�p d�n. {{Nh�m b�o ph�}} xu�t hi�n � 7 ��i th�nh th� v� 8 T�n th� th�n. M�i ng�y ��i hi�p ch� c� th� s�n t�i �a 20 {{Nh�m b�o ph�}}.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay);
end


function tbBirthday0905:OnDailogMain5()
	if (self:IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.");
	end
	local tbSay = {};
	local szTitle = format("Ho�t ��ng {{h� tr� t�n th�}} di�n ra t� %s ��n %s. Trong th�i gian n�y c�c v� ��i hi�p c� c�p �� trong kho�ng t� 1-79 c� th� t�i 8 t�n th� th�n � NPC {{Chi�n T�m t�n gi�}} g�n L� Quan nh�n {{H� tr� t�n th�}} v� tham gia ho�t ��ng {{H� tr� t�n th�}}. Tham gia ho�t ��ng h� tr� t�n th� th� c�c v� ��i hi�p s� g�p nhi�u thu�n l�i khi h�nh hi�p  tr�n giang h�.", "19/06/2009", "19/07/2009");
	tinsert(tbSay, 1, "<dec><npc>"..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay);
end

