--������ ������ ·��4����淶Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Huhuhu,huhu�m� �i, m� m�t r�i, trong tr�n b�y gi� c�ng ng�y c�ng nhi�u ng��i ch�t nh�ng kh�ng bi�t nguy�n do. �ng tr�i �i! Tr� m� l�i cho ta �i, tr� m� cho ta.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("Ta mu�n �i h�c kinh th�, nh�ng cha ta kh�ng cho, n�i con g�i �i h�c kh�ng th� ra ti�n c� c�ng danh, ch� l� l�ng ph� ti�n. ",0)
return
end;

if (i == 1) then
Say("Cha ta c� ��nh ta, n�i ta l� k� ti�u ti�n, ngay c� l�c c� m� ta c�ng ��nh. N�u nh� ta c� b�n l�nh nh� huynh, cha ta s� kh�ng c�n ��nh ta n�a",0)
end;

end;

