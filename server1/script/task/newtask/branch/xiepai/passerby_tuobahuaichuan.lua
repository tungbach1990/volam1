-- ������ϵͳа��֧�߹���npc
-- BY��XIAOYANG��2005-1-17��
 
 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_tuobahuaichuan()
--------------------------------------------------------------------��ѧ����------------------------------------------------------------------
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)   --��ѧ�������
	Uworld1003 = nt_getTask(1003)	 --а�������������
	Uworld189 = nt_getTask(189)
	Uworld1058 = nt_getTask(1058) --а��20-30֧��
	Uworld1059 = nt_getTask(1059) --а��30-40֧��
	Uworld1060 = nt_getTask(1060) --а��40-50֧��
	Uworld1061 = nt_getTask(1061) --а��50-60֧��
	Uworld1013 = nt_getTask(1013) --а��֧�ߵ�ɱ���������
	Uworld198 = nt_getTask(198) --а��ȫ����
	local name = GetName()  
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 2 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_xfz1",name..": Ng� Gia b�o ta ��n, ��y l� th� c�a Ng� Gia!","Ng��i c�a Long Ng�? H�m! H�n c�n nh� ��n Th�c m� n�y sao?","Ng��i c� th� c� th� d�o ch�i trong th�nh, d�ng ph�m Tab m� b�n �� nh� �� d� xem! Sau �� h�y ��n t�m ta!")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 2 ) then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_xfz2",name..": Ta �� xem qua r�i..","T�t! B�y gi� h�y �i t�m V� L�m truy�n nh�n!")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 2 ) and ( Uworld1003 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_xfz3","V� r�i �! ��y l� t�i th� c�a ng��i! Xem xong ng��i t� bi�t ph�i l�m g�!",name..":......Thay ta c�m �n Ng� Gia.","H�y t� �i c�m �n! T� nay v� sau m�i khi ho�n th�nh nhi�m v� ch�nh tuy�n ��u quay v� ch� ta, ta c� v�i nhi�m v� nh� giao cho ng��i, ho�n th�nh xong s� c� nh�ng m�n qu� b�t ng� t�ng ng��i. Ta quy�t kh�ng �� g� �� xem th��ng.",name..": ���c! Ta nh� r�i.","Nhi�m v� phe kh�c ng��i c�ng c� th� l�m, c� th� ���c kh�ng �t �i�m kinh nghi�m, ch� l� h� c� th�nh ki�n v�i ng��i, n�n c� v�i m�n b�o v�t kh�ng th� ��a ng��i ���c. Ng��i c� th� v�o th�n tr�n t�m Long Ng� h�i th�.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 2 ) and ( Uworld1003 > 10 ) then
			Talk(1,"Uworld1000_finishxiepai","Ng��i  �� b�t ��u nh�n nhi�m v� c�c phe, ch� ta kh�ng gi� ���c ng��i n�a, ng��i �� h�c ���c kh�  nhi�u r�i, h�y t� m�nh �i  �i!")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 2 ) and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1003 < 10 ) then 
			Say("T�i sao quay l�i? Hay l� �� qu�n t�i th� � ch� ta.",2,"Tu�n l�nh!/Uworld1000_xfz4","Kh�ng ph�i! Ch� l� quay l�i th�m �ng m� th�i!/Uworld1000_no3")
		else 
			Talk(1,"","Quy�n khuynh Nam S�n, Ch��ng ��o B�c H�i, ng��i mu�n ��n Ti�u c�c �? Nh�c ng��i m�t c�u, n�u ng��i �ang l�m <color=red>nhi�m v� s� nh�p<color>, ng��i s� kh�ng c� c�ch n�o ti�p t�c l�m nhi�m v� c�a nh�ng  ��ng c�p kh�c, h�y l�m h�t nhi�m v� s� nh�p �i!")
		end
