-- С�������		���ʹ��
-- By Spe(2004-01-01)

NUM20E = 2000000000;

function main(nItemIdx)
	if GetLevel() == 200 then
		Msg2Player("��i hi�p c�p 200 kh�ng th� s� d�ng�B�n Nh��c T�m Kinh�.")
		return 1
	end
	local ng, _, np = GetItemProp(nItemIdx);
	
	local exp=GetExp();
	
	if (exp < 0) then
		exp = exp*-1;
		if (ng == 6 and np == 12) then
			if (exp >= NUM20E) then
				exp = NUM20E;
			end
		elseif (ng == 6 and np == 2392) then
			exp = floor (exp / 2);
--		elseif (ng == 6 and np == 2393) then		-- ������ľ� �� 100%����
		end
		
		sutra_addexp(exp)
		Msg2Player("Sau khi nghi�n c�u k� B�t Nh��c T�m Kinh, b�n c�m th�y to�n th�n khoan kho�i, kinh nghi�m th�c chi�n h�i ph�c kh�ng �t. ")
		return 0
	end 
	
	Msg2Player("B�n nghi�n c�u B�t Nh��c T�m Kinh ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
	return 1;
end


function sutra_addexp(n_exp)
	local n_count = 100;
	while (n_exp > 0) do
		if (n_exp >= 20e8) then
			AddOwnExp(20e8);
			n_exp = n_exp - 20e8;
		else
			AddOwnExp(n_exp);
			n_exp = 0;
			break
		end
	end
end
