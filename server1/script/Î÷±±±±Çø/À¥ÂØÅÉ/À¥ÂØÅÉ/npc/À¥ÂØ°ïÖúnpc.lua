--�����ɰ���NPC
-- ��ס��Ҫ����GetTask(9) == 127���ݴ���δ�ӣ�
-- By: Dan_Deng(2003-12-01)

function main(sel)
	UTask_kl = GetTask(9)
	player_faction = GetFaction()
	if (player_faction == "kunlun") then		-- ���ŵ���
		RestoreLife()		-- �����������
		RestoreMana()
		RestoreStamina()
		Say("L�o phu �� � b�n m�n m�y m��i n�m, ch�ng ki�n bao nhi�u s� thay ��i, bi�t r� �i�u n�n n�i s� n�i, �i�u g� kh�ng n�i ���c th� ��ng bao gi� truy t�m c�n c�i",4,"T�m hi�u �i�n c� b�n m�n/faction","T�m hi�u c�c v� t�n tr��ng/member","T�m hi�u nhi�m v� /task_get","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 70*256) then				-- ���ų�ʦ
		Say("Hi�m khi g�p ���c nh�ng ��ng m�n �� th�nh ngh� quay l�i n�i ��y. Nh�n c�c ng��i nh�p m�n, r�i l�i th�y c�c ng��i th�nh ngh� h�nh t�u giang h�, kh�ng th� kh�ng c�m th�y th�i gian tr�i nhanh nh� t�n",4,"�n l�i chuy�n n�m x�a b�n m�n/faction","Nh�n l�i ��o h�u n�m x�a/member","Ta c�n c� th� gi�p g� kh�ng/task_get","Kh�ng h�i n�a!/nothing")
	elseif (player_faction ~= "") then			-- �Ǳ��ų�ʦ���������ɣ����ɲ�Ϊ�ռ�ָ�����֣�
		Say("Hoan ngh�nh �� ��n C�n L�n ph�i, ���ng xa v�t v� ��n ��y, kh�ng bi�t c� �i�u g� ch� gi�o?",3,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","Kh�ng h�i n�a!/nothing")
	else													-- ����
		Say("C�n L�n ph�i ��o ph�p t� ti�n, r�t hoan ngh�nh qu� v� tham quan h�c ngh� ",4,"T�m hi�u qu� ph�i/faction","T�m hi�u c�c v� ��o tr��ng/member","T�m hi�u �i�u ki�n nh�p m�n/task_get","Kh�ng h�i n�a!/nothing")
	end
end

----------------- ���ɽ��ܲ��� ----------------------------
function faction()
	Say("V�y th� ng��i mu�n ���c gi�i thi�u ph��ng di�n n�o c�a b�n m�n? ",5,"Kh�i nguy�n m�n ph�i/F1","V� tr� ��a l� /F2","��a v� giang h� /F3","��c s�c m�n ph�i/F4","Kh�ng h�i n�a!/nothing")
end

function F1()
	Say("C�n L�n ph�i � t�n T�y V�c, tuy ���c s�ng l�p �� l�u nh�ng sau khi S� T� khai ph�i qua ��i, trong ph�i kh�ng c� ai l� xu�t ch�ng. M�i cho ��n h�n tr�m n�m tr��c, C�n Lu�n ph�i xu�t hi�n m�t v� k� nh�n. Ng��i n�y kh�ng nh�ng t�o ���c uy danh l�ng l�y trong v� l�m Trung Nguy�n m� c�n gi�p t�n tu�i c�a C�n Lu�n b�t ��u lan r�ng kh�p v� l�m.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F2()
	Say("C�n L�n S�n to� l�c t�i T�n C��ng, giao gi�i c�a Thanh H�i, l�i c� ���c ��a v� huy ho�ng c�a 'V�n S�n Chi T�', ���c xem l� 'Trung Qu�c �� nh�t s�n'",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F3()
	Say("B�n ph�i tuy xa t�n T�y V�c, nh�ng v�n hy v�ng c� th� ��t ���c ��a v� t��ng x�ng t�i Trung Nguy�n, hi�n t�i �� d�n b�nh ��ng ��a v� v�i Thi�u L�m, V� �ang v� Nga Mi",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function F4()
	Say("B�n ph�i �� t� c� c� nam n�,t�n ph�c ��o gi�o. �� t� ���c ph�p h�n ph�i, kh�ng c�m �n m�n. ��c �i�m l�n nh�t c�a b�n ph�i c� 2 �i�u: 1 l� d� t�m, 2 l� b� ngo�i c� v� ch�nh nh�n qu�n t�, nh�ng b�n trong c�c k� nham hi�m x�o tr�, n�i b� ��ng m�n c�ng kh�ng t�n nhi�m l�n nhau, lo�i tr� l�n nhau, tranh quy�n t��c v�. Ng��it�i b�n m�n n�i n�ng ph�i lu�n c�n th�n, b�t c� chuy�n g� c�ng kh�ng n�n nhi�u l�i",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ��Ա���ܲ��� ----------------------------
function member()
	Say("V�y ng��i mu�n ���c gi�i thi�u v� n�o c�a b�n m�n?",11,"Ch��ng m�n Tuy�n C� T� /Mxuan","Thanh Li�n T� /Mqing","Ng�c Ho�nh T� /Myu","Chu Khuy�t/Mzhu","��ng T�ch Nhan/Mtong","Ti�u H�n/Mxiao","Th�n T�c L�o Nh�n/Mtan","Tr�n T�m/Mxin","Tr�n Duy�n/Myuan","Tr�n Ni�m/Mnian","Kh�ng h�i n�a!/nothing")
end

function Mxuan()
	Say("Ch��ng m�n Tuy�n C� T�   V� tr�: Ch�nh �i�n   T�a ��: 190,196<enter> ��y r�c d� t�m, ngo�i m�t ra v� qu�n t� nh�n nh�n, th�c t� t�m hi�m ��c �c, ch�a ��t m�c ��ch kh�ng t� m�i th� �o�n. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mqing()
	Say("Thanh Li�n T�   V� tr�: T� Vi �i�n   T�a ��: 186/199<enter>L� ng��i �ch k�, m�c ��ch l�n nh�t mu�n l�m ch��ng m�n C�n L�n Ph�i, v� ��t m�c ��ch, kh�ng ti�c l�i d�ng l�n nhau v�i Ng�c Ho�nh T� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Myu()
	Say("Ng�c Ho�nh T�  V� tr�: Thi�n Vi �i�n   T�a ��: 195/195<enter>L� ng��i c� l�ng �� k� cao, bao g�m c� �� t� c�a m�nh. V� mu�n ��t ���c ch�c ch��ng m�n c�a C�n L�n Ph�i n�n l�i d�ng  l�n nhau v�i Thanh Li�n T�, th�c ch�t ai c�ng mang d� t�m.",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mzhu()
	Say("Chu Khuy�t    V� tr�:  B�n trong ��i m�n        T�a ��: 198/200<enter>��i �� T� c�a Tuy�n C� T�, t�nh t�nh l�nh ��m, nham hi�m �� k�. B� B�ch Doanh Doanh c�a Ng� ��c gi�o l�i d�ng",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mtong()
	Say("��ng T�ch Nhan   V� tr�: h�u Hoa vi�n   T�a ��: 178,195<enter> con g�i Tuy�n C� T�, ng��i trong tr�ng ng�y th�, t�m t�nh l��ng thi�n",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mxiao()
	Say("Ti�u H�n   V� tr�: T�ch Nhan ��nh   T�a ��: 184,196<enter> a ho�n c�a ��ng T�ch Nhan, l� m�t c� g�i nh� nh�n, th�ng minh lanh l�i. ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mtan()
	Say("Th�n T�c L�o Nh�n   V� tr�: ph�ng �� t�   T�a ��: 191,201<enter> Ch��ng m�n c�a ��i tr��c, s� ph� c�a 3 ng��i Tuy�n C� T�, Thanh Li�n T� v� Ng�c Ho�nh T�. Ng�y tr��c l�c ���ng nhi�m Ch��ng m�n, b�n t�nh t�n nh�n, ��i ��i m�n �� th� b�o v� �n, khi�n 3 �� �� u�t h�n r�p k� h�m h�i ra n�ng n�i n�y. Nh�ng v� 3 �� �� nghi s� l�n nhau, n�n kh�ng d�m h�i ch�t l�o",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mxin()
	Say("Tr�n T�m   V� tr�: Qu�ng tr��ng   T�a ��: 189,197   Ph� tr�ch: Giao d�ch binh kh� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Myuan()
	Say("Tr�n Duy�n   V� tr�: Qu�ng tr��ng   T�a ��: 193,195   Ph� tr�ch: Giao d�ch trang b� ",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function Mnian()
	Say("Tr�n Ni�m   V� tr�: Qu�ng tr��ng   T�a ��: 193,197   Ph� tr�ch: Giao d�ch D��c ph�m",2,"T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

----------------- ������ܲ��� ----------------------------
function task_get()
	UTask_kl = GetTask(9)
	if (UTask_kl < 10*256) then	-- δ����
		Say("Ng��i hi�n ch�a nh�p m�n, mu�n nh�p m�n ��n c�c T�n Th� th�n g�p �� t� ti�p d�n c�a b�n ph�i l� ���c",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_enroll","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 10*256) and (UTask_kl < 20*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� h�i thu�c.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L10","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 20*256) and (UTask_kl < 30*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� x��ng ��u con l�c ��.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L20","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 30*256) and (UTask_kl < 40*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� d� minh ch�u.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L30","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 40*256) and (UTask_kl < 50*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� huy�t h�n th�n ki�m.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L40","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 50*256) and (UTask_kl < 60*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� huy�t qu�i nh�n.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L50","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 60*256) and (UTask_kl < 70*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� ng� s�c th�ch.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_L60","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	elseif (UTask_kl >= 70*256) and (UTask_kl < 80*256) then
		Say("Ng��i hi�n �ang ti�n h�nh l� nhi�m v� tr�ng ph�n s� m�n.",4,"Ti�p t�c t�m hi�u nhi�m v� hi�n t�i/T_return","T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	else
		Say("Hi�n t�i ng��i c� th� t� do ra v�o m�n ph�i, t�m th�i ch�a c� nhi�m v� m�i!",3,"T�m hi�u nh�ng nhi�m v� kh�c/T_all","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
	end
end

function T_all()
	Say("Mu�n t�m hi�u nhi�m v� g�?",10,"Nhi�m v� nh�p m�n/T_enroll","Nhi�m v� h�i thu�c/T_L10","Nhi�m v� x��ng ��u con l�c ��/T_L20","Nhi�m v� d� minh ch�u/T_L30","Nhi�m v� b�ng huy�t/T_L40","Nhi�m v� huy�t h�n th�n ki�m/T_L50","Nhi�m v� ng� s�c th�ch/T_L60","Nhi�m v� tr�ng ph�n s� m�n/T_return","T�m hi�u nh�ng v�n �� kh�c/main","Kh�ng h�i n�a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Mu�n nh�p m�n h�c ngh�, ch� v�n thu�c h� Th�, ��ng c�p ��n 10, ch�a gia nh�p m�n ph�i n�o. ��n ��i tha�i v�i �� t� b�n m�n � c�c T�n th� th�n l� ���c. Sau khi nh�p m�n, l�n l��t ho�n th�nh 5 nhi�m v� c�a m�n ph�i, s� h�c ���c v� c�ng, ���c phong danh hi�u. Ho�n th�nh nhi�m v� xu�t s� th� c� th� xu�t s� ")
end

function T_L10()
	Talk(4,"t_all","Sau khi nh�p m�n v� ��ng c�p �� ��t ��n 10, ng��i c� th� ti�p nh�n nhi�m v� h�i thu�c. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Ph�ng Ki�m �� t�, h�c ���c v� c�ng C�n L�n �ao ph�p, C�n L�n Ki�m ph�p, Th�c Ph��c Ch�, Thanh Phong ph� ","B��c 1: ��n T�ch Nhan ��nh g�p Ti�u H�n, ti�p nh�n nhi�m v�. ��n D��c V��ng c�c h�i �� 5 lo�i T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� th�o v� Linh Chi","B��c 2: ��n D��c V��ng C�c ��nh qu�i, s� l�y �� d��c li�u","B��c 3: Mang 5 lo�i d��c li�u v� giao cho Ti�u H�n, ho�n th�nh nhi�m v�.")
end

function T_L20()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m v� h�i thu�c v� ��ng c�p ��t ��n 20, ng��i c� th� ti�p nh�n nhi�m v� X��ng ��u L�c ��. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� T� Vi H� Ph�p, h�c ���c v� c�ng Ki B�n Ph� ","B��c 1: ��n tr��c ph�ng �� t� g�p Th�n T�c L�o Nh�n, ti�p nh�n nhi�m v�, �i l�y v� X��ng ��u L�c ��.","B��c 2: ��n t�ng 1 D��c V��ng ��ng, ��nh b�i Th� ph�, l�y ���c X��ng ��u L�c ��.","B��c 3: Tr� v� ph�ng �� t�, giao X��ng ��u L�c �� cho Th�n T�c L�o Nh�n, ho�n th�nh nhi�m v�.")
end

function T_L30()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m X��ng ��u L�c �� v� ��ng c�p ��t ��n 30, ng��i c� th� ti�p nh�n nhi�m v� D� Minh Ch�u. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Th�i Vi H� ph�p, h�c ���c v� c�ng: Nh�t Kh� Tam Thanh, B�c Minh ��o H�i, Thi�n T� T�n L�i, Thi�n Thanh ��a Tr�c","B��c 1: ��n ��i m�n g�p Chu Khuy�t, ti�p nh�n nhi�m v�. ��n D��c V��ng c�c, v�o Tuy�t B�o ��ng t�m D� Minh Ch�u.","B��c 2: ��n t�ng 1 Tuy�t B�o ��ng, ��nh b�i Tuy�t B�o, l�y ���c 3 vi�n D� Minh Ch�u","B��c 3: Tr� v� C�n L�n ph�i, giao 3 vi�n D� Minh Ch�u cho Chu Khuy�t, ho�n th�nh nhi�m v�.")
end

function T_L40()
	Talk(4,"t_all","Sau khi ho�n th�nh nhi�m D� Minh Ch�u v� ��ng c�p ��t ��n 40, ng��i c� th� ti�p nh�n nhi�m v� Huy�t H�n Th�n Ki�m. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Thi�n Vi H� ph�p, h�c ���c v� c�ng Khi H�n Ng�o Tuy�t, Kh� T�m ph� ","B��c 1: ��n T� Vi �i�n g�p Thanh Li�n T�, ti�p nh�n nhi�m v�, ��n Ki�n T�nh phong t�m Huy�t H�n Th�n Ki�m.","B��c 2: ��n Ki�n T�nh phong s�n ��ng ��nh b�i s�n t�c Ti�u ��u m�c v� s�n t�c ��u l�nh, l�y ���c ch�a kh�a m� b�o r��ng l�y Huy�t H�n Th�n Ki�m","B��c 3: Tr� v� T� Vi �i�n, giao Huy�t H�n Th�n Ki�m cho Thanh Li�n T�, ho�n th�nh nhi�m v�.")
end

function T_L50()
	Talk(5,"t_all","Sau khi ho�n th�nh nhi�m v� Huy�t H�n Th�n Ki�m v� ��ng c�p ��t ��n 50, ng��i c� th� ti�p nh�n nhi�m v� b�ng huy�t Qu�i nh�n. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Th� Ph� Thi�n T��ng, h�c ���c v� c�ng Cu�ng Phong S�u �i�n, M� Tung �o �nh","B��c 1: ��n Thi�n Vi �i�n g�p Ng�c Ho�nh T�, ti�p nh�n nhi�m v�, ��n B�ng lao thu ph�c Qu�i nh�n.","B��c 2: ��n B�ng huy�t ��ng, ��nh b�i 5 t�n Tuy�t Qu�i, t�m th�y B�ng lao","B��c 3: ��nh b�i Qu�i nh�n trong B�ng lao, l�y ���c 1 n�a t�c","B��c 4: Tr� v� Thi�n Vi �i�n, g�p Ng�c Ho�nh T� ph�c m�nh, ho�n th�nh nhi�m v�.")
end

function T_L60()
	Talk(6,"t_all","Sau khi ho�n th�nh nhi�m v� Qu�i nh�n v� ��ng c�p ��t ��n 50, ng��i c� th� ti�p nh�n nhi�m v� Ng� S�c th�ch. Th�ng qua ho�n th�nh nhi�m v� n�y, ng��i ���c phong l� Ti�n Ph� Ch�n Qu�n, thu�n l�i xu�t s�.","B��c 1: ��n Ch�nh �i�n g�p Ch��ng m�n Tuy�n C� T�, ti�p nh�n nhi�m v�, �i t�m Ng� S�c th�ch.","B��c 2: ��n Ho�ng H� Nguy�n ��u, g�p1 l�o gi�, bi�t ���c Ng� S�c th�ch ���c gi�u trong L�u Ti�n ��ng, c�n t�m 5 chi�c 'Thi�n t�a'","B��c 3: V�o L�u Ti�n ��ng, t�i m�i t�ng ��nh b�i 1 t�n gi� ch�a kh�a, l�y ���c �� chi�c ch�a kh�a","B��c 4: ��n m�t th�t � t�ng cu�i c�ng d�ng 5 chi�c ch�a kh�a m� B�o r��ng, l�y ���c Ng� S�c th�ch.","B��c 5: Tr� v� Ch�nh �i�n, giao Ng� S�c th�ch cho Ch��ng m�n, ho�n th�nh nhi�m v�.")
end

function T_return()
	Talk(3,"t_all","Th�ng qua tr�ng ph�n s� m�n, ng��i ���c phong l� H� Ph�i Ch�n Qu�n, h�c ���c tuy�t h�c tr�n ph�i Ng� L�i Ch�nh Ph�p, S��ng Ng�o C�n L�n","B��c 1: Sau khi ��ng c�p ��t ��n 60, ��n Ch�nh �i�n g�p Tuy�n C� T�, xin tr�ng ph�n C�n L�n.","B��c 2: giao n�p 50000 ng�n l��ng, tr�ng ph�n C�n L�n ph�i.")
end

----------------- ���� ---------------------------
function nothing()
end