----------------------------------------------------------------------а��֧��---------------------------------------------------------------	
	else
		if (( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1)) or (( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1)) or (( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1)) or  (( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1)) then
			Describe(DescLink_TuoBaHuaiChuan.."<#>:  Ta r�t h�i l�ng v�i bi�u hi�n c�a ng��i, t�ng ng��i m�n b�o v�t n�y!",1,"Nh�n l�nh b�o v�t/allprize_xiepai")
		elseif ( Uworld1061 == 110 ) or ( Uworld1061 == 120 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: T�t! Th�nh Do�n �� ch�t! ��i Kim kh�ng c�n g� ph�i lo l�ng! L�m r�t hay! L�c n�y, ng��i c� th� �i ngao du s�n th�y, l�nh xa th� s� nhi�u nh��ng <enter>",
				1,"K�t th�c ��i tho�i/Uworld1061_xfz6")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1061 == 80 ) or ( Uworld1061 == 90 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Th�t phi�n to�i��<enter>"
				..name.."<#>: T��ng qu�n! Chuy�n g� m� �u s�u th�?<enter>T��ng D��ng th�nh l�y v�ng v�ng, binh h�ng t��ng m�nh. Th�nh Do�n l�i tr� d�ng song to�n, chi�n s� k�o d�i c�ng l�u, qu�n ta chi vi�n c�ng kh�. N�u tr�i v�o ��ng, c�ng c� nhi�u kh� n�ng b�t l�i.<enter>"
				..name.."<#>: � t��ng qu�n l�?<enter> Di�t ���c S� Th�nh Do�n, T��ng D��ng kh�ng ��nh m� th�ng!<enter>",
				1,"K�t th�c ��i tho�i/Uworld1061_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1061 == 60 ) or ( Uworld1061 ==70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,70)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: B�n tr� l�i r�t t�t!",1,"K�t th�c ��i tho�i/Uworld1061_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1061 == 40 ) or ( Uworld1061 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,50)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Ng��i �� s�n s�ng ch�a?",2,"B�t ��u th�i!/branch_songjinproblem","�� ta suy ngh� l�i!/no")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1061 == 20 ) or ( Uworld1061 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,30)
				Describe(
				name.."<#>: T��ng qu�n! �i�m t�ch l�y T�i h� �� l�y nhi�u r�i!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: Kh� kh�! Qu� nhi�n l�i h�i! Ho�ng Th��ng �ang mu�n g�p ng��i �� h�i v� ki�n th�c qu�n s�! Ta th� h�i ng��i tr��c!<enter>",
				1,"K�t th�c ��i tho�i/Uworld1061_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1060 == 110 ) or ( Uworld1060 == 120 )then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Tr�n ��i n�y e r�ng kh�ng c�n chuy�n g� c� th� c�n b��c ch�n ng��i!",
				1,"K�t th�c ��i tho�i/Uworld1060_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1060 == 80 ) or ( Uworld1060 == 90 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>:Ha ha! Gi�i l�m! Qu� nhi�n ta kh�ng nh�n l�m ng��i! <enter>"
				..name.."<#>: Ch� th�ng m�t tr�n n�o c� ��ng g�!<enter>Ng��i c� bi�t c� b�n Nam T�ng hoang mang th� n�o ch�a!?<enter>"
				..name.."<#>:Kh�ng bi�t.<enter>Chi�n tranh g�n k�, l�ng ng��i ho�ng lo�n, ��a ng��i ra n�i ��u s�ng ng�n gi�, l�ng ta c�m th�y �y n�y!<enter>"
				..name.."<#>: L� t�i h� mu�n x� th�n v� n��c.<enter>T�t! Ng��i �� ngh� m� L�i ��i kh�ng ai kh�c h�n l� ��i h�o Nguy�n Minh Vi�n, h�n v�n l� �� t� t�c gia Thi�u L�m t�. Khi h�n ra ngo�i th�nh T��ng D��ng l� c� h�i t�t �� ti�u di�t. N�u gi�t ���c h�n s� h� th�p � ch� ��u tranh c�a qu�n d�n T�ng Qu�c. Ta �� suy t�nh k�, ch� c� ng��i m�i c� th� ��m nh�n tr�ng tr�ch n�y.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1060_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1060 == 60 ) or ( Uworld1060 == 70 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,70)
				Describe(name.."<#>: T��ng qu�n, t�i h� ��ch th�n tham gia 1 tr�n l�i ��i! Th�t nguy hi�m! May m� t�i h� chi�n th�ng!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: Th�t kh�ng? V�y danh hi�u  Thi�n h� v� d�ng c�a ��i Kim ta �� � ��u? H�y ��nh th�ng m�t tr�n cho ta, quy�t ph�i gi�nh chi�n th�ng �� m�i ng��i bi�t r�ng thi�n h� n�y l� c�a ai!<enter>",
				1,"K�t th�c ��i tho�i/Uworld1060_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1059 == 110 ) or ( Uworld1059 == 120 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Ng��i �� b�t ���c r�i, gi�i l�m! Ng��i �� l�p ���c ��i c�ng, ta s� t��ng th��ng x�ng ��ng!<enter>",
				1,"K�t th�c ��i tho�i/Uworld1059_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1059 == 60 ) or ( Uworld1059 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,70)
				Describe(
				name.."<#>: Th�c B�t T��ng qu�n, qu� kh�ng ngo�i d� �o�n! Thi Nghi Sinh �ang c� �m m�u l�m n�i gi�n!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: �� ph�n qu�c!<enter>"
				..name.."<#>: T��ng qu�n gi�n d�.<enter>�C�c�ch  r�i! Ng��i �i L�m An m�t chuy�n, b� m�t b�t h�n v� ��y cho ta x� l�.<enter>"
				..name.."<#>:Tu�n l�nh.<enter>L�m An th� th�nh nghi�m ng�t, kh�ng ph�i nh� nh�ng n�i ng��i �� t�ng �i qua, l�n h�nh ��ng n�y e r�ng s� g�p kh� kh�n kh�ng �t!<enter>"
				..name.."<#>: Kh� kh�n th� l�ng ng��i, kh�ng th�nh c�ng c�ng th�nh nh�n.<enter>Chuy�n n�y th�nh b�i kh�ng quan tr�ng. Ta �� c�i s�n m�t th�m � L�m An, h�y �i T�u �i�m t�m T�y H�n! K� n�y ng�y ng�y ��m ch�m men r��u, nh�ng kh�ng ai ng� r�ng h�n l� ng��i c�a ta.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1059_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1059 == 20 ) or ( Uworld1059 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,30)
				Describe(name.."<#>: Y�u c�u c�a T��ng qu�n, t�i h� l�m ���c nh�ng c�n c� ch�t nghi ho�c, xin gi�i ��p c�n k�!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>:Ha ha ha! Doanh Thi�n H� ch�nh l� ta ��y!<enter>"
				..name.."<#>: C�c h� x�ng ��ng l� m�t T��ng qu�n.<enter>N�u mu�n ���c nh� ta hi�n gi� ��i v�i ng��i m� n�i d� nh� tr� b�n tay, ch� c�n l�m t�t chuy�n ta giao, ta nh�t ��nh ti�n c� ng��i v�i Ho�ng th��ng!<enter>"
				..name.."<#>: L�m t�t l�m!.<enter>Hi�n ta c� m�t nhi�m v� tr�ng ��i giao cho ng��i, kh�p ph��ng b�c ch� c� 5 ng��i n�y bi�t ���c chuy�n n�y.<enter>"
				..name.."<#>: L� chuy�n g�?<enter>Theo tin th�m b�o, g�n ��y S� gi� Thi Nghi Sinh do ��i Kim ph�i t�i Nam T�ng c� nhi�u h�nh ��ng kh� nghi, kh� n�ng c� m�u �� ph�n qu�c, h�n bi�t qu� nhi�u �i�u c� m�t c�a ��i Kim ta. H�y �i T��ng D��ng t�m  L�u U�n C� b�n c�ch th� ti"
				..name.."<#>: ���c! Ng�y mai ta h�nh ��ng. <enter>Kh�ng! L�p t�c h�nh ��ng, t�nh h�nh d�u s�i l�a b�ng, t�t c� tr�ng ch� v�o ng��i!<enter>",
				1,"K�t th�c ��i tho�i/Uworld1059_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1058 == 90 ) or ( Uworld1058 == 100 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,100)
				Describe(DescLink_TuoBaHuaiChuan.."<#>:C� k� gi� d�ng Th�m Phong? Ta c�n ph�i �i xem th�c h�, t�m th�i nhi�m v� c�a ng��i �� ho�n th�nh!<enter>",1,"K�t th�c ��i tho�i/Uworld1058_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end																																			
		elseif (( Uworld1058 == 20 ) or ( Uworld1058 == 30 ))  and ( Uworld1013 == 20 ) then 
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,30)
				Describe(DescLink_TuoBaHuaiChuan.."<#>: Ng��i th�t l�i h�i! X�ng danh nam t� ��i Kim!<enter>V�i t�i n�ng nh� ng��i, ta s� giao ph� cho ng��i m�t chuy�n tr�ng ��i.<enter>"
				..name.."<#>: Xin ti�n sinh c� n�i.<enter>Ng��i �� �i Ba Th�c, ch�c kh�ng c�n l� g� v�i Th�nh ��. Mau mang l�nh b�i c�a ta x�m nh�p Th�nh �� t�m Tr�u Tr��ng C�u, l� m�t th�m do ��i Kim ta ph�i t�i. T�m ���c h�n, l�p t�c c�m v�i m�n �� ra kh�i th�nh, ch�m tr� e r�ng kh",
				1,"K�t th�c ��i tho�i/Uworld1058_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!");
			end
		elseif ( GetLevel() >= 20) then
			Say("Mu�n t�m m�t c�ng vi�c v�a � �? Chuy�n nh� th�i m�!",3,"T�i h� mu�n l�m nhi�m v� ch�nh tuy�n T� ph�i tr��c!/Uworld1000_xfz8","T�i h� mu�n nh�n nhi�m v� ph� tuy�n T� ph�i!/Uworld1000_xfz88","K� nh� ng��i ai m� kh�ng bi�t, ai th�m m�ng t�i nhi�m v� c�a ng��i?/Uworld1000_no3")
		else
			Talk(1,"","L�m g� ��? Mau �i �i! Ta kh�ng c� th�i gian m� �� m�t t�i ng��i! C� �i�u g� ch�a hi�u, �n ph�m <color=red>F12<color>�� xem.")
		end
	end
end



function Uworld1000_xfz8()
	Uworld1000 = nt_getTask(1000)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","H�y ��n T�n Th� th�n t�m Long Ng� ")
		Msg2Player("Ng�o V�n T�ng b�o b�n v�o T�n Th� Th�n t�m Long Ng�, Y s� giao v�i nhi�m v� cho b�n.")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","Ng��i v�n c�n l�m nhi�m v� s� nh�p, l�m xong �i! Long Ng� s� giao cho ng��i nhi�m v� kh�c, ��ng n�ng v�i!")
	elseif ( Uworld1003 ~= 0 ) then
		Talk(1,"","N�y b�ng h�u, ch�ng ph�i ng��i �ang l�m nhi�m v� T� ph�i ch�nh tuy�n �� sao? Kh�ng ph�i tr�u gh�o ta ch�! Ta l� ng��i th�t th�, ��ng g�t ta! Th�t l��.")
	else
		Talk(1,"","Nhi�m v� Ch�nh tuy�n l� sau khi b�n ��t ��n c�p nh�t ��nh m�i c� th� ti�p nh�n. Ch� c�n ��ng c�p nh�n v�t tr�n 20 l� c� th� ti�p nh�n. N�u ho�n th�nh......s� c� gi�i th��ng h�n mong ��i.")
	end
end

function Uworld1000_xfz88()
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Describe(DescLink_TuoBaHuaiChuan.."<#>: ��i ng��i c� m�y ai an ph�n m� ���c gi�u c�? Ngh� k� �i, h�y theo ta h�nh s�!",6,
	"Ta mu�n t�m hi�u c�ch l�m nhi�m v� Ph� tuy�n/Uworld1000_xfz7" ,
	"Ta mu�n l�m nhi�m v� t� c�p 20 ��n 29/Uworld1058_xfz1",
	"Ta mu�n l�m nhi�m v� c�p 30 ��n 39/Uworld1059_xfz1",
	"Ta mu�n l�m nhi�m v� c�p 40 ��n 49/Uworld1060_xfz1",
	"Ta mu�n l�m nhi�m v� c�p 50 ��n 59/Uworld1061_xfz1",
	"Hay l� sau n�y h�y l�m!/no")
end

function Uworld1000_xfz7()
	Describe(DescLink_TuoBaHuaiChuan.."<#>:  Nhi�m v� Ph� tuy�n tr�n c� b�n l� nhi�m v� Ch�nh tuy�n, khi ��t ��n ��ng c�p nh�t ��nh m�i c� th� ti�p nh�n. V� d� l�c ��ng c�p b�n l� 32, b�n ph�i ti�p nh�n nhi�m v� Ch�nh tuy�n c�p 30 tr��c, sau �� m�i c� th� ti�p nh�n nhi�m v� ph� tuy�n.Tr��c khi",1,"K�t th�c ��i tho�i/no")
end

function Uworld1058_xfz1()
	Uworld1058 = nt_getTask(1058) --а��20-30��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1058 == 0 ) or ( Uworld1058 == 10 )) then
		nt_setTask(1058,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  V� L�m Nh�n s� Trung Nguy�n lu�n xem th��ng ��i Kim, cho r�ng ch�ng ta kh�ng �� s�c chi�n th�ng.<enter>"
		..name.."<#>:  N�u kh�ng ph�i n�i b� T�ng tri�u chia r�, ch�ng ta mu�n th�ng kh�ng ph�i l� chuy�n d�.<enter> T�ng tri�u v�n c�n nhi�u t��ng gi�i, cho n�n ch�ng ta ch�a y�n t�m ���c. Mu�n h��ng ph��c e r�ng ph�i ch� sau khi �o�t ���c s�n h� c�a ��i T�ng.<enter>"
		..name.."<#>:  Ta v�n c�n tr�, Th�c B�t ti�n sinh c� g� xin ch� gi�o.<enter>��i Kim s�p tri�n khai qu�n v�i quy m� l�n, ta mu�n ng��i gi�i h�n n�a, hay l� �i ���ng M�n m�t chuy�n, ��nh b�i 50 con H�c Di�p H�u.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1058_xfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 20, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1003 < 20 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m  nhi�m v� Ch�nh tuy�n T� ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Chu Ti�n Tr�n<color> t�m V�n Nhi")
	else
		Talk(1,"","V�n m�nh ��t n��c n�m trong tay ch�ng ta, ch� c�n ng��i m�t l�ng ph�ng s� ")
	end
end

function Uworld1058_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(5000)
	nt_setTask(1058,20)
	nt_setTask(1013,10)
	AddPlayerEvent(4) 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i ���ng M�n Th�nh �� ��nh 50 con H�c Di�p H�u.")
end

function Uworld1058_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1058_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level20();
end

function Uworld1059_xfz1()
	Uworld1059 = nt_getTask(1059) --а��30-40��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 110 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1059 == 0 ) or ( Uworld1059 == 10 )) then
		nt_setTask(1059,10) 
		Describe(
		name.."<#>:  Th�c B�t ti�n sinh, cu�i c�ng l� chuy�n g� v�y, ta t� ch� Tr�u Tr��ng C�u l�y ���c M�t t�ch da d�,   h�n b�o ta �i D��ng Ch�u t�m Th�m Phong, tr�n ���ng ��n �� b� Binh s� Nam T�ng �m to�n.<enter>"
		..DescLink_TuoBaHuaiChuan.."<#>:  �? Th�m Phong �� �� ng��i ph�t hi�n, h�n ta sao l�i b�t c�n th�. T�t chuy�n n�y n�i ra d�i d�ng l�m c�ng kh�ng th� �� ng��i kh�c bi�t, ng��i ph�i �i V� Di S�n ��nh 50 con S�i v�ng, n�u kh�ng ng��i kh�ng ��ng ���c ta giao cho nhi�m v�.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1059_xfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 30, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1003 < 100 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m  nhi�m v� Ch�nh tuy�n T� ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Chu Ti�n Tr�n<color> t�m V�n Nhi")
	else
		Talk(1,"","V�n m�nh ��t n��c n�m trong tay ch�ng ta, ch� c�n ng��i m�t l�ng ph�ng s� ")
	end
