--������ ������ ·�˹�֮���Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","H�t r�i, h�t th�t r�i, ��ng l� ra ta c� th� g� cho m�t v� anh h�ng h�o ki�t v�a m�i v�o tr�n n�y �. Kh�ng ng� anh ta b� c�n b�nh d�ch c��p m�t m�ng, ��ng ti�c qu� �i. H�......ta kh�ng r� ��u �u�i th� n�o n�a ng��i th� �i h�i ng��i kh�c xem sao.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe n�i c� m�t v� s� th�i kh�ng bi�t t� mi�u n�o ��n, ph�p l�c v� bi�n ng��i �i h�i th� xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("��c C� phu nh�n th�t c� ph�c, t��ng c�ng l� m�t ��i anh h�ng,th�t khi�n ta ng��ng m� ",0)
return
end;

if (i == 1) then
Say("Quan tr�ng nh�t c�a m�t ��i con g�i ch�nh l� kh�ng n�n g� nh�m ng��i. Sau n�y ta c�ng ph�i l�y m�t ��i hi�p c� t�nh c�m d�u d�ng",0)
end;

end;

