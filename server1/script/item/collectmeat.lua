 Include("\\script\\task\\newtask\\newtask_head.lua")
 
function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end
 
function PickUp( nItemIndex )
	local Uworld1065 = nt_getTask(1065)+1
	local Uworld1066 = nt_getTask(1066)
	local Uworld1000 = nt_getTask(1000)
	nt_setTask(1065,Uworld1065)
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then 
		Msg2Player("B�n �� nh�n ���c 3 mi�ng th�t t��i, c� th� ��i tho�i v�i V� s�..")
	elseif ( Uworld1000 == 180) and ( Uworld1065 >= 5 ) then
		Msg2Player("B�n �� nh�n ���c 5 mi�ng th�t t��i, c� th� ��i tho�i v�i V� s�..")
	elseif ( Uworld1065 == 1 ) and ( Uworld1066 == 0 ) then
		Msg2Player("B�n c� th� ��n c�c V� s� � c�c T�n Th� Th�n nh�n 1 v�i nhi�m v� mua b�n th�t t��i. Khi b�n l�m nhi�m v� n�y c� th� ���c ti�n v� danh v�ng.")
	elseif ( Uworld1066 ~= 0 ) then
		if ( Uworld1066 == Uworld1065 ) then
			Msg2Player("B�n �� nh�n ���c �� th�t t��i, c� th� tr� v� t�m V� s� giao nhi�m v�.")
		end
	end
	return 0 ; --ɾ����Ʒ
end