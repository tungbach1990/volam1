MONEY_ADDLIFETIME = 1000000

function main()
	Say("Th� cho ph�ng t�n g�u"..",".."Xin ��t t�n ".."!", 2, "���c th�i! �� ta nh�p v�o/pay_chatroom_enter","K�t th�c ��i tho�i/OnCancel");
	return 1;
end

function pay_chatroom_enter()
	AskClientForString("pay_chatroom_time", "", 1, 20, "Xin ��t t�n "); 
end

function pay_chatroom_time(roomname)

	-- �����ҳ�ֵ����Ҫ����
	if (ChatRoom_FindRoom(roomname) == 0) then
		Msg2Player("<#>t�n " .. roomname .. "n�y kh�ng t�n t�i")
	else
		ChatRoom_AddTime(roomname)
	end
end


function OnCancel()
end
