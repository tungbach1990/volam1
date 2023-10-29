

ItemType	=	{{"Y ph�c","Nh�n","D�y chuy�n","Gi�y","Th�t l�ng","N�n","Th� Tr�c","Ng�c B�i"},{1,2,1,1,1,1,1,1}}

function hello()

	Say("Bi�n! Bi�n! Bi�n! Mu�n c� c�p m�t c�a chim �ng, ��i tai c�a lo�i s�i, s�c m�nh c�a lo�i g�u, mu�n l�m vua c�a lo�i v�t? � ��y ta s� cho ng��i ��c m� th�nh hi�n th�t.",3,"C� th�n k� v�y kh�ng? �� ta th� xem/exchange_mask", "Hay th�t ��! N�i ra xem th� �i!/about","��ng x�o n�a, ta kh�ng tin ��u!/no")

end

function exchange_mask()

	GiveItemUI( "K� Tr�n b�o v�t", "Ng��i ph�i chu�n b� ngo�i v� kh� l� 9 b� <color=blue>trang b� m�u xanh <color> v� <color=blue>20 v�n <color>ng�n l��ng, th� c� c� h�i nh�n ���c m�t M�t n� th�n k�. Xin ch� �, khi ��i M�t n� c� th�nh c�ng hay kh�ng th� trang b� v� ng�n l��ng c�ng s� bi�n m�t!", "exchange_mask_Confirm", "onCancel" );
	
end

function exchange_mask_Confirm( nCount )

	isItemType = {0,0,0,0,0,0,0,0}
	if ( nCount ~= 9 ) then
		Say("Xin h�y ki�m tra l�i, trang b� ng��i ��a ta kh�ng ph� h�p v�i y�u c�u!",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
			if ( ItemGenre ~= 0 ) then
				Say("Xin h�y ki�m tra l�i, trang b� ng��i ��a ta kh�ng ph� h�p v�i y�u c�u!",0)
				return 0
			elseif ( DetailType == 0 ) then
				Say("B�n ba giang h� kh�ng ph�i chuy�n d� ��u, thi�u hi�p h�y gi� l�y v� kh� �� ph�ng th�n �i",0)
				return 0
			elseif ( DetailType == 10 ) then
				Say("�i ���ng m�t m�i th� n�y, tr�ng s� c�n con ng�a n�y h�n ta ��!",0)
				return 0
			elseif ( DetailType == 11 ) then
				Say("� ��y ta nhi�u M�t n� l�m, �� b�n t� l�y v�y!",0)
				return 0
			elseif ( DetailType > 11 ) then
				Say("Xin h�y ki�m tra l�i, trang b� ng��i ��a ta kh�ng ph� h�p v�i y�u c�u!",0)
				return 0
			else
				if ( magictype == 0 ) then
					Say("V�i kinh nghi�m bu�n b�n l�u n�m c�a Ta mu�n �em trang b� m�u tr�ng qua m�t ta �h, kh�ng d� ��u!",0)
					return 0
				else
					isItemType[DetailType - 1] = isItemType[DetailType - 1] + 1
				end
			end
		end
	end
	if ( (ItemType[2][1] == isItemType[1]) and (ItemType[2][2] == isItemType[2]) and (ItemType[2][3] == isItemType[3]) and (ItemType[2][4] == isItemType[4]) and (ItemType[2][5] == isItemType[5]) and (ItemType[2][6] == isItemType[6]) and (ItemType[2][7] == isItemType[7]) and (ItemType[2][8] == isItemType[8]) ) then
		onPay = 200000
		if ( GetCash() < onPay ) then
			Say("M�t n� c�a ta kh�ng gi�ng nh� c�c th� kh�c ��u, 20 v�n l��ng l� r� r�i ��y, c� ti�n r�i h�y ��n t�m ta �i!",1,"���c! �� ta v� l�y ti�n, nh� �� l�i cho ta m�t c�i ��y!")
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
		iGive = random (1,400000)
		if ( iGive < 10000 ) then
			AddItem(0,11,23,0,0,0,0)     --������
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
			
		elseif ( iGive < 20000 ) then
			AddItem(0,11,31,0,0,0,0)     --ѩ��
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		elseif ( iGive < 40000 ) then
			AddItem(0,11,38,0,0,0,0)     --����
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		elseif ( iGive < 50000 ) then
			AddItem(0,11,61,0,0,0,0)     --��˿��
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		elseif ( iGive < 60000 ) then
			AddItem(0,11,63,0,0,0,0)     --ѩ��
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		elseif ( iGive < 70000 ) then
			AddItem(0,11,65,0,0,0,0)     --÷��¹
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		elseif ( iGive < 80000 ) then
			AddItem(0,11,66,0,0,0,0)     --����
			Say("T�t l�m! Xin l�y M�t n� n�y!",0)
		else
			Say("Gi� n�y t�i phi�n ta, xem nh� ng��i �� u�ng c�ng r�i!",1,"Xem nh� ta kh�ng may v�y! �� t�m tr�ng ta t�t h�n r�i m�i ��n t�m ng��i!/no")

		end
	else
		Talk(1,"","Xin h�y ki�m tra l�i, trang b� ng��i ��a ta kh�ng ph� h�p v�i y�u c�u!")
	end
	
end

function about()

	Say("Ng��i ph�i chu�n b� ngo�i v� kh� l� 9 b� <color=blue>trang b� m�u xanh <color> v� <color=blue>20 v�n <color>ng�n l��ng, th� c� c� h�i nh�n ���c m�t M�t n� th�n k�. Xin ch� �, khi ��i M�t n� c� th�nh c�ng hay kh�ng th� trang b� v� ng�n l��ng c�ng s� bi�n m�t!",1,"Oh! Ta hi�u r�i, c�m �n!/no")
end


function no()

end
