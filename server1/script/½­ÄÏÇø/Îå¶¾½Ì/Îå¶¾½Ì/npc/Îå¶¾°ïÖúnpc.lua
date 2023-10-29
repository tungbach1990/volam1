-- �嶾�̰���NPC
-- By: Dan_Deng(2003-12-06)

function main(sel)
	UTask_wu = GetTask(10)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say("Trong b�n gi�o n�y, m�i ng�y n�u kh�ng luy�n c�ng th� kh�ng th� s�ng ���c. Ng��i ��n ��y t�m ta c� chuy�n g�?",4,"T�m hi�u �i�n c� b�n m�n/faction","T�m hi�u c�c v� t�n tr��ng/member","T�m hi�u nhi�m v� /task_get","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 70*256) then				-- ���ų�ʦ
		Say("Ng��i �� xu�t s� t� b� gi�o �t ai quay tr� l�i? Ng��i quay l�i l�n n�y c� chuy�n g� v�y?",4,"�n l�i chuy�n n�m x�a b�n m�n/faction","Nh�n l�i ��o h�u n�m x�a/member","Ta c�n c� th� gi�p g� kh�ng/task_get","Kh�ng h�i n�a!/nothing")
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say("Ng��i c� th� xuy�n qua tr�ng tr�ng ��c v�t �� v�o ���c ��y, xem nh� l� k� t�i. B�n gi�o t�n tr�ng nh�ng ng��i anh t�i. Hoan ngh�nh tham quan!",3,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","Kh�ng h�i n�a!/nothing")
	else													-- ����
		Say("Ng��i ��n �� d� th�m hay �� b�i s�? N�u nh� kh�ng c� l� v�t g� ra m�t th� ta kh�ng c� h�ng th�. ",4,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","T�m hi�u �i�u ki�n nh�p m�n/task_get","Kh�ng h�i n�a!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say("V�y th� ng��i mu�n ta gi�i thi�u v� c�i g� c�a b�n m�n?",5,"Kh�i nguy�n m�n ph�i/F1","V� tr� ��a l� /F2","��a v� giang h� /F3","��c s�c m�n ph�i/F4","Kh�ng h�i n�a!/nothing")
end

function F1()
	Say("B�n gi�o ch� m�i th�nh l�p v�i n�m nay nh�ng ph�t tri�n r�t m�nh. N�i b� t� ch�c nghi�m m�t. Gi�o ch� H�c Di�n Lang Qu�n ch�nh l� ng��i �� s�ng l�p n�n Ng� ��c Gi�o",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F2()
	Say("Xung quanh b�n gi�o l� n�m ng�n ��c phong L�nh, ai mu�n v�o ��y ph�i qua tr�ng tr�ng th� th�ch. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F3()
	Say("T�n ch� c�a Ng� ��c gi�o l� 'L�i �ch quy�t ��nh b�n th�', c� l�i m�i l�m, kh�ng qu�n b�t k� chuy�n th� phi ch�nh t�. Ng� ��c gi�o c�n c� 1 �i�u l� 'K� ��c t�i v�i Ng� ��c gi�o, s� ch�t kh�ng to�n th�y'.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F4()
	Say("B�n gi�o h�nh tung �n b�,h�nh ��ng kh�ng �� l�i d�u t�ch. �ng ch� qu�n tr� b�n ���ng c�ng c� th� l� m�n �� c�a ng� ��c ph�i c� th� gi�t ng��i trong nh�y m�t, h� th� v� t�nh. Th�m ch� nh�ng ng��i ��ng m�n v�i nhau c�ng ��u l� ng��i v� t�nh. Gi�o �� v�i nhau v�n c� th� h� ��c l�n nhau. Ng��i b� tr�ng ��c s� b� xem l� b�n l�nh k�m c�i",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say("Mu�n t�m hi�u v� n�o c�a b�n gi�o?",10,"Gi�o ch� H�c Di�n Lang Qu�n /M01","Kim X� H��ng Ch� V�n B�t T� /M02","X�ch Y�t H��ng ch� �� D� /M03","M�c Th� H��ng Ch� tang Chu /M04","Ng�n Thi�m H��ng Ch� B�ch Doanh Doanh /M05","Thanh Ng� H��ng Ch� Thang B�t /M06","��c Nha /M101","��c Th�ch /M102","��c T�m /M103","Kh�ng h�i n�a!/nothing")
end

function M01()
	Say("Gi�o ch� H�c Di�n Lang Qu�n      V� tr�: T�ng tr�i      T�a ��:  220/166<enter>L� ng��i l�nh ��m v� t�nh, l�ng d� s�t ��, ch�a ai th�y h�n c��i. Ch� quan t�m nghi�n c�u ch� t�o c�c lo�i ��c d��c, mu�n d�ng ��c �� th�ng tr� V� l�m.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M02()
	Say("Kim X� H��ng ch� V�n B�t T�      V� tr�: Kim X� tr�i      V� tr�:156/170<enter> C� ch� nh� nhi n�, khi h�n nh�n xu�ng ��t c��i l� ��n l�c ph�i gi�t ng��i, thi�n h� ch� c� m�t th� vui l� th�y ng��i kh�c �au ��n v� tr�ng ��c.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M03()
	Say("X�ch Y�t H��ng ch� �� D�      V� tr�: X�ch Y�t tr�i      T�a ��: 169/184<enter> l� k� tham lam h�m l�i. Tuy�n C� T� c�a C�n L�n ph�i�� d�ng ti�n h�i l� nh� h�n h� ��c ch��ng m�n C�n L�n",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M04()
	Say("M�c Th� H��ng Ch� Tang Chu",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M05()
	Say("Ng�n Thi�m H��ng ch� B�ch Doanh Doanh      V� tr�: Ng�n Thi�m tr�i  T�a ��: 220/209<enter> M�t nh� hoa ��o, t�m nh� r�n r�t, khu�n m�t l�c n�o c�ng n� m�t n� c��i l�ng l�, nh�ng ra tay r�t ��c �c. C�u k�t v�i Chu Khuy�t C�n L�n ph�i, mu�n m� ho�c  T� Trung Nguy�n c�a V� �ang ph�i.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M06()
	Say("Thanh Ng� Tr�i Ch� Thang B�t      V� tr�: Thanh Ng� tr�i      T�a ��: 200/201<enter> ��c �c v� s�, n�m x�a h�i ch�t m� c�a Y�n Hi�u Tr�i (Th�y Y�n m�n) .",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M101()
	Say("��c Nha      V� tr�:      T�a ��: 182/194      Ph� tr�ch: Giao d�ch binh kh� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M102()
	Say("��c Th�ch      V� tr�:      T�a ��: 184/193      Ph� tr�ch: Giao d�ch trang b� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function M103()
	Say("��c T�m      V� tr�:      T�a ��: 187/191      Ph� tr�ch: Giao d�ch d��c ph�m",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_wu = GetTask(10)
	if (UTask_wu < 10*256) then	-- δ����
		Say("Ng��i hi�n ch�a nh�p m�n. Mu�n nh�p m�n, c� th� ��n b�t k� T�n Th� Th�n �� t� ti�p d�n c�a b�n m�n.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_enroll","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 10*256) and (UTask_wu < 20*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Nh�n nh�n v� T�n Th�ch",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L10","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 20*256) and (UTask_wu < 30*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Nh�n ��u Tr�ng.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L20","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 30*256) and (UTask_wu < 40*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� M�c H��ng ��nh.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L30","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 40*256) and (UTask_wu < 50*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Nh�n K�nh V��ng M�ng X�.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L40","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 50*256) and (UTask_wu < 60*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Ng�c San H�.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L50","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 60*256) and (UTask_wu < 70*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� T�ch ��c Chu.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L60","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_wu >= 70*256) and (UTask_wu < 80*256) then
		Say("Ng��i hi�n �ang ti�p nh�n l� nhi�m v� Tr�ng ph�n s� m�n.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_return","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	else
		Say("Ng��i c� th� t� do ra v�o m�n ph�i, t�m th�i kh�ng c� nhi�m v� m�i.",3,"T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	end
end

function T_all()
	Say("Mu�n t�m hi�u nhi�m v� g�?",10,"Nhi�m v� nh�p m�n/T_enroll","Nhi�m v� Nh�n Nh�n v� T�n Th�ch /T_L10","Nhi�m v� Nh�n ��u Tr�ng /T_L20","Nhi�m v� M�c H��ng ��nh /T_L30","nhi�m v� Nh�n K�nh V��ng M�ng X�  /T_L40","Nhi�m v� Ng�c San H� /T_L50","Nhi�m v� T� ��c Chu  /T_L60","Nhi�m v� tr�ng ph�n s� m�n/T_return","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu�n nh�p m�n h�c ngh�, ch� c�n thu�c h� M�c v� ��t ��n c�p 10. ��n b�t k� T�n th� th�n n�o �� g�p �� t� ti�p d�n c�a b�n m�n l� ���c. Sau �� l�n l��t ho�n th�nh 5 Nhi�m v� c�a m�n ph�i. S� h�c ���c v� c�ng,���c phong Danh hi�u. Sau khi ho�n th�nh Nhi�m v� xu�t s� s� th�nh ngh� xu�t s� ")
end

function T_L10()
	Talk(5,"t_all","Sau khi nh�p m�n v� ��ng c�p �� ��t ��n 10, ng��i c� th� ti�p nh�n nhi�m v� Nh�n nh�n v� T�n th�ch. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� �o�t H�n T�n Nh�n, h�c ���c v� c�ng Ng� ��c �ao ph�p,Ng� ��c Ch��ng Ph�p","B��c 1: ��n M�c Th� tr�i g�p Tang Chu, ti�p nh�n nhi�m v�, �i b�t 10 con Nh�n v� mua 10 bao T�n Th�ch cho b� ta luy�n c�ng","B��c 2: ��n Nh�n ��ng s�n b�t 10 con nh�n","B��c 3: ��n D��c �i�m � Long Tuy�n th�n mua 10 bao T�n Th�ch","B��c 4: Tr� v� M�c Th� tr�i, giao Nh�n nh�n v� T�n th�ch cho Tang Chu. Ho�n th�nh nhi�m v�.")
end

function T_L20()
	Talk(4,"t_all","Ho�n th�nh nhi�m v� Nh�n nh�n v� T�n th�ch v� ��ng c�p ��t ��n 20,ng��i c� th� ti�p nh�n nhi�m v� Nh�n ��u tr�ng. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Th�i M�nh S� Gi�, h�c ���c v� c�ng X�ch Di�m th�c Thi�n, T�p Nan D��c Kinh","B��c 1: ��n Ng�n Thi�m tr�i g�p B�ch Doanh Doanh, ti�p nh�n nhi�m v�, �i gi�t La Ti�u Th�t Qu�, l�y v� 7 c�i ��u!","B��c 2: ��n La Ti�u s�n, ��nh b�i La Ti�u Th�t Qu� ","B��c 3: Tr� v� Ng�n Thi�m tr�i, g�p B�ch Doanh Doanh ph�c m�nh, ho�n th�nh nhi�m v�.")
end

function T_L30()
	Talk(6,"t_all","Ho�n th�nh nhi�m v� Nh�n ��u tr�ng v� ��ng c�p ��t ��n 30,ng��i c� th� ti�p nh�n nhi�m v� M�c H��ng ��nh. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� H�c Am Di�m La, h�c ���c v� c�ng U Minh Kh� L�u, V� H�nh ��c, B�ch ��c Xuy�n T�m, B�ng Lam Huy�n Tinh","B��c 1: ��n X�ch Y�t tr�i g�p �� D�, ti�p nh�n nhi�m v�, �i tr� ph�n �� l�y l�i M�c H��ng ��nh.","B��c 2: ��n V� Di s�n, ��nh b�i Ph�n ��, l�y ���c M�c H��ng ��nh.","B��c 3: Tr� v� X�ch Y�t tr�i, �� D� ph�t hުn M�c H��ng ��nh l� gi�, c�n ph�i �i l�y l�i M�c H��ng ��nh th�t","B��c 4: Tr� l�i V� Di s�n, ��nh b�i ph�n �� ��u M�c, l�y ���c M�c H��ng ��nh th�t!","B��c 5: Tr� l�i X�ch Y�t tr�i, giao M�c H��ng ��nh th�t cho �� D�, ho�n th�nh nhi�m v�.")
end

function T_L40()
	Talk(5,"t_all","Ho�n th�nh nhi�m v� M�c H��ng ��nh v� ��ng c�p ��t ��n 40, ng��i c� th� ti�p nh�n nhi�m v� Nh�n K�nh V��ng M�ng X�. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� V� ��ng La S�t, h�c ���c v� c�ng V�n ��c Th�c T�m, Xuy�n Y Ph� Gi�p","B��c 1: ��n Kim X� tr�i g�pV�n B�t T�, ti�p nh�n nhi�m v�, ��n Kim X� Huy�t Tr�ch b�t cho V�n B�t T� 1 con Nh�n K�nh V��ng M�ng X�.","B��c 2: Tr��c khi �i v�o Kim X� Huy�t Tr�ch c�n ��n D��c �i�m mua X� H��ng","B��c 3: v�o Kim X� Huy�t Tr�ch, ��nh b�i Nh�n K�nh V��ng M�ng X� ","B��c 4: Tr� v� Kim X� tr�i, giao Nh�n K�nh V��ng M�ng X� cho V�n B�t T�, ho�n th�nh nhi�m v�.")
end

function T_L50()
	Talk(6,"t_all","Ho�n th�nh nhi�m v� Nh�n K�nh V��ng M�ng X� v� ��ng c�p ��t ��n 50, ng��i c� th� ti�p nh�n nhi�m v� Ng�c san h�. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Co ��c T�n Gi�, h�c ���c v� c�ng Xuy�n T�m ��c Th�ch","B��c 1: ��n Thanh Ng� tr�i g�p Thang B�t, ti�p nh�n nhi�m v�, �i �o�t l�i Ng�c san h�.","B��c 2: ��n V� Di s�n, v�o Ng�c Hoa ��ng, ��nh b�i L�u Kh�u, bi�t ���c Ng�c san h� �� b� mang v�o Nghi�t Long ��ng","B��c 3: Ti�p t�c v�o Nghi�t Long ��ng, ��nh b�i c��ng ��o, l�y ���c Ng�c san h�.","B��c 4: Tr� v� Thanh Ng� tr�i, giao Ng�c san h� cho Thang B�t, ho�n th�nh nhi�m v�.")
end

function T_L60()
	Talk(5,"t_all","Ho�n th�nh nhi�m v� Ng�c san h� v���ng c�p ��t ��n 50, ng��i c� th� ti�p nh�n nhi�m v� T�ch ��c Chu. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� U Minh Qu� S�, thu�n l�i xu�t s�.","B��c 1: ��n T�ng tr�i g�p gi�o ch� H�c Di�n Lang Qu�n, ti�p nh�n nhi�m v�, �o�t l�i T�ch ��c Chu t� tay Nh�n ��ng ph�i","B��c 2: ��n Nh�n ��ng s�n, v�o D��ng Gi�c ��ng ��nh b�i v� s� �� t� Nh�n ��ng ph�i, cu�i c�ng ch��ng m�n c�a ch�ng ph�i l� di�n","B��c 3: ��nh b�i Ch��ng m�n Nh�n ��ng ph��, l�y l�i T�ch ��c Chu.","B��c 4: Tr� v� T�ng tr�i, giao T�ch ��c Chu cho H�c Di�n Lang Qu�n, ho�n th�nh nhi�m v�.")
end

function T_return()
	Talk(3,"t_all","Th�ng qua tr�ng ph�n s� m�n, ng��i ���c phong l� U Minh Qu� V��ng, h�c ���c tuy�t h�c tr�n ph�i Ng� ��c K� Kinh, v� c�ng Thi�n C��ng ��a S�t, Chu C�p Thanh Minh","B��c 1: Sau khi ��ng c�p ��t ��n c�p 60, ��n T�ng tr�i g�p gi�o ch� H�c Di�n Lang Qu�n, xin tr�ng ph�n Ng� ��c gi�o","B��c 2: T�ng cho m�n ph�i 50000 l��ng, tr�ng ph�n Ng� ��c gi�o")
end

----------------- ���� ---------------------------
function nothing()
end
