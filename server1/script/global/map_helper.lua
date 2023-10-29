-- map_helper.lua
-- By: Dan_Deng(2004-06-28)
-- ��ά���������С��ȼ������Թ�
Include("\\script\\activitysys\\npcdailog.lua")

lv_str={	"<#>Kh�ng ��n c�p 10 ","<#>H�n 10 c�p ","<#>H�n 20 c�p ","<#>H�n 30 c�p ","<#>H�n 40 c�p ","<#>H�n 50 c�p ","<#>H�n 60 c�p ","<#>H�n 70 c�p ","<#>H�n 80 c�p ","<#>H�n 90 c�p "}
map0 = {	"<#>C�c T�n th� th�n ",
			"<#>G�n b�n B�n m�n, c�c th�nh th� n�i danh ",
			"<#>Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u s�n, V� L�ng s�n, T�n L�ng ",
			"<#>Th�c C��ng s�n, Mi�u L�nh, Y�n t� ��ng, v� D��c V��ng ��ng t�ng 1, Kho�i Ho�t L�m ",
			"<#>Kinh Ho�ng ��ng, Ph�c Ng�u s�n T�y, �i�m Th��ng ��ng t�ng 3, Thi�u L�m m�t th�t ",
			"<#>H��ng Th�y ��ng, Thi�n T�m ��ng, v� ��ng ��nh H� s�n ��ng, B�ng Huy�t M� Cung ",
			"<#>Thanh Loa ��o, 108 La H�n Tr�n, v� Ho�nh s�n ph�i, T��ng D��ng v� m�n m�t ��o ",
			"<#>��i T� ��ng, Thanh Loa ��o s�n ��ng, v� Linh C�c ��ng, L�o H� ��ng, L�m Du Quan ",
			"<#>Sa m�c ��a Bi�u, Phi Thi�n ��ng, Ph� Dung ��ng, L��ng Th�y ��ng, B�ng H� ��ng, Thanh Kh� ��ng, Tr��ng B�ch s�n C��c ",
			"<#>Sa m�c s�n ��ng t�ng 1, 2 v� Ti�n C�c ��ng, Kho� Lang ��ng, Tr��ng B�ch s�n Nam L�c, Tr��ng B�ch s�n B�c L�c "}
map1 = {	"<#>C�c T�n th� th�n ",
			"<#>G�n b�n B�n m�n, c�c th�nh th� n�i danh ",
			"<#>Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u s�n, V� L�ng s�n, T�n L�ng ",
			"<#>V� Di s�n, T�n L�ng t�ng 1, v� B�ch V�n ��ng, th� ph� ��ng ",
			"<#>Thanh Th�nh s�n, �i�m Th��ng s�n, v� Phong Nh�n ��ng, �i�m Th��ng ��ng t�ng 1, Th�n Ti�n ��ng ",
			"<#>H��ng Th�y ��ng, Nghi�t Long ��ng, B�o Ng�c Hoa ��ng, v� Thi�n T�m Th�p t�ng 1,2 ",
			"<#>D��ng Gi�c ��ng, Tr�c T� ��ng t�ng 1, v� Ho�nh s�n ph�i, Thi�n T�m Th�p t�ng 3 ",
			"<#>Long Nh�n ��ng, T�n L�ng t�ng 2, v� Tr�c T� ��ng t�ng 2, Tr��ng Giang ��u, L�m Du Quan ",
			"<#>Sa m�c ��a Bi�u, V� L�ng ��ng, D��ng Trung ��ng, C� D��ng ��ng, Nh�n Th�ch ��ng, D��c V��ng ��ng t�ng 3, T�n L�ng t�ng 3, Tr��ng B�ch s�n C��c ",
			"<#>Sa m�c s�n ��ng t�ng 1,2,3, v� D��c V��ng ��ng t�ng 4, Ti�n C�c ��ng, Tr��ng B�ch s�n Nam L�c, Tr��ng B�ch s�n B�c L�c "}
