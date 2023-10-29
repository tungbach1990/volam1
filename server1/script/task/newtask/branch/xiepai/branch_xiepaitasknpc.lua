-- ����֧������ű�
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
----------------------------------------------------------------------�޳���-----------------------------------------------------------------------
function branch_zouchangjiu()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 40) or ( Uworld1058 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,50)
			Describe(name.."<#>:C�c h� l� Tr�u Tr��ng C�u?<enter>"
			..DescLink_ZouChangJiu.."<#>:��ng! T�m ta c� vi�c g�?<enter>"
			..name.."<#>:Huynh xem ��y l� g�! <enter>L�nh b�i c�a Th�c B�t Ho�i Xuy�n b� m�t.<enter>Ng��i... Ng��i l� ng��i ���c Th�c B�t Ho�i Xuy�n ph�i t�i. T�t! ��n ��ng l�c l�m!<enter>"
			..name.."<#>:Th� g� m� quan tr�ng th�. <enter>Tr�u Tr��ng C�u: C�i n�y ng��i kh�i lo, c�m nh�ng quy�n m�t t�ch da d� n�y c� th� l�p t�c ra kh�i th�nh, n�u kh�ng s� kh�ng �i ���c ��u. N�u c� th� tho�t th�n ���c, c�m nh�ng quy�n m�t t�ch n�y �i D��ng Ch�u t�m Th�m Phong. Nh�n th�y v�t n�y, h�n t� nhi�n s� hi�u.enter>",
			1,"K�t th�c ��i tho�i/branch_zouchangjiu1")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_ZouChangJiu.."<#>: ��i ng��i c� nhi�u chuy�n kh�ng ng�! C� nh�ng chuy�n ta kh�ng mu�n th� n� v�n c� ��n!",1,"K�t th�c ��i tho�i/no")
	end
end
---------------------------------------------------------------------���-----------------------------------------------------------------------
function branch_shenfeng()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 60) or ( Uworld1058 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,70)
			Describe(name.."<#>:Th�m Phong?<enter>"
			..DescLink_ShenFeng.."<#>: Ch�nh ta.<enter>"
			..name.."<#>: Ng��i xem ��y!<enter>G� th�? <enter>B�n m� M�t t�ch da d� cho Th�m Phong xem.<enter>"
			..name.."<#>: C� ng��i � Th�nh �� nh� ta ��n t�m huynh <enter>C�u t�c! Gia gia kh�ng ph�i Th�m Phong, ng��i m�c l�a r�i! N�y Kim c�u, h�m nay c� mu�n to�n m�ng s�ng?<enter>",
			1,"K�t th�c ��i tho�i/branch_shenfeng1")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_ShenFeng.."<#>:Ch�nh ta!",1,"K�t th�c ��i tho�i/no")
	end
end

