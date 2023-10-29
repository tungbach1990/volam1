Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function IsInValentineEx()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))	
	if ACTIVITY_STARTTIME <= nDate and nDate <= 20110223 then
		return 1
	end
	Msg2Player("Kh�ng ph�i trong th�i gian di�n ra ho�t ��ng, ��o c� kh�ng c� hi�u l�c")
	return 0
end


function main()
	
	if IsInValentineEx() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end
	
	if pActivity:CheckTask(QingRenLiHeExpLimit,500000000 ,"Th�ng qua L� H�p t�nh Nh�n nh�n ���c t�ng kinh nghi�m �� ��t ��n gi�i h�n","<") ~= 1 then
		return 1
	end
	
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "L� T�nh Nh�n n�m 2011, m� L� H�p T�nh Nh�n")
	pActivity:AddTask(QingRenLiHeExpLimit,5000000)
end