map2 = {	"<#>C�c T�n th� th�n ",
			"<#>G�n b�n B�n m�n, c�c th�nh th� n�i danh ",
			"<#>Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u s�n, V� L�ng s�n, T�n L�ng ",
			"<#>B�ch V�n ��ng, Th�c C��ng s�n, th� ph� ��ng, v� Ph�c Ng�u s�n ��ng, Kim Quang ��ng ",
			"<#>Phong Nh�n ��ng, �i�m Th��ng ��ng t�ng 1, Th�n Ti�n ��ng, v� Ph�c Ng�u s�n T�y, Kinh Ho�ng ��ng ",
			"<#>H��ng Th�y ��ng, Thi�n T�m Th�p t�ng 1,2, v� T�n T��ng t� ��a ��o, �c B� ��a ��o ",
			"<#>Thi�n T�m Th�p t�ng 3, 108 La H�n Tr�n, v� C�m ��a m� cung, Ho�nh s�n ph�i ",
			"<#>Tr��ng Giang Nguy�n ��u, S�n B�o ��ng, v� ��o Hoa Nguy�n, D��c V��ng ��ng t�ng 2, L�m Du Quan ",
			"<#>Sa m�c ��a Bi�u, Phi Thi�n ��ng, Ph� Dung ��ng, D��ng Trung ��ng, C� D��ng ��ng, D��c V��ng ��ng t�ng 3, Tr��ng B�ch s�n C��c ",
			"<#>Sa m�c s�n ��ng t�ng 1, 2, 3, v� Kho� Lang ��ng, Ti�n C�c ��ng, Tr��ng B�ch s�n Nam L�c, Tr��ng B�ch s�n B�c L�c "}
map3 = {	"<#>C�c T�n th� th�n ",
			"<#>G�n b�n B�n m�n, c�c th�nh th� n�i danh ",
			"<#>Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u s�n, V� L�ng s�n, T�n L�ng ",
			"<#>Ph�c Ng�u s�n ��ng, Kim Quang ��ng, v� T�n L�ng t�ng 1, V� Di s�n ",
			"<#>T�a V�n ��ng, Long Cung ��ng, v� �i�m Th��ng ��ng t�ng 2, Thanh Th�nh s�n, �i�m Th��ng s�n ",
			"<#>H��ng Th�y ��ng, Bi�n Kinh Thi�t Th�p t�ng 1, 2, 3, v� T��ng V�n ��ng t�ng 1, Ng� Hoa Vi�n s�n ��ng ",
			"<#>T��ng V�n ��ng t�ng 2, 3, 4, v� Thi�n Nh�n Th�nh ��ng, D��ng Gi�c ��ng, Tr�c T� ��ng t�ng 1 ",
			"<#>D��c V��ng ��ng t�ng 2, L�o H� ��ng, T��ng V�n ��ng 5 t�ng, Linh C�c ��ng, L�m Du Quan ",
			"<#>Sa m�c ��a Bi�u, V� L�ng ��ng, V� danh ��ng, Nh�n Th�ch ��ng, T�n L�ng t�ng 3, Tr��ng B�ch s�n C��c ",
			"<#>Sa m�c s�n ��ng t�ng 1, 2, 3, v� D��c V��ng ��ng t�ng 4, C�n Vi�n ��ng, Tr��ng B�ch s�n Nam L�c, Tr��ng B�ch s�n B�c L�c "}
