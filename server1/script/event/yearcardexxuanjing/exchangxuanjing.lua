function onYearCardGift()
	Say( " ", 2, "Ta mu�n nh�n l�nh/year_GetCardGift", "L�t n�a quay l�i/onCancel" )
end

function year_GetCardGift()
	local nCurEPValue = GetExtPoint( 3 );
	if( nCurEPValue >= 1 ) then
		if( nCurEPValue > 32767 ) then
			Say( "D� li�u c� ch�t sai s�t, xin h�y li�n l�c v�i GM �� ���c gi�i quy�t! C�m �n qu� kh�ch �� tham gia ho�t ��ng!", 0 );
		else
			Say("Ng��i x�c ��nh nh�n qu� th� ��u n�m ch�? (Sau khi x�c ��nh xin ��ng r�i m�ng!) ", 2, "X�c nh�n/year_getgiftok", "H�y b� /no");
		end
	else
		Talk( 1, "", "Trong th�i gian di�n ra ho�t ��ng b�n ch�a n�p th� ��u n�m (ho�c �� l�nh qua) , khi n�p th� ��u n�m s� nh�n ���c qu�, ��ng b� l� c� h�i <color=yellow>5 vi�n <color> <color=red>Huy�n Tinh Kho�ng Th�ch c�p 6<color> v� <color=yellow>5 vi�n <color> <color=red> Huy�n Tinh Kho�ng Th�ch c�p 7<color> ��y nh�!" );
	end
end

function year_getgiftok()
	PayExtPoint( 3, 1);
	Msg2Player("�ang l�y qu� th� ��u n�m cho b�n! Trong th�i gian n�y xin ��ng r�i m�ng!")
end

function no()
end