--��ԭ���� ������ ·��С�ܵĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)

--ʹ�ñ���: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 1) then
		Talk(2,"","Ti�u huynh ��, c� th�y chi�c nh�n c�a Song Song t� t� kh�ng?","Ta th�y ng��i �n m�y ph�a T�y tr�n nh�t ���c m�t chi�c nh�n, kh�ng bi�t c� ph�i c�a Song Song t� t� kh�ng?")
		AddNote("Chi�c nh�n c�a Song Song c� n��ng c� th� �� b� ng��i �n m�y l�y �i. ")
		SetTask(68,2)
		Msg2Player("Chi�c nh�n c�a Song Song c� n��ng c� th� �� b� ng��i �n m�y l�y �i. ")
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","Song Song t� t� r�t t�t v�i ta.")
		else
			Talk(1,"","a c�m th�y ng��i �n m�y � ph�a T�y tr�n c� c�i g� �� h�i k� qu�i.")
		end
	end
end;
