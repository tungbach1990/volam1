Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")
tbCTL = 
{
	{szName = "C�ng Tr�ng L�nh", tbProp = {6,1, 30048,1,0,0}, nExpiredTime = 20101025, nCount = 1},
}
function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	if (GetLevel() < 50) then
		Talk(1, "", "��ng c�p nh� h�n 50 kh�ng th� s� d�ng !");
		return 1
	end
	if CalcFreeItemCellCount() < 10 then
			Talk(1, "", "H�nh trang kh�ng �� 10 � tr�ng.");
			return 1
	end
	local nGenre, nDetailType, nPartType = GetItemProp(nItemIndex)
	if (nPartType == 30052) then
		TieuLongControl()
	else
		TrungDaiLongControl(nPartType)
	end
	
end

function TieuLongControl()
	if (GetTask(Task_Use_TieuLong) >= 1000) then
		Talk(1, "", "(�� s� d�ng t�i �a v�t ph�m n�y. Kh�ng th� s� d�ng th�m ���c n�a !.");
		return 1
	end
	SetTask(Task_Use_TieuLong, GetTask(Task_Use_TieuLong) + 1)
	tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 N�m Th�ng Long, Use Ti�u Long");
	AddOwnExp(2000000)
	Msg2Player("Ban nh�n ���c 2000000 �i�m kinh nghi�m")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."S� D�ng Ti�u Long nh�n 2000000 �i�m EXP ")
end
function TrungDaiLongControl(nPartType)
	if (GetTask(Task_Use_TrungDaiLong) >= 60000) then
		Talk(1, "", "(�� s� d�ng t�i �a v�t ph�m n�y. Kh�ng th� s� d�ng th�m ���c n�a !.");
		return 1
	end
	if (nPartType == 30054) then--neu la dai long
		tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 N�m Th�ng Long, Use ��i Long");		
		tbAwardTemplet:GiveAwardByList(tbAwardItemUseDaiLong, "Event 1000 N�m Th�ng Long");
		local nExp, nTaskValue = GetValueByRandom(tbAwardExp)
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + nTaskValue)
		AddOwnExp(nExp)
		Msg2Player(format("��i hi�p nh�n ���c %d �i�m kinh nghi�m", nExp))
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."S� D�ng Trung Long nh�n �i�m EXP  " .. nExp)
	else
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + 20)
		AddOwnExp(2000000)
		Msg2Player("��i hi�p nh�n ���c 2000000 �i�m kinh nghi�m !")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."S� D�ng Trung Long nh�n �i�m EXP 2000000")
	end
	
	
end
