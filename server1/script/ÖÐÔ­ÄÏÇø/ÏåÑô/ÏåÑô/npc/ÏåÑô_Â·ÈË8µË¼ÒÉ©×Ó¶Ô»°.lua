--description: ��ԭ���� ������ ·��8�˼�ɩ�ӶԻ� �䵱��50������
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 50*256+50) then 
		Talk(3, "select", "Nh� ta kh�ng c�n g� �� �n, nh�n con nh� lu�n mi�ng k�u ��i, l�m m� nh� ta th�t r�t �au l�ng!", "��i t�u, ta ��y c� 1 v�n l��ng. T�u mau nh�n �i! Ch� c�n c� �� t� V� �ang ta � ��y, c�c ng��i s� kh�ng ph�i ch�u ��i l�nh n�a!", "�i da,ta qu� l� g�p ���c b� t�t s�ng r�i! Ta �ang t�nh hay m�? B�y gi� c�n c� ng��i t�t v�y sao?")
	elseif (UTask_wd > 50*256+50) then
		Talk(1,"","C�c ��i hi�p tr�n V� �ang s�n th�t l� b� t�t s�ng c�u m�ng b�n ng��i c�ng kh� ta! N�u h� kh�ng th��ng gi�p ��, m� con ta ch�c �� ch�t ��i m�t r�i!")
	else
		Talk(1,"","Nh� ta kh�ng c�n g� �� �n, nh�n con nh� lu�n mi�ng k�u ��i, l�m m� nh� ta th�t r�t �au l�ng!")
	end
end;

function select()
	if (GetCash() >= 10000) then
		Pay(10000)
		Msg2Player("�em to�n b� m�t v�n l�ng b�c c��p ���c trao cho con d�u ��ng gia ")
		SetTask(5, 50*256+80)
		AddNote("�em to�n b� m�t v�n l�ng b�c c��p ���c trao cho con d�u ��ng gia ")
	else
		Talk(1,"","Th�t t�! 1 v�n l��ng �� ta �� d�ng m�t r�i, th� n�y th� l�m sao m�i ph�i ��y?Ta ph�i �i ki�m ch�t ng�n l��ng!")
		AddNote("Ng�n l��ng kh�ng ��, �i ki�m ti�n tr��c. ")
	end
end;