map4 = {	"<#>C�c T�n th� th�n ",
			"<#>G�n b�n B�n m�n, c�c th�nh th� n�i danh ",
			"<#>Ki�m C�c Trung Nguy�n, Ki�m C�c T�y Nam, Ki�m C�c T�y B�c, La Ti�u s�n, V� L�ng s�n, T�n L�ng ",
			"<#>Mi�u L�nh, D��c V��ng ��ng t�ng 1, Kho�i Ho�t L�m, v� Ph�c Ng�u s�n ��ng, Kim Quang ��ng, Tuy�t B�o ��ng t�ng 1, 2 ",
			"<#>Ki�n T�nh Phong s�n ��ng, K� Qu�n ��ng, Ho�ng H� Nguy�n ��u, v� T�a V�n ��ng, �i�m Th��ng ��ng t�ng 2 ",
			"<#>H��ng Th�y ��ng, B�ng Huy�t M� Cung, L�u Ti�n ��ng t�ng 1, v� Thi�t Th�p t�ng 1,2,3 ",
			"<#>Ho�nh s�n ph�i, T��ng D��ng V� m�n m�t ��o, v� L�u Ti�n ��ng t�ng 2,3,4 ",
			"<#>��o Hoa Nguy�n, L�u Ti�n ��ng t�ng 5, 6 v� T�n L�ng t�ng 2, Long Nh�n ��ng, L�m Du Quan ",
			"<#>Sa m�c ��a Bi�u, L��ng Th�y ��ng, V� danh ��ng, B�ng H� ��ng, Thanh Kh� ��ng, Tr��ng B�ch s�n C��c ",
			"<#>Sa m�c s�n ��ng t�ng 1, 2, 3, v� D��c V��ng ��ng t�ng 4, C�n Vi�n ��ng, Tr��ng B�ch s�n Nam L�c, Tr��ng B�ch s�n B�c L�c "}

function map_help()
	ser = GetSeries() + 1
	lvl = floor(GetLevel()/10 + 1)
	if (lvl > 10) then lvl = 10 end
	if (ser == 1) then
		Say(npc_name.."<#>: ��i v�i h� <color=red>Kim  "..lv_str[lvl].."<#><color>��i v�i ng��i m� n�i , n�i luy�n c�ng t�t nh�t g�m c�"..map0[lvl].."<#>. ",0)
	elseif (ser == 2) then
		Say(npc_name.."<#>: ��i v�i h� <color=red>M�c  "..lv_str[lvl].."<#><color>��i v�i ng��i m� n�i , n�i luy�n c�ng t�t nh�t g�m c�"..map1[lvl].."<#>. ",0)
	elseif (ser == 3) then
		Say(npc_name.."<#>: ��i v�i h� <color=red>Th�y  "..lv_str[lvl].."<#><color>��i v�i ng��i m� n�i , n�i luy�n c�ng t�t nh�t g�m c�"..map2[lvl].."<#>. ",0)
	elseif (ser == 4) then
		Say(npc_name.."<#>: ��i v�i h� <color=red>H�a  "..lv_str[lvl].."<#><color>��i v�i ng��i m� n�i , n�i luy�n c�ng t�t nh�t g�m c�"..map3[lvl].."<#>. ",0)
	else
		Say(npc_name.."<#>: ��i v�i h� <color=red>Th�  "..lv_str[lvl].."<#><color>��i v�i ng��i m� n�i , n�i luy�n c�ng t�t nh�t g�m c�"..map4[lvl].."<#>. ",0)
	end
end