end

function Uworld1059_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(15000)
	nt_setTask(1059,20)
	nt_setTask(1013,10)
	AddPlayerEvent(5) 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i V� Di S�n ��nh 10 con S�i v�ng.")
end

function Uworld1059_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1059_xfz4()
	AddOwnExp(15000)
	nt_setTask(1059,80) 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i L�m An t�m t�n M�t th�m �n n�p �� l�u, ng��i n�y th��ng gi� d�ng say x�n b�n t�u l�u.")	
end

function Uworld1059_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level30();
end

function Uworld1060_xfz1()
	Uworld1060 = nt_getTask(1060) --а��40-50��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	if ( Uworld1003 >= 210 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1060 == 0 ) or ( Uworld1060 == 10 )) then
		nt_setTask(1060,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  Nghe n�i g�n ��y Nam T�ng t� ch�c thi ��u l�i ��i, ���c bi�t c� nhi�u cao th� �n c� �� l�u nay l�i xu�t hi�n, b�n trong �� ch�c c� �n t�nh, ng��i �i T��ng D��ng t�m L�u U�n C� h�i th�m t�nh h�nh.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1060_xfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 40, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1003 < 200 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m  nhi�m v� Ch�nh tuy�n T� ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Chu Ti�n Tr�n<color> t�m V�n Nhi")
	else
		Talk(1,"","V�n m�nh ��t n��c n�m trong tay ch�ng ta, ch� c�n ng��i m�t l�ng ph�ng s� ")
	end
end

function Uworld1060_xfz2()
	AddOwnExp(30000)
	nt_setTask(1060,20) 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i t�m L�u U�n C� �i�u tra t�nh h�nh T�ng tri�u Di�n v� tr��ng.")	
end

function Uworld1060_xfz3()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,80) 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i Di�n v� tr��ng ��nh m�t tr�n v� uy danh c�a ��i Kim.")	
end

