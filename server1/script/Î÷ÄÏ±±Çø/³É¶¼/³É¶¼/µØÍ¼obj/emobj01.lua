--description: ���ϱ��� �ɶ��� ������10������������
--author: yuanlan	
--date: 2003/5/24

function main()
	SetPropState()
	AddEventItem(118)
	Msg2Player("Nh�t ���c m�t mi�ng L��ng Ng�n Kho�ng. ")
	if (GetTask(1) > 10*256) and (GetTask(1) < 20*256) then
		AddNote("T�m th�y m�t mi�ng L��ng Ng�n Kho�ng trong khu r�ng � ph�a t�y Th�nh ��. ")
	end
end;
