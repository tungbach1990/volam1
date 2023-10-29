-------------------------------------------------------------------------
-- FileName		:	zhonglitasknpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 14:42:00
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

-----------------------------------���ϱ��Ի�--------------------------------
function funanbing()
	Uworld1002 = nt_getTask(1002)  --����
	local name = GetName()  
	if ( Uworld1002 == 10 ) or ( Uworld1002 == 20 )then 
		nt_setTask(1002,20)
		Describe(name.."<#>: �ng l� "..DescLink_FuNanBin.."?<enter> Kh�ng sai.<enter>"
				..name.."<#>: Ng� Gia ph�i ta ��n, � ��y c� th� c� b�t t�ch c�a �ng ta. <enter> Ng��i �� t�ng gi�t ng��i ch�a? <enter>"
				..name.."<#>:......Ch�a t�ng.<enter> Th� ng��i d�a v�o c�i g� m� v�o L�m Uy�n Nhai. Th� ti�n c� c�a Ng� Ca ch�c kh�ng ��. <enter>"
				..name.."<#>: N�i �i�u ki�n c�a �ng xem. <enter> Gi�t ng��i! Gi�t m�t ng��i kh� gi�t. <enter>"
				..name.."<#>: L� ai?<enter> Ninh T��ng Qu�n.<enter>"
				..name.."<#>: Ninh T��ng Qu�n l� ai? <enter> ��i t��ng Nam T�ng, th�ng ��ch ph�n qu�c, t�i kh�ng th� tha. <enter>"
				..name.."<#>: ��ng ch�t! <enter> H�n g�n ��y du ngo�n � La Ti�u S�n, kh�ng bi�t bao gi� v� Doanh tr�i. ��i ��n h�n v� trong qu�n doanh th� r�t kh� kh�n. Ng��i ch� c� m�t c� h�i duy nh�t n�y th�i. <enter>"
				..name.."<#>: ���c.<enter>",1,"K�t th�c ��i tho�i/middlefinish1")
	elseif ( Uworld1002 == 40 ) or ( Uworld1002 == 50 ) then
		nt_setTask(1002,50)
		Describe(name.."<#>: H�n ch�t r�i. <enter>"..DescLink_FuNanBin.."<#>: Ta bi�t r�i, ta �� xem th��ng ng��i. "
				..name.."<#>. <enter>"..name.."<#>: Kh�ng sao. <enter> Sau n�y c� vi�c ta s� t�m ng��i. Ng��i h�y �i L�m An t�m Li�u Nam V�n, y s� giao nhi�m v� cho ng��i. <enter>"
				..name.."<#>: ta bi�t r�i. <enter>",1,"K�t th�c ��i tho�i/middlefinish2")
	elseif (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1,"middletask","C� g�ng l�n")
	elseif ( Uworld1002 == 90 ) or ( Uworld1002 == 100 ) then
		nt_setTask(1002,100)
		Describe(name.."<#>: H�n ch�t r�i. <enter>"..DescLink_FuNanBin.."<#>: Ta �� gi�t ���c L� Thi�n T��ng. <enter>"
				..name.."<#>: H�n kh�ng nh� ng��i, cho n�n h�n ch�t. <enter> ���c, ��y l� ph�n th��ng c�a ng��i, c�m �i. <enter>"
				..name.."<#>: C�m �n.<enter> Ta �� th�y r� n�ng l�c. S�n tr�i c� m�t k� ho�ch l�n, ta hy v�ng ng��i tham gia. <enter>"
				..name.."<#>:  l� k� ho�ch g�? <enter> Hi�n v�n �ang thu x�p, ��n l�c ta s� b�o cho ng��i. <enter>"
				..name.."<#>: Ta ch� hy v�ng ng��i kh�ng g�t ta. <enter> C� tin g� ta s� b�o cho ng��i. <enter>"
				..name.."<#>: ���c.<enter>",1,"K�t th�c ��i tho�i/middlefinish3") 
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		Talk(1,"middletask","C� g�ng l�n")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		Talk(1,"middletask","C� g�ng l�n")
	elseif ( Uworld1002 == 180 ) then
		Talk(1,"no","L�m t�t l�m, gi� h�y ti�p t�c luy�n c�ng, sau n�y s� t�m ng��i.")
	elseif ( Uworld1002 == 220 ) or ( Uworld1002 == 230 ) then
		nt_setTask(1002,230)
		Describe(DescLink_FuNanBin.."<#>: Th�nh c�ng r�i?  Ta c�ng bi�t ng��i s� th�nh c�ng.",1,"K�t th�c ��i tho�i/middlefinish7")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		Talk(1,"middletask","C� g�ng l�n")
	elseif ( Uworld1002 == 290 ) or ( Uworld1002 == 300 ) then
		nt_setTask(1002,300)
		Describe(DescLink_FuNanBin.."<#>: Th� n�o? <enter>"
			..name.."<#>: M�i th� � ��y. <enter> T�t qu�! Ta c�ng bi�t ng��i nh�t ��nh s� th�nh c�ng. <enter>"
			..name.."<#>:......Long Kh� c� ��, c� th� thay ��i v�n m�nh Thi�n h� sao? <enter> T�i sao l�i h�i v�y? <enter>"
			..name.."<#>: Ta......L�ng ta c� ch�t nghi v�n. <enter> Ta c�ng kh�ng bi�t. Ta ch� nghe qua 'Th�p Long T� Th�, Thi�n H� Kh�i ��nh, �o�n K� Ch�y C�t, T�n Ch� Xu�t Hi�n'. <enter> ���c! Trong th�i gian n�y c� th� ta s� kh�ng t�m ng��i. Hoa S�n ph�i �ang c� m�t s� v�n �� c�n ng��i gi�p ��, ng��i h�y ��n �� �i. V� nh� quay v� t�m Long Ng� l�nh th��ng. <enter>",1,"K�t th�c ��i tho�i/middlefinish9")
	else
		Describe(DescLink_FuNanBin.."<#>: Giang h� hi�m �c, m��i ba huynh �� gi� ch� c�n m�nh ta.",1,"K�t th�c ��i tho�i/no")
	end