function Uworld1060_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1060_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level40();
end

function Uworld1061_xfz1()
	Uworld1061 = nt_getTask(1061) --а��50-60��֮���֧���������
	Uworld1003 = nt_getTask(1003) --а�������������
	local name = GetName()  
	if ( Uworld1003 >= 300 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1061 == 0 ) or ( Uworld1061 == 10 )) then
		nt_setTask(1061,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  Ta kh�ng bi�t c�n g� c� th� l�m kh� ng��i ���c.<enter>"
		..name.."<#>:  �ng qu� �� cao ta r�i.<enter> Ta ���ng nhi�n gi� l�i h�a n�m x�a, Ho�n Nhan Kh�nh Hy �� v�o tri�u t�u v�i Ho�ng Th��ng phong ng��i l�m B�nh Nam Qu�n �� Th�i Hi�u U�.<enter>"
		..name.."<#>:  T� ch� long �n.<enter>V�i c�ng lao m� ng��i l�p ���c bao nhi�u ��y c� l� g�. Kh�nh Hy ��i nh�n chu�n b� v�o tri�u b�m Ho�ng Th��ng phong ng��i l�m Qu� Ngh� �� U�. Nh�ng v� ng��i ch�a l�p c�ng e r�ng m�i ng��i b�n t�n. H�y ��n chi�n tr��ng T�ng Kim ��nh m�t tr�n, l�y 200 �i�m t�ch l�y, cho m�i ng��i bi�t b�n l�nh c�a ng��i.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1061_xfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 50, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1003 < 300 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m  nhi�m v� Ch�nh tuy�n T� ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Chu Ti�n Tr�n<color> t�m V�n Nhi")
	else
		Talk(1,"","V�n m�nh ��t n��c n�m trong tay ch�ng ta, ch� c�n ng��i m�t l�ng ph�ng s� ")
	end
