-- ���̰���NPC
-- By: Dan_Deng(2003-11-21)

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Ng�o Mai"
	
function main(sel)
	UTask_cy = GetTask(6)
	player_faction = GetFaction()
	if (player_faction == "cuiyan") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say(" Ta v�a ra ��i �� b� v�t b�, may nh� Ch��ng m�n c�u gi�p. 18 n�m nay l�n l�n t�i ��y, t�ng ng�n c�y c�ng c� ��u quen thu�c.",7,"��i tho�i v�i Long Ng� /Uworld1000_word","T�m hi�u �i�n c� b�n m�n/faction","T�m hi�u c�c v� t� mu�i/member","T�m hi�u nhi�m v� /task_get","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 70*256) then				-- ���ų�ʦ
		if (UTask_cy == 80*256) and (GetTask(1) == 70*256) and (HaveMagic(93) == -1) then		-- ���������ط����ɺ��һ��BUG�����ܱ��Ϊδѧ���Ⱥ��նɡ�
			Talk(1,""," T�m tr�ng c�a t� c� ch�t h�n lo�n, ��ng lo l�ng n�a, b�y gi� �� t�t r�i!")
		else
			Say(" S� t� kh� th� tr� v�, l�n n�y ��n th�m t� mu�i ta c� chuy�n g� kh�ng?",6,"�n l�i chuy�n n�m x�a b�n m�n/faction","�n l�i c�c t� mu�i n�m x�a/member","Ta c�n c� th� gi�p g� kh�ng/task_get","T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng h�i n�a!/nothing")
		end
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say(" Xin h�i ng��i ��n Th�y Y�n m�n �� th�m th�n hay th�m b�n? C� g� kh�ng bi�t c� h�i Ti�u mu�i.",3,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c t� mu�i Th�y Y�n/member","Kh�ng h�i n�a!/nothing")
	else													-- ����
		Say(" T� ��n th�m vi�ng hay l� b�i s�? C� g� kh�ng hi�u c� h�i mu�i.",4,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c t� mu�i Th�y Y�n/member","T�m hi�u �i�u ki�n nh�p m�n/task_get","Kh�ng h�i n�a!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say(" Th� T� mu�n mu�i gi�i thi�u g� v� b�n m�n?",5,"Kh�i nguy�n m�n ph�i/F1","V� tr� ��a l� /F2","��a v� giang h� /F3","��c s�c m�n ph�i/F4","Kh�ng h�i n�a!/nothing")
end

function F1()
	Say(" T� s� s�ng l�p m�n ph�i do b� ��n �ng ph� b�c, n�n �n c� � bi�n gi�i V�n Nam, m�t h�m tr�n ���ng �i g�p m�y c� g�i c�ng b� h�t h�i ru�ng b�, nh� ��n ng�y x�a, sinh l�ng tr�c �n n�n mang v� nu�i d��ng v� truy�n d�y v� c�ng. Thu� Y�n c�a ch�ng ta c�ng t� �� m� ���c s�ng l�p.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F2()
	Say(" N�i ��y n�m b�n b� Nh� H�i Th��ng S�n ��i L� phong c�nh h�u t�nh.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F3()
	Say(" B�n ph�i v� ���ng M�n ���c g�i l� 'V� L�m Nh� M�n', d�a v�o s� th�n b� m� danh ��ng giang h�, l� gi�c m�ng v�a ��p v�a m� h� c�a c�c trang nam t�. ��i v�i ng��i ngo�i m� n�i th� kh�ng ai c� th� n�i r� m�n ph�i Thu� Y�n m�n ch�ng ta l� thi�n ���ng hay ��a ng�c.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F4()
	Say(" Do �� t� c�a b�n ph�i ai c�ng l� nh�ng tuy�t s�c giai nh�n, n�n khi�n cho c�c nam t� ��u rung ��ng ngay c� trong m� v�n c�n th�m mu�n. Cho n�n s� t� s�ng l�p m�n ph�i �� ��a ra m�t quy t�c. V� �� tr�nh cho c�c �� t� c�a Thu� y�n m�n kh�ng b� ��n �ng l�a g�t v� ru�ng b�, ph�m l� nam t� mu�n v�o Thu� Y�n m�n th� ph�i c� v� c�ng tuy�t th� v� ph�i giao ra m�t v�t qu� hi�m, ��ng th�i ��i ��i kh�ng ���c r�i kh�i Thu� Y�n M�n.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say(" Th� T� mu�n t�m hi�u v� v� t� mu�i n�o?",11,"Ch��ng m�n Do�n H�m Y�n/Myun","H�i ���ng S� Gi� L� Thu Th�y/Mli","Th�yTi�n S� Gi� Y�n Hi�u Tr�i/Myan","T��ng Vi S� Gi� H� M� Tuy�t /Mhe","L� Hoa S� Gi� Chung Linh T� /Mzhong","Xu�n H��ng b� b� /Mchun","Nh��c Lan/Mruo","Phong Tr�c/Mfeng","Ti�u C�c/Mxiao","Ng�o Mai/Mao","Kh�ng h�i n�a!/nothing")
end

function Myun()
	Say("Ch��ng m�n Do�n H�m Y�n   V� tr�: Th�y Y�n l�u   T�a ��: 35,75<enter> Do�n Ch��ng m�n l�n l�n t�i Thu� Y�n m�n, sau n�y quen bi�t v�i ���ng m�n ���ng Nh�t Tr�n, tr�i qua nhi�u gian kh� cu�i c�ng s�ng ���c v�i nhau. Hi�n t�i Thu� Y�n ���ng m�n ���c ng��i ��i ca th��ng.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")

end

function Mli()
	Say("H�i ���ng S� Gi� L� Thu Th�y<enter> L� s� t� t�nh c�ch cao ng�o, r�t gh�t ��n �ng, n�n m�t m�c ph�n ��i ch��ng m�n k�t th�n c�ng v�i ���ng Nh�t Tr�n.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Myan()
	Say("Th�y Ti�n S� gi� Y�n Hi�u Tr�i, V� tr�: Th� Ng�c S�nh, To� ��: 43, 90<enter>t� khi Y�n s� t� c�n nh� m�u th�n b� ph� th�n ru�ng b�, c�ng th�m b� b�nh hi�m ngh�o, b� ng��i ta l�ng nh�c m� ch�t, t�o ra m�t v�t th��ng s�u ��m trong l�ng t� �y. Cho n�n tuy b� ngo�i y�u �i�u, nh�ng n�i t�m r�t ki�n c��ng. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mhe()
	Say("T��ng Vi S� Gi� H� M� Tuy�t. V� tr� t�i s�nh B�ch Hoa. T�a ��: 52, 85<enter> H� t� t� d�u d�ng linh ho�t, t�t c� c�c t� mu�i ch�ng ta ai c�ng ��u th�ch t� �y, nh�ng t�n D��ng H� � Thi�n V��ng bang v� th� nh� n� n��c g� �� m� kh�ng ng� ng�ng ��n H� t� t�. Th�t ��ng th��ng. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mzhong()
	Say("L� Hoa S� Gi� Chung Linh T�<enter>Chung mu�i mu�i nh� tu�i nh�t, nh�ng l� ng��i c� ti�n �� nh�t. Do cha m� c�a mu�i �y b� gi�c Kim s�t h�i, ng��i th�n b� l�u l�c cho n�n r�t c�m th� gi�c Kim, chuy�n t�m luy�n t�p v� thu�t �� ��i ng�y b�o th� cho cha m�.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mchun()
	Say("Xu�n H��ng b� b�   V� tr�: H�u hoa vi�n   T�a ��: 40,74<enter> Xu�n H��ng b� b� l� a ho�n c�a ch��ng m�n l�p ph�i, b� ta ��i x� v�i ch�ng ta v� c�ng nh� nh�n v� th�n thi�t.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mruo()
	Say("Nh��c Lan  V� tr�: Qu�ng tr��ng   T�a ��: 48,84  Ph� tr�ch: Giao d�ch binh kh� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mfeng()
	Say("Phong Tr�c   V� tr�: Qu�ng tr��ng   T�a ��: 51,85   Ph� tr�ch: Giao d�ch trang b� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mxiao()
	Say("Ti�u ��o   V� tr�: Qu�ng tr��ng   T�a ��: 53,86   Ph� tr�ch: Giao d�ch d��c ph�m",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mao()
	Say("Ng�o Mai    ��y ch�nh l� ta! ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_cy = GetTask(6)
	if (UTask_cy < 10*256) then	-- δ����
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� ��i M�n �� La hoa, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_enroll","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 10*256) and (UTask_cy < 20*256) then
		Say("<#> Nhi�m v� c�a ng��i hi�n gi� l� nhi�m v� Th�y V� Tr�m, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L10","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 20*256) and (UTask_cy < 30*256) then
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� ��i M�n �� La hoa, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L20","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 30*256) and (UTask_cy < 40*256) then
		Say("<#> Nhi�m v� hi�n gi� c�a ng��i l� V� � Ngh� Th��ng. Hi�n �� "..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L30","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 40*256) and (UTask_cy < 50*256) then
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Di�t �c B� �i�m Th��ng S�n, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L40","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 50*256) and (UTask_cy < 60*256) then
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� B�t tr�m Thi�n T�m Th�p, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L50","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 60*256) and (UTask_cy < 70*256) then
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� B� m�t M� cung c�m ��a, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L60","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_cy >= 70*256) and (UTask_cy < 80*256) then
		Say("<#> Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Tr�ng ph�n s� m�n, hi�n ��"..UTask_cy.."<#>.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_return","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	else
		Say("<#> Ng��i b�y gi� c� th� t� do ra v�o m�n ph�i, t�m th�i kh�ng c� nhi�m v� m�i, hi�n ��"..UTask_cy.."<#>.",3,"T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	end
end

function T_all()
	Say(" Th� T� mu�n t�m hi�u nhi�m v� n�o?",10,"Nhi�m v� nh�p m�n/T_enroll","Nhi�m v� Th�y V� tr�m/T_L10","Nhi�m v� ��i M�n �� La hoa/T_L20","Nhi�m v� V� Y Ngh� Th��ng/T_L30","Nhi�m v� �i�m Th��ng s�n di�t tr� �c B� /T_L40","Nhi�m v� b�t c��p � Thi�n T�m Th�p/T_L50","Nhi�m v� m� cung c�m ��a/T_L60","Nhi�m v� tr�ng ph�n s� m�n/T_return","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu�n nh�p m�n h�c v�, ch� c�n thu�c t�nh h� Th�y, ch�a nh�p ph�i kh�c v� ��ng c�p tr�n 10, ��n b�t k� T�n Th� Th�n ��i tho�i v�i Hoa s� c�a b�n m�n. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u.Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s�.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nh�p m�n, ��ng th�i ��ng c�p ��t tr�n c�p 10, b�n c� th� ti�p nh�n nhi�m v� Th�y V� Tr�m. V��t qua nhi�m v� n�y b�n ���c th�ng l�m Tam Ph�m Hoa S�, h�c ���c <color=blue>Th�y Y�n �ao ph�p v� Th�y Y�n song �ao<color>. ","B��c 1: T�i <color=blue>l�u Th�y Y�n<color> t�m g�p <color=blue>ch��ng m�n Do�n H�m Y�n<color> Ti�p nh�n nhi�m v� ��n <color=blue>c�nh r�ng ph�a ��ng nam<color> t�m c�y <color=red> Th�y V� tr�m<color> b� m�t. ","B��c 2: Trong khu r�ng ph�a ��ng nam ��nh b�i <color=blue>H�a h�<color> nh�t v� c�y <color=red> Th�y V� tr�m<color> ","B��c 3: V� ��n <color=blue>l�u Th�y Y�n<color> ph�c m�nh v�i ch��ng m�n <color=blue>Do�n H�m Y�n<color>, giao <color=red> Th�y V� tr�m<color> nhi�m v� ho�n th�nh ")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m v� Th�y Y�n tr�m v� ��ng c�p tr�n 20, b�n c� th� nh�n nhi�m v� ��i Man �� La Hoa. V��t qua nhi�m v� n�y b�n s� ���c phong l�: <color=blue>Nh� Ph�m Hoa S�<color>, h�c ���c <color=red>B�ng T�m Tr�i �nh<color> ","B��c 1: Trong <color=blue>Th� Ng�c s�nh<color>, g�p <color=blue>Y�n Hi�u Tr�i<color> nh�n nhi�m v� �i ��n <color=blue>v�ch n�i ph�a t�y b�c<color> h�i <color=red>10 b�ng hoa ��i Man �� La<color> ","B��c 2: Khi h�i hoa Man �� La � v�ch n�i t�y b�c th� c�n ph�i c�n th�n <color=blue>tr��c khi ��c t�nh ph�t t�n<color> ph�i quay v� <color=blue>Th� Ng�c s�nh<color> gi�i ��c n�u kh�ng ch�t ��c s� ph�t t�n to�n th�n ","B��c 3: H�i ���c 10 ��a ��i M�n �� La hoa, v� Th� Ng�c s�nh ph�c m�nh, ho�n th�nh nhi�m v�.")
end

function T_L30()
	Talk(7,"t_all","Sau khi ho�n th�nh nhi�m v� ��i Man �� La Hoa v� ��ng c�p ��t tr�n 30, b�n c� th� ti�p nh�n nhi�m v� V� Y Ngh� Th��ng. V��t qua nhi�m v� n�y b�n s� ���c phong l�: Nh�t Ph�m Hoa S� v� s� ���c h�c <color=blue>V� �� L� Hoa, Ph� V�n T�n Tuy�t<color>. ","B��c 1: T�i <color=blue>�i�n B�ch Hoa<color>, g�p <color=blue>H� M� Tuy�t<color> nh�n nhi�m v� �i ��n <color=blue>�o�n l�o n�ng<color> trong <color=blue> th�nh ��i L�<color> t�m h�i b� quy�t tr�ng <color=blue> V� Y Ngh� Th��ng<color> ","B��c 2: ��n th�nh ��i L� t�m ��n �o�n l�o n�ng ph�t hi�n �ng �y �au bu�n v� ��a ch�u g�i b� b�n th� ph� tr�n <color=blue>�i�m Th��ng S�n<color> b�t �i, b�n �i c�u <color=blue>ch�u g�i <color> �ng �y tr��c. ","B��c 3: ��n <color=blue>��ng th� ph� � �i�m Th��ng s�n<color>, ��nh b�i <color=blue>t�n th� l�nh th� ph�<color>, c�u tho�t ��a ch�u c�a �o�n l�o n�ng. ","B��c 4: ���c bi�t c�ch tr�ng V� Y Ngh� Th��ng c�n ph�i c� <color=blue>c� Ng�n Tuy�t<color> s�ng trong <color=blue>Nh� H�i<color>, <color=red>B�ch Th��ng Ph��ng �i�p<color> s�ng c�nh <color=blue>H� �i�p Tuy�n<color>, v� <color=red>con giun ��t ��<color> � g�n <color=blue>V�n N�ng ��nh<color>. ","B��c 5: ��n Nh� H�i t�m <color=blue>thuy�n gia<color> mua <color=red>c� Ng�n Tuy�t<color>, ��n b� H� �i�p Tuy�n l�y ���c B�ch Th��ng Ph��ng �i�p, v� ��o l�y giun ��t �� g�n N�ng V�n ��nh ","B��c 6: V� ��n <color=blue>B�ch Hoa �i�n<color> l�y b� quy�t tr�ng c�y V� Y Ngh� Th��ng, n�i v�i <color=blue>H� M� Tuy�t<color>, ��ng th�i l�y c� Ng�n Tuy�t, B�ch Th��ng Ph��ng �i�p v� giun ��t �� giao cho c� �y, nhi�m v� ho�n th�nh. ")
end

function T_L40()
	Talk(5,"t_all","Ho�n th�nh nhi�m v� ��ng th�i ��ng c�p ��t 40, b�n c� th� nh�n nhi�m v� tr� �c b� �i�m Th��ng S�n. V��t qua nhi�m v� n�y b�n s� tr� th�nh Hoa Ti�n s� gi�, ���c h�c <color=blue>H�n B�ng H� Th�n<color> ","B��c 1: G�p <color=blue>Y�n Hi�u Tr�i<color> � <color=blue>Thi�n �i�n<color>, nh�n nhi�m v� di�t tr� <color=blue>�c b�<color> c��ng �o�t thi�u n� kh�t ti�ng trong <color=blue>th�nh ��i L�<color> ","B��c 2: ��n th�nh ��i L�, t�m <color=blue>t�n �c b�<color>, ph�t hi�n ra m�t <color=blue>l�i �i b� m�t xu�ng l�ng ��t<color> � g�c v��n. �i v�o m�t ��o ��nh b�i <color=blue>tr� th� c�a h�n<color>, gi�i c�u nh�ng thi�u n� trong m�t ��o, ��ng th�i bi�t t�n �c b� �� b�t v�i c� kh�c l�n <color=blue>�i�m Th��ng S�n <color> r�i. ","B��c 3: ��n <color=blue>�i�m Th��ng s�n ��ng<color>, ��nh b�i <color=blue>tr� th�, h� vi�n, b�o ti�u c�a t�n �c b�<color>, l�y �u�c <color=red>3 ch�a kh�a m� c�a<color>, c�u ���c nh�ng <color=blue> thi�u n�<color> b� nh�t trong ph�ng t�i. ","B��c 4: V� ��n <color=blue>Thi�n �i�n Nga Mi<color>, g�p Y�n Hi�u Tr�i ph�c m�nh, nhi�m v� ho�n th�nh. ")
end

function T_L50()
	Talk(5,"t_all","Sau khi ho�n th�nh nhi�m v� �i�m Th��ng s�n di�t �c b� v� ��ng c�p ��t tr�n 50, b�n c� th� nh�n nhi�m v� Thi�n T�m Th�p. V��t qua nhi�m v� n�y b�n s� tr� th�nh Hoa Tinh, h�c ���c <color=blue>Tuy�t �nh <color> ","B��c 1: G�p <color=blue>ch��ng m�n Do�n H�m Y�n<color> � <color=blue>Th�y Y�n L�u<color>, ti�p nh�n nhi�m v�, tr� gi�p S�ng Th�nh t� b�t <color=blue> ��o t�c<color> �� l�y tr�m <color=red>V� ��ng Quan �m<color> ","B��c 2: ��n <color=blue>S�ng Th�nh t�<color> ��i th�ai <color=blue>H� Vi�n ph��ng tr��ng<color>, ���c bi�t b�n c��p �� ch�y v�o trong <color=blue>Thi�n T�m Th�p<color>. ","B��c 3: �i v�o Thi�n T�m Th�p, m�i t�ng l�u ��u b�nh b�i b�n ��o t�c, �o�t l�i <color=red>V� ��ng Quan �m<color>. ","B��c 4: V� ��n <color=blue>Th�y Y�n l�u<color>, g�p Do�n H�m Y�n ph�c m�nh, nhi�m v� ho�n th�nh. ")
end

function T_L60()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� Thi�n T�m Th�p v� ��ng c�p ��t ��n 50, ng��i c� th� ti�p nh�n nhi�m v� C�m ��a m� cung. Ho�n th�nh nhi�m v� n�y, ng��i �u�c phong l�m Hoa Ti�n, thu�n l�i xu�t s�.","B��c 1: G�p <color=blue>Xu�n H��ng b� b�<color> � <color=blue>H�u Hoa Vi�n<color>, ti�p nh�n nhi�m v�, ��n <color=blue>C�m ��a<color> t�m ra s� th�t v� l�i truy�n m�n quy. ","B��c 2: ��u ti�n � <color=blue>c�m ��a m� cung<color> t�m ���c m�t chi�c <color=red>kh�n l�a<color>, sau �� v�o ��n v�ng c�m ��a cu�i c�ng l� <color=blue>�o�n Tr��ng C�c<color> ","B��c 3: ��i tho�i v�i m�t <color=blue>�ng l�o v� danh<color> trong �o�n Tr��ng C�c, nghe �ng �y n�i v� nh�ng chuy�n c�a v� s� t� l�p ph�i, v� c� ���c <color=red>b�c th�<color> ghi ch�p m�i vi�c ","B��c 4: Sau khi tr� l�i <color=blue>H�u Hoa Vi�n<color>, n�i cho Xu�n H��ng b� b� nghe nh�ng �i�u m�nh �� t�m ra. ","B��c 5: ��n l�u <color=blue>Th�y Y�n<color> mang <color=red>th�<color> giao cho <color=blue>ch��ng m�n<color>, nhi�m v� ho�n th�nh ")
end

function T_return()
	Talk(3,"t_all","Sau khi th�nh t�i xu�ng n�i, ��ng th�i ��ng c�p �� ��t tr�n 60, b�n c� th� tr�ng ph�n s� m�n. S� ���c th�ng l�m Hoa Th�n, h�c ���c tuy�t h�c tr�n ph�i <color=blue>M�c D� L�u Tinh, B�ch H�i Tri�u Sinh, v� B�ng C�t Tuy�t T�m <color> ","B��c 1: Sau khi ��t ��ng c�p qu� c�p 60, g�p <color=blue>Do�n H�m Y�n<color> t�i <color=blue> Ph�ng ch�nh<color>, c�u xin b� cho quay v� Th�y Y�n ","B��c 2: Giao n�p <color=red>50000 l��ng b�c<color>, tr� v� Th�y Y�n m�n ")
end

----------------- ���� ---------------------------
function nothing()
end
