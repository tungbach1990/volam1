function main()
	local a = "Thuy�n r�ng nh� = 1 ��u r�ng + 1 �u�i r�ng + 1 th�n r�ng + 1s��n r�ng + 4 m�i ch�o + 1 b�nh l�i + 1 tr�ng";
	local b = "<enter>Thuy�n r�ng truy�n th�ng = 1 Thuy�n r�ng nh� + 4 m�i ch�o";
	local c = "<enter>M� ��u thuy�n r�ng = 1 Thuy�n r�ng nh� + 1 Thuy�n r�ng truy�n th�ng + 1 ��u r�ng";
	Say(a..b..c, 2, "Trang k� /nextpage", "��ng/no");
	return 1;
end

function nextpage()
	local d = " Thuy�n r�ng ��u ph�ng = 1 Thuy�n r�ng ��u ng�a + 1 Thuy�n r�ng truy�n th�ng + 1 ��u r�ng";
	local e = "<enter>Thuy�n r�ng h�nh th� = 1 Thuy�n r�ng ��u ph�ng + 1 Thuy�n r�ng ��u ng�a + 1 ��u r�ng";
	local f = "<enter>Thuy�n r�ng lo�i l�n = 1 Thuy�n r�ng h�nh th� + 1 Thuy�n r�ng ��u ph�ng + 1 Thuy�n r�ng ��u ng�a";
	Say(d..e..f, 2, "Trang tr��c/main", "��ng/no");
end

function no()
end