end

function Uworld1061_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(60000)
	nt_setTask(1013,10)
	nt_setTask(1061,20)  
	Msg2Player("Th�c B�t Ho�i Xuy�n �� ti�n c� b�n l�m Qu� Ngh� �� U�, nh�ng b�n c�n thi�u c�ng lao, b�o b�n tham gia ��i chi�n T�ng Kim, ��t 200 �i�m t�ch l�y.")	
end

function Uworld1061_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz5()
	AddOwnExp(30000)
	nt_setTask(1061,100)  
	Msg2Player("Qu�n ��i Kim Nam h�, T��ng D��ng l�m nguy, b�n ph�ng m�nh �i gi�t S� Th�nh Do�n.")	
end

function Uworld1061_xfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level50();
end

function Uworld1000_xfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end 
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n v�o th�nh ngh� ng�i!")	
end

function Uworld1000_xfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n �i t�m V� L�m Truy�n Nh�n.")
	seteducationnpcpos()	
end

function Uworld1000_xfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(189,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --����22end
	Msg2Player("B�n nh�n ���c 1 t�i th�, Th�c B�t Ho�i Xuy�n b�o b�n mau t�m ng��i c�n t�m.")	
end

function Uworld1000_xfz4()
  
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(189,10)
	Msg2Player("B�n nh�n ���c 1 t�i th�, Th�c B�t Ho�i Xuy�n b�o b�n mau t�m ng��i c�n t�m.")	
end

function Uworld1000_xfz5()
	Talk(1,"","H�y ��n T�n Th� th�n t�m Long Ng� ")
	Msg2Player("Th�c B�t Ho�i Xuy�n b�o b�n ��n T�n Th� th�n t�m Long Ng�, y s� giao nhi�m v� cho b�n.")	
end

function Uworld1000_no3()
	Talk(1,"","Giang h� ch�ng khi s�ng y�n gi� l�ng. Ng��i h�nh t�u giang h� ph�i c�n th�n. Sau s� quay l�i ��y, ta c� nhi�m v� giao cho ng��i.")
end

function allprize_xiepai()
	Uworld198 = nt_getTask(198) --����ȫ����
	local i=random(1,1200)
	if ( i >= 1 ) and ( i <= 99) then
		AddEventItem(490)
	elseif ( i >= 100 ) and ( i <= 199) then
		AddEventItem(491)
	elseif ( i >= 200 ) and ( i <= 299) then
		AddEventItem(492)
	elseif ( i >= 300 ) and ( i <= 399) then
		AddEventItem(493)
	elseif ( i >= 400 ) and ( i <= 499) then
		AddEventItem(494)
	elseif ( i >= 500 ) and ( i <= 599) then
		AddEventItem(495)
	elseif ( i >= 600 ) and ( i <= 699) then
		AddEventItem(496)
	elseif ( i >= 700 ) and ( i <= 799) then
		AddEventItem(497)
	elseif ( i >= 800 ) and ( i <= 899) then
		AddEventItem(498)
	elseif ( i >= 900 ) and ( i <= 999) then
		AddEventItem(499)
	elseif ( i >= 1000 ) and ( i <= 1099) then
		AddEventItem(500)
	elseif ( i >= 1100 ) and ( i <= 1200) then
		AddEventItem(501)
	end
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1 m�nh T�ng B�o ��.")
	if ( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(198,SetBit(GetTask(198),1,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Tr�c Li�n Quang")
	elseif ( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(198,SetBit(GetTask(198),2,1))
	Msg2Player("Ch�c m�ng b�n ��t ���c 1  Kim Phong C�ng C�n Tam Th�n.")
	elseif ( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(198,SetBit(GetTask(198),3,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Lan ��nh Ng�c")
	elseif ( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(198,SetBit(GetTask(198),4,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Kim Phong ��ng T��c Xu�n Th�m.")
	end	
	Msg2Player("B�n �� ho�n th�nh nhi�m v� c�a ��ng c�p n�y.")
end

function Uworld1000_finishxiepai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B�n �� ho�n th�nh nhi�m v� s� nh�p.")
end

function no()
end