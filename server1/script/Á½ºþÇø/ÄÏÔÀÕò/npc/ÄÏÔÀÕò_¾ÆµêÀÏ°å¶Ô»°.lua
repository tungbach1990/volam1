--������ ������ �Ƶ��ϰ�Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","V� kh�ch quan n�y xin d�ng b��c, qu�n nh� ch�ng ta kh�ng d�m m� c�a n�a. G�n ��y th� tr�n n�y nhi�u ng��i ch�t m�t c�ch k� l�, ch� ch�ng ta ��y c�ng ch�t m�y ng��i kh�ch qua ���ng. Hi�n t�i quan ph� �ang �i�u tra, ti�u nh�n ��y r�t s� ch�n quan tr��ng n�n kh�ng th� m� c�a ti�p ng�i ���c xin ng�i b� qua cho.")		 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

Say("Sau khi ��c C� ��i Hi�p c�a Ho�nh S�n l�m V� L�m Minh Ch�, nam Nh�c Tr�n nh� c�a ch�ng ta c�ng n�o nhi�t h�n l�n; c�c hi�p kh�ch ki�m hi�p ��n ��y r�t nhi�u, l�m �n bu�n b�n c�a qu�n r��u nh� n�y c�ng ��t h�n tr��c",0);

end;

