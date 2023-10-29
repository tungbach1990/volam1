-------------------------------------------------------------------------
-- FileName		:	·��_Ī��.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 22:53:08
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

function mochou()
	Uworld1001 = nt_getTask(1001)  --����
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>: Xin h�i ng��i c� ph�i l��."..DescLink_MoChou.."<#>? <enter>V� ��y l�...?<enter>"
				..name.."<#>: Ta c� b�c th� n�y, ng��i xem qua s� bi�t. <enter>M�c S�u nh�n th�.  Trong th� c� ��c! <enter>"
				..name.."<#>: C�i g�? <enter>Ng��i�.Ng��i th�t �c ��c! N�i! Ai ph�i ng��i ��n? <enter>"
				..name.."<#>: Ta kh�ng mu�n ti�t l� danh t�nh ng��i ��! <enter> T�t! Ng��i kh�ng n�i, h�m nay ��ng h�ng r�i kh�i ��y! <enter>"
				..name.."<#>: Cho d� c� b� m�ng n�i ��y ta c�ng kh�ng ti�t l� danh t�nh h�n. <enter> Ta � b�n t�u ngo�i th�nh ��i ng��i! C� b�n l�nh h�y ��n ��! <enter>",
				1,"K�t th�c ��i tho�i/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>: Kh�ng ng� v� ngh� ng��i th�t cao c��ng. <enter>"
				..DescLink_MoChou.."<#>: Ng��i c�n kh�ng n�i, ta s� ph� v� c�ng c�a ng��i, c� n�i hay kh�ng?<enter>"
				..name.."<#>: Kh�ng n�i.<enter>M�c S�u:......<enter>"
				..name.."<#>:  Ng��i gi�t ta �i. <enter> Th�t kh�ng ng�, th� h� c�a Long Ng� l�i gan d� nh� v�y. <enter>"
				..name.."<#>: Ng��i t��ng �e d�a l� ta s� �? <enter>�i ch�! B�ng h�u! Ta ��y ch� th� ng��i m� th�i. Kh�ng tin ng��i t� xem th� �i s� r�. <enter>"
				..name.."<#>:......R�t cu�c l� chuy�n g� v�y? <enter>V� mu�n xem C�c h� c� ph�i l� ng��i ��ng �� giao ph� chuy�n l�n kh�ng. <enter>"
				..name.."<#>: Chuy�n l�n?<enter>��ng v�y, n�i ra d�i l�m. G�n ��y Thi�n Ho�ng Long Kh� m�t t�ch �� l�u �� t�i xu�t giang h�. �� l� m�t b� �o gi�p tuy�t th�. N�m x�a t�n Th�y Ho�ng t�n c�ng L�c qu�c, tri�u t�p th� r�n b�y n��c ��c th�nh � H�m D��ng. <enter>"
				..name.."<#>: C� lo�i b�o v�t th� sao? Ta kh�ng bi�t g� c�. <enter> Tin n�y t� ho�ng cung truy�n ra. B� �o gi�p n�y �ng v�i thi�n m�nh, ai c�ng mu�n c� n�, th�t kh�ng bi�t c�n chuy�n g� x�y ra n�a? <enter>"
				..name.."<#>: Nh�ng ngay sau khi ��c th�nh c�ng th� T�n tri�u l�p t�c b� di�t vong, xem ra v�t n�y c�ng chn�g t�t l�mh g�! <enter>M�c S�u: N�i c�ng c� l�! <enter>"
				..name.."<#>: C�n mu�n gi�i th�ch g� n�a? <enter> Ta kh�ng bi�t nhi�u ��u! Ch� bi�t r�ng v� b�o kh� n�y m� Kim qu�c �� ph�i r�t nhi�u cao th� ��n Trung Nguy�n.<enter>"
				..name.."<#>: Kh�ng bi�t v�t ch�t ng��i n�y c� g� ��c bi�t kh�ng? <enter> C� n� r�i m�i tr� l�i ���c <enter>"
				..name.."<#>: Vi�c n�y li�n quan g� ��n ta? <enter> Ta mu�n ng��i gi�p ta. <enter>"
				..name.."<#>: Gi�p th� n�o?<enter> Ta mu�n gi�p 1 ng��i, c�u 1 ng��i. <enter>"
				..name.."<#>: Gi�p ai?C�u ai? <enter>Ng��i b�y gi� c�ng l�c c�n y�u, ch� ng��i kh� h�n, ta s� t� t�m ng��i. <enter>"
				..name.."<#>: C� �� l� b�n c�a Ng� Gia, ta nh�t ��nh gi�p. <enter>L�c r�nh c� th� ��n t�m Ng�o V�n T�ng, �ng ta l� th� l�nh T�m Long H�i, c� th� s� ch� d�y nhi�u cho ng��i! <enter>"
				..name.."<#>: ���c! V�y t�i h� xin c�o t�. <enter>Khoan ��, ��y l� M�c X�o Nhi em ta, v�a xu�ng n�i h�c ngh�, sau n�y hai ng��i h�y th��ng xuy�n li�n l�c. <enter>",
				1, "��i tho�i v�i M�c X�o Nhi/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "C� g�ng l�n")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001,120)
		Talk(1, "Uworld1001_finish3", "<#> ��y kh�ng ph�i l� Ho�ng Kim L�n sao?"..name.."<#> B�n l�nh c�a ng��i c�ng kh�ng t�.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1, "mastertask", "C� g�ng l�n")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1, "Uworld1001_finish4", "<#> C�u Hi�n Chi Ch�!"..name.."<#>, ta qu� nhi�n kh�ng nh�n l�m ng��i.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1, "mastertask","C� g�ng l�n")
	elseif ( Uworld1001 == 300 ) or ( Uworld1001 == 310 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>: Kh�ng c� g� �� n�i! Giao M�c S�u ra ��y! <enter>"
				..DescLink_ShenMiRen.."<#>: Ng��i cho r�ng ta b�t M�c S�u �i? <enter>"
				..name.."<#>: Ch�ng l� kh�ng ph�i sao! <enter>Ai ch�! Ng��i hi�u l�m r�i. <enter>"
				..name.."<#>: � c�a ng��i l�...? <enter> Ta l� ch� nh�n c�a T�m Long H�i, M�c S�u ���c ta gi�i c�u,  nay �ang � T��ng D��ng tr� th��ng. <enter>"
				..name.."<#>: C�n mu�n n�i nh�m n�a? <enter>"
				..name.."<#> Kh�ng ���c v� l�! V� n�y l� Ch� nh�n T�m Long h�i--Nam Cung Phi V�n! <enter>",
				1, "��i tho�i v�i M�c S�u/Uworld1001_talk5")
	else
		Describe(DescLink_MoChou.."<#>: Giang h� l� g�? Ng�y mai s� ra sao? Cu�i c�ng ta tranh h�ng tranh b�, tay nhu�m bao nhi�u m�u l� v� c�i g�?", 
				1, "K�t th�c ��i tho�i/no")
	end
end

---------------------------------------Ī�ɶ�------------------------------------------------
function moqiaoer()
	Uworld1001 = nt_getTask(1001)  --����
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>: Xin h�i ng��i c� ph�i l��."
			..DescLink_MoChou.."<#>? <enter>V� ��y l�...?<enter>"
			..name.."<#>: Ta c� b�c th� n�y, ng��i xem qua s� bi�t. <enter>M�c S�u nh�n th�.  Trong th� c� ��c! <enter>"
			..name.."<#>: C�i g�? <enter>Ng��i�.Ng��i th�t �c ��c! N�i! Ai ph�i ng��i ��n? <enter>"
			..name.."<#>: Ta kh�ng mu�n ti�t l� danh t�nh ng��i ��! <enter> T�t! Ng��i kh�ng n�i, h�m nay ��ng h�ng r�i kh�i ��y! <enter>"
			..name.."<#>: Cho d� c� b� m�ng n�i ��y ta c�ng kh�ng ti�t l� danh t�nh h�n. <enter> Ta � b�n t�u ngo�i th�nh ��i ng��i! C� b�n l�nh h�y ��n ��! <enter>",
			1,"K�t th�c ��i tho�i/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>: Kh�ng ng� v� ngh� ng��i th�t cao c��ng. <enter>"
			..DescLink_MoChou.."<#>: Ng��i c�n kh�ng n�i, ta s� ph� v� c�ng c�a ng��i, c� n�i hay kh�ng?<enter>"..name.."<#>: Kh�ng n�i.<enter>M�c S�u:......<enter>"
			..name.."<#>:  Ng��i gi�t ta �i. <enter> Th�t kh�ng ng�, th� h� c�a Long Ng� l�i gan d� nh� v�y. <enter>"
			..name.."<#>: Ng��i t��ng �e d�a l� ta s� �? <enter>�i ch�! B�ng h�u! Ta ��y ch� th� ng��i m� th�i. Kh�ng tin ng��i t� xem th� �i s� r�. <enter>"
			..name.."<#>:......R�t cu�c l� chuy�n g� v�y? <enter>V� mu�n xem C�c h� c� ph�i l� ng��i ��ng �� giao ph� chuy�n l�n kh�ng. <enter>"
			..name.."<#>: Chuy�n l�n?<enter>��ng v�y, n�i ra d�i l�m. G�n ��y Thi�n Ho�ng Long Kh� m�t t�ch �� l�u �� t�i xu�t giang h�. �� l� m�t b� �o gi�p tuy�t th�. N�m x�a t�n Th�y Ho�ng t�n c�ng L�c qu�c, tri�u t�p th� r�n b�y n��c ��c th�nh � H�m D��ng. <enter>"
			..name.."<#>: C� lo�i b�o v�t th� sao? Ta kh�ng bi�t g� c�. <enter> Tin n�y t� ho�ng cung truy�n ra. B� �o gi�p n�y �ng v�i thi�n m�nh, ai c�ng mu�n c� n�, th�t kh�ng bi�t c�n chuy�n g� x�y ra n�a? <enter>"..name.."<#>: Nh�ng ngay sau khi ��c th�nh c�ng th� T�n tri�u l�p t�c b� di�t vong, xem ra v�t n�y c�ng chn�g t�t l�mh g�! <enter>M�c S�u: N�i c�ng c� l�! <enter>"
			..name.."<#>: C�n mu�n gi�i th�ch g� n�a? <enter> Ta kh�ng bi�t nhi�u ��u! Ch� bi�t r�ng v� b�o kh� n�y m� Kim qu�c �� ph�i r�t nhi�u cao th� ��n Trung Nguy�n.<enter>"..name.."<#>: Kh�ng bi�t v�t ch�t ng��i n�y c� g� ��c bi�t kh�ng? <enter> C� n� r�i m�i tr� l�i ���c <enter>"
			..name.."<#>: Vi�c n�y li�n quan g� ��n ta? <enter> Ta mu�n ng��i gi�p ta. <enter>"
			..name.."<#>: Gi�p th� n�o?<enter> Ta mu�n gi�p 1 ng��i, c�u 1 ng��i. <enter>"
			..name.."<#>: Gi�p ai?C�u ai? <enter>Ng��i b�y gi� c�ng l�c c�n y�u, ch� ng��i kh� h�n, ta s� t� t�m ng��i. <enter>"
			..name.."<#>: C� �� l� b�n c�a Ng� Gia, ta nh�t ��nh gi�p. <enter>L�c r�nh c� th� ��n t�m Ng�o V�n T�ng, �ng ta l� th� l�nh T�m Long H�i, c� th� s� ch� d�y nhi�u cho ng��i! <enter>"..name.."<#>: ���c! V�y t�i h� xin c�o t�. <enter>Khoan ��, ��y l� M�c X�o Nhi em ta, v�a xu�ng n�i h�c ngh�, sau n�y hai ng��i h�y th��ng xuy�n li�n l�c. <enter>",1,"��i tho�i v�i M�c X�o Nhi/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "C� g�ng l�n")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001, 120)
		Talk(1, "Uworld1001_finish3", "<#> ��y kh�ng ph�i l� Ho�ng Kim L�n sao?"..name.."<#> B�n l�nh c�a ng��i c�ng kh�ng t�.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1,"mastertask","C� g�ng l�n")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1,"Uworld1001_finish4","C�u Hi�n Chi Ch�!<#> "..name.."<#>, ta qu� nhi�n kh�ng nh�n l�m ng��i.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1,"mastertask","C� g�ng l�n")
	elseif ( Uworld1001 == 300 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>: Kh�ng c� g� �� n�i! Giao M�c S�u ra ��y! <enter>"
			..DescLink_ShenMiRen.."<#>: Ng��i cho r�ng ta b�t M�c S�u �i? <enter>"
			..name.."<#>: Ch�ng l� kh�ng ph�i sao! <enter>Ai ch�! Ng��i hi�u l�m r�i. <enter>"
			..name.."<#>: � c�a ng��i l�...? <enter> Ta l� ch� nh�n c�a T�m Long H�i, M�c S�u ���c ta gi�i c�u,  nay �ang � T��ng D��ng tr� th��ng. <enter>"
			..name.."<#>: C�n mu�n n�i nh�m n�a? <enter>"
			..name.."<#> Kh�ng ���c v� l�! V� n�y l� Ch� nh�n T�m Long h�i--Nam Cung Phi V�n! <enter>",
			1, "��i tho�i v�i M�c S�u/Uworld1001_talk5")
	else
		Describe(DescLink_MoQiaoEr.."<#>: Th�t t�i cho M�c t� t�, ch�nh t� �� nu�i ta kh�n l�n. Ta bi�t t� y�u m�t ng��i, nh�ng t� ch�a t�ng nh�c ��n t�n ng��i ��.",1,"K�t th�c ��i tho�i/no")
	end
end

----------------------------------------����Ц-----------------------------------------------
function gongzixiao()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 80 ) or ( Uworld1001 == 90 ) then
		nt_setTask(1001,90)
		Describe(name.."<#>: Ti�u C�ng T�.<enter>"
				..DescLink_GongZiXiao.."<#>:Xin l�i! T�i h� ph�i � b�n linh c�u c�a vong th�, b�t lu�n th� n�o ch� qua tang k� h�y n�i. <enter>"
				..name.."<#>: ��ng qu� �au bu�n, nh�ng chuy�n n�y r�t h� tr�ng, n�i xong ta s� �i ngay.<enter> L�i ta n�i s� kh�ng thay ��i, ng��i v� �i! <enter>"
				..name.."<#>: C�ng T�! T�i h� ��n ��y v� Ho�ng Kim L�n! <enter>Ha ha ha ha.......<enter>"
				..name.."<#>: C�ng T�......<enter> Ho�ng Kim L�n, l�i l� Ho�ng Kim L�n. Ch�nh v� n� m� ta t�n gia b�i s�n, th6n b�i danh li�t h� th� n�y! <enter>"
				..name.."<#>: C�ng T�......<enter> Ho�ng Kim L�n ta �� ��a cho th� h� Gi�i L�u Phong gi�. Y �ang � t�ng 1 D��c V��ng ��ng, n�u c� th� ��nh th�ng h�n, Ho�ng Kim L�n t�y ng��i l�y. <enter>"
				..name.."<#>: �a t� C�ng t�! Xin ��ng qu� �au bu�n! <enter> B�n tr�! V� th� n�y m� ta ph�i m�t �i m�t mg��i th�n! Sau n�y ng��i s� hi�u! <enter>",
				1,"K�t th�c ��i tho�i/taskfinish2")
	else 
		Describe(DescLink_GongZiXiao.."<#>: Giang h� tranh danh �o�t l�i. �� c� ch�t danh ti�ng ai c�ng ph�i tr� m�t c�i gi�. Ti�c thay c�i gi� m� ta ph�i tr� ch�nh l� v� c�a ta! �i! �i th� �i...!",1,"K�t th�c ��i tho�i/no")
	end
end

----------------------------------------������--------------------------------------------------

function xiawuqie()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 150 ) or ( Uworld1001 == 160 ) then
		nt_setTask(1001,160)
		Describe(name.."<#>: Ng��i l� H� V� Th�?<enter>"..DescLink_XiaWunQie.."<#>: Ch�nh ta.<enter>"
				..name.."<#>: Ta l� ng��i c�a T�m Long H�i. <enter> T�i sao ta ch�a th�y qua ng��i. <enter>"
				..name.."<#>: Kh�ng c�n th�y ta, ch� c�n bi�t n� l� ���c. <enter>l�nh b�i �� m�t<enter> Ng��i l� ng��i c�a M�c S�u? <enter>"
				..name.."<#>: T�i sao ta ��n H� ti�n sinh ch�c �� r�. <enter>Ta bi�t. D��ng Ch�u m�i th� b�nh th��ng! M�i ng�i! Ta �� chu�n b� th�c �n. <enter>"
				..name.."<#>: H� ti�n sinh ��ng quanh co n�a, �ng bi�t Thi�n Ho�ng Long Kh� ch�?<enter> ���ng nhi�n bi�t.<enter>"
				..name.."<#>: Xu�t hi�n � D��ng Ch�u �ng t�i sao l�i kh�ng bi�t ch�? <enter>  V�y �, ta ch�a nghe qua tin n�y. <enter>"
				..name.."<#>: H� ti�n sinh kh�ng c�n che gi�u, ta �� s�m bi�t 'C�u Hi�n Chi Ch�' tr�n tay �ng! Giao ra ��y �i. <enter> S�u c� n��ng �� bi�t vi�c n�y r�i. <enter>"
				..name.."<#>: H� ti�n sinh, ta cho �ng m�t con ���ng s�ng. N�u b�y gi� giao ra th� c�n k�p ��y. <enter> N�u ta kh�ng n�i th� sao? <enter>H� V� Th� b� b�n ��nh g�c.<enter>"
				..name.."<#>: N�i �i.<enter> Th�i r�i! L� H� m� b�t ngh�a tr��c, ng��i l�n t�ng 3 �i�m Th��ng S�n �i, ta �� ��a cho huynh �� ta T� �ao Hi�p gi� r�i. <enter>"
				..name.."<#>: H� ti�n sinh, h�m nay ng��i ch�c cao quy�n tr�ng, ta kh�ng bi�t t�i sao ng��i th�y l�i qu�n ngh�a. <enter> Ha ha ha ha! Ng��i qu� xem th��ng H� m� r�i. <enter>",
				1, "K�t th�c ��i tho�i/taskfinish4")
	else
		Describe(DescLink_XiaWunQie.."<#>: Chuy�n m� c� ��i ng��i mu�n l�m ch� c� v�i chuy�n l�m ���c, l�m kh�ng th�nh c� m�t s� ng��i t� nguy�n b� �i, ta th� kh�ng!", 1, "K�t th�c ��i tho�i/no")
	end
