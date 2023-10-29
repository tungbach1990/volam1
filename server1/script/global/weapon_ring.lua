--�ø������ʵ�֣������������������ľ��ˮ���������и�һ�����ɻ�ȡһ��������ָ
--designed by yangqi
--written by renbin

function weapon_ring()

	Say("G�n ��y nh�n qu� tr�n giang h� hi�m, ta nh�n c� h�i �i h�c ph��ng ph�p l�m nh�n, ch� c�n ng��i chu�n b� m�t b� v� kh� c� �� 5 thu�c t�nh ng� h�nh v� 10 v�n l��ng, ta s� gi�p ��i m�t nh�n thu�c t�nh m�u xanh, ng��i mu�n ��i kh�ng?",3,"���c, ta �ang c�n m�t chi�c nh�n ��y!/exchange_weapon","�� ta t�m hi�u c�i ��!/weapon_help","Th�i b� �i, ta c� nh�n r�i!/no")

end

function exchange_weapon()

	GiveItemUI( "V� kh� ng� h�nh ��i nh�n", "B�n c�n chu�n b� v� kh� ng� h�nh ph�n bi�t c� Kim, M�c, Th�y, H�a, Th�, ch� c�n <color=blue>��y �� ng� h�nh<color>, ��ng th�i ph�i c�<color=blue> thu�c t�nh m�u xanh<color>, th� c� th� ��i ���c m�t chi�c nh�n.<color=blue> ��ng c�p v� kh� v� ch�ng lo�i kh�ng c� h�n ch�, m�i l�n nh� v�y ch� t�n 10 v�n l��ng, x�c su�t 100%.<color>", "weapon_ring_Confirm", "onCancel" );
	
end

function weapon_ring_Confirm( nCount )

	onSeries = {1,1,1,1,1}
	if ( nCount ~= 5 ) then						--are there 5 weapons
		Say("Xin ki�m tra k�, v� kh� b�n ��a ta kh�ng ph� h�p y�u c�u!",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )		--get itemindex
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)	--get magic attrib
--			Msg2Player("nSeries = "..nSeries)
--			Msg2Player("magictype = "..magictype)
			if ( ItemGenre ~= 0 ) then
				Say("Xin ki�m tra k�, v� kh� b�n ��a ta kh�ng ph� h�p y�u c�u!",0)
				return 0
			elseif ( DetailType ~= 0 and DetailType ~= 1) then					--is it weapon
				Say("Xin ki�m tra k�, v� kh� b�n ��a ta kh�ng ph� h�p y�u c�u!",0)
				return 0
			elseif ( magictype == 0 ) then
				Say("V�i kinh nghi�m bu�n b�n l�u n�m c�a Ta mu�n �em trang b� m�u tr�ng qua m�t ta �h, kh�ng d� ��u!",0)
				return 0
			elseif ( nSeries < 0 and nSeries > 4 ) then			--exception
				Say("Trang b� c�a ng��i l� qu� �i! Tr� l�i cho ng��i!",0)
				return 0
			elseif ( onSeries[nSeries + 1] == 0 ) then				--���������Ƿ���ȫ
				Say("Xin ki�m tra k�, v� kh� ng��i ��a ta kh�ng �� thu�c t�nh ng� h�nh!",0)
				return 0
			else
				onSeries[nSeries + 1] = 0
			end
		end
			onPay = 100000
			if ( GetCash() < onPay ) then
				Say("Kh�ng c� ti�n th� kh�ng ���c r�i, m�y m�n �� n�y sao ��i ���c nh�n ��y!",0)
				return 0
			end
			for i = 1, nCount do
		
				nItemIndex = GetGiveItemUnit( i )
				k = RemoveItemByIndex( nItemIndex )
				if ( k ~= 1 ) then
					Say("Chuy�n g� v�y, sao ng��i c� th� g�t ta?",0)
					return 0
				end
			
			end
			Pay( onPay )
			local _nSeed = SetRandSeed(234)					--�̶��Ľ�ָ
			AddItem(0,3,0,1,0,0,1,0,0,0,0,0)     			--��ָ
			SetRandSeed(_nSeed)
			Say("Uhm~�� c�a ng��i �� ���c x�c ��nh, ta nh�n ��y, chi�c nh�n n�y l� c�a ng��i!",0)
		
	end
	
end

function weapon_help()

	Say("B�n c�n chu�n b� v� kh� ng� h�nh ph�n bi�t c� Kim, M�c, Th�y, H�a, Th�, ch� c�n <color=blue>��y �� ng� h�nh<color>, ��ng th�i ph�i c�<color=blue> thu�c t�nh m�u xanh<color>, th� c� th� ��i ���c m�t chi�c nh�n.<color=blue> ��ng c�p v� kh� v� ch�ng lo�i kh�ng c� h�n ch�, m�i l�n nh� v�y ch� t�n 10 v�n l��ng, x�c su�t 100%.<color>",1,"Oh! Ta hi�u r�i, c�m �n!/no")

end


function no()

end