end

------------------------------------۪��ˮ�Ի�----------------------------------
function liqiushui()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 130 ) or ( Uworld1002 == 140 ) then
		nt_setTask(1002,140)
		Describe(DescLink_LiQiuShui.."<#>: Ng��i l� ai? ��n Th�y Y�n m�n v�i m�c ��ch g�? <enter>"
			..name.."<#>: Ta l� ng��i trong h�i, Nam B�ng b�o ta ��n t�m c�. <enter> H�! Ta �� n�i v�i h�, kh�ng n�n t�m nh�ng k� v� d�ng. <enter>"
			..name.."<#>: Ta v�n c�ng ch�ng th�ch ��ng h�nh v�i c�! <enter> A! Kh�ng ng� ng��i c�ng c� t�nh c�ch. <enter>"
			..name.."<#>: Ta s� cho c� th�y b�n l�nh c�a ta! <enter> N�i hay l�m! Kh�u kh� c�ng kh�ng t�. Ki�m m�n c� T� T� L�c �ang gi� 1 b�o v�t. ��n �� l�y n� v� cho ta. <enter>"
			..name.."<#>: L� c�i g�? <enter> 1 b� �o gi�p--B�ch Long T�c. <enter>"
			..name.."<#>: �ng ta � ��u. <enter> Kinh Ho�ng ��ng. <enter>",1,"K�t th�c ��i tho�i/middlefinish4")
	elseif ( Uworld1002 == 160 ) or ( Uworld1002 == 170 ) then 
		nt_setTask(1002,170)
		Describe(DescLink_LiQiuShui.."<#>: B�ch Long T�c l� b�o kh� trong truy�n thuy�t. Hay qu�! <enter>"
			..name.."<#>: B�o Kh�? Ch�ng l� ��y l� Thi�n Ho�ng Long Kh�. <enter> Ng��i bi�t Thi�n Ho�ng Long Kh�? <enter>"
			..name.."<#>: Ta nghe th� r�n nh�c ��n. <enter> Th� r�n? Kh�ng ng� tr�n ��i n�y ng��i bi�t chuy�n n�y c�ng kh�ng �t. B�ng h�u, ta �� xem th��ng ng��i. <enter>"
			..name.."<#>: ��u v� L�m Uy�n Nhai m� th�i! V� Long Kh�, c� bi�t ���c bao nhi�u? <enter> Thi�n Ho�ng Long Kh� v�i b� m�t c�a t� ch�c c� li�n quan, ta ch� c� th� n�i v�i ng��i b�y nhi�u. <enter> C�i n�y l� c�a ng��i, c�m l�y �i. <enter>",1,"K�t th�c ��i tho�i/middlefinish5")
	elseif ( Uworld1002 == 180 ) and ( GetLevel() >= 50 ) then
		Talk(1,"","Ng��i mau �i t�m Ph� Nam B�ng, �ng ta c� nhi�m v� quan tr�ng giao cho ng��i.")
	else 
		Describe(DescLink_LiQiuShui.."<#>: Ta s�ng l�m ng��i c�a Th�y Y�n m�n, ch�t l�m qu� c�a Th�y Y�n m�n.",1,"K�t th�c ��i tho�i/no")
	end
