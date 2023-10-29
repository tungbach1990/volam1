-------------------------------------------------------------------------
-- FileName		:	honor_master.lua
-- Author		:	zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   ����npc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\task\\system\\task_string.lua" )
Include("\\script\\lib\\awardtemplet.lua")


tbHonor_Sys_2009.nHonor_QuestTime_Task = 2599
tbHonor_Sys_2009.nHonor_QuestChance_Task = 2600 -- 0 û�д��������, 1 ��һ�δ������, 2 �����δ��������, 3 û������, 4�����������콱�� 

tbHonor_Sys_2009.tbMasterContent = 
{
	strTalk1 = "<dec><npc>Ta l� ���ng ch� � ��y, n�i ��y ��t nh�ng b�c �i�u kh�c c�a th�p ��i cao th� ���ng ��i. Ng��i c� th� t�y � tham quan nh�ng kh�ng ���c l�m h� h�ng b�t c� th� g� trong ��. Ngo�i ra t�i ��y c� 1 nhi�m v� nh�, ng��i c� mu�n tham gia kh�ng?",
	strTalk2 = "<dec><npc>N�i ��y ���c g�i l� Danh Nh�n ���ng v� c�ng l� n�i vinh danh c�c ��i cao th� trong v� l�m, ch� c�n ���c th� gian c�ng nh�n l� cao th� th� � n�i ��y s� c� m�t b�c t��ng m� c�c nh�n s� kh�c ph�i ao ��c.",
	strTalk3 = "<dec><npc>Nhi�m v� n�y r�t ��n gi�n, ng��i �i quan s�t nh�ng b�c t��ng kia l� ai r�i quay tr� v� ��y t�m ta, ta s� h�i m�t s� c�u. Tr� l�i ��ng th� ph�n th��ng s� thu�c v� ng��i!",
	strTalk4 = "<dec><npc>Ng��i �i nhanh th�? �� chu�n b� xong ch�a?",
	strTalk5 = "<dec><npc>H�m nay ng��i c� <color=green>%d<color> c� h�i tr� l�i c�u h�i <enter>Trong b�ng x�p h�ng giang h� <color=yellow>%s<color> ng��i th�<color=yellow>%d<color> l� ai?",
	strTalk6 = "<dec><npc>H�m nay �� tr� l�i c�u h�i n�y r�i, xin ��i ng�y mai h�y ti�p t�c.",
	strTalk7 = "<dec><npc>Ch�c m�ng c�u tr� l�i ��ng!",
	strTalk8 = "<dec><npc>Th�t ��ng ti�c! C�u tr� l�i kh�ng ch�nh x�c, ng�y mai h�y ��n l�i nh�!",
	strTalk9 = "<dec><npc>Ch�c m�ng ��i hi�p �� �o�n ��ng c�u h�i! Nh�ng h�nh trang kh�ng �� ch�, xin m�i �� th�a  <color=green>3<color> � tr�ng trong h�nh trang r�i ��n nh�n l�i nh�!",
	strSelect1 = "Xin h�i ��y l� n�i n�o?/#tbHonor_Sys_2009:master_introduce()",
	strSelect2 = "Ta mu�n nh�n nhi�m v�/#tbHonor_Sys_2009:master_quest()",
	strSelect3 = "C�u h�i th�t ��n gi�n, ta �i xong v� ngay./#tbHonor_Sys_2009:accept_quest()",
	strSelect4 = "�� chu�n b� xong/#tbHonor_Sys_2009:doing_quest()",
	strReturn = "Ta c�n m�t s� v�n �� c�n h�i/#tbHonor_Sys_2009:master_main()",
	strCancel1 = "K�t th�c ��i tho�i/#tbHonor_Sys_2009:master_onCancel()",
	strCancel2 = "B�y gi� ta c� ch�t vi�c b�n, s� quay l�i sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel3 = "Ta c�n m�t s� vi�c kh�c, s� quay l�i sau./#tbHonor_Sys_2009:master_onCancel()",
	strCancel4 = "Ta v�n ch�a chu�n b� xong./#tbHonor_Sys_2009:master_onCancel()",
}

tbHonor_Sys_2009.tb_reward = 
{
    {
        {szName = "Ti�n Th�o L� ", tbProp={6, 1, 71, 1, 0, 0}, nCount = 3, nBindState = -2}
    }
}
	

