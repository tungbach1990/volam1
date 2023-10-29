Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "V�t ph�m n�y �� h�t h�n")
		return 0
	end
	
	if IsCharged() ~= 1 then 
		Talk(1,"", "Nh�n v�t �� n�p th� m�i c� th� s� d�ng v�t ph�m n�y.")
		return 1
	end
	
	if GetLevel() < 50 then
		Talk(1,"", "��ng c�p kh�ng �� 50, h�y r�n luy�n th�m")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_USE_TIMES) >= 6 then
		Talk(1,"", "M�i ng�y ch� c� th� s� d�ng v�t ph�m  t�i �a 6 l�n")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("Ch� tr�ng h�nh trang kh�ng �� %d ch�, h�y s�p x�p l�i.", 2))
		return 1
	end
	
	if GetTask(TASKID_CUR_EXP) >= MAX_EXP then
		Talk(1,"","B�n �� ��t ��n gi�i h�n 1500000000 �i�m kinh nghi�m, kh�ng th� ti�p t�c s� d�ng.")
		return 1
	end
		
	local nAddExp = ITEM_EXP
	if GetTask(TASKID_CUR_EXP) + ITEM_EXP > MAX_EXP then
		nAddExp = MAX_EXP - GetTask(TASKID_CUR_EXP) 
	end
	
	SetTask(TASKID_CUR_EXP, GetTask(TASKID_CUR_EXP) + nAddExp)
	SetTask(TASKID_USE_TIMES, GetTask(TASKID_USE_TIMES) + 1)
	AddOwnExp(nAddExp)
	Msg2Player("B�n nh�n ���c "..nAddExp.." �i�m kinh nghi�m.")
end