end

---------------------------------------�Ϸ�---------------------------------------------------------

function mengfan()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 220 ) or ( Uworld1001 == 230 ) then
		nt_setTask(1001,230)
		Describe(name.."<#>: Ng��i l� M�nh Ph�m ��i th�c ph�i kh�ng?<enter>"..DescLink_MengFan.."<#>: V� ��y l�...? <enter>"
				..name.."<#>: Ng��i c�a T�m Long H�i. <enter> T�m Long H�i l� c�i g�?<enter>"
				..name.."<#>: C� th� M�nh Ph�m kh�ng bi�t T�m Long H�i?!"
				..name.."<#>: �, ta ��a ch�t th�i. �ng ch�c bi�t M�c S�u?......<enter> Khoan ��! T�m Long H�i l� c�i g�, M�c S�u l� ai? C�c h� c� ph�i �� nh�n l�m ng��i r�i. <enter>"
				..name.."<#>: M�nh ��i th�c, �ng kh�ng tin ta �? <enter>M�nh Ph�m: Ta th�t s� kh�ng bi�t ng��i �ang n�i c�i g�. <enter>"
				..name.."<#>:M�c S�u m�t ��m H�c Y nh�n b�t �i, Thi�n Ho�ng Long Kh� m�t t�ch! N�u �ng kh�ng tin, c� th� d�ng b� c�u truy�n tin t�m X�o Nhi c� n��ng ��i ch�ng!<enter> M�c S�u b� b�t c�c? X�y ra l�c n�o v�y.<enter>"
				..name.."<#>: M�i ��y th�i! <enter> Chuy�n n�y x�y ra qu� ��t ng�t, ng��i h�y ��n H��ng Th�y ��ng ��nh b�i O�n ��c, n�u �em ���c th� c�p h�n v� ta m�i tin. <enter>",
				1, "K�t th�c ��i tho�i/taskfinish6")
	elseif ( Uworld1001 == 250 ) or ( Uworld1001 == 260 ) then
		nt_setTask(1001,260)
		Describe(name.."<#>: M�nh ��i th�c, th� c�p � ��y, �ng tin ch�a, m�i vi�c kh�ng n�n ch�m tr�.<enter>"
				..DescLink_MengFan.."<#>: B�n tr�! Ta �� hi�u l�m. Ta �� ph�i thu�c h� �i �i�u tra. Ta tin chuy�n n�y c� li�n quan ��n T�m Long H�i. <enter>"
				..name.."<#>: Ch� nh�n? Ch� nh�n l� ai? <enter> Vi�c n�y, th� l�i ta kh�ng th� n�i......Ta ch� c� th� cho ng��i bi�t, h�n l� ng��i m� tr�n giang h� t��ng r�ng �� ch�t. <enter>"
				..name.."<#>: �� s�m ch�t r�i?<enter>M�nh Ph�m: M�i vi�c ng��i �i�u tra r� r�i b�o cho ta bi�t,chuy�n n�y kh�ng n�n ch�m tr�. <enter>"
				..name.."<#>: C� chuy�n g� l�p t�c b�o ta bi�t.<enter> Nh�t ��nh. X�o Nhi � ��, ng��i kh�ng c�n quay v�, ta �� s�p x�p �n th�a. <enter>",
				1, "K�t th�c ��i tho�i/taskfinish7")
	elseif ( Uworld1001 == 270 ) or ( Uworld1001 == 280 ) then
		Talk(1,"mastertask","��ng c�p c�a ng��i �� cao th� r�i �?")
	else
		Describe(DescLink_MengFan.."<#>: Ai c�ng n�i ta r�t gi�i, th�t ra c�ng ch�ng c� g�. Duy c� �i�u l�m ta h�i l�ng ��c m� l�c tr� �� th�nh hi�n th�c.",1,"K�t th�c ��i tho�i/no")
	end
