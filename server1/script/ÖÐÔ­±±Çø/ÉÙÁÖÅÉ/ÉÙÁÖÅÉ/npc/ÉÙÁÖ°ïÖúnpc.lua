-- �����ɰ���NPC
-- By: Dan_Deng(2003-12-01)

function main(sel)
	UTask_sl = GetTask(7)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say("B�n t� �� c� t� ng�n n�m l�ch s�, v� ph��ng di�n v� ngh� c� th� ��n t�m Ph��ng tr��ng hay c�c v� th� t�a m� h�i, c�n v�n �� kh�c c� th� ��n h�i b�n t�ng l� ���c.",4,"T�m hi�u �i�n c� b�n m�n/faction","T�m hi�u c�c v� t�n tr��ng/member","T�m hi�u nhi�m v� /task_get","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 70*256) then				-- ���ų�ʦ
		Say("L�c tr��c ng��i t� M�c Nh�n H�ng ��n La H�n Tr�n trong kho�n th�i gian r�t ng�n, b�y gi� h�u b�i ai c�ng noi g��ng ng��i, mau �i xem c�c s� �� �i.",4,"�n l�i chuy�n n�m x�a b�n m�n/faction","Nh�n l�i ��o h�u n�m x�a/member","Ta c�n c� th� gi�p g� kh�ng/task_get","Kh�ng h�i n�a!/nothing")
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say("Hoan ngh�nh ��n v�i Thi�u L�m! C�c v� c� th� t� t�c du ngo�n trong t�. C� v�n �� g� th� c� ��n h�i l�o n�p.",3,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","Kh�ng h�i n�a!/nothing")
	else													-- ����
		Say("Hoan ngh�nh ��n v�i Thi�u L�m T�! Kh�ng bi�t ��n b�i s� hay l� Ph�t v�y?",4,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","T�m hi�u �i�u ki�n nh�p m�n/task_get","Kh�ng h�i n�a!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say("Ng��i mu�n bi�t v� b� ph�n n�o trong Thi�u L�m ��y?",5,"Kh�i nguy�n m�n ph�i/F1","V� tr� ��a l� /F2","��a v� giang h� /F3","��c s�c m�n ph�i/F4","Kh�ng h�i n�a!/nothing")
end

function F1()
	Say("B�n t� ���c s�ng l�p t�i B�c Ng�y Hi�u V�n �� Th�i H�a Th�p C�u Ni�n (C�ng nguy�n 49 n�m) . Thi�n Tr�c t�ng nh�n B�t �� t� T�y V�c ��n Trung Nguy�n, do Hi�u V�n �� t�i Thi�u Th�t S�n x�y d�ng l�n ch�a Thi�u L�m �� cung d��ng. 30 n�m sau, Nam Thi�n Tr�c t�ng nh�n B� �� ��t Ma ��n Thi�u L�m T�, chi�u n�p �� t�, truy�n th� Thi�n T�ng, ch�nh v� th� �� tr� th�nh Ph�t gi�o Thi�n T�ng khai s�n T� S�.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F2()
	Say("B�n t� n�m t�i T�nh H� Nam Tung S�n, Tung S�n l� do c�c d�y n�i h�nh th�nh, b�n ��ng l� Th�i Th�t S�n, b�n T�y l� Thi�u Th�t S�n, m�i b�n c� 16 ��nh, ��nh n�o c�ng n�i danh, b�n t� t�a l�c t�i Tr�c L�m Mao Th�t, Thi�u Th�t S�n Ng� Nhu Phong H�, c� danh 'Thi�u L�m'.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F3()
	Say("B�n ph�i t� tr��c gi� ���c x�ng t�ng l� v� l�m �� nh�t m�n ph�i, ���c xem l� Th�i S�n B�c ��u c�a V� L�m Trung Nguy�n. T�ng ch�ng trong Thi�u L�m T� x�a nay c� truy�n th�ng h�c v�, v�i '72 tuy�t k� c�a Thi�u L�m' �� vang danh thi�n h�.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F4()
	Say("B�n ph�i c� truy�n th�ng b�i Ph�t v� luy�n v�, �� t� trong m�n v� c�ng cao si�u, l�i c� t�nh ngh�a hi�p. �� t� b�n ph�i l� nam gi�i ph�n ra c� �� t� xu�t gia v� �� t� t�c gia hai lo�i, xu�t gia �� t� tu luy�n trong t�, c�n t�c gia �� t� ph�n r�i r�c kh�p n�i, h�nh hi�p tr��ng ngh�a.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say("Ng��i mu�n bi�t v�n �� g� c�a b�n t�?",9,"Ph��ng Tr��ng Huy�n Nh�n ��i s� /M01","��t Ma ���ng ��u t�a Huy�n Bi/M02","B�n Nh��c ���ng ��u t�a Huy�n Gi�c/M03","T�ng Kinh c�c ��u t�a Huy�n T� /M04","La H�n ���ng ��u t�a Huy�n Nan/M05","Tr�ng M�c/M101","Tr�ng Ti�t/M102","Tr�ng Vi/M103","Kh�ng h�i n�a!/nothing")
end

function M01()
	Say("ph��ng tr��ng Huy�n Nh�t ��i s�  V� tr�: ph��ng tr��ng Thi�n ph�ng  T�a ��: 230,184<enter> Tr� tu� xu�t ch�ng, v� ngh� cao c��ng, khi�m nh��ng �� l��ng ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M02()
	Say("��t Ma ���ng ��u t�a Huy�n Bi  V� tr�: ��t Ma ���ng  T�a ��: 210,188<enter> L� ng��i thi�t di�n v� t�, c�ng ch�nh nghi�m minh, tuy c� l�c h�i gi�o �i�u nh�ng r�t ���c c�c �� t� y�u qu� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M03()
	Say("B�n Nh��c ���ng ��u t�a Huy�n Gi�c  V� tr�: h� Ph�ng sinh  T�a ��: 220,193<enter> C�m gh�t c�i �c, t�nh n�ng nh� l�a, kh�ng kh�i h�o hi�p",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M04()
	Say("Ch� t�a T�ng Kinh c�c Huy�n T�       V� tr�: T�ng Kinh c�c       T�a ��: 218,190<enter> c� t�i thao l��c, th�ng bi�t m�i s�, l� m�t con m�t s�ch, l� ng��i th�ch h�a b�nh, gh�t tranh ��u v�i ng��i kh�c, ph�m chuy�n g� c�ng l�y ch� nh�n l�m ��u, c� l�c h�i c� h� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M05()
	Say("La H�n ���ng ��u t�a Huy�n Nan  V� tr�: La H�n ���ng  T�a ��: 201,192<enter> Tr�ng quan ni�m ��a v� x� h�i, l� ng��i cao ng�o, tranh c��ng h�o th�ng, lu�n mu�n c�ng ��t Ma vi�n th� t�a Huy�n Bi tranh t�i cao th�p. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M101()
	Say("Tr�ng M�c  V� tr�: Qu�ng tr��ng  T�a ��: 211,196  Ph� tr�ch: Giao d�ch binh kh� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M102()
	Say("Tr�ng Ti�t  V� tr�: Qu�ng tr��ng  T�a ��: 209,194  Ph� tr�ch: Giao d�ch trang b� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M103()
	Say("Tr�ng Vi  V� tr�: Qu�ng tr��ng  T�a ��: 208,195  Ph� tr�ch: Giao d�ch D��c ph�m",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_sl = GetTask(7)
	if (UTask_sl < 10*256) then	-- δ����
		Say("Ng��i hi�n ch�a nh�p m�n, mu�n nh�p m�n ��n c�c T�n Th� th�n g�p �� t� ti�p d�n",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_enroll","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 10*256) and (UTask_sl < 20*256) then
		Say(" Ng��i hi�n �ang ti�p nh�n l� nhi�m v� M�c Nh�n H�ng",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L10","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 20*256) and (UTask_sl < 30*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Di nh�n",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L20","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 30*256) and (UTask_sl < 40*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Th�p l�m nghi tung",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L30","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 40*256) and (UTask_sl < 50*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� T�ch Di�t Nh� T�ng",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L40","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 50*256) and (UTask_sl < 60*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� D�ch C�t Kinh",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L50","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 60*256) and (UTask_sl < 70*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� La H�n Tr�n,",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L60","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_sl >= 70*256) and (UTask_sl < 80*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Tr�ng ph�n s� m�n",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_return","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	else
		Say("Ng��i c� th� t� do ra v�o m�n ph�i, t�m th�i kh�ng c� nhi�m v� m�i",3,"T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	end
end

function T_all()
	Say("Mu�n t�m hi�u nhi�m v� g�?",10,"Nhi�m v� nh�p m�n/T_enroll","Nhi�m v� M�c Nh�n h�ng/T_L10","Nhi�m v� Di nh�n/T_L20","Nhi�m v� Th�p L�m nghi tung/T_L30","Nhi�m v� T�ch Di�t Nh� t�ng/T_L40","Nhi�m v� D�ch C�t Kinh/T_L50","Nhi�m v� La H�n tr�n/T_L60","Nhi�m v� tr�ng ph�n s� m�n/T_return","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu�n nh�p m�n h�c ngh�, ch� c�n thu�c h� Kim v� ��t c�p 10. ��n ��i tho�i v�i �� t� ti�p d�n Thi�u l�m t�i c�c T�n th� th�n l� ���c. Sau khi nh�p m�n, l�n l��t ho�n th�nh nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng, ���c phong Danh hi�u. Sau khi ho�n th�nh nhi�m v� xu�t s� l� c� th� xu�t s�.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nh�p m�n v� ��t ��n c�p 10, c� th� ti�p nh�n nhi�m v� M�c Nh�n h�ng. Ho�n th�nh nhi�m v� n�y, ng��i s� ���c phong l� H� Vi�n V� T�ng, h�c ���c v� c�ng Thi�u L�m Quy�n ph�p, Thi�u L�m C�n ph�p, Thi�u L�m �ao ph�p.","B��c 1: ��n Thi�n ph�ng g�p ph��ng tr��ng, ti�p nh�n nhi�m v� M�c Nh�n h�ng, �i l�y Kim Li�n hoa.","B��c 2: �i v�o h�m M�c nh�n, ��nh b�i M�c nh�n, s� c� 30% c� h�i l�y ���c Kim Li�n hoa.","B��c 3: Tr� l�i Thi�n ph�ng giao Kim Li�n hoa cho Huy�n Nh�n ph��ng tr��ng, ho�n th�nh nhi�m v�.")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m v� M�c nh�n h�ng v� ��t ��n c�p 20, ng��i c� th� ti�p nh�n nhi�m v� Man Di. Ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� H� Tr� Kim Cang, h�c ���c v� c�ng B�t ��ng Minh V��ng","B��c 1: ��n ��t Ma ���ng g�p Huy�n Bi, ti�p nh�n nhi�m v�, ��n Ph�c Ng�u s�n T�y gi�o hu�n 5 t�n Man Di.","B��c 2: ��n Ph�c Ng�u s�n T�y, l�n l��t ��nh b�i 5 t�n Man Di.","B��c 3: Tr� l�i ��t Ma ���ng, g�p Huy�n Bi ph�c m�nh, ho�n th�nh nhi�m v�.")
end

function T_L30()
	Talk(5,"t_all","Sau khi ho�n th�nh nhi�m v� Man Di v� ��t ��n tr�n c�p 30, ng��i c� th� ti�p nh�n nhi�m v� Th�p L�m Nghi Tung. Ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� H� ph�p La H�n, h�c ���c v� c�ng La H�n Tr�n","B��c 1: ��n h� Ph�ng sinh g�p Huy�n Gi�c, ti�p nh�n nhi�m v�, ��n Th�p L�m ��nh b�i nh�ng k� c� h�nh tung m� �m.","B��c 2: ��n Th�p L�m, ��nh b�i b�n ch�ng, ph�t hi�n b�n ch�ng ch�nh l� gi�n �i�p c�a Kim Qu�c, ��ng ��ng b�n ch�ng �� ��nh c�p 'B�t Nh� T�m Kinh', ch�y ��n Kim Quang ��ng.","B��c 3: ��n Kim Quang ��ng, ��nh b�i gi�n �i�p Kim Qu�c, �o�t l�i 'B�t Nh� T�m Kinh'.","B��c 4: Quay l�i h� Ph�ng sinh, giao 'B�t Nh� T�m Kinh' cho Huy�n Gi�c, ho�n th�nh nhi�m v�.")
end

function T_L40()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� Th�p L�m Nghi Tung v� ��t tr�n c�p 40, ng��i c� th� ti�p nh�n nhi�m v� T�ch Di�t Nh� T�ng. Ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Truy�n Kinh La H�n, h�c ���c v� c�ng S� T� H�ng","B��c 1: ��n Ph��ng Tr��ng Thi�n Ph�ng g�p Huy�n Nh�n Ph��ng Tr��ng, ti�p nh�n nhi�m v�, t�m T�ch Di�t nh� th�n t�ng th�nh gi�o chuy�n thi�n h� c�c th�.","B��c 2: ��n M�t Th�t ph�a sau n�i, tr� l�i ch�nh x�c c�u h�i �� v�o m�t th�t.","B��c 3: ��nh b�i b�n ng��i ��ng trong m�t th�t, c� th� m� c�a s� bi�t ���c kh�u quy�t �� n�i chuy�n v�i Nh� T�ng.","B��c 4: ��n ph�a tr��c c�a s� nh� cu�i M�t Th�t, ��c ch�nh x�c kh�u quy�t, th�nh gi�o thi�n h� c�c th� t� Nh� T�ng.","B��c 5: Quay l�i Ph��ng Tr��ng Thi�n Ph�ng, truy�n ��t ch�nh x�c �i�u Nh� T�ng �� n�i cho Huy�n Nh�n ph��ng tr��ng nghe, ho�n th�nh nhi�m v�. N�u qu�n, c� th� �i th�nh gi�o l�i.")
end

function T_L50()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� T�ch Di�t Nh� T�ng v� ��t tr�n c�p 50, ng��i c� th� ti�p nh�n nhi�m v� D�ch C�t Kinh. Ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Ph�c Ma Thi�n V��ng, h�c ���c v� c�ng Ma Ha V� L��ng, Long Tr�o H� Tr�o, Ho�nh T�o L�c H�p","B��c 1: ��n T�ng Kinh C�c g�p Huy�n T�, ti�p nh�n nhi�m v�, t�m Tr�ng Vi�n li�u m�ng l�y l�i 'D�ch C�t Kinh' trong T�ng Kinh C�c.","B��c 2: ��n khu luy�n v� ��i tho�i v�i Ti�u h�a th��ng Tr�ng T�m, bi�t ���c c� th� d�ng m�t con g� quay �� Tr�ng t�m n�i ra b� m�t c�a Tr�ng Vi�n.","B��c 3: ��n T�u l�u � Bi�n Kinh mua m�t con g� quay, sau �� quay l�i t�m Tr�ng T�m bi�t ���c b� m�t.","B��c 4: C�n c� l�i n�i c�a Tr�ng T�m, ��n t�m d��i t�ng �� to trong r�ng t�ng sau n�i l�y ���c 'D�ch C�t Kinh'.","B��c 5: Quay l�i T�ng Kinh C�c, giao 'D�ch C�t Kinh' cho Huy�n T�, ho�n th�nh nhi�m v�.")
end

function T_L60()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m v� D�ch C�t Kinh v� ��t tr�n c�p 50, ng��i c� th� nh�n nhi�m v� La H�n tr�n. Ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� V� L��ng Th�ch T�n, thu�n l�i xu�t s�.","B��c 1: ��n La H�n ���ng g�p Huy�n Nan, ti�p nh�n nhi�m v�, v�o La H�n Tr�n l�y b�n t�n v�t: tr�ng h�t, thi�n tr��ng, M�c ng� v� b�t nh� s�.","B��c 2: V�o La H�n Tr�n, ��nh b�i qu�i v�t l�y ���c b�n t�n v�t.","B��c 3: Quay l�i La H�n ���ng, giao t�n v�t cho Huy�n Nan, ho�n th�nh nhi�m v�.")
end

function T_return()
	Talk(3,"t_all","Sau khi ho�n th�nh nhi�m v� Tr�ng ph�n s� m�n, ng��i ���c phong l� H� Ph�p Tr��ng L�o, h�c ���c v� c�ng tr�n ph�i D�ch C�n Kinh, Nh� Lai Thi�n Di�p","B��c 1: Sau khi ��t c�p 60 tr� l�n, ��n Ph��ng Tr��ng Thi�n Ph�ng g�p Huy�n Nh�n Ph��ng Tr��ng, xin tr�ng ph�n Thi�u L�m ph�i.","B��c 2: Giao n�p 50000 l��ng b�c, tr�ng ph�n Thi�u L�m ph�i.")
end

----------------- ���� ---------------------------
function nothing()
end
