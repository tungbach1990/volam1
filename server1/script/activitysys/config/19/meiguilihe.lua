Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function main()
	
	if IsInValentine() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end
	
	if pActivity:CheckTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,1000000000,"Th�ng qua L� H�p Hoa H�ng v� L� H�p T��ng T� nh�n ���c t�ng kinh nghi�m �� ��t ��n gi�i h�n","<") ~= 1 then
		return 1
	end
	
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "L� T�nh Nh�n n�m 2011, m� L� H�p T�nh Nh�n")
	pActivity:AddTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,5000000)
	
end