function main()
	tbHonor_Sys_2009:master_main()
end

function tbHonor_Sys_2009:master_main()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect1;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_introduce()
	local tbTalk = {};
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk2;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strReturn;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:master_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	local tbTalk = {};
	
	if (nQuestChance == 3) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect3;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel2;
	elseif (nQuestChance == 1 or nQuestChance == 2) then
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strSelect4;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel3;
	elseif (nQuestChance == 4) then
		self:give_reward();
		return
	else
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk6;
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
	end
	
	CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:accept_quest()
	self:reset_task();
	SetTask(self.nHonor_QuestChance_Task, 2);
end

function tbHonor_Sys_2009:doing_quest()
	self:reset_task();
	
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
        local tbTalk = {};
		local tbLadder;
		local nLimit = 100;
	
		repeat
		    local nPos = random(1,getn(self.tbHonor_Ladder_List));
		    tbLadder = self.tbHonor_Ladder_List[nPos];
		    nLimit = nLimit - 1;
		until tbLadder.nCount ~= 0 or nLimit <= 0
		
		local nTotal = tbLadder.nCount;

		if (nTotal == 0) then
		    return
		end
		
		local nTotalSelection = min(nTotal, 4);

		local nRightIdx = random(1, nTotalSelection);

		local i = 1;
		local k = 1;
		local tbSelect = {};
		while i <= nTotalSelection do
		    local nPos = random(1, nTotal);
		    local bNewPos = 1;

	        for k = 1, nTotalSelection do
	            if(nPos == tbSelect[k])then
	                bNewPos = 0;
	            end
	        end
	        if bNewPos == 1 then
	            tbSelect[i] = nPos;
	            if (i == nRightIdx)then
	                tbTalk[1] = format(self.tbMasterContent.strTalk5, nQuestChance, tbLadder.strName, nPos);
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:right_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            else
	                tbTalk[i + 1] = format("%s/#tbHonor_Sys_2009:wrong_answer()", tbLadder.tbLadder[nPos].strPlayerName);
	            end
	            i = i + 1;
	        end
		end
		tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel4;
        CreateTaskSay(tbTalk);
	end
	
end

function tbHonor_Sys_2009:right_answer()
	self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	
	if (nQuestChance == 2 or nQuestChance == 1) then
		SetTask(self.nHonor_QuestChance_Task, 4);
		local tbTalk = {};
		if (CalcFreeItemCellCount() >= 3) then
		    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk7;
		    self:give_reward();
        else
            tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
		end

	    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
        CreateTaskSay(tbTalk);
	end
end

function tbHonor_Sys_2009:wrong_answer()
    self:reset_task();
    local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
    
    if (nQuestChance == 2) then
        SetTask(self.nHonor_QuestChance_Task, 1);
        self:doing_quest()
        return
    end
    
    local tbTalk = {};
	SetTask(self.nHonor_QuestChance_Task, 0);
    tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk8;
	tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
    CreateTaskSay(tbTalk);
end

function tbHonor_Sys_2009:give_reward()
    self:reset_task();

	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);

	if (nQuestChance == 4) then
	    if (CalcFreeItemCellCount() < 3) then
	        local tbTalk = {};
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strTalk9;
	        tbTalk[getn(tbTalk)+1] = self.tbMasterContent.strCancel1;
            CreateTaskSay(tbTalk);
        else
            tbAwardTemplet:GiveAwardByList(self.tb_reward, "Honor System Answer Reward");
	        SetTask(self.nHonor_QuestChance_Task, 0);
	    end
	end
end

function tbHonor_Sys_2009:reset_task()
    local nQuestTime = GetTask(self.nHonor_QuestTime_Task);
	local nQuestChance = GetTask(self.nHonor_QuestChance_Task);
	local nCurTime = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nQuestTime ~= nCurTime) then
	    nQuestTime = nCurTime;
	    nQuestChance = 3; -- û������״̬
	    SetTask(self.nHonor_QuestTime_Task, nQuestTime);
	    SetTask(self.nHonor_QuestChance_Task, nQuestChance);
	end
end

function tbHonor_Sys_2009:master_onCancel()

end