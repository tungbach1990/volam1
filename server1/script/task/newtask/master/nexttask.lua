-------------------------------------------------------------------------
-- FileName		:	nexttask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 21:46:30
-- Desc			:	������ϵͳ���ɣ�����������һ������Ĵ���
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")

-----------------------------------------��������---------------------------------
function mastertask()
	Uworld1001 = nt_getTask(1001)
	name = GetName()
	if (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1001,70)
		Describe(DescLink_MoChou.."<#>: L�u ng�y kh�ng g�p, ta nghe n�i ng��i tr�n giang h� c�ng c� ch�t th�nh t�u. <enter>"
				..name.."<#>: A! L� M�c S�u <enter>M�y ng�y nay ta r�t b�n �i�u tra tung t�ch c�a 'Thi�n Ho�ng Long Kh�', cu�i c�ng c�ng t�m ���c. <enter>"
				..name.."<#>: Mu�n ta l�m chuy�n g�? <enter> T�n T��ng T� � Th�nh �� g�n ��y c� nhi�u kh�ch h�nh h��ng, trong �� c� ng��i t�n C�ng T� Ti�u. Theo s� �i�u tra c�a ta,h�n ch�nh l� C�ng t� Ti�u n�i danh n�m x�a � Ba Th�c. Ng��i n�y r�t gi�u c� v� ph�ng kho�ng,th� h� m�n �� h�n ng�n ng��i, n�m �� ���c T� C�ng T� di phong. <enter>C� m�t n�m, trong v�ng m�t th�ng y �� c�m c� h�t gia s�n, g�n ��y ��t nhi�n xu�t hi�n �  T�n T��ng T�, nghe n�i l� �� ni�m kinh si�u �� cho cho ng��i v� qu� c�. Th�m t� c�a ta h�i b�o, m�y n�m nay C�ng T� Ti�u h�n thu th�p Thi�n Ho�ng Long Kh�, trong �� H� Uy�nHo�ng Kim L�n �ang n�m trong tay h�n. <enter>"
				..name.."<#>: L�i c� chuy�n nh� th� �? <enter>C�ng T� Ti�u l� ng��i tr��ng ngh�a. L�n n�y ng��i �i kh�ng th� d�ng s�c c��ng �p. N�u nh� huynh �y m�t m�c c� tuy�t th� quay l�i t�m c�ch kh�c. <enter>",
				1, "K�t th�c ��i tho�i/taskfinish1") 
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1001,140)
		Describe(DescLink_MoChou.."<#>: Ai da! Kh�ng bi�t n�n n�i th� n�o v�i ng��i. <enter>"
				..name.."<#>: Th� n�o r�i M�c S�u c� n��ng? C� g� xin c� n�i.<enter> ��y l� ng�y cu�i c�ng ��nh chim �ng, l�i b� n� l�m m� m�t. <enter>"
				..name.."<#>: L�u ng�y kh�ng g�p ng��i l�i � r� nh� th�. <enter>B�n trong T�m Long H�i c� m�t m�ng l��i t�nh b�o ph�c t�p c� v�ng D��ng Ch�u do H� V� Th� ph� tr�ch. <enter>"
				..name.."<#>: Ch�ng l� h�n �� x�y ra chuy�n g�? <enter>Kh�ng sai.<enter>G�n ��y nh�n ���c tin 'C�u Hi�n Chi Ch�' trong 'Thi�n Ho�ng Long Kh�' �� xu�t hi�n � D��ng Ch�u. Nh�ng H� V� Th� kh�ng b�o l�i, ch� n�i kh�ng c� manh m�i, v�i n�ng l�c c�a h�n th�t ��ng nghi ng�. <enter>"
				..name.."<#>: C� mu�n ta l�m th� n�o? <enter>�i D��ng Ch�u, �i�u tra ch�n t��ng ��y l� L�nh b�i c�a ta, th�y L�nh b�i nh� th�y ng��i. <enter>",
				1,"K�t th�c ��i tho�i/taskfinish3") 
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1001,210)
		Describe(DescLink_MoQiaoEr.."<#>: ��i s� ch�ng l�nh!<enter>"
				..name.."<#>: Th� n�o r�i? <enter> T� t� ta b� m�t H�c Y nh�n b�t �i. <enter>"
				..name.."<#>: C�i g�! T� t� ng��i sao l�i b� ng��i ta ph�t hi�n? <enter> Ta c�ng kh�ng bi�t,b�y gi� trong ��u ta r�t b�i r�i. Cho n�n m�i ��n t�m ��i hi�p. <enter>"
				..name.."<#>: V�y H�c Y nh�n �� c� ��c �i�m g�? Ho�c l� c� �� l�i d�u v�t g� kh�ng.<enter> H�n cao to tr�ng r�t khi�p, ch� m�t chi�u �� kh�ng ch� ���c M�c t�. L�c ta ch�y ��n ch� c�n th�y c�i b�ng �o �en m� th�i. <enter>"
				..name.."<#>: T� l�c n�o tr�n giang h� l�i xu�t hi�n 1 ��m cao th� v�y? Chuy�n n�y qu� nhi�n kh�ng ��n gi�n, c� th� li�n quan ��n Thi�n Ho�ng Long Kh�. <enter> ��ng v�y! Ta v�i qu� qu�n cho ng��i bi�t Ho�ng Kim L�n v� C�u Hi�n Chi Ch� ��u �� m�t t�ch. <enter>"..name..": Vi�c n�y qu� ��t ng�t, kh�ng ch�t manh m�i, nh�t th�i kh�ng bi�t ��u tra t� ��u.C� nh� l�i xem, T� t� c� tr��c khi b� b�t �i c� n�i qua g� kh�ng.<enter> ��ng r�i,T� t� t�ng n�i,n�u nh� t� m�t t�ch, th� ��n L�m An t�m  M�nh Ph�m. <enter>"
				..name.."<#>: C� manh m�i n�y qu� l� r�t t�t. C� ch� � ��y, ta s� �i t�m h�n. <enter> ���c.<enter>",
				1,"K�t th�c ��i tho�i/taskfinish5")
	elseif (( Uworld1001 == 270 ) or ( Uworld1001 == 280 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1001,280)
		Describe(DescLink_MengFan.."<#>: Ta �� th�m th�nh ���c tung t�ch c�a S�u nhi.<enter>"
				..name.."<#>: � ��u?<enter>l� 1 n�i kh�ng th� n�o tin ���c.<enter>"
				..name.."<#>:......<enter>M�t ��o Nha M�n T��ng D��ng!<enter>"
				..name.."<#>: C�i g�? � ch� Quan ph� �? Ch�ng l� Tri�u ��nh c�ng c� li�n quan.<enter>Vi�c n�y ta c�ng kh�ng bi�t. Ta bi�t ���c tung t�ch c�a Long Kh� xu�t hi�n b�n h� B� D��ng, ph�i qua b�n �� xem m�i ���c. Ng��i h�y ��n T��ng D��ng t�y c� h�nh ��ng!<enter>"
				..name.."<#>:M�nh ��i th�c �ng y�n t�m! Ta s� c� c�ch.<enter> Th� ng��i �i ��u?<enter>",
				1,"K�t th�c ��i tho�i/taskfinish9")
	end 
end 

function taskfinish1()
		AddOwnExp(10000)
		nt_setTask(1001,80)
		Msg2Player("M�c S�u b�o b�n �i Th�nh �� T�n T��ng T� t�m C�ng T� Ti�u �i�u tra tung t�ch c�a Ho�ng Kim L�n.")
end

function taskfinish3()
		AddOwnExp(15000)
		nt_setTask(1001,150)
		Msg2Player("M�c S�u b�o b�n �i D��ng Ch�u t�m  H� V� Th� �i�u tra tung t�ch c�a C�u Hi�n Chi Ch�.")
end

function taskfinish5()
		AddOwnExp(30000)
		nt_setTask(1001,220)
		Msg2Player("M�c X�o Nhi b�o b�n �i L�m An t�m  M�nh Ph�m, �ng ta bi�t tung t�ch c�a M�c S�u.")
end

function taskfinish9()
		AddOwnExp(50000)
		nt_setTask(1001,290)
		Msg2Player("M�nh Ph�m b�o b�n �i M�t ��o T��ng D��ng, M�c S�u b� 1 ng��i th�n b� b�t ��n ��.")
end

-------------------------------------��������----------------------------------------------

function middletask()
	Uworld1002 = nt_getTask(1002)
	name = GetName()
	if (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1002,70)
		Describe(DescLink_FuNanBin.."<#>: Ch� m�i m�t th�i gian ng�n nh�ng b�n l�nh c�a b�n �� t� ra v��t tr�i. <enter>"..name..": C� tin t�c g�? <enter> Tr�n giang h� c� 3 ng��i kh�ng th� gi�t. <enter>"..name..": Ba ng��i n�o? <enter>Nh�c V� M�c, l� V� th�nh nh�n, d�n ch�ng b�i Ph�c, kh�ng th� gi�t ���c. <enter>V� L�m Minh Ch� ��c C� Ki�m, m�t ki�m trong tay, tung ho�nh thi�n h�. <enter>L� Thi�n T��ng, v� c�ng c�i th�. <enter>"..name..": Hai ng��i tr��c ta kh�ng ��ng ��n. <enter> Ta mu�n ng��i �i khu�t ph�c L� Thi�n t��ng. T�n n�y l�m nhi�u chuy�n �c, c� ng��i b� s� ti�n l�n mua m�ng h�n. <enter>"..name..": � ��u? L�c n�o?<enter> Kho�i Ho�t L�m, n�i trong 10 ng�y. <enter>"..name..": Ng��i ch� c� m�t c� h�i duy nh�t! <enter> C�n m�ng th� quay v� g�p ta. <enter>",1,"K�t th�c ��i tho�i/middlegoon1")
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1002,120)
		Describe(DescLink_FuNanBin.."<#>: Th�i c� ��n r�i! <enter>"..name..": Th�i c� g�?<enter> L�m Uy�n Nhai �� b�t ��u h�nh ��ng. <enter>"..name..": �ng n�i r� ch�t �i. <enter> Tin t�c trong L�m Uy�n Nhai ��u l� li�n l�c m�t chi�u, ta ch� bi�t  b�o ng��i �i Th�y Y�n m�n t�m ��i s� t� L� Thu Th�y. C� ta s� ch�  cho ng��i b��c ti�p theo. <enter>"..name..": Th�y Y�n m�n? <enter> ��ng, s�c m�nh ch� y�u c�a L�m Uy�n Nhai l� do tinh anh c�a m�y ��i m�n ph�i t�o th�nh, Th�y Y�n m�n l� m�t trong s� ��. B� m�t n�y tr�n giang h� r�t �t ng��i bi�t. <enter>"..name..": V�y ���c! Ta �i t�m c� ta. <enter>",1,"K�t th�c ��i tho�i/middlegoon2")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1002,190)
		Describe(DescLink_FuNanBin.."<#>: Chi�n th��ng 'Long �o�n' trong 'Thi�n Ho�ng B�t Kh�' t�ng l� Tr�n bang chi b�o c�a Thi�n V��ng Bang, ��ng ti�c sau �� b� k� l� c��p �i. Thi�n V��ng Bang l� 1 ph�n quan tr�ng c�a L�m Uy�n Nhai,h�n n�a Bang ch� D��ng Anh l� Ch� nh�n c�a L�m Uy�n Nhai. G�n ��y nghe n�i chuy�n n�y c� li�n quan ��n H�n Giang ��c �i�u T�u. Ng��i n�y c� c�ng hi�n r�t nhi�u cho Thi�n V��ng, ch� nh�n c�a h� kh�ng mu�n ��ch th�n ra tay! Ng��i c� th� ��m nh�n vi�c n�y kh�ng? <enter>",1,"K�t th�c ��i tho�i/middlegoon3")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1002,250)
		Describe(DescLink_FuNanBin.."<#>: ��i s� ch�ng l�nh, theo m�t th�m h�i b�o, T� ch�c b� m�t Ch�nh ph�i T�m Long H�i thu th�p ���c 2 Th�n kh�, n�u �� b�n h� c� �� b� k� ho�ch c�a ch�ng ta s� kh�ng c� ng�y ho�n th�nh.V� hy v�ng c�a b� t�nh, ng��i nh�t ��nh ph�i �o�t l�i Th�n kh� b� M�c S�u ��a cho Kh�ng T�ch. H�n �ang � trong Thi�u L�m T�. H�y t�m h�n �o�t l�i b�o kh�. Hy v�ng c�a L�m Uy�n Nhai n�m trong tay ng��i! <enter>",1,"K�t th�c ��i tho�i/middlegoon4")
		end 
end 

function middlegoon1()
	AddOwnExp(10000)
	nt_setTask(1002,80)
	Msg2Player("Ph� Nam B�ng b�o b�n �i Kho�i Ho�t L�m ��nh b�i L� Thi�n T��ng.")
end

function middlegoon2()
	AddOwnExp(15000)
	nt_setTask(1002,130)
	Msg2Player("Ph� Nam B�ng b�o b�n �i Th�y Y�n m�n t�m L� Thu Th�y.")
end

function middlegoon3()
	AddOwnExp(30000)
	nt_setTask(1002,200)
	Msg2Player("Ph� Nam B�ng b�o b�n �i Thi�n V��ng Bang t�m H�n Giang ��c �i�u T�u.")
end

function middlegoon4()
	AddOwnExp(50000)
	nt_setTask(1002,260)
	Msg2Player("Ph� Nam B�ng b�o b�n �i Thi�u L�m T� t�m Kh�ng T�ch ��i S�.")
end
