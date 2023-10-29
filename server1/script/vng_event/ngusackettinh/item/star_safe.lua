Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_safe = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return 1
	end
	--  kiem tra han su dung
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	if (tbNSKT_star_safe:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "��i hi�p ��  ��t t�i �a s� d�ng v�t ph�m n�y!")
		return 1 -- khong delete item	
	end
end

function tbNSKT_star_safe:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--khong set task duoc, khong tang thuong, xoa vat pham
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 20e6} --20 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "Ph�n th��ng EXP ng�i sao an l�nh");		
		return 1;
	end
	return 0; --s� d�ng max, kh�ng cho s� d�ng, kh�ng x�a v�t ph�m
end