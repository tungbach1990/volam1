--������ ������ ·��6�԰���Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","ta�ta�s� ta sao kh� th�, c�i d�ch b�nh �y �� c��p m�t ng��i v� c�a ta r�i. T� nay v� sau ai n�i d�i t�ng ���ng cho h� Tri�u ��y.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

Say("Ta th�t xui x�o, ��n b�y gi� c�ng ch�a c� con trai, ch�ng l� Tri�u Gia ta th�t ��t �o�n h��ng ho� r�i sao?",0)

end;