function skill_help()
	fact_num = GetLastFactionNumber() + 1
	if (fact_num == 1) then				-- ����
		Talk(5,"","Nh�ng ng��i theo <color=red>Thi�u L�m ph�i<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: 'Quy�n Thi�u L�m', l�y H�ng Long B�t V�, Thi�u L�m Quy�n Ph�p, La H�n Tr�n, Long Tr�o H� Tr�o, Nh� Lai Thi�n Di�p, ��t Ma �� Giangl�m ch�.","H��ng th� hai g�i l�: 'C�n Thi�u L�m', l�y Kim Cang Ph�c Ma, Thi�u L�m C�n ph�p, La H�n Tr�n, Ho�nh T�o L�c H�p, Nh� Lai Thi�n Di�p, Ho�nh T�o Thi�n Qu�n l�m ch�.","H��ng th� ba g�i l�: '�ao Thi�u L�m', l�y Kim Cang Ph�c Ma, Thi�u L�m �ao ph�p, La H�n Tr�n, Ma Ha V� L��ng, Nh� Lai Thi�n Di�p, V� T��ng Tr�m l�m ch�.","Ngo�i ra c�n c� B�t ��ng Minh V��ng, S� T� H�ng, D�ch C�n kinh c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n.")
	elseif (fact_num == 2) then		-- ����
		Talk(5,"","Nh�ng ng��i theo <color=red>Thi�n V��ng bang<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: '�ao Thi�n V��ng', l�y Kinh L�i Tr�m, Thi�n V��ng  �ao ph�p, B�t Phong Tr�m, V� T�m Tr�m, Thi�n V��ng Chi�n �, Ph� Thi�n Tr�m l�m ch�.","H��ng th� hai g�i l�: 'Th��ng Thi�n V��ng', l�y H�i Phong L�c Nh�n, Thi�n V��ng Th��ng ph�p, D��ng Quan Tam �i�p, Huy�t Chi�n B�t Ph��ng, Thi�n V��ng Chi�n �, Truy Tinh Tr�c Nguy�t l�m ch�.","H��ng th� ba g�i l�: 'Ch�y Thi�n V��ng', l�y Tr�m Long quy�t, Thi�n V��ng Ch�y Ph�p, H�ng V�n Quy�t, Th�a Long Quy�t, Thi�n V��ng Chi�n �, Truy Phong Quy�t l�m ch�.","Ngo�i ra c�n c� T�nh T�m Quy�t, �o�n H�n Th�ch, Kim Chung Tr�o c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n.")
	elseif (fact_num == 3) then		-- ����
		Talk(5,"","Nh�ng ng��i theo <color=red> ���ng M�n <color> v� ngh� ph�n theo 4 h��ng:","H��ng th� nh�t g�i l�: 'Phi �ao���ng', l�y T�ch L�ch ��n, ���ng M�n �m kh�, Truy T�m Ti�n, Ti�u L� Phi �ao, T�m Nh�n, Nhi�p H�n Nguy�t �nh l�m ch�.","H��ng th� hai g�i l�: 'T� Ti�n ���ng', l�y T�ch L�ch ��n, ���ng M�n �m kh�, M�n Thi�n Hoa V�, Thi�n La ��a V�ng, T�m Nh�n, B�o V� L� Hoa l�m ch�.","H��ng th� ba g�i l�: 'Phi Ti�u���ng', l�y T�ch L�ch ��n, ���ng M�n �m kh�, �o�t H�n Ti�u, T�n Hoa Ti�u, T�m Nh�n, C�u Cung Phi Tinh l�m ch�.","H��ng th� t� g�i l�: 'H�m T�nh ���ng', l�y ��a Di�m H�a, ��c Th�ch C�t, Xuy�n T�m Th�ch, H�n B�ng Th�ch, L�i K�ch Thu�t, Lo�n Ho�n K�ch l�m ch�.")
	elseif (fact_num == 4) then		-- �嶾
		Talk(5,"","Nh�ng ng��i theo <color=red>Ng� ��c gi�o<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: 'Ch��ng ��c', l�y ��c Sa Ch��ng, Ng� ��c Ch��ng Ph�p, U Minh Kh� L�u, Thi�n C��ng ��a S�t, Ng� ��c K� Kinh, �m Phong Th�c C�t l�m ch�.","H��ng th� hai g�i l�: '�ao ��c', l�y Huy�t �ao ��c S�t, Ng� ��c �ao ph�p, B�ch ��c Xuy�n T�m, Chu C�p Thanh Minh, Ng� ��c K� Kinh, Huy�n �m Tr�m l�m ch�.","H��ng th� ba g�i l�: 'Ch� thu�t ��c', l�y C�u Thi�n Cu�ng L�i, X�ch Di�m Th�c Thi�n, B�ng Lam Huy�n Tinh, Xuy�n Y Ph� Gi�p, Xuy�n T�m ��c Th�ch, �o�n C�n H� C�t l�m ch�.","Ngo�i ra c�n c� T�p Nan D��c Kinh, V� H�nh ��c, V�n ��c Th�c T�m c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n.")
	elseif (fact_num == 5) then		-- ����
		Talk(4,"","Nh�ng ng��i theo <color=red>Nga Mi ph�i<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: 'Ki�m T�ng Nga Mi', l�y Nh�t Di�p Tri Thu, Nga Mi Ki�m ph�p, Th�i Song V�ng Nguy�t, B�t Di�t B�t Tuy�t, Ph�t Ph�p V� Bi�n, Tam Nga T� Tuy�t l�m ch�.","H��ng th� hai g�i l�: 'Kh� T�ng Nga Mi', l�y Phi�u Tuy�t Xuy�n V�n, Nga Mi Ch��ng ph�p, T� T��ng ��ng Quy, Ph�t Quang Ph� Chi�u, Ph�t Ph�p V� Bi�n, Phong S��ng To�i �nh l�m ch�.","H��ng th� ba hai g�i l�: 'To�n Ph� Nga Mi', l�y T� H�ng Ph� ��, M�ng �i�p, L�u Th�y, Ph�t T�m T� H�u, Thanh �m Ph�n X��ng, Ph� �� Ch�ng Sinh l�m ch�.")
	elseif (fact_num == 6) then		-- ����
		Talk(4,"","Nh�ng ng��i theo <color=red>Th�y Y�n m�n <color>, v� ngh� ph�n theo 2 h��ng:","H��ng th� nh�t g�i l�: '��n �aoTh�y Y�n', l�y Phong Hoa Tuy�t Nguy�t, Th�y Y�n �ao ph�p, V� �� L� Hoa, M�c D� L�u Tinh, B�ng C�t Tuy�t T�m, B�ng Tung V� �nh l�m ch�.","H��ng th� hai g�i l�: 'Song �aoTh�y Y�n', l�y Phong Quy�n T�n Tuy�t, Th�y Y�n Song �ao, Ph� V�n T�n Tuy�t, B�ch H�i Tri�u Sinh, B�ng C�t Tuy�t T�m, B�ng T�m Ti�n T�  l�m ch�.","Ngo�i ra c�n c� B�ng T�m Tr�i �nh, H� Th� H�n B�ng, Tuy�t �nh c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n")
	elseif (fact_num == 7) then		-- ؤ��
		Talk(4,"","Nh�ng ng��i theo <color=red>C�i Bang <color>, v� ngh� ph�n theo 2 h��ng:","H��ng th� nh�t g�i l�: 'Ch��ng C�i', l�y Ki�n Nh�n Th�n Th�, C�i Bang Ch��ng Ph�p, Gi�ng Long Ch��ng, Kh�ng Long H�u H�i, T�y �i�p Cu�ng V�, Phi Long T�i Thi�n l�m ch�.","H��ng th� hai g�i l�: 'C�n C�i', l�y Di�n M�n Th�c B�t, C�i Bang B�ng ph�p, �� C�u B�ng, B�ng �� �c C�u, T�y �i�p Cu�ng V�, Thi�n H� V� C�u l�m ch�.","Ngo�i ra c�n c� H�a Hi�m Vi Di, Ho�t B�t L�u Th�, Ti�u Di�u C�ng  c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n")
	elseif (fact_num == 8) then		-- ����
		Talk(4,"","Nh�ng ng��i theo <color=red>Thi�n Nh�n gi�o<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: 'Chi�n Nh�n', l�y T�n D��ng Nh� Huy�t, Thi�n Nh�n M�u ph�p, Li�t H�a T�nh Thi�n, Th�u Thi�n Ho�n Nh�t, Thi�n Ma Gi�i Th�,V�n Long K�ch l�m ch�.","H��ng th� hai g�i l�: 'Ma Nh�n', l�y ��n Ch� Li�t Di�m, Thi�n Nh�n �ao ph�p, Th�i S�n �i�n H�i, Ma Di�m Th�t S�t, Thi�n Ma Gi�i Th�, Thi�n Ngo�i L�u Tinh l�m ch�.","H��ng th� ba g�i l�: 'Ch� thu�t nh�n', l�y H�a Li�n Ph�n Hoa, �o �nh Phi H�, Phi H�ng V� T�ch, Bi T� Thanh Phong, L�ch Ma �o�t H�n, Nhi�p H�n Lo�n T�m l�m ch�.")
	elseif (fact_num == 9) then		-- �䵱
		Talk(4,"","Nh�ng ng��i theo <color=red>V� �ang ph�i<color>, v� ngh� ph�n theo 2 h��ng:","H��ng th� nh�t g�i l�: 'Kh� T�ng V� �ang', l�y N� L�i Ch�, V� �ang Quy�n Ph�p, B�c C�p Nhi Ph�c, V� Ng� V� Ki�m, Th�i C�c Th�n C�ng, Thi�n ��a V� C�c l�m ch�.","H��ng th� hai g�i l�: 'Ki�m T�ng V� �ang', l�y Th��ng H�i Minh Nguy�t, V� �ang Ki�m ph�p, Ki�m Phi Kinh Thi�n, Tam Ho�n Thao Nguy�t, Th�i C�c Th�n C�ng, Nh�n Ki�m H�p Nh�t  l�m ch�.","Ngo�i ra c�n c� Th�t Tinh Tr�n, Th� V�n Tung, T�a V�ng V� Ng� c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n")
	elseif (fact_num == 10) then		-- ����
		Talk(5,"","Nh�ng ng��i theo <color=red>C�n L�n ph�i<color>, v� ngh� ph�n theo 3 h��ng:","H��ng th� nh�t g�i l�: '�ao C�n L�n', l�y H� Phong Ph�p, C�n L�n �ao ph�p, Nh�t Kh� Tam Thanh, Cu�ng Phong S�u �i�n, S��ng Ng�o C�n L�n, Ng�o Tuy�t Ti�u Phong l�m ch�.","H��ng th� hai g�i l�: 'Ki�m C�n L�n', l�y Cu�ng L�i Ch�n ��a, C�n L�n Ki�m ph�p, Thi�n T� T�n L�i, Ng� L�i ch�nh Ph�p, S��ng Ng�o C�n L�n, L�i ��ng C�u Thi�n l�m ch�.","H��ng th� ba g�i l�: 'Ch� thu�t C�n L�n', l�y Th�c Ph��c Ch�, Ki B�n ph�, B�c Minh ��o H�i, Khi H�n Ng�o Tuy�t, M� Tung �o �nh, T�y Ti�n T� C�t l�m ch�.","Ngo�i ra c�n c� Thanh Phong ph�, Thi�n Thanh ��a Tr�c, Kh� T�m Ph� c�c lo�i v� c�ng n�y gi�p �ch cho ng��i r�t nhi�u ph��ng di�n")
	else									-- ����
		Say(npc_name.."<#>: ng��i th�m ch� ch�a h� tham gia m�n ph�i n�o, n�i g� ��n chuy�n luy�n hay kh�ng luy�n ph�p ",0)
	end
