-- ����֧������ű�
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------------------��ɮ-----------------------------------------------------------------------
function branch_chiseng()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 20) or ( Uworld1050 == 30 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,30)
			Describe(DescLink_ChiSeng.."<#>: Ha ha ha! Vui qu�!  Vui qu�!<enter>"
			..name.."<#>:......T�n n�y ch�c ��u �c c� v�n ��.<enter>Si T�ng: A! ��u h�! Th�t ch�...<enter>"
			..name.."<#>:  H�a Th��ng l�m g� v�y? <enter>A Di �� Ph�t! Xin ch�o Th� ch�.<enter>"
			..name.."<#>:  Ha! Ha!.<enter>Si T�ng: Ta �ang t�nh hay m�?<enter>"
			..name.."<#>:  Th�i ��ng gi� v� n�a! G�n ��y � ��i L� c� ng��i b� m�t phao tin....<enter>B�n T�ng lu�n � Thi�n Long t� ni�m kinh b�i Ph�t, l�m sao bi�t c� tin ��n n�o.<enter>"
			..name.."<#>:  ��i h�a th��ng! �ng kh�ng th�nh th�t.<enter>B�n t�ng 30 n�m tr��c ph�p hi�u l� Th�nh th�t H�a Th��ng.<enter>"
			..name.."<#>:  Th�t kh�ng ch�u n�i �ng! Ta ch� mu�n h�i v� Thi�n Ho�ng Long Kh�.<enter> Thi�n Kh� g�?<enter>"
			..name.."<#>:  Thi�n Ho�ng Long Kh�.<enter> �! Mu�n h�i th�m tin t�c c�ng ���c, nh�ng mu�n bi�t tin ph�i tr� c�ng 1 K� ph� <enter>"
			..name.."<#>:  K� ph� g�? <enter>Ngo�i Thi�n Long t� c� v�i T�ng B�o Kh�ch, nghe n�i b�n ch�ng v�a m�i c��p ���c 5 quy�n k� ph� Thi�n T�n ��a Khuy�t, ng��i l�y ���c th� h�y quay l�i t�m ta<enter>"
			..name.."<#>:  ���c!",
			1,"K�t th�c ��i tho�i/chiseng1")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) >= 5 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,50)
			Describe(DescLink_ChiSeng.."<#>:  L�m xong ch�a v�y?<enter>"
			..name.."<#>:  ��y l� 5 quy�n K� ph� �ng c�n.<enter>Hay l�m! B�n t�ng s� cho Th� ch� bi�t tung t�ch c�a Thi�n Ho�ng Long Kh�.<enter>"
			..name.."<#>:  T�t qu�.<enter> Thi�n Ho�ng Long Kh� th�t ra ch�nh l� Thi�n Ho�ng Long Kh�.<enter>"
			..name.."<#>:  C�i g�?<enter> Th� ra l� m�t n�ng d�n trong th�n gi� d�ng Si T�ng. Th�t ra, th�t ra......Ng��i c�a Thi�n Long t� ��u �� h� s�n h�a duy�n, s� s�m quay l�i.<enter>"
			..name.."<#>:  Ng��i h�y nh� n�u bi�t quay ��u ta s� tha cho.<enter> Ta c� ng�i � ��y, ng��i c� gi�i th� c� ��n th� �i!",
			1,"K�t th�c ��i tho�i/chiseng2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) < 5 ) then
		Describe(DescLink_ChiSeng.."<#>:  Ng��i ch�a l�y �� K� ph� c�n d�m ��n?<enter>",1,"K�t th�c ��i tho�i/no")
	else
		Describe(DescLink_ChiSeng.."<#>:  B�u v�t tr�n ��i v� s�, b�o b�i kh�p n�i, c� g� qu� hay kh�ng qu�.Thi�n tai! Thi�n tai!",1,"K�t th�c ��i tho�i/no")
	end
end

----------------------------------------------------------------��ͷ----------------------------------------------------------------------
function branch_jiantou()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 80 ) or ( Uworld1050 == 90 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,90)
			Describe(name.."<#>:  Xin h�i c� ph�i Ti�n ��u ��i ca kh�ng?.<enter>"
			..DescLink_JianTou.."<#>:  Ti�n ��u, ng��i n�y �� kh�ng c�n tr�n ��i.<enter>"
			..name.."<#>:  Ng�o V�n T�ng b�o ta ��n.<enter> G�n ��y �ng ta kh�e kh�ng?<enter>"
			..name.."<#>:  �ng ta v�n kh�e, �ng ta b�o ta ��n h�i ng�i tin t�c c�a Thi�n Ho�ng Long Kh�.<enter> Thi�n Ho�ng Long Kh�? Vi�c n�y �� l�u l�m r�i, mu�n n�i ra ph�i b�t ��u t� chuy�n Nh�c t��ng qu�n b� s�t h�i<enter>"
			..name.."<#>:  T�i sao Nh�c t��ng qu�n b� h�i?<enter> Ti�n ��u: N�m �� Nh�c t��ng qu�n ch�ng l�i gi�c Kim, ��i ph� Thi�t Ph� ��, gi�t ���c Ch� t��ng n��c Kim l�m an l�ng thi�n h�. Kim C�u ���ng nhi�n mu�n gi�t T��ng qu�n.<enter>"
			..name.."<#>:  Nh�ng ta ch�a t�ng nghe qua chuy�n T��ng qu�n b� �m s�t.<enter>Chuy�n n�y r�t �t ng��i bi�t.<enter>"
			..name.."<#>:  V�y T��ng qu�n b� th�ch s�t nh� th� n�o?<enter> N�m �� c� l�nh ti�n tri�u Nh�c Phi t� tuy�n tuy�n tr� v�. M�i ng��i ��u t��ng l� ng�i b� �m s�t t�i Phong Ba ��nh, k� th�c �� ���c c�c hi�p kh�ch ��a �i �n n�p <enter>"
			..name.."<#>:  C�u tho�t? V�y T��ng qu�n � ��u.<enter> Ti�n ��u: � Hoa S�n ph�i, T��ng qu�n �n c� kh�ng l�u �� b� s�t h�i.<enter>"
			..name.."<#>:  C�i g�!<enter> B� �o gi�p n�m x�a c�a T��ng qu�n th�n quang ch�i s�ng, m�i ng��i ��u n�i �� l� Thi�n Ho�ng Long Kh�. Nh�ng c� th� th� n�o th� ta kh�ng r�, nh�ng ng��i c� th� �i h�i m�t ng��i.<enter>"
			..name.."<#>: L� ai?<enter> S�m H�ng! H�n l� h� s� b�n c�nh Nh�c T��ng qu�n hi�n �ang � Ph��ng T��ng <enter>"
			..name.."<#>:  C�m �n �ng.<enter>Ng��i �i �i! L�n n�y coi nh� ta �� tr� �n c�u m�ng c�a Li�u V�n T�ng ng�y x�a.<enter>",
			1,"K�t th�c ��i tho�i/jiantou1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_JianTou.."<#>:  Hoa S�n hi�m h�a.<enter>",1,"K�t th�c ��i tho�i/no")
	end
end

----------------------------------------------------------------���---------------------------------------------------------------------------
function branch_cenxiong()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
		if ( Uworld1050 == 100 ) or ( Uworld1050 == 110 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,110)
				Describe(name.."<#>:  S�m H�ng ��i ca!<enter>"
				..DescLink_CenXiong.."<#>:  V� B�ng h�u n�y, Ta kh�ng quen! Hai ti�ng ��i ca ta kh�ng d�m nh�n.<enter>"
				..name.."<#>:  Ti�n ��u ��i ca b�o ta ��n.<enter> Ti�n ��u? �ng ta d�o n�y kh�e kh�ng?<enter>"
				..name.."<#>:  C�ng t�t. �ng ta sai ta ��n t�m huynh.<enter>A! T�m ta c� vi�c g�?<enter>"
				..name.."<#>:  N�m x�a l�c Nh�c Phi t��ng qu�n B�c chinh, �� t�ng m�c b� gi�p n�y.<enter>S�m H�ng: ��ng v�y! Ph� th�n ta t�ng n�i, Nh�c Gia anh d�ng c�i th�, kho�t l�n m�nh b� �o gi�p �� tr�ng nh� Th�n ti�n.<enter>"
				..name.."<#>:  B� �o gi�p �� l� Thi�n Ho�ng Long Kh�?<enter>��ng v�y!<enter>"
				..name.."<#>:  V�y b�y gi� n� � ��u?<enter> M�t t�ch r�i. T� l�c Nh�c Gia Gia b� th�ch s�t � Hoa S�n kh�ng ai bi�t tung t�ch c�a b� gi�p n�y.<enter>"
				..name.."<#>:  S�m ��i ca �� t�ng �i�u tra qua ch�a?<enter>��ng ti�c v�n ch�a t�m ra tung t�ch c�a Th�n binh, nh�ng ta �� ph�t hi�n s�t th� n�m x�a th�ch s�t Nh�c Gia!<enter>"
				..name.."<#>:  Ng��i n�y t�n g�, hi�n �ang � ��u?<enter> H�n t�n Phan Nh� Long �ang � ngo�i th�nh Ph��ng T��ng.<enter>",
				1,"K�t th�c ��i tho�i/cenxiong1")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		else
			Describe(DescLink_CenXiong.."<#>:  Ph�n trai v� nghi�p n��c! D� c� v�i th�y n�i sa tr��ng c�ng ��ng ti�ng 'Anh h�ng'",1,"K�t th�c ��i tho�i/no")
		end
end

----------------------------------------------------------------����֥---------------------------------------------------------------------------
function branch_helanzhi()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 20 ) or ( Uworld1051 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,30)
			Describe(name.."<#>:  Ch�o H� t� t�.<enter>"
			..DescLink_HeLanZhi.."<#>:  Ng��i l�...?<enter>"
			..name.."<#>:  M� Dung s� ph� b�o ta ��n, �ng ta hi�n � L�m An ��c �o gi�p, thi�u Kho�ng th�ch thu�c t�nh, t� t�ng c� 2 vi�n, cho n�n �ng ta b�o ta ��n th�m c�, nh�n ti�n xem c� c�n gi� B�o th�ch kh�ng.<enter>�! B�o v�t c�a S� ph� ta ta lu�n gi� b�n m�nh Ch� c� �i�u n�m x�a khi ta k�t h�n �� b� th�t l�c n�.<enter>"
			..name.."<#>:  �, Tr�ng h�p v�y!.<enter>H� Lan Chi: Th� n�y v�y, ng��i h�y ��n Giang T�n th�n g�p Ng� L�o th�i�i.<enter>"
			..name.."<#>: T�t l�m! <enter> Khoan ��! Ng��i h�y gi� l�y b� trang b� n�y! Ng�y sau c� l�c h�u d�ng! <enter>",
			1,"K�t th�c ��i tho�i/helanzhi1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
			Describe(DescLink_HeLanZhi.."<#>:  Th�i tr� c� nhi�u m� ��c, gi� ch� c�n Phu qu�n ta kh�e m�nh kh�ng g� quan tr�ng b�ng.<enter>",1,"K�t th�c ��i tho�i/no")	
	end
end

----------------------------------------------------------------����̫̫-------------------------------------------------------------------
function branch_wulaotai()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 40 ) or ( Uworld1051 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,50)
			Describe(name.."<#>:  Ng� L�o th�i.<enter>"
			..DescLink_WuLaoTai.."<#>:��<enter>"
			..name.."<#>:  L�o Th�i th�i?<enter>Ng� L�o th�i:......<enter>"
			..name.."<#>:  L�o Th�i th�i m�c b�nh l�, kh�ng n�i chuy�n ���c, hay l� quay v� t�m Ng�o V�n T�ng tr��c ��.<enter>",
			1,"K�t th�c ��i tho�i/wulaotai1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1051 == 150 ) or ( Uworld1051 == 160 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,160)
			Describe(DescLink_WuLaoTai.."<#>:��<enter>",
			1,"L�y d��c t�u ��a cho Ng� L�o th�i u�ng/wulaotai2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
			Describe(DescLink_WuLaoTai.."<#>:  L�o th�n �� ��n tu�i n�y, s� r�ng kh�ng th� tr� l�i Kinh th�nh.<enter>",1,"K�t th�c ��i tho�i/no")	
	end
end
--------------------------------------------------------------����ţ-------------------------------------------------------------------------
function branch_taokan()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 100 ) or ( Uworld1051 == 110 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,110)
			Describe(DescLink_TaoKan.."<#>:  T�c th�t! ��m ch� s�i n�y ��ng l� mu�n l�y m�ng ng��i! �� h�i l�y m�ng m��i huynh �� r�i.<enter>"
			..name.."<#>:  Ng��i c� kh� kh�n g�?<enter>Ng��i l� ai? T�m ta c� vi�c g�? Ta �ang b�n kh�ng r�nh ti�p ng��i.<enter>"
			..name.."<#>:  Trong tay ta c� 1 �t x��ng s�i, xin �ng gi�p ta b�o ch� d��c t�u.<enter>Kh�ng ph�i ta kh�ng l�m! Ch� v� d�o n�y b�n �c lang tr�n n�i ho�nh h�nh d� qu� khi�n ta kh�ng r�nh tay <enter>"
			..name.."<#>:  Vi�c n�y ��n gi�n, Ta c� th� gi�p huynh ti�u di�t �c lang.<enter>Cung A Ng�u: Th�t t�t qu�!M�i xem qua phong th�i c�a ng��i, ta bi�t ng��i kh�ng ph�i l� ng��i th��ng. Ch� ng��i ti�u di�t �c lang ta s� b�o ch� thu�c.<enter>",
			1,"K�t th�c ��i tho�i/taokan1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1051 == 130 ) or ( Uworld1051 == 140 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,140)
			Describe(name.."<#>:  Cung ��i ca, ta �� gi�p huynh di�t tr� �c lang.<enter>"
			..DescLink_TaoKan.."<#>:  T�t qu�, d��c t�u � ��y, ng��i l�y �i! <enter>",
			1,"K�t th�c ��i tho�i/taokan2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
			Describe(DescLink_TaoKan.."<#>:  Qu�n t� l� ng��i bi�t gi�p ng��i kh�c ��ng l�c m� kh�ng m�ng danh l�i!<enter>",1,"K�t th�c ��i tho�i/no")	
	end
end

----------------------------------------------------------���---------------------------------------------------------------------------
function branch_hunhun()
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
		if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1053 == 0 ) or ( Uworld1053 == 10))  then
				nt_setTask(1053,10)
				Describe(DescLink_HunHun.."<#> Ta cho ng��i bi�t m�t b� m�t. �� c� ng��i trong t� ch�c nghe ���c chuy�n Nh�c Phi b� th�ch s�t. M�i th� gi�a L�m Uy�n Nhai v� Nh�c Phi ai c�ng bi�t, n�m �� b�n c�nh Nh�c Phi kh�ng �t cao th� b�o v�. Ta c�ng kh�ng bi�t c� ph�i ng��i c�a ta gi�t h�n kh� "
				..name.."<#>:  T�i sao ng��i l�i n�i v�i ta b� m�t n�y? <enter>Nhi�u l�i! Ng��i t��ng ta mu�n sao? G�n ��y ng��i �� ��t nhi�n m�t l�n l�c v�i ta. Nghe n�i h�n �� ��n chi�n tr��ng T�ng Kim. Ta kh�ng tin h�n chi�n ��u v� n��c, hay l� phi�n ng��i ��n Chi�n tr��ng T�ng Kim m�t chuy�n t�m tung t�ch ng��i n�y ti�n th� l�y 200 �i�m t�ch l�y<enter>",
				1,"K�t th�c ��i tho�i/hunhun3")
		elseif (( Uworld1053 == 20 ) or ( Uworld1053 == 25 )) and ( Uworld1011 == 20 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,25)
				Describe(DescLink_HunHun.."<#>:  L�m t�t l�m, �i�m th��ng �� l�y ��.",
				1,"K�t th�c ��i tho�i/hunhun5")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif ( Uworld1053 == 27 ) or ( Uworld1053 == 30 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,30)
				Describe(DescLink_HunHun.."<#>:  Tr� l�i ta v�i v�n �� li�n quan ��n T�ng Kim. S�n s�ng ch�a?.<enter>",
				2,"C� th� b�t ��u!/branch_songjinproblem","K�t th�c ��i tho�i/no")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif ( Uworld1053 == 40 ) or ( Uworld1053 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,50)
				Describe(DescLink_HunHun.."<#>:  Tr� l�i ��ng h�t, kh� l�m. G�n ��y, ta ���c tin t�n �� tr�n trong Chi�n tr��ng T�ng Kim ��nh �m s�t ch� t��ng hai n��c T�ng Kim.<enter>"
				..name.."<#>:  Th�ch s�t ch� t��ng hai n��c?<enter>Kh�ng sai, ch�ng ta kh�ng c� �n t��ng t�t v� T�ng tri�u, v�i Kim C�u c�ng v�y! Ch� c�n c� ti�n l� l�m! Ng��i ��n ngo�i th�nh L�m An t�m h�n, y t�n l� T� T�c Phong, sau �� ta v� ng��i c�ng h�nh ��ng. Chuy�n n�y n�u",
				1,"K�t th�c ��i tho�i/hunhun4")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif ( Uworld1052 == 40 ) or ( Uworld1052 == 50 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,50)
				Describe(name.."<#>:  Ch�o �ng, ta l� "
				..name..".<enter>"
				..DescLink_HunHun.."<#>:  L� ng��i �, t�i sao tr� nh� v�y m�i ��n? M�i ng��i �� v�o v� tr��ng. Ng��i v�o v� tr��ng ��nh m�t tr�n �i, ta mu�n xem th�c l�c c�a ng��i.<enter>",
				1,"K�t th�c ��i tho�i/hunhun1")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif ( Uworld1052 == 60 ) and ( Uworld1011 == 10 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>:  ��nh m�t tr�n pk c�ng kh�ng xong c�n d�m ��n g�p ta? Mau �i ��nh th�ng m�t tr�n.<enter>",1,"K�t th�c ��i tho�i/no")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif (( Uworld1052 == 60 ) or ( Uworld1052 == 70 )) and ( Uworld1011 == 20 ) then --�������䳡սʤ��һ��
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,70)
				Describe(DescLink_HunHun.."<#>:  Hay l�m! Ng��i qu� nhi�n r�t gi�i.<enter>"
				..name.."<#>:  Qu� khen!<enter> M�y n�m nay ta c� nh�c ��u, chuy�n l�m �n � Di�n v� tr��ng v�n r�t thu�n l�i, t� nhi�n xu�t hi�n t�n qu�i v�t ��nh tr�m tr�n tr�m th�ng, l�m cho ch�ng ai d�m ��n khi�u chi�n. T�n n�y khi�n ta �au ��u qu�.<enter>"
				..name.."<#>:  � ng��i l�?<enter>H�n H�n: � c�a ta ng��i hi�u m�.<enter>"
				..name.."<#>:  H�n � ��u?<enter> T�n h�n l� Du S��ng T�n, t�n n�y �n n�p r�t k�. Ta hi�n v�n ch�a �i�u tra ra tung t�ch h�n. N�u ng��i c� th� ti�u di�t h�n coi nh� �� l�p ��i c�ng cho t� ch�c.<enter>",
				1,"K�t th�c ��i tho�i/hunhun2")
			else
				Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
			end
		elseif ( Uworld1052 == 1000 )  then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>:  Huynh ��! Sau n�y ch� hy v�ng � ng��i th�i.<enter>",
				1,"K�t th�c ��i tho�i/no")
			else
				Talk(1,"","Huynh ��, c� g�ng nha.")
			end
	else
			Describe(DescLink_HunHun.."<#>:  S� c�i g�? C�ng s� c�ng b� ng��i ta �n hi�p.<enter>",1,"K�t th�c ��i tho�i/no")	
		end
