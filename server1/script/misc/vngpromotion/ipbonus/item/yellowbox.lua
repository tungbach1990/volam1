Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "V�t ph�m n�y �� h�t h�n")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "��ng c�p kh�ng �� 50, h�y r�n luy�n th�m")
		return 1
	end
	
	local nMonth = tonumber(date("%m"))
	if GetByte(GetTask(TASKID_YELLOW_USE_DATE),1) == nMonth then
		Talk(1,"", "M�i th�ng ch� c� th� s� d�ng v�t ph�m  t�i �a 1 l�n")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("Ch� tr�ng h�nh trang kh�ng �� %d ch�, h�y s�p x�p l�i.", 2))
		return 1
	end
	
	local nAddExp = YELLOW_ITEM_EXP
	SetTask(TASKID_YELLOW_USE_DATE, SetByte(GetTask(TASKID_USE_TIMES),1,nMonth))
	AddOwnExp(nAddExp)
	Msg2Player("B�n nh�n ���c "..nAddExp.." �i�m kinh nghi�m.")
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","s� d�ng Ho�ng B�o H�p",GetAccount(),GetName()))		
	return 0;
end