end

-------------------------------------------------------------------------------------------------------------
function no()
end


function Uworld1001_finish1()
	DelItem(455)
	AddOwnExp(5000)
	nt_setTask(1001,30)   --���ڶ�end
	Msg2Player("M�c S�u b�o b�n ra b�n t�u ngo�i th�nh g�p c� ta.")
end

function Uworld1001_finish2()
	AddOwnExp(5000)
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level20();
	Msg2Player("M�c S�u n�i sau n�y s� t�m b�n.")
	Talk(1,"mastertask","C� g�ng l�n")
end

function Uworld1001_finish3()
	AddOwnExp(10000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level30();
	Msg2Player("M�c S�u n�i sau n�y s� t�m b�n")
	Talk(1,"mastertask","C� g�ng l�n")
end

function Uworld1001_finish4()
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level40();
	Msg2Player("M�c S�u n�i sau n�y s� t�m b�n. C� ta s� gi�p b�n ti�n h�nh t�y t�y, b�y gi� b�n c� h�i s�a �i�m k� n�ng. N�u b�n kh�ng thu�c phe ch�nh ph�i s� kh�ng ���c c� h�i n�y.")
	Talk(1,"mastertask","C� g�ng l�n")
end

function Uworld1001_talk()
	local name = GetName()  
	Describe(DescLink_MoQiaoEr.."<#>: Ch�o!<enter>"
	..name.."<#>: Ch�o! Sau n�y mong mu�i mu�i gi�p �� nhi�u! <enter> Kh�ch s�o!<enter>"
	..name.."<#>:�!<enter>",1,"K�t th�c ��i tho�i/Uworld1001_finish2") 
end

function Uworld1001_talk5()
	local name = GetName()  
	Describe(name.."<#>: Nam Cung......Phi V�n. L� Nam Cung ��i hi�p nhi�u n�m tr��c b� Thi�n Nh�n Gi�o ch� ��i tr��c ��nh r�i xu�ng v�c! <enter>"
	..DescLink_MoChou.."<#>: ��ng v�y.<enter>"
	..name.."<#>:<#> L� ta sai. <enter> Kh�ng c�n �y n�y! Ng��i c�ng lo l�ng cho an nguy c�a M�c S�u. <enter>"
	..name.."<#>: C�m �n ng��i �� hi�u, Nam Cung ��i Hi�p! <enter> Ta b� ��m H�c Y nh�n b�t �i, ch�nh S� ph� c�u ta.<enter>"
	..name.."<#>: Nh�ng ng��i �� l� ai? <enter> Ta kh�ng r�, nh�ng nghi ng� l� cao th� c�a L�m Uy�n Nhai l�m. <enter>"
	..name.."<#>: L� t� ch�c g�? <enter> L� t� ch�c s�t th� gi�a trung l�p. <enter>"
	..name.."<#>: B�n h� v� Long Kh�? <enter> ��ng, h� mu�n thu th�p �� Long Kh�, �� gi�i c�u Bang ch� Phu nh�n Ho�n Nhan Nh��c Tuy�t. <enter>"
	..name.."<#>:�! Nh��c Tuy�t phu nh�n n�m �� ��......? <enter> �! Phu nh�n ch�a ch�t, ch� b� giam � m�t n�i b� m�t. Ch� c� t�m �� Long Kh�, l�y ���c b�n �� n�i �� m�i c� th� gi�i c�u Phu nh�n. <enter>",
	1,"��i tho�i v�i Nam Cung Phi V�n/Uworld1001_talk6")
end

function Uworld1001_talk6()
	local name = GetName()  
	Describe(name.."<#>:Nam Cung ��i Hi�p.<enter>"
	..DescLink_NanGongFeiYun.."<#>: Ta �� nghe S�u Nhi k� ng��i �� gi�p T�m Long H�i. Ta kh�ng c� g� �� b�o ��p, c�m th�y r�t h� th�n. <enter>"
	..name.."<#>:Nam Cung ��i Hi�p ��ng lo l�ng, ta nh�t ��nh t�m ���c Phu nh�n. <enter> Ta m� l� ��i hi�p g�? Ngay c� v� c�ng kh�ng c�u ���c. <enter>Ch� nh�n, ng��i l�i than ng�n th� d�i g� v�y. Ch�ng ta ph�i �i th�i. <enter>",
	1,"L�i ��i tho�i v�i M�c S�u/Uworld1001_talk7")
end

function Uworld1001_talk7()
	local name = GetName()  
	Describe(name.."<#>:......M�c S�u, c� ph�i c� th�ch Nam Cung ��i Hi�p. <enter>"
	..DescLink_MoChou.."<#>: N�i b�y, ng��i l�i nhi�u chuy�n n�a, ng��i ta th�n v�i ng��i l�m sao? <enter>"
	..name.."<#>: Ha ha ha.<enter>Ha ha ha, gi�ng y nh� h�n, hai t�n ��i ng�c. <enter>"
	..name.."<#>: Ha ha ha.<enter> Ta s� c�ng Ch� nh�n ��n  Thi�n Long t� m�t chuy�n, ng��i h�y v� g�p Long Ng�. Ta s� li�n l�c sau. <enter>"
	..name.."<#>: ���c! Mong m�i ng��i vui v�. <enter> C�m �n ng��i �� gi�p �� trong th�i gian qua, ta s� kh�ng qu�n ng��i. <enter>",
	1,"K�t th�c ��i tho�i/Uworld1001_finish10")
end

function Uworld1001_finish10()
	AddOwnExp(90000)
	nt_setTask(1001,320)
	AddSkillState( 509, 1, 0, 180);
	ex_add_zl_level60();
	Msg2Player("M�c S�u s� c�ng Nam Cung Phi V�n ��n Thi�n Long t� gi�i quy�t m�t s� chuy�n, b�n h�y v� g�p Long Ng� ")
end

function taskfinish2()
	AddOwnExp(10000)
	nt_setTask(1001,100)
	Msg2Player("C�ng T� Ti�u b�o b�n �i t�ng 1 D��c V��ng ��ng t�m thu�c h� Gi�i L�u Phong.")
end

function taskfinish4()
	AddOwnExp(15000)
	nt_setTask(1001,170)
	Msg2Player("B�n l�n �i�m Th��ng S�n t�m T� �ao Hi�p.")
end

function taskfinish6()
	AddOwnExp(30000)
	nt_setTask(1001,240)
	Msg2Player("M�nh Ph�m b�o b�n ��n H��ng Th�y ��ng ti�u di�t O�n ��c, �em th� c�p h�n v�.")
end

function taskfinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level50();
	Msg2Player("M�nh Ph�m b�o b�n luy�n t�p th�m, y s� �i h�i th�m tung t�ch M�c S�u, khi c� tin s� b�o cho b�n bi�t.")
	Talk(1,"mastertask","C� g�ng l�n")
end
