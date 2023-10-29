-- ������ϵͳ����֧�߹���npc
-- BY��XIAOYANG��2004-11-30��

 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")

function task_aoyunzong()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001) --��������
	Uworld183 = nt_getTask(183)
	Uworld1050 = nt_getTask(1050) --����20-30֧��
	Uworld1051 = nt_getTask(1051) --����30-40֧��
	Uworld1052 = nt_getTask(1052) --����40-50֧��
	Uworld1053 = nt_getTask(1053) --����50-60֧��
	Uworld1011 = nt_getTask(1011) --����֧�ߵ�ɱ���������
	Uworld196 = nt_getTask(196) --����ȫ����
	local name = GetName()  
---------------------------------------------------------------��������------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 0 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_zfz1",name..": Ng� Gia b�o ta ��n, ��y l� th� c�a Ng� Gia!","Ng� gia? Xem qua th� th� ch�c l� kh�ng sai r�i. Mu�n d�m ���ng xa, b�y gi� �� l� m�a ��ng, mau v�o nh� u�ng b�nh r��u n�ng, �n ch�n d� n��ng, r�i t�nh ti�p.","Ng��i c� th� c� th� d�o ch�i trong th�nh, d�ng ph�m Tab m� b�n �� nh� �� d� xem! Sau �� h�y ��n t�m ta!")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 0 ) then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_zfz2",name..": Ta �� xem qua r�i..","V�y ���c, h�y �i t�m V� L�m Truy�n Nh�n.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 0 ) and ( Uworld1001 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_zfz3","V� r�i �! ��y l� t�i th� c�a ng��i! Xem xong ng��i t� bi�t ph�i l�m g�!",name..":......Thay ta c�m �n Ng� Gia."," Sau khi ho�n th�nh nhi�m v� Ch�nh tuy�n h�y quay l�i ��y t�m ta. Ta c� v�i nhi�m v� nh� cho ng��i, n�u ho�n th�nh s� c� ph�n th��ng h�n mong ��i. Coi nh� thay Ng� Ca gi�p �� ng��i.",name..": ���c! Ta nh� r�i.","Ng��i v�n c� th� l�m nhi�m v� phe kh�c, c� th� ��t ���c nhi�u �i�m kinh nghi�m, nh�ng h� v�n xem ng��i l� ng��i ngo�i, n�n s� kh�ng t�ng ng��i nh�ng v�t ph�m qu� b�u. Ng��i c� th� �i t�m Long Ng� trong c�c th�n tr�n h�i th�m.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 0 ) and ( Uworld1001 > 10 ) then
			Talk(1,"Uworld1000_finishzhengpai","Ng��i �� b�t ��u ti�p nh�n nhi�m v� c�c phe, ta kh�ng c�n g� d�y ng��i. H�y �i �i.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 0 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1001 < 10) then 
			Say("T�i sao quay l�i? Hay l� �� qu�n t�i th� � ch� ta.",2,"Tu�n l�nh!/Uworld1000_zfz4","Kh�ng ph�i! Ch� l� quay l�i th�m �ng m� th�i!/Uworld1000_no1")
		else
			Talk(1,"","T�m ta u�ng r��u? ���c th�i, ch� n�o kh�ng hi�u nh�n <color=red>F12<color> xem. N�u ng��i �ang l�m <color=red>nhi�m v� S� nh�p<color>,   kh�ng th� ti�p nh�n nhi�m v� kh�c.")
		end
	else
---------------------------------------------------------------����֧������-----------------------------------------------------------------------	
		if (( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1)) or (( Uworld1051 == 1000 ) and ( GetBit(GetTask(196),2) ~= 1)) or (( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1)) or  (( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1)) then
			Describe(DescLink_AoYunZong.."<#>:  Ta r�t h�i l�ng v�i bi�u hi�n c�a ng��i, t�ng ng��i m�n b�o v�t n�y!",1,"Nh�n l�nh b�o v�t/allprize_zhengpai")
		elseif ( Uworld1053 == 70 ) or ( Uworld1053 == 80 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1053,80)
				Describe(DescLink_AoYunZong.."<#>:  Sao? Nh�c Nguy�n So�i kh�ng ph�i do ng��i c�a L�m Uy�n Nhai h�i, v�y th� l� ai? Ch�ng l� ��ng sau c�n c� th� l�c l�n �ang thao t�ng?.<enter>",1,"K�t th�c ��i tho�i/Uworld1053_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1052 == 110 ) or ( Uworld1052 == 120 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,120)
				Describe(DescLink_AoYunZong.."<#>:  L�m t�t l�m! Ta bi�t ng��i s� kh�ng ph� l�ng hy v�ng c�a ta.",
				1,"K�t th�c ��i tho�i/Uworld1052_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end		
		elseif ( Uworld1052 == 80 ) or ( Uworld1052 == 90 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,90)
				Describe(DescLink_AoYunZong.."<#>:  Quay l�i t�m ta c� vi�c �? L�c n�y n�n �t li�n l�c th� h�n.<enter>"
				..name.."<#>:  V�n T�ng, �ng bi�t Du S��ng T�n �ang � ��u kh�ng?.<enter> H�n �ang � b�n ngo�i Th�nh ��, h�n kh�ng ph�i k� x�u, c� th� tha cho h�n con ���ng s�ng.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1052_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end			
		elseif (( Uworld1052 == 20 ) or ( Uworld1052 == 30 )) and ( Uworld1011 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,30)
				Describe(DescLink_AoYunZong.."<#>:  Th�y ch�a, nh�n ngo�i h�u nh�n, thi�n ngo�i h�u thi�n. V� �ang cao th� v� s�. V� h�c v�n kh�ng c� c�nh gi�i.<enter>"
				..name.."<#>:  Th� n�m x�a v� n�o �o�t ���c danh hi�u?<enter>L� 1 v� cao nh�n c�a Ng� ��c gi�o.<enter>"
				..name.."<#>:  Ng� ��c gi�o? <enter>��ng v�y, ��ng ti�c sau khi �o�t danh hi�u kh�ng l�u ng��i n�y �� bi�n m�t. Nghe n�i sau khi chi�n th�ng ng��i n�y qu� ��c � �� h�n quy�t chi�n v�i ��c C� Ki�m, �� l� 1 cu�c chi�n kinh thi�n ��ng ��a nh�ng k�t qu� th� kh�ng "
				..name.."<#>:  Tr�n t� th� nh� nh�ng b�n trong l�i l� b� m�t l�n.<enter>Nhi�m v� ti�p theo r�t kh�, c� th� ng��i c�ng s� b� m�ng gi�ng nh� bao cao th� tr��c ��y.<enter>"
				..name.."<#>:  N�i �i! Ta kh�ng s� ��u! <enter> Ta mu�n ng��i x�m nh�p v�o t� ch�c s�t th� L�m Uy�n Nhai. N�m x�a Nh�c Nguy�n So�i b� h�i c� li�n quan ��n b�n h�, ta �� thay ng��i �i�u tra ch�t �t. H�y ��n D��ng Ch�u t�m H�n H�n.<enter>"
				..name.."<#>:  Ta ��n �� l�m sao li�n l�c v�i y?<enter> Ng��i t� b�o danh l� ���c. ��ng li�n l�c v�i ta. Ta ch� tin ng��i.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1052_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end			
		elseif (( Uworld1051 == 170 ) or ( Uworld1051 == 180 )) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,180)
				Describe(name.."<#>:  Ta �� �em B�o th�ch v�.<enter>"
				..DescLink_AoYunZong.."<#>:     �� ta xem......��y qu� nhi�n l� Kho�ng th�ch thu�c t�nh, ���c l�m. L�n nay ta xem M� Dung B�t Ky kh�ng th� l�m ng� ���c. �ng ta ch� c�n 1 vi�n, vi�n c�n l�i ng��i gi�. Ng��i �em �o gi�p thu�c t�nh �n, b�o th�ch t� l� v� Kho�ng th�ch thu�c t�nh � ",
				1,"K�t th�c ��i tho�i/Uworld1051_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end		
		elseif ( Uworld1051 == 80 ) or ( Uworld1051 == 90 ) and ( Uworld1011 == 20 ) then --�������ж��������ѹ��ı���Uworld1011
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,90)
				Describe(DescLink_AoYunZong.."<#>:  Ti�u di�t s�i r�i? T�t! H�y �em x��ng s�i ��n T��ng D��ng t�m Cung A Ng�u, h�n l� th� s�n n�i ti�ng � Ph�c Ng�u S�n, l�y x��ng s�i b�o ch� d��c t�u s� tr� ���c b�nh c�a Ng� L�o th�i.<enter>",1,"K�t th�c ��i tho�i/Uworld1051_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1051 == 60 ) or ( Uworld1051 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1051,70)
				Describe(DescLink_AoYunZong.."<#>:  �a? Sao l�i quay l�i?.<enter>"
				..name.."<#>:  Ta �� �i t�m H� Lan Chi, c� ta b�o ta ��n g�p Ng� L�o th�i. Vi�n ng�c c� th� th�t l�c � ��. Nh�ng l�c ta qua Ng� L�o th�i m�c b�nh l� kh�ng n�i ���c.<enter>B�nh l�? C� chuy�n tr�ng h�p th� sao, v�a ��ng l�c ng��i qua h�i tung t�ch c�a vi�n �� l�i m� "
				..name.."<#>:  Ch�ng l� trong �� c�n c� b� m�t g�? <enter>Ng�o V�n T�ng:......Ta kh�ng gi�u ng��i n�a. M� Dung B�t Ky �� s�m ch� t�o m�t thanh Ch�y th�, nh�ng �ng ta c� gi�u chuy�n n�y, ta nghi ng� �� l� hung kh� th�ch s�t Nhac Phi.<enter>"
				..name.."<#>:  C�i g�!<enter> Cho n�n ch�ng ta n�n t�m B�o th�ch thu�c t�nh, sau �� c� th� b�t M� Dung B�t Ky n�i ra s� th�t. B�nh c�a Ng� L�o th�i ��n r�t l� tr�ng h�p, ph�a sau ch�c c� m�t b�n tay mu�n che ��y t�t c�.<enter>"
				..name.."<#>:  V�y ta ph�i l�m sao? <enter>Mau t�m thu�c gi�i, n�u kh�ng m�i chuy�n s� thay ��i. L�n Ph�c Ng�u S�n ��ng ��nh 50 con S�i xanh, l�y x��ng s�i v�, ta s� c� c�ch.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1051_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1050 == 130 ) or ( Uworld1050 == 140 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,140)
				Describe(name.."<#>:  B�n �� ��nh b�i t�n s�t th� ��, nh�ng khi h�n s�p qua ��i l�i n�i m�nh kh�ng ph�i l� k� ch� m�u s�t h�i Nh�c Nguy�n So�i.<enter>"
				..DescLink_AoYunZong.."<#>:  Xem ra v�n �� ph�c t�p h�n b�n t��ng r�t nhi�u.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1050_zfz4")	
			else
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end							
		elseif ( Uworld1050 == 60 ) or ( Uworld1050 == 70 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,70)
				Describe(name.."<#>:  �y!  L�c ta ��n Si T�ng �� c�ng �� t� Thi�n Long t� xu�ng n�i h�nh s�.<enter>"
				..DescLink_AoYunZong.."<#>:  Ta ph�i �i t�m �ng ta m�i ���c.<enter>"
				..name.."<#>:  L� ai?<enter> M�t ng��i �n c� th� ngo�i, ta v�n kh�ng mu�n l�m phi�n ng��i ��.<enter>"
				..name.."<#>:  L� ai?<enter> L� Ti�n ��u b�n c�a ta. Ng��i �i Hoa S�n ph�i t�m �ng ta �i, �ng ta �n c� � �� �� 10 n�m r�i, n�m x�a y t�ng nh�c ��n Thi�n Ho�ng Long Kh�.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1050_zfz3")	
			else
				Talk(1,"Uworld1000_zfz6","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( GetLevel() >= 20)  then
			Say("Ng��i c� mu�n g�p m�t ph�n s�c cho V� l�m? Ta c� nhi�u nhi�m v� giao cho ng��i.",3,"Ta mu�n l�m m�t v�i nhi�m v� Ch�nh tuy�n./Uworld1000_zfz5","Ta mu�n l�m m�t v�i nhi�m v� ph� tuy�n/Uworld1000_zfz6","Ta m�t m�i r�i! ��ng t�m ta n�a!/Uworld1000_no1")
		else
			Talk(1,"","T�m ta u�ng r��u �? ���c ��, ch� n�o kh�ng hi�u nh�n <color=red>F12<color> xem.")
		end
	end
end

function Uworld1000_zfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end
	Msg2Player("Ng�o V�n T�ng b�o b�n v�o th�nh ngh� ng�i, xong r�i ��n t�m �ng ta.")	
end

function Uworld1000_zfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end 
	Msg2Player("Ng�o V�n T�ng b�o b�n �i t�m V� L�m Truy�n Nh�n.")	
	seteducationnpcpos()
end

function Uworld1000_zfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(183,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --����22end
	Msg2Player("B�n nh�n ���c 1 t�i th�, Ng�o V�n T�ng b�o b�n mau �i t�m ng��i c�n t�m.")	
end

function Uworld1000_zfz4()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(183,10)
	Msg2Player("B�n nh�n ���c 1 t�i th�, Ng�o V�n T�ng b�o b�n mau �i t�m ng��i c�n t�m.")	
end

function Uworld1000_zfz5() --���ɷ�֧������ѡ��ű�
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","Ng��i h�y �i c�c T�n Th� Th�n t�m Long Ng�. Nh� gi� k� th� c�a h�n! N�u m�t th� ti�n d�n th� s� kh�ng ai tin ng��i ��u!")
		Msg2Player("Ng�o V�n T�ng b�o b�n v�o T�n Th� Th�n t�m Long Ng�, Y s� giao v�i nhi�m v� cho b�n.")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","Ng��i c�n ph�i l�m nhi�m v� S� nh�p, Sau �� Long Ng� s� giao nhi�m v� kh�c cho ng��i.")
	elseif ( Uworld1001 ~= 0 ) then
		Talk(1,"","N�y b�ng h�u, ch�ng ph�i ng��i �ang l�m nhi�m v� Ch�nh tuy�n Ch�nh ph�i �� sao? Kh�ng ph�i tr�u gh�o ta ch�! Ta l� ng��i th�t th�, ��ng g�t ta! Th�t l�......")
	else
		Talk(1,"","Nhi�m v� Ch�nh tuy�n l� sau khi b�n ��t ��n c�p nh�t ��nh m�i c� th� ti�p nh�n. Ch� c�n ��ng c�p nh�n v�t tr�n 20 l� c� th� ti�p nh�n. N�u ho�n th�nh......s� c� gi�i th��ng h�n mong ��i.")
	end
end

function Uworld1000_zfz6()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Describe(DescLink_AoYunZong.."<#>:  giang h� d�y s�ng, th� l�c B�ch ��o ng�y c�ng �t, kh�ng c�n ��o ngh�a giang h�, �� ��n l�c ta v� ng��i  ra s�c r�i.",6,
	"Ta mu�n t�m hi�u c�ch l�m nhi�m v� Ph� tuy�n/Uworld1000_zfz7" ,
	"Ta mu�n l�m nhi�m v� t� c�p 20 ��n 29/Uworld1050_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 30 ��n 39/Uworld1051_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 40 ��n 49/Uworld1052_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 50 ��n 59/Uworld1053_zfz1",
	"Hay l� sau n�y h�y l�m!/no")
end

function Uworld1000_zfz7()
	Describe(DescLink_AoYunZong.."<#>:  Nhi�m v� Ph� tuy�n tr�n c� b�n l� nhi�m v� Ch�nh tuy�n, khi ��t ��n ��ng c�p nh�t ��nh m�i c� th� ti�p nh�n. V� d� l�c ��ng c�p b�n l� 32, b�n ph�i ti�p nh�n nhi�m v� Ch�nh tuy�n c�p 30 tr��c, sau �� m�i c� th� ti�p nh�n nhi�m v� ph� tuy�n.Tr��c khi",1,"K�t th�c ��i tho�i/no")
end

function Uworld1050_zfz1()
	Uworld1050 = nt_getTask(1050) --����20-30��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1050 == 0 ) or ( Uworld1050 == 10 )) then
		nt_setTask(1050,10)
		Describe(DescLink_AoYunZong.."<#>:  G�n ��y giang h� xu�t hi�n tin t�c v� Thi�n Ho�ng Long Kh�, ch� bi�t �� l� b� B�o gi�p. Ng��i m�c b� gi�p n�y s� c� uy l�c t�i th��ng. C� ng��i b� ra m�t s� ti�n l�n �� ch�ng ta �i�u tra lai l�ch c�a Thi�n Ho�ng Long Kh�.<enter>"
		..name.."<#>:  ��t ti�n l�m kh�ng? <enter>L� m�t c�i gi� m� ng��i kh�ng th� ng�?<enter>"
		..name.."<#>:  Ch� �� t�m tung t�ch c�a b� �o gi�p? <enter> C� ng��i nghi ng� ��y l� tin gi�, ng��i h�y �i �i�u tra, ta c�ng? Mu�n bi�t b� gi�p n�y nh� th� n�o.<enter>"
		..name.."<#>:  �ng c� manh m�i n�o kh�ng? <enter> ��n Thi�n Long t� t�m Si T�ng. Tin n�y c� kh� n�ng ���c truy�n t� V�n Nam.<enter>"
		..name.."<#>:  Hi�u r�i.<enter>",1,"K�t th�c ��i tho�i/Uworld1050_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 20, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1001 < 20 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n Ch�nh ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>��i L�<color> t�m M�c S�u.")
	else
		Talk(1,"","L�m 1 s�t th�, tr��c khi h�nh ��ng c�n ph�i suy t�nh cho chu ��o! Kh�ng ph�i ai tr�n giang h� c�ng tr� th�nh s�t th� n�i ti�ng")
	end
end

function Uworld1051_zfz1()
	Uworld1051 = nt_getTask(1051) --����30-40��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1051 == 0 ) or ( Uworld1051 == 10 )) then
		nt_setTask(1051,10)
		Describe(DescLink_AoYunZong.."<#>:  M� Dung B�t Ky �ang � L�m An ��c 1 b� B�o gi�p cho Ho�ng th��ng, �ng ta c�n 1 vi�n kho�ng th�ch thu�c t�nh �n h� Kim, b�n �i t�m gi�p �ng ta.<enter>"
		..name.."<#>:  M�n �� �� � ��u? <enter> ��n Th�nh �� t�m H� Lan Chi, c� ta t�ng l� �� t� c�a M� Dung B�t Ky, c� ta c� gi� hai vi�n B�o th�ch n�y.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1051_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 30, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1001 < 70 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n Ch�nh ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>��i L�<color> t�m M�c S�u.")
	else
		Talk(1,"","L�m 1 s�t th�, tr��c khi h�nh ��ng c�n ph�i suy t�nh cho chu ��o! Kh�ng ph�i ai tr�n giang h� c�ng tr� th�nh s�t th� n�i ti�ng")
	end
end

function Uworld1052_zfz1()
	Uworld1052 = nt_getTask(1052) --����40-50��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 140 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1052 == 0 ) or ( Uworld1052 == 10 )) then
		nt_setTask(1052,10)
		Describe(DescLink_AoYunZong.."<#>:  Ta b�n ba giang h� �� l�u, c� l�i mu�n n�i v�i ng��i.<enter>"
		..name.."<#>:  L� th� n�o?<enter>Ng�o V�n T�ng: <color=red>D�ng ki�m d�ng nh�n, ��nh nhanh th�ng g�n.<color><enter>"
		..name.."<#>:  Ngh�a l� sao? <enter> L�c ��i ��ch quan s�t l� quan tr�ng nh�t. Ch� c� quan s�t m�i ph�t hi�n ���c �i�m y�u c�a ��i th�, t�m ra c�ch ��nh b�i. ��y g�i l� 'D�ng ki�m d�ng nh�n'. M�t khi ra tay t�c �� ph�i mau �� c� th� che ��y �i�m y�u c�a m�nh, kh�ng cho ��ch c� c� h�i ph�n c�ng. �� g�i l� '��nh nhanh th�ng g�n'."
		..name.."<#>:  Nh�ng �i�u �� r�t c� �ch v�i ng��i.<enter> Ch� nghe th�i th� kh�ng th� th�nh cao th� ���c, ng��i h�y ��n t� v� tr��ng ��nh m�t tr�n pk, �� c�m nh�n th�c t�.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1052_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 40, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1001 < 140 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n Ch�nh ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>��i L�<color> t�m M�c S�u.")
	else
		Talk(1,"","L�m 1 s�t th�, tr��c khi h�nh ��ng c�n ph�i suy t�nh cho chu ��o! Kh�ng ph�i ai tr�n giang h� c�ng tr� th�nh s�t th� n�i ti�ng")
	end
end

function Uworld1053_zfz1()
	Uworld1053 = nt_getTask(1053) --����50-60��֮���֧���������
	Uworld1001 = nt_getTask(1001) --���������������
	local name = GetName()  
	if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ( Uworld1053 == 0 )  then
		if ( Uworld1052 == 1000 ) then
			Describe(DescLink_AoYunZong.."<#>:  �i t�m H�n H�n �i, kh�ng c� g� ��ng ��n t�m ta, tai m�t c�a L�m Uy�n Nhai � kh�p n�i.",1,"K�t th�c ��i tho�i/no")
		else
			Describe(DescLink_AoYunZong.."<#>:  ��n t�m H�n H�n b�n ngo�i t� v� tr��ng t�i D��ng Ch�u, c� ta s� cho ng��i bi�t n�n l�m th� n�o.<enter>",1,"K�t th�c ��i tho�i/no")
		end
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 50, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1001 < 210 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n Ch�nh ph�i t��ng �ng v�i ��ng c�p, h�y ��n <color=red>��i L�<color> t�m M�c S�u.")
	else
		Talk(1,"","L�m 1 s�t th�, tr��c khi h�nh ��ng c�n ph�i suy t�nh cho chu ��o! Kh�ng ph�i ai tr�n giang h� c�ng tr� th�nh s�t th� n�i ti�ng")
	end
end

function Uworld1050_zfz2()
	AddOwnExp(5000)
	nt_setTask(1050,20)
	Msg2Player("Ng�o V�n T�ng b�o b�n ��n Thi�n Long t� � ��i L� t�m Si T�ng h�i th�m tin t�c.")
end

function Uworld1050_zfz3()
	AddOwnExp(5000)
	nt_setTask(1050,80)
	Msg2Player("Ng�o V�n T�ng b�o b�n �i Hoa S�n ph�i t�m Ti�n ��u h�i th�m tin t�c.")
end

function Uworld1050_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level20();
end

function Uworld1051_zfz2()
	AddOwnExp(15000)
	nt_setTask(1051,20)
	Msg2Player("M� Dung B�t Ky c�n 1 vi�n B�o th�ch thu�c t�nh �n, Ng�o V�n T�ng b�o b�n �i Th�nh �� t�m H� Lan Chi.")
end

function Uworld1051_zfz3()
	Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���
	AddOwnExp(15000)
	nt_setTask(1051,80)
	nt_setTask(1011,10) --10Ϊ������������������ʵ���ж�ɱ�����������
	AddPlayerEvent(1)
	Msg2Player("Ng�o V�n T�ng cho b�n bi�t m�t b� m�t, �ng nghi ng� Ng� L�o th�i b� k� th� h� ��c. �ng ta b�o b�n l�n Ph�c Ng�u S�n ��nh 50 con S�i xanh l�y x��ng v� b�o ch� thu�c.")
end

function Uworld1051_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1051_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()	
	ex_add_zp_level30();
end

function Uworld1052_zfz2()
	Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���������Ϊ10���������������жϣ����䳡pk���ж�
	AddOwnExp(30000)
	nt_setTask(1011,10)
	nt_setTask(1052,20)
	Msg2Player("Ng�o V�n T�ng b�o b�n ��n t� v� tr��ng ��nh 1 tr�n, b�n c�m th�y th�t s� nguy hi�m.")
end

function Uworld1052_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1052_zfz4()
	AddOwnExp(30000)
	nt_setTask(1052,100)
	Msg2Player("Ng�o V�n T�ng cho b�n bi�t Du S��ng T�n c� th� �ang � Th�nh ��.")
end

function Uworld1052_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level40();
end

function Uworld1053_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level50();
end

function allprize_zhengpai()
	Uworld196 = nt_getTask(196) --����ȫ����
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
	if ( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(196,SetBit(GetTask(196),1,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Tr�c Li�n Quang")
	elseif ( Uworld1051 == 1000 )  and ( GetBit(GetTask(196),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(196,SetBit(GetTask(196),2,1))
	Msg2Player("Ch�c m�ng b�n ��t ���c 1  Kim Phong C�ng C�n Tam Th�n.")
	elseif ( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(196,SetBit(GetTask(196),3,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Lan ��nh Ng�c")
	elseif ( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(196,SetBit(GetTask(196),4,1))
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Kim Phong ��ng T��c Xu�n Th�m.")
	end	
	Msg2Player("B�n �� ho�n th�nh nhi�m v� c�a ��ng c�p n�y.")
end

function Uworld1000_finishzhengpai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B�n �� ho�n th�nh nhi�m v� s� nh�p.")
end

function no()

end

function Uworld1000_no1()
	Talk(1,"","Ng�o V�n T�ng: Giang h� kh�ng ng�ng d�y s�ng, ng��i ph�i c�n th�n. Sau n�y c� r�nh quay l�i ��y, ta c� v�i nhi�m v� giao cho ng��i.")
end