--description: ������������
--author: yuanlan
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40������
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 0) then		-- ����������
			Talk(4,"","L�o ��i gia, ��y l� L�c Th� Quy ng��i c�u ���c �?","��ng! H�m nay th�t may m�n! ��y kh�ng ph�i l� chuy�n c� th� d� d�ng g�p��u!","T�i h� �ang c�n d�ng n� �� l�m thu�c gi�i c�u ng��i, l�o c� th� �� l�i n� cho ta kh�ng?","Ta h�m nay mang m�i c�u t�i h�nh nh� l� kh�ng ��, ng��ic� th� t�m cho ta v�i con giun th� ta s� t�ng n� cho ng��i!")
			AddNote("Ti�p nh�n nhi�m v� t�m giun ��t v� ��i r�a L�c M�o ")
			Msg2Player("T�m m�y con giun ��t v� cho L�o Ng� �ng m�i c� th� ��i ���c r�a L�c M�o ")
			SetTask(14,1)
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 1) then
			Talk(3, "", "Th� n�o? �� c� giun ch�a?", "L�o ��i gia! Ng��i xem ��y �� �� ch�a?", "T�t! L�c Th� Quy n�y t�ng cho ng��i!")
			DelItem(150)
			AddEventItem(94)
			Msg2Player("T�m ���c r�a L�c M�o ")
			SetTask(14,10)
			AddNote("�em con giun ��t t�ng cho �i�u Ng� �ng �� ���c r�a L�c M�o ")
		elseif (UTask_tw40sub >= 10) then
			if (HaveItem(94) == 0) then
				AddEventItem(94)
				Talk(2,"","L�o ��i gia! L�c Th� Quy �ng t�ng cho ta,ta l�m m�t r�i!","�i! Ng��i sao m� t�ts�m th�! Ta m�i v�a c�u ���c m�t con, ng��ic�m �i c�u ng��i!")
			else
				Talk(1,"","L�o H�n ta m�i ng�y ��u c�u � ��y, c� � ��y ��u bi�t ta")
			end
		else
			if (UTask_tw40sub ~= 0) and (UTask_tw40sub ~= 1) and (UTask_tw40sub ~= 3) and (UTask_tw40sub ~= 5) and (UTask_tw40sub ~= 7) and (UTask_tw40sub ~= 9) and (UTask_tw40sub ~= 10) then
				SetTask(14,0)
				Talk(1,"","Ti�u t�! Xem kh� s�c c�a ng��i kh�ng t�t l�m. Tr��c h�t h�y ng�i xu�ng ngh� ng�i m�t ch�t,c� g� t� t� m� n�i. ")
			else
				Talk(1,"","T�m cho ta m�y con giun ��t, th� ta s� cho ng��i L�c Th� Quy. ")
			end
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nh� nh�! ��ng l�m ��ng c� c�a ta! ")
		else
			Talk(1,"","L�o H�n ta m�i ng�y ��u c�u � ��y, c� � ��y ��u bi�t ta")
		end
	end
end;
