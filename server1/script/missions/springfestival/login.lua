Include([[\script\missions\springfestival\head.lua]]);


function springfestival06_login()
	if (sf06_isactive() ~= 0) then
		Msg2Player("Nh�ng ng�y g�n ��y, quan ph� �� t� ch�c ho�t ��ng <color=yellow>�u�i �ng Ba M��i<color>. Trong th�i gian <color=yellow>19:00 ��n 23:00<color> c�c nh�n s� c� th� ��n Nha m�n c�c th�nh th� �� b�o danh tham gia ho�t ��ng.")
	end
end

if login_add then login_add(springfestival06_login, 2) end