--------------------------------------------------------------------���̹�-----------------------------------------------------------------
function branch_liuyungu()
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1013 = nt_getTask(1013)
	local name = GetName()  
	if ( Uworld1060 == 20) or ( Uworld1060 == 30 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,30)
			Describe(
			name.."<#>:L�u huynh! Nghe n�i T�ng Tri�u �ang m� h�i l�i ��i, khuy�n kh�ch qu�n h�ng trong thi�n h� luy�n v�.<enter>"
			..DescLink_LiuYunGu.."<#>: Nam T�ng m� tr�n l�i ��i t� v� cho nh�n s� v� l�m, m�c ��ch tuy�n d��ng phong tr�o luy�n v� nh�ng c� th� th�y Nam tri�u �ang m�u t�nh ��y m�nh bi�n ph�ng, b� sung qu�n l�c �� ch�ng l�i ��i Kim ta.<enter>"
			..name.."<#>: Huynh c� m�u k� g� ch�ng?<enter>Kh�ng! Ch� c� ng��i tham d� tr�n l�i ��i m�i c� th� gia nh�p v�o s�n ��u, ��y l� chuy�n m� ta v�t �c m�i kh�ng ra. N�u ng��i��.<enter>"
			..name.."<#>: Ta hi�u. Ta s� ��ch th�n �i Di�n V� Tr��ng tham gia m�t tr�n thi ��u, ch� c� th� nh� v�y m�i c� th� thu th�p tin t�c.<enter>",
			1,"K�t th�c ��i tho�i/branch_liuyungu2")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif (( Uworld1060 == 40) or ( Uworld1060 == 50 )) and ( Uworld1013 == 20 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,50)
			Describe(
			DescLink_LiuYunGu.."<#>: Th�ng r�i �! H�! H�! Kh� l�m! H�y quay v� t�m Th�c B�t T��ng qu�n k� l�i t��ng t�n t�nh h�nh tr�n L�i ��i, n�n nh� ��ng �� s�t b�t c� ch� nh� n�o.<enter>",
			1,"K�t th�c ��i tho�i/branch_liuyungu3")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end	
	elseif ( Uworld1059 == 40) or ( Uworld1059 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,50)
			Describe(
			name.."<#>:L�u U�n C�?<enter>"
			..DescLink_LiuYunGu.."<#>: Ng��i l� ai! D�m th�t l� v�i b�n quan �?<enter>"
			..name.."<#>: ��ng gi� b� n�a, ta l� ng��i ���c Th�c B�t T��ng Qu�n ph�i t�i t�m ng��i h�i th�m v�i chuy�n. <enter>Th�c B�t? Th�c B�t qu�i g� ch�? ��i T�ng ta m�y v�n chi�n t��ng, n�o c� ai mang c�i h� r� �y?<enter>"
			..name.."<#>: L�nh B�i Th�c B�t T��ng qu�n ��y, L�u ti�n sinh c�n kh�ng tin sao?<enter>C�n th�n ki�m tra l�nh b�i, b�ng nhi�n h� gi�ng <enter>Qu� nhi�n l� ng��i c�a Th�c B�t T��ng Qu�n, ng��i  mu�n bi�t tin g�?<enter>"
			..name.."<#>: G�n ��y nghe n�i v�i tin ��n v� Thi Nghi Sinh, T��ng qu�n sai ta ��n �� tra r� th�c h�.<enter>Thi Nghi Sinh? Ho�t ��ng � Nam T�ng c�a g� n�y c� ch�t m� �m v� �� ti�t l� nh�ng t�nh b�o tuy�t m�t c�a ��i Kim.<enter>"
			..name.."<#>: Th�t c� chuy�n �� sao? V�y Taph�i tr� v� b�m b�o v�i T��ng qu�n. <enter>Tr�n ���ng ph�i h�t s�c c�n th�n.<enter>",
			1,"K�t th�c ��i tho�i/branch_liuyungu1")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	
	else
		Describe(DescLink_LiuYunGu.."<#>: Ta? V�ng, Ng�c, L�a, Sa tanh, R��u ngon, ng�a t�t  th� g� c�ng c�, ch� c�n n�i ra, ta s� c� b�n!",1,"K�t th�c ��i tho�i/no")
	end
end

---------------------------------------------------------------------��-------------------------------------------------------------------------
function branch_zuihan()
	Uworld1059 = nt_getTask(1059)
	local name = GetName()  
	
	if ( Uworld1059 == 80) or ( Uworld1059 == 90 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,90)
			Describe(
			name.."<#>:Ma men! D�y �i!<enter>"
			..DescLink_JiuGui.."<#>: M�t gi�c m�ng d�i, ��i ng��i c� bao l�u, �� ta say �i....��<enter>"
			..name.."<#>: Ng��i mu�n say, c�ng kh�ng ph�i l� b�y gi�. Th�c B�t T��ng qu�n �ang c�n ng��i.<enter>Ng��i n�i g�?!��Qu� l� Th�c B�t T��ng qu�n, c� ��ng l� T��ng qu�n nh� ng��i t�i kh�ng? �� 10 n�m r�i, ta �n n�u n�i n�y kh�ng b�n b� th�n th�ch! C� l�c ta ngh� r�ng qu� h��ng �� t� b� ta, h�a ra m�i ng��i v�n c�n nh� ��n ta. Ng��i c� g� c�n ta gi�p ch�ng?<enter>"
			..name.."<#>: B�y gi� ta mu�n bi�t quy lu�t ra v�o c�a Thi Nghi Sinh, ngo�i ra ng��i l�m cho ta m�t s� th�ng h�nh l�nh b�i.<enter>Nh�ng th� n�y ta �� chu�n b� t� l�u, h�y �i b�t t�n c�u gian t� Thi Nghi Sinh �i.<enter>",
			1,"K�t th�c ��i tho�i/branch_zuihan1")	
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_JiuGui.."<#>: Ai da, say r�i, �� say th� kh�ng c�n nh� g� n�a, m�nh nh� ng��i kh�c ch�a ch�c ai �� nh� t�i m�nh.",1,"K�t th�c ��i tho�i/no")
	end
end

function branch_zouchangjiu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shenfeng1()
	AddOwnExp(5000)
	nt_setTask(1058,80)
	Msg2Player("T�n Th�m Phong n�y r� r�ng l� do v� s�  T�ng Tri�u gi� d�ng!")
	NewWorld(80,1795,3395)
	SetFightState(1)
end
	
function branch_liuyungu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_liuyungu2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,40)
	Msg2Player("B�n quy�t ��nh ��ch th�n �i  Di�n V� Tr��ng tham gia ��nh m�t tr�n pk.")
end

function branch_liuyungu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_zuihan1()
	AddOwnExp(15000)
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	nt_setTask(1059,100)
	Msg2Player("B�n �� c� th� thu�n ti�n �i th�ch s�t Thi Nghi Sinh.")
end

function no()
end