end



function chiseng1()
	AddOwnExp(5000)
	nt_setTask(1050,40)
	Msg2Player("Si T�ng b�o b�n t�m 5 quy�n K� ph� 'Thi�n T�n ��a Khuy�t', T�ng B�o Kh�ch hi�n �ang gi� n�.")
end



function chiseng2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function jiantou1()
	AddOwnExp(5000)
	nt_setTask(1050,100)
	Msg2Player("Ti�n ��u b�o b�n ��n Ph��ng T��ng t�m S�m H�ng h�i th�m tin t�c.")
end

function cenxiong1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function helanzhi1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function wulaotai1()
	AddOwnExp(15000)
	nt_setTask(1051,60)
	Msg2Player("Ng� L�o th�i h�nh nh� m�c b�nh l�, b�n quy�t ��nh t�m Ng�o V�n T�ng th��ng l��ng b��c ti�p theo.")
end

function taokan1()
	AddOwnExp(15000)
	nt_setTask(1051,120)
	Msg2Player("��n T��ng D��ng t�m Cung A Ng�u. �ng ta �ang g�p r�c r�i v� �c lang tr�n Ph�c Ng�u S�n, b�n quy�t ��nh gi�p anh ta gi�i quy�t kh� kh�n n�y.")
end

function taokan2()
	AddOwnExp(15000)
	nt_setTask(1051,150)
	Msg2Player("Cung A Ng�u ��a cho b�n d��c t�u b�o ch� t� x��ng s�i, b�n mang ��n ch� Ng� L�o th�i")
