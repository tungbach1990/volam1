
Include("\\script\\event\\jiaoshi_jieri\\200910\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\npcdailog.lua")
tbJiaoShi2009.tbHuaDengExpAward = 
{
	{nExp = 3000000},
}

function main()
	local nNpcIndex = GetLastDiagNpc()
	local bUsed = GetNpcParam(nNpcIndex, 1)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	if bUsed == 0 then
		if (PlayerFunLib:CheckTaskDaily(1901,20,"Ki�n th�c c�a ��i hi�p �� r�ng r�i r�i, kh�ng c�n ph�i ki�m tra n�a","<") ~= 1) then
			return
		end
		
		SetNpcParam(nNpcIndex, 1, 1)
		local nNpcIndex = GetLastDiagNpc();
		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
	
		local tbDailog = DailogClass:new(szNpcName)
		
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
		--�����Ի���
		tbDailog:Show()
		
		DelNpc(nNpcIndex)
	end
end


function tbJiaoShi2009:Award()
	PlayerFunLib:AddTaskDaily(1901,1)
	tbAwardTemplet:GiveAwardByList(self.tbHuaDengExpAward, "2009 Teacher's Day HuaDeng ExpAward");
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "huashandengmi")
end

function tbJiaoShi2009:WrongAnswer()
	return 0 --����0���ڼ�������
end