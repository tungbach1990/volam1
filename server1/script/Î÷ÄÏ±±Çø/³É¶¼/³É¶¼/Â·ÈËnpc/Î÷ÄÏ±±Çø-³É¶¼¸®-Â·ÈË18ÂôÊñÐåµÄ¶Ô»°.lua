--���ϱ��� �ɶ��� ·��18������ĶԻ�
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2)
	if (UTask_tm == 10*256+20) then			--����ʮ�����������
		Talk(2, "", "Ta b�n � ��y ��u l� h�ng th�u T� Xuy�n c�a danh gia T�n Uy�n. C� �y r�t n�i ti�ng � ph� Th�nh �� n�y, ���ng kim m�i ch� r�t kh�o, ��ng ��u c� ph�, Nh� c� ta � g�n qu�n tr� Ph� dung phia ��ng nam th�nh. ", "�� l� danh gia th�u, ch�c h�n trong nh� kim th�u kh�ng thi�u, c� l� c� �y � �� c� th� nghe ���c m�t s� tin t�c v� Ma V� Ch�m.")
		AddNote("T�i ch� Mai N��ng ���c bi�t Danh gia th�u l�a T� Xuy�n T�n Uy�n c� ���ng kim m�i ch� r�t k� t�i, � g�n qu�n tr� Ph� Dung ph�a ��ng nam th�nh. ")
		SetTask(2,10*256+30)
	elseif (UTask_tm == 10*256+30) then			--����ʮ�����������
		Talk(1, "", "Ta b�n � ��y ��u l� h�ng th�u T� Xuy�n c�a danh gia T�n Uy�n. C� �y r�t n�i ti�ng � ph� Th�nh �� n�y, ���ng kim m�i ch� r�t kh�o, ��ng ��u c� ph�, Nh� c� ta � g�n qu�n tr� Ph� dung phia ��ng nam th�nh. ")
	elseif (random(0,1) == 0) then
		Talk(1,"","Ng��i � ��u ��n v�y? H�ng th�u T� Xuy�n n�y l� 'Th�c Trung Chi B�o' c�a ch�ng ta, ng��i th� nh�n xem, ���ng may ho�n ch�nh, ���ng c�t b�ng nho�ng, ch�t ch� �m d�u, ��y ��ng l� th� c�ng th��ng h�ng ��, mua m�t c�i v� l�m k� ni�m �i!")
	else
		Talk(1,"","Th�ch b� 'ph� dung l� ng�' kh�ng? C� th�y th�u gi�ng y nh� th�t kh�ng?")
	end
end;