end

GV_TSK_CD_OPEN = 35
tbDEFENCE_SIGNMAP = { 518, 519 }
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Ph��ng T��ng Ph� ", 2 },	--����
						[11] = { 3018,5089, "Th�nh �� Ph� ", 1 },	--�ɶ�
						[37] = { 1632,3185, "Bi�n Kinh Ph� ", 2 },	--�꾩
						[78] = { 1439,3214, "T��ng D��ng Ph� ", 1 },	--����
						[80] = { 1593,3197, "D��ng Ch�u Ph� ", 1 },	--����
						[162] = { 1470,3269, "��i L�", 1 },	--����
						[176] = { 1392,3313, "L�m An Ph� ", 1 },	--�ٰ�
					}
CD_LEVEL_LIMIT = 80		--��Ͳμ��سǵȼ�

function main(sel)
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
    Msg2Player(szNpcName)
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--�����Ի���
	
	tbDailog.szTitleMsg = npc_name.."<#>Tuy kh�ng ph�i l� ng��i trong giang h�, nh�ng h�ng ng�y ta th�y c�c ng��i qua l�i r�t nhi�u l�n. Kh�ng ph�i kho�c l�c v� ho�n c�nh c�c ng��i ta hi�u r�t r�. "
	
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
						
	tbDailog:AddOptEntry("Tham gia Phong V�n Lu�n Ki�m", CallRescrptFunc )
	tbDailog:AddOptEntry("T�m hi�u khu v�c luy�n c�ng", map_help )
	tbDailog:AddOptEntry("T�m hi�u v� ngh� b�n m�n", skill_help )
	tbDailog:AddOptEntry("T�n g�u", default_talk )
	tbDailog:AddOptEntry("R�i kh�i")
	
	if ( GetGlbValue( GV_TSK_CD_OPEN ) == camp ) then
		tbDailog:AddOptEntry("Tham gia chi�n d�ch th� th�nh", want2cd_signmap)
	end
	
	
	tbDailog:Show()
