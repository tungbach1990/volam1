Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")

 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","B�n �ang s� d�ng v�t ph�m !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","S� d�ng v�ng hoa ��t t�i �a �i�m kinh nghi�m !")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","��ng c�p nh� h�n 50 kh�ng th� s� d�ng !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
			return 1
	end
	Create_main(nItemIndex)
	--WriteLog(date("%Y%m%d %H%M%S").."\t".."H�nh Hi�p K�"..GetAccount().."\t"..GetName().."\t".."S� d�ng Thi�n H�o K� ")	
end