end

------------------------------------����������-------------------------------------
function hanjiangdudiaosou()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 200 ) or ( Uworld1002 == 210 ) then
		nt_setTask(1002,210)
		Describe(DescLink_HanJiangDuDiaoSou.."<#>: Nh�t c�n nh�t l�p nhi�m b�nh sinh, nh�t giang y�n ba nh�t giang s�u. <enter>"
			..name.."<#>: H�n L�o ti�n b�i! V�n b�i v�n an ng��i! <enter> T�m ta c� vi�c g�? <enter>"
			..name.."<#>: D��ng Bang ch� b�o ta ��n h�i �ng v�i chuy�n. <enter>  Chuy�n g�?<enter>"
			..name.."<#>:N�m x�a B�o kh� Long �o�n m�t t�ch t�i Thi�n V��ng Bang, ng��i bi�t tung t�ch c�a n� kh�ng. <enter>  Chuy�n n�y �� l�u r�i, tr� nh� c�a ta ng�y c�ng k�m, nh�ng chuy�n x�a kia ta �� kh�ng c�n nh� n�a.<enter>"
			..name.."<#>:L�o Ti�n B�i! Bang ch� �� s�m �i�u tra bi�t �ng �ang gi� n�! Ta kh�ng mu�n l�m �ng t�n th��ng. <enter> Ha! Ha! Ti�ng ��n v� ng��i qu� kh�ng sai. Long �o�n �ang � trong tay ta, xem ng��i b�n l�nh ra sao!<enter>"
			..name.."<#>: Xin �ng h�y giao ra. <enter> Nh� n�m x�a Chung D��ng Nh� V��ng tung ho�nh giang ��ng ��nh h�, binh h�ng t��ng m�nh, ��nh thay ��i th� ��o t�n kh�c n�y. Nh�ng ��n cu�i c�ng c�ng th�t b�i? C� nh�ng chuy�n l� � tr�i, � tr�i kh�ng th� thay ��i! <enter>"
			..name.."<#>:L�o Ti�n B�i! Chuy�n sau n�y �� sau n�y h�y n�i. B�y gi� �ng giao Long �o�n ra, ta c� th� b�o ��m t�nh m�ng c�a �ng.<enter> Ha ha ha! Ta s�ng kh�ng bao l�u n�a, c�i m�ng gi� n�y th� c� ��ng g�? <enter>"
			..name.."<#>: �ng�.!<enter> Mu�n Long �o�n th� h�y ��n ��y M� cung ��ng ��nh h�, ta s� ��i � ��!",
			1, "K�t th�c ��i tho�i/middlefinish6")
	elseif ( Uworld1002 >= 220 ) then
		Describe(name.."<#>: H�n l�o ti�n b�i xin b�o tr�ng, ta v� s� thay �ng n�i. <enter>"..DescLink_HanJiangDuDiaoSou.."<#>: Kh�ng c�n ��u! B�n tr� h�y nh� l�y: ng�y n�o Long Kh� c� �� b�, thi�n h� s� ��i lo�n. <enter>"
			..name.."<#>: T�i h� nh� r�i. ", 1, "K�t th�c ��i tho�i/no")
	else
		Describe(DescLink_HanJiangDuDiaoSou.."<#>:  ��c c�u h�n giang, t�m nh� ch�nh th�y, ung dung t� t�i!",1,"K�t th�c ��i tho�i/no")
	end
end