end

function want2cd_signmap()
	if ( GetLevel() < CD_LEVEL_LIMIT ) then
		Say(npc_name..": �? Ng��i c�ng mu�n tham gia chi�n d�ch th� th�nh �h? ��ng c�p ch�a �� ��u"..CD_LEVEL_LIMIT.."C�p, t�i ngh� nh� ng��i ��y gi�p kh�ng ���c g� ��u, c� th� m�t m�ng nh� ch�i n�a, th�i � l�i th�nh n�y �i!", 0)
		return
	end
	Say(npc_name..": Ng��i mu�n �i gi� th�nh �h? Mu�n l�m �h? �i! Ng��i v� ��i th�t ��! Nh�ng nghe ��u t�nh hu�ng c�p b�ch l�m th� ph�i! Trong th�nh ch� c�n th� ���c 2 ti�ng n�a th�i, n�u trong 2 ti�ng kh�ng k�ch lui ���c qu�n ��ch th� th�t th� r�i! C�n mu�n tham gia ch� c� t��ng qu�n m�i quy�t ��nh ���c, ta c� th� d�n ng��i qua ��.", 2, "Ta bi�t r�i! Mau d�n ta qua �� �i!/sure2cd_signmap", "�� ta chu�n b� ��!/no")
end

function sure2cd_signmap()
	LeaveTeam();
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
	if ( camp == nil ) then
		Say(npc_name..": Ph�a tr��c h�nh nh� kh�ng th�ng!", 0)
		return
	end
	if (camp == 1) then
		Msg2Player("V�o khu v�c th� th�nh phe T�ng")
	else
		Msg2Player("V�o khu v�c th� th�nh phe Kim")
	end
	SetTask(TASKID_FIRE_ADDR, SubWorldIdx2ID(SubWorld))
	SetFightState(0)
	NewWorld(bt_getsignpos(camp))	--camp���س�����������
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_about_compose()
	Say(npc_name..": Haha! Nh�n trang b� c�a ng��i nh� v�y m� c�ng ��i �i c�ng th� th�nh! Th�i n�o! ��a ��y ta v� l�i h� cho!", 0)
