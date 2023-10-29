-- ְ�ܡ�����
-- by��Li_Xin(2004-08-18)


function help()
	str = 
	{
		"<#> Qu� tr�nh kh�m n�m: ��t trang b� v�o giao di�n ch�nh gi�a, sau �� �em v�t ph�m kh�m n�m ��t v�o ch� t��ng �ng. V�t ph�m kh�m n�m t�ng v� gi�m ��ng c�p ��t v�o thanh ��ng c�p; thay ��i thu�c t�nh ma ph�p ��t v�o thanh linh l�c; thay ��i thu�c t�nh ng� h�nh ��t v�o thanh ng� h�nh. Nh�n 'Kh�m n�m' �� ho�n th�nh. M�t n� kh�ng th� kh�m n�m.",
		"<#> Li�n quan kh�m n�m th�y tinh/crystalhelp",
		"<#> Li�n quan kh�m n�m v� kh� /weaponhelp",
		"<#> Li�n quan kh�m n�m y ph�c/armorhelp",
		"<#> Li�n quan kh�m n�m n�n/helmhelp",
		"<#> Ta �� bi�t r�i /no",
	};
	Say(str[1], 5, str[2], str[3], str[4], str[5],str[6])
   	-- Say(str[1], 3,str[2], str[3], str[4])
end

function crystalhelp()
	Talk(1,"","Mu�n kh�m nh�ng v�t n�y kh�ng ��n gi�n ch�t n�o, ti�n c�ng r�t cao, l�m xong c�ng ch�a ch�c l� �� v�a �, th� n�o c� nu�n kh�m kh�ng? ��ng �? V�y kh�m nh�ng th� g�? ")
end

function weaponhelp()
	str = {
		"<#> G�n ��y giang h� xu�t hi�n �� ph� c� th� t�ng ��ng c�p v� kh�. Ng��i c� mu�n nghe kh�ng?",
		"<#> Qu� tr�nh th�ng c�p �� ph� v� kh� /onweaponhelp",
		"<#> L�ng V��ng Th��ng �o�n T�o T�n Bi�n/onweaponhelp",
		"<#> Huy�n V� Ch�y Chi ��c T�o Thu�t/onweaponhelp",
		"<#> Long Ng�m Ki�m �o�n T�o ��/onweaponhelp",
		"<#> Gia C�t C� Qu�t M�t Y�u/onweaponhelp",
		"<#> Li�u Di�p To�i Phong �ao. T�y Th� Bi�n/onweaponhelp",
		"<#> Huy�n Nguy�t �ao T� Kinh b�o l�c/onweaponhelp",
		"<#> Thi�n C� C�n �� ph� /onweaponhelp",
		"<#> �m Kh� T�ng ph�. Quy�n 1/onweaponhelp",
		"<#> Uy�n ��ng �ao. Khai Quang bi�n/onweaponhelp",
		"<#> Kh�ng quan t�m!/no",
	};
    Say(str[1],11,str[2], str[3], str[4], str[5],str[6], str[7], str[8], str[9],str[10], str[11], str[12])
end

function onweaponhelp(nSel)
	strHelp = 
	{
		"<#> ��t v� kh� c�n th�ng c�p gi�a giao di�n kh�m n�m, �� ph� ��t v�o thanh ��ng c�p. N�u ph� h�p �i�u ki�n s� th�ng ��ng c�p",
		"<#> L�ng V��ng Th��ng �o�n T�o T�n Bi�n l� �� ph� d�ng �� t�ng ��ng c�p th��ng. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Huy�n V� Ch�y Chi ��c T�o Thu�t l� �� ph� d�ng �� t�ng ��ng c�p ch�y. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Long Ng�m Ki�m �o�n T�o �� l� �� ph� d�ng �� t�ng ��ng c�p ki�m. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Gia C�t C� Qu�t M�t Y�u l� �� ph� d�ng �� t�ng ��ng c�p n�. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Li�u Di�p To�i Phong �ao. T�y Th� Bi�n l� �� ph� d�ng �� t�ng ��ng c�p phi �ao. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Huy�n Nguy�t �ao T� Kinh B�o L�c l� �� ph� d�ng �� t�ng ��ng c�p �ao. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Thi�n C� C�n �� ph� l� �� ph� d�ng �� t�ng ��ng c�p c�n. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> �m Kh� T�ng ph�. Quy�n 1 l� �� ph� d�ng �� t�ng ��ng c�p phi ti�u. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"<#> Uy�n ��ng �ao. Khai Quang bi�n l� �� ph� v� kh� lo�i song �ao, s� d�ng c� th� t�ng c�p song �ao. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
	};
	Talk(1,"",strHelp[nSel + 1]);   
end

function armorhelp()
	Talk(1,"","Ta gi�i th�ch ph��ng ph�p kh�m n�m y ph�c. D�a v�o B�ng T�m V� C�c T� c�a Thi�n s�n Tuy�t Linh ph�i h�p v�i ph��ng ph�p b� truy�n c�a ta qua bao l�n ��c luy�n s� th�nh c�ng th�ng c�p ���c ��ng c�p y ph�c. D�a v�o Nam Minh Chi Tinh c�a Tam Mi�u Hoang Nguy�n k�t h�p v�i ph��ng ph�p b� truy�n c�a ta qua c�c giai �o�n ��c luy�n s� th�nh c�ng gi�m ���c ��ng c�p y ph�c.")
end

function helmhelp()
	Talk(1,"","Nh�ng th� c�n l�i n�y s� gi�p ng��i t�ng ���c ��ng c�p m�, nh�ng ng��i ph�i th�c hi�n ��ng theo c�c b��c tr�nh t� c�a n�, n�u kh�ng th� s� �i�m c�a ng��i s� l�i b� gi�m xu�ng ")
end

