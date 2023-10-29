Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_BowBox = {}
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1 or tbVNG_WomenDay2011:IsActive() ~= 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_BowBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_BowBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 150 v� ��  n�p th�."
	end
	
	if tbVNGWD2011_ItemHead:checkBag(3) ~= 1 then
		return 0, "�� b�o v� t�i s�n, xin vui l�ng ch�a 3 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!"
	end		
	
	local tbAward = {szName="Chi�c N�",tbProp={6,1,30099,1,0,0},nCount=3,nExpiredTime=20110314}
	tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][S� d�ng H�p N�]")
	return 1
end