end

function CallRescrptFunc()
	if ( GetLevel() < 40 ) then
		Talk( 1, "", npc_name..": Phong V�n Lu�n Ki�m l� n�i r�t nguy hi�m, ch�a ��t c�p 40 kh�ng th� tham gia chi�n tr��ng." );
	else
		Say ( npc_name..": Nh�n s� ��ng s� chi�m �u th�, tuy nhi�n �i�m s� nh�n ���c s� �t h�n, ng��i mu�n ��n n�i b�o danh b�n n�o?", 3, "V�o �i�m b�o danh phe V�ng (T)/#DoRescriptFunc(1)", "V�o �i�m b�o danh phe T�m (K)/#DoRescriptFunc(2)","�� ta suy ngh� l�i./no" );
	end;
end;

function DoRescriptFunc(nSel)
	local tbsongjin_pos = {1608,3254};	--�η������
	local szstr = "T�ng";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "Kim";
	end;
	if ( GetLevel() >= 40 and GetLevel() < 60 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ��������ʹ�ûسǷ�
		Msg2Player( "�� v�o �i�m b�o danh" );
	elseif ( GetLevel() >= 60 and GetLevel() < 90 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ��������ʹ�ûسǷ�
		Msg2Player( "�� v�o �i�m b�o danh" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ��������ʹ�ûسǷ�
		Msg2Player( "�� v�o �i�m b�o danh" );
	end
end;

function no()
end