------------------------------------���ֿռ�--------------------------------------------
function shaolinkongji()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 260 ) or ( Uworld1002 == 270 ) then
		nt_setTask(1002,270)
		Describe(DescLink_KongJi.."<#>: A Di �� Ph�t!  Th� ch� s�t kh� qu� n�ng. <enter>"
			..name.."<#>: Su�t ng�y ch� bi�t ch�m gi�t, ���ng nhi�n s�t kh� n�ng r�i! <enter> T�o nhi�u nghi�p �c, Th� ch� ng�y sau s� b� ��y xu�ng ��a ng�c A T�,  kh� �i v� bi�n, quay ��u l� b�. <enter>"
			..name.."<#>: Ta kh�ng th� quay l�i ���c n�a. <enter> Ch� c�n b� ���c l� c� th� quay ��u. <enter>"
			..name.."<#>: Ta g�t ���c m�nh, kh�ng g�t ���c v�n d�n. <enter> B� T�t s� ph� h� cho k� thi�n t�m! A Di �� Ph�t! <enter>"
			..name.."<#>: Th�n T�ng! ��o b�t ��ng b�t t��ng vi m�u, xin giao hai b� Th�n kh� m� qu� t� �ang gi�. <enter> H�y ra c�nh r�ng � h�u s�n Thi�u L�m, B�n T�ng th� gi�o v�i chi�u s� n�i! <enter>",
			1, "K�t th�c ��i tho�i/middlefinish8")
	elseif ( Uworld1002 >= 290 ) then
		Describe(name.."<#>: Th�n T�ng, xin ��c t�i. <enter>"..DescLink_KongJi.."<#>:A Di �� Ph�t! Thi�n �c ��u ��nh s�n, � tr�i kh� ��i. Th� ch� �i �i, tr�n ��i �t c� nh�n qu�. <enter>",1,"K�t th�c ��i tho�i/no")
	else
		Describe(DescLink_KongJi.."<#>: Nh�n qu� tr�n ��i �� ��nh s�n. A Di �� Ph�t!",1,"K�t th�c ��i tho�i/no")
	end
end

--------------------------------------------------------------------------------------------

function no()
end

function middlefinish1()
	DelItem(456)
	AddOwnExp(5000)
	nt_setTask(1002,30)
	Msg2Player("Ph� Nam B�ng b�o b�n l�n La Ti�u S�n ��nh b�i Ninh T��ng Qu�n.")
end

function middlefinish2()
	AddOwnExp(5000)

	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level20();
	Msg2Player("Ph� Nam B�ng n�i sau n�y s� t�m b�n.")
	Talk(1,"middletask","C� g�ng l�n")
end

function middlefinish3()
	AddOwnExp(10000)
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level30();
	Msg2Player("Ph� Nam B�ng n�i L�m Uy�n Nhai c� m�t k� ho�ch l�n, sau n�y s� t�m b�n!")
	Talk(1,"middletask","C� g�ng l�n")
end

function middlefinish4()
	AddOwnExp(15000)
	nt_setTask(1002,150)
	Msg2Player("L� Thu Th�y b�o ��n Kinh Ho�ng ��ng ��nh b�i T� T� L�c.")
end

function middlefinish5()
	Uworld1002 = nt_getTask(1002)
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level40();
	Msg2Player("Ph� Nam B�ng gi�p b�n t�y t�y, hi�n gi� b�n c� th� thay ��i �i�m k� n�ng. N�u b�n kh�ng thu�c Phe Trung l�p, th� s� kh�ng ���c t�y t�y. B�n c� th� v� t�m Ph� Nam B�ng.")
end

function middlefinish6()
	AddOwnExp(30000)
	nt_setTask(1002,215)
	Msg2Player("H�n Giang ��c �i�u T�u b�o b�n ��n M� cung ��ng ��nh h� t�m �ng ta!")	
end

function middlefinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level50();
	Msg2Player("Ph� Nam B�ng n�i s� sau n�y s� t�m b�n.")
	Talk(1,"middletask","C� g�ng l�n")
end

function middlefinish8()
	AddOwnExp(50000)
	nt_setTask(1002,280)
	Msg2Player("Kh�ng T�ch Th�n T�ng b�o ��n H�u s�n Thi�u L�m T� t�m �ng ta")	
end

function middlefinish9()
	AddOwnExp(40000)
	nt_setTask(1002,310)
	ex_add_zl_level60();
	AddSkillState( 509, 1, 0, 180);
	Msg2Player("Ph� Nam B�ng n�i s� �i Hoa S�n l�m ch�t chuy�n, sau n�y c� d�p g�p l�i. B�n quay v� t�m Long Ng� ")	
end
