--������ ������ ��ջ�ϰ�Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Kh�ch quan xin m�i v�o, ��ng s�, ��ng s�, tuy trong s�nh ���ng c� m�y c�i quan t�i nh�ng ch�ng ta v�n m� c�a ��n kh�c ��ng �� � ��n m�y v� d�ch b�nh �y. C�i g�? ta kh�ng s� m�i l� ��, l� l�n ra ch�t m�t ��ng th� sao ��y. Hihihi, ti�u �i�m ��y an to�n m�, ���ng nhi�n trong th�i bu�i lo�n l�c n�y ti�n thu� ph�ng c� h�i cao m�t ch�t ��y.")		 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end
	
Say("Ng��i c�ng l�n n�i b�i ki�n ��c C� ��i hi�p sao? Nh�ng �ng �y l� th�n t��ng c�a ta. G�p ���c �ng ta, phi�n �ng �y vi�t cho ta m�t ch� ",0);

end;

