--description: �������ʦ���� ���ݵ�����
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 60*256+20) and (HaveItem(101) == 1) then
		DelItem(101)
		Talk(2,"","R��ng b�u tr�ng kh�ng, 'Thi�n V��ng Di Th�' �� b� ng��i Kim l�y �i ","Tr�n ��t c� m�t s� d�u ch�n h��ng v� S�n ��ng Thanh La ��o, xem ra b�n s�t th� r�i kh�i ch�a bao l�u. ")
		SetTask(3, 60*256+40)
		AddNote("M� r��ng b�u ph�a B�c h�, m�i bi�t Thi�n V��ng Di Th� �� b� b�n s�t th� ng��i n��c Kim l�y �i. ")
	elseif (UTask_tw == 60*256+40) then
		Talk(1,"","R��ng b�u tr�ng kh�ng. ")
	else
		Talk(1,"","Kh�ng c� ch�a kh�a, kh�ng m� ���c r��ng.")
	end
end;