end

function wulaotai2()
	local name = GetName()  
	Describe(DescLink_WuLaoTai.."<#>:  �i......�i,......B�n tr�! C�m �n d��c t�u c�a ng��i. Ta c�ng kh�ng bi�t n�i g� h�n.<enter>"
	..name.."<#>:  L�o Th�i th�i! N�m �� H� Lan Chi khi theo ch�ng c� th�t l�c 2 vi�n B�o th�ch. B� th�y qua ch�a? <enter> Th�y qua r�i. Ta lu�n gi�p Lan Chi gi� n�, ��ng ti�c n� ch�a bao gi� v� ��y, b�y gi� ng��i ��n  r�t ��ng l�c.<enter>"
	..name.."<#>:  B� �ang gi� �? Th� th� t�t qu�. <enter>Ng� L�o th�i: C�m l�y �i, ti�u t� sau n�y h�y b�o tr�ng.<enter>",
	1,"K�t th�c ��i tho�i/wulaotai3")
end

function wulaotai3()
	AddOwnExp(15000)
	nt_setTask(1051,170)
	Msg2Player("B�n nh�n ���c 1 vi�n B�o th�ch thu�c t�nh �n. B�n c� th� quay v� g�p Ng�o V�n T�ng ph�c m�nh.")
end

function hunhun1()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(30000)
	nt_setTask(1011,10) --ɱ�ֱ�����Ϊ10��
	nt_setTask(1052,60)
	Msg2Player("H�n H�n b�o b�n ��n t� v� tr��ng ��nh th�ng m�t tr�n.")
end

function hunhun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun3()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(60000)
	nt_setTask(1011,10) --���ñ���Ϊ10����¼�μ��ν�Ĳ���
	nt_setTask(1053,20)
	Msg2Player("H�n H�n b�o b�n �i Chi�n tr��ng T�ng Kim, ��ng th�i ph�i ��t 200 �i�m t�ch l�y. Xem ra m�t nhi�m v� kh� kh�n �ang ch� b�n.")
end

function hunhun4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function no()
end

