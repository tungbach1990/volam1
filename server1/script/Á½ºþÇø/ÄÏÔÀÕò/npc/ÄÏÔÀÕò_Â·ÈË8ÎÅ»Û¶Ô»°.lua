--������ ������ ·��8�Ż۶Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","C�i b�nh d�ch qu�i �c n�y �� phong t�a ���ng l�n n�i Ho�nh S�n, l�m ta h�t ���c di�n ki�n ��c C� ��i Hi�p r�i.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

Say("Ng��i c�ng l�n n�i b�i ki�n ��c C� ��i hi�p sao? Nh�ng �ng �y l� th�n t��ng c�a ta. G�p ���c �ng ta, phi�n �ng �y vi�t cho ta m�t ch� ",0)

end;

