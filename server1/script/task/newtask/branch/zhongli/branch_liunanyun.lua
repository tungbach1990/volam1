-- ������ϵͳ����֧�߹���npc
-- BY��XIAOYANG��2004-11-30��

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_liunanyun()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002) --��������
	Uworld186 = nt_getTask(186)
	Uworld1054 = nt_getTask(1054) --����20-30֧��
	Uworld1055 = nt_getTask(1055) --����30-40֧��
	Uworld1056 = nt_getTask(1056) --����40-50֧��
	Uworld1057 = nt_getTask(1057) --����50-60֧��
	Uworld1012 = nt_getTask(1012) --����֧�ߵ�ɱ���������
	Uworld197 = nt_getTask(197) --����ȫ����
	local name = GetName()
----------------------------------------------------��������-----------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 1 ) then 
			nt_setTask(1000,310) --����16start
			Talk(3,"Uworld1000_zhfz1",name..": Ng� Gia b�o ta ��n, ��y l� th� c�a Ng� Gia!","��ng l� th� c�a Ng� Ca. B�n c�a Ng� Ca t�c l� b�n c�a ta, sau n�y c� l�m �n ta s� chi�u c� ng��i, ha ha.","Ng��i c� th� v�o th�nh ch�i, d�ng ph�m Tab m� b�n �� xem b� c�c trong th�nh, xong r�i ��n t�m ta.")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 1 )  then
			nt_setTask(1000,330) --����17start
			Talk(2,"Uworld1000_zhfz2",name..": Ta �� xem qua r�i..","B�y gi� h�y �i t�m V� L�m Truy�n Nh�n �i.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 1 ) and ( Uworld1002 < 10 ) then
			nt_setTask(1000,430) --����22start
			Talk(5,"Uworld1000_zhfz3","M�i vi�c �� xong.��y l� t�i Ng� Ca ��a cho ng��i, �ng c�n d�n kh�ng c�n v� g�p �ng, t� m�nh phi�u b�t giang h� �i, th� trong t�i c�n xem s�m!",name..":......Thay ta c�m �n Ng� Gia.","Sau n�y m�i khi ho�n th�nh m�t nhi�m v� Ch�nh tuy�n quay v� ��y g�p ta. Ta c� v�i nhi�m v� nh� giao cho ng��i, n�u ho�n th�nh s� c� gi�i th��ng ngo�i mong ��i. Coi nh� thay Ng� Ca gi�p �� ng��i.",name..": ���c! Ta nh� r�i.","Nhi�m v� phe kh�c ng��i c�ng c� th� l�m, c� th� ���c kh�ng �t �i�m kinh nghi�m, ch� l� h� c� th�nh ki�n v�i ng��i, n�n c� v�i m�n b�o v�t kh�ng th� ��a ng��i ���c. Ng��i c� th� v�o th�n tr�n t�m Long Ng� h�i th�.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 1 ) and ( Uworld1002 > 10 ) then
			Talk(1,"Uworld1000_finishzhongli","Ng��i �� ti�p nh�n nhi�m v� c�c phe, nh�ng g� c�n d�y ta �� d�y xong, ng��i �i �i.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 1 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1002 < 10 ) then 
			Say("T�i sao quay l�i? Hay l� �� qu�n t�i th� � ch� ta.",2,"Tu�n l�nh!/Uworld1000_zhfz4","Kh�ng ph�i! Ch� l� quay l�i th�m �ng m� th�i!/Uworld1000_no2")
		else
			Talk(1,"","Tr�n ���ng h�nh t�u giang h� c� g� kh�ng hi�u nh�n <color=red>F12<color> xem c�m nang. N�u ng��i �ang ti�p nh�n <color=red>nhi�m v� s� nh�p<color>, kh�ng th� ti�p nh�n nhi�m v� kh�c..")
		end
-----------------------------------------------------------------����֧��-----------------------------------------------------------------------------
	else
		if (( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1)) or (( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1)) or (( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1)) or  (( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1)) then
			Describe(DescLink_LiuNanYun.."<#>:  Ta r�t h�i l�ng v�i bi�u hi�n c�a ng��i, t�ng ng��i m�n b�o v�t n�y!",1,"Nh�n l�nh b�o v�t/allprize_zhongli")
		elseif ( Uworld1057 == 90 ) or ( Uworld1057 == 100 ) then
			nt_setTask(1057,100)
			Describe(DescLink_LiuNanYun.."<#>:  C�m �n �ng..........ta s� kh�ng qu�n �ng.",1,"K�t th�c ��i tho�i/Uworld1057_zfz5")
		elseif ( Uworld1057 == 60 ) or ( Uworld1057 == 70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,70)
				Describe(DescLink_LiuNanYun.."<#>:  Ng��i �� c� g�ng l�m vi�c ta giao, ta r�t c�m k�ch.<enter>"
				..name.."<#>:  Li�u ��i gia! G�n ��y �ng h�i kh�c th��ng <enter> Kh�c th��ng? Ha ha! C� th� l�m. C� l� v� ta ng�y trang �� l�u.<enter>"
				..name.."<#>:  Li�u ��i gia! �ng c� t�m s� �? <enter>Kh�ng c� g�, ta n�i cho ng��i m�t b� m�t ch�a ai ���c bi�t.<enter>"
				..name.."<#>:  Hay l� ��ng n�i, ta kh�ng mu�n bi�t t�m s� c�a �ng, bi�t r�i ph�i g�nh v�c nhi�u vi�c.<enter>��ng ti�c! Tr�n ��i n�y ch� c� ng��i m�i gi�p ���c ta.<enter>"
				..name.."<#>:...... N�u �� nh� th�, �ng n�i �i.<enter> Ta l� m�t k� ��ng th��ng.<enter>"
				..name.."<#>:  C�i g�? <enter> Ta c�ng l� m�t nh�n s� v� l�m b�nh th��ng, d�a v�o b�n th�n m� s�ng. Nh�ng tu�i tr� b�ng b�t, c� m�t l�n t�i t�u l�u ta l� tay n�n gi�t m�t tay c�ng t� gi� tr� tr�u hoa gh�o nguy�t. N�o ng� k� n�y l� con trai duy nh�t c�a t�n c��p kh"
				..name.."<#>:  T�n n�y ��ng ch�t!<enter> Long Truy V� tinh th�ng d� dung thu�t v� ngh� l�i cao c��ng, tung ho�nh Trung Nguy�n hai m��i m�y n�m ch�a ai ��nh l�i h�n.<enter>"
				..name.."<#>:  �ng y�n t�m, ta s� thay �ng b�o th� n�y.<enter> C�ng ch� c� ng��i m�i ��m ���ng ���c,   y th��ng gi� trang th�nh ph� n� v�o ��i L�, tin t�c ta bi�t ch� c� b�y nhi�u.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1057_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1057 == 40 ) or ( Uworld1057 == 50 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,50)
				Describe(DescLink_LiuNanYun.."<#>:  Ti�p theo chu�n b� tr� l�i v�n �� T�ng Kim.",1,"K�t th�c ��i tho�i/branch_songjinproblem")				
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1057 == 20 ) or ( Uworld1057 == 30 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,30)
				Describe(DescLink_LiuNanYun.."<#>:  L�m t�t l�m.",1,"K�t th�c ��i tho�i/Uworld1057_zfz4")				
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1056 == 70 ) or ( Uworld1056 == 80 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,80)
				Describe(DescLink_LiuNanYun.."<#>:  L�m t�t l�m! T� ch�c s� tr�ng th��ng cho ng��i.",
				1,"K�t th�c ��i tho�i/Uworld1056_zfz5")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1056 == 40 ) or ( Uworld1056 == 50 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ����ν�pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,50)
				Describe(DescLink_LiuNanYun.."<#>:  � D��ng Ch�u c�  Du S��ng T�n th�ng tr�m tr�n t�i t� v� tr��ng, khi�n cho kh�ng ai d�m ��n th�ch ��u. Cho n�n �ng ta b� m�t s� ti�n l�n b�o ch�ng ta ti�u di�t h� Du kia. C� th� h�n kh�ng ph�i l� ng��i x�u nh�ng bi�t l�m sao ���c l�i �ch tr��c m�t m�. Ng��i n�i c� ��ng kh�ng?<enter>"
				..name.."<#>:  ��ng v�y.<enter>"
				..name.."<#>:  Ta kh�ng m�n gi�t h�n.<enter> Tr� phi ng��i r�t kh�i giang h�, n�u kh�ng gi�t h�n, danh ti�ng c�a ch�ng ta coi nh� tan bi�n, kh�ng ai thu� ch�ng ta n�a. Giang h� r�t l� kh�c nghi�t, ng��i kh�ng c� quy�n l�a ch�n.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1056_zfz4")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( Uworld1056 == 27 ) or ( Uworld1056 == 30 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,30)
				Describe(DescLink_LiuNanYun.."<#>:  G�n ��y ��t nhi�n ti�p nh�n nhi�m v� v� c�ng nguy hi�m, c� li�n quan ��n D��ng Ch�u t� v� tr��ng. Ng��i ��n �� thi ��u l�n n�a, ph�i th�ng m�t tr�n m�i quay v� g�p ta.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1056_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif (( Uworld1056 == 20 ) or ( Uworld1056 == 25 )) and ( Uworld1012 == 20 ) then --�������ж��Ƿ���pk��һ���ı���Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,25)
				Describe(DescLink_LiuNanYun.."<#>:  Th� n�o �� bi�t thi�n ngo�i h�u thi�n, nh�n ngo�i h�u nh�n?.<enter>",1,"K�t th�c ��i tho�i/Uworld1056_zfz6")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end																			
		elseif ( Uworld1055 == 130 ) or ( Uworld1055 == 140 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1055,140)
				Describe(name.."<#>:  Nam V�n, chuy�n ti�u xa c�a T�y B�c ti�u c�c ta �� gi�i quy�t xong.<enter>"
				..DescLink_LiuNanYun.."<#>:  L� do ai l�m?<enter>"
				..name.."<#>:  M�t ��m n� t�c t� x�ng l� H� Hoa ��o.<enter> L� b�n h�? Ta t�ng nghe qua. Trong l� v�t ��n �n c�a C� ch� c� m�t vi�n kho�ng th�ch thu�c t�nh. Ng��i �em B�o th�ch t� l�, trang b� thu�c t�nh �n t�m Th� r�n th�n b� �� h�p th�nh m�t trang b�.<enter>",
				1,"K�t th�c ��i tho�i/Uworld1055_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi l�m nhi�m v� g�p v�n �� g�, c� th� �n ph�m <color=red>F12<color> �� xem nh�t tr�nh. Trong �� ch� ghi l�i c�c b��c m� b�n �� th�c hi�n qua!")
			end
		elseif ( GetLevel() >= 20)  then
			Say(" Ai c�ng kh�ng quan tr�ng, ch� c�n c� b�n l�nh l� ���c!",3,"Ta mu�n l�m m�t v�i nhi�m v� Ch�nh tuy�n./Uworld1000_zhfz6","Ta mu�n l�m m�t v�i nhi�m v� ph� tuy�n/Uworld1000_zhfz7","Ph�ng h� �� �ao, l�p ��a th�nh Ph�t. Ta kh�ng mu�n gi�t ng��i!/Uworld1000_no2")
		else
			Talk(1,"","Sau n�y tr�n ���ng h�nh t�u giang h� c� g� kh�ng hi�u nh�n <color=red>F12<color> xem c�m nang ")
		end
	end
end

function Uworld1000_zhfz6()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002)
	local name = GetName()
	if ( Uworld1002 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","Ng��i h�y �i c�c T�n Th� Th�n t�m Long Ng�. Nh� gi� k� th� c�a h�n! N�u m�t th� ti�n d�n th� s� kh�ng ai tin ng��i ��u!")
		Msg2Player("Li�u Nam V�n b�o b�n �i v�o T�n Th� th�n t�m Long Ng�, s� c� nhi�m v� m�i!")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","Li�u Nam V�n: Ng��i c�n nhi�m v� S� nh�p, sau khi ho�n th�nh Long Ng� s� giao cho ng��i nhi�m v� kh�c.")
	elseif ( Uworld1002 ~= 0 ) then
		Talk(1,"","Ng��i �� b��c v�o con ���ng s�t th�, kh�ng th� quay ��u. Kh�ng ph�i ng��i �� ti�p nh�n nhi�m v� sao?.")
	else
		Talk(1,"","Nhi�m v� Ch�nh tuy�n l� sau khi b�n ��t ��n c�p nh�t ��nh m�i c� th� ti�p nh�n. Ch� c�n ��ng c�p nh�n v�t tr�n 20 l� c� th� ti�p nh�n. N�u ho�n th�nh......s� c� gi�i th��ng h�n mong ��i.")
	end
end

function Uworld1000_zhfz7()
	Uworld1054 = nt_getTask(1054) --����20-30֧��
	Uworld1055 = nt_getTask(1055) --����30-40֧��
	Uworld1056 = nt_getTask(1056) --����40-50֧��
	Uworld1057 = nt_getTask(1057) --����50-60֧��
	local name = GetName()
	Describe(DescLink_LiuNanYun.."<#>:  Th� gi�i n�y ch� d�nh cho nh�ng k� m�nh. B�n ch� c� m�t c�ch duy nh�t �� t�n t�i �� l�: chi�n ��u!",6,
	"Ta mu�n t�m hi�u c�ch l�m nhi�m v� Ph� tuy�n/Uworld1000_zhfz8" ,
	"Ta mu�n l�m nhi�m v� t� c�p 20 ��n 29/Uworld1054_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 30 ��n 39/Uworld1055_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 40 ��n 49/Uworld1056_zfz1",
	"Ta mu�n l�m nhi�m v� c�p 50 ��n 59/Uworld1057_zfz1",
	"Hay l� sau n�y h�y l�m!/no")
end

function Uworld1000_zhfz8()
	Describe(DescLink_LiuNanYun.."<#>:  Nhi�m v� Ph� tuy�n tr�n c� b�n l� nhi�m v� Ch�nh tuy�n, khi ��t ��n ��ng c�p nh�t ��nh m�i c� th� ti�p nh�n. V� d� l�c ��ng c�p b�n l� 32, b�n ph�i ti�p nh�n nhi�m v� Ch�nh tuy�n c�p 30 tr��c, sau �� m�i c� th� ti�p nh�n nhi�m v� ph� tuy�n.Tr��c khi",1,"K�t th�c ��i tho�i/no")
end

function Uworld1054_zfz1()
	Uworld1054 = nt_getTask(1054) --����20-30��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1054 == 0 ) or ( Uworld1054 == 10 )) then
		nt_setTask(1054,10)
		Describe(DescLink_LiuNanYun.."<#>:  Hi�n nay giang h�, cao th� s� d�ng ki�m c� th� t�nh ��n V� �ang v� Nga Mi.<enter>"
		..name.."<#>:  H�nh nh� l� kh�ng c� nh�n t�i.<enter>Ng��i sai r�i, ch�nh l� kh�ng c� binh kh� v�a tay. Thanh ki�m t�t l� t�nh m�ng c�a ng��i s� d�ng ki�m.<enter>"
		..name.."<#>:  D�ng m�nh hi�p y�u kh�ng ph�i l� Ch�nh ��o.<enter>Li�u Nam V�n: Ha ha, ng��i n�i th� nh�ng ch�a ch�c b�ng ng��i ngh� th�!<enter>"
		..name.."<#>:  Ng��i n�i c�ng c� l�. <enter>Mu�n l�m s�t th�, l�i kh� r�t c�n thi�t. Nghe n�i Ng� d�n D��ng Ch�u trong 1 ��m m�a gi� b�o b�ng ph�t hi�n d��i ��y bi�n xu�t hi�n c�nh t��ng k� d�, c�n ph�i �i�u tra.<enter>"
		..name.."<#>:  ���c.<enter> Ta c� ng��i b�n t�n Giang Nh�t Ti�u, ng��i ��n t�m h�n gi�p ��, y s� kh�ng ch�i t�.<enter>"
		..name.."<#>:  Nh� v�y qu� t�t, Giang Nh�t Ti�u b�nh th��ng th�ch c�i g�? T�t nh�t chu�n b� qu� ra m�t.<enter>Kh�ng c�n ��u,   y nh�m ch�c � T�n L�ng, n�i �� �ang b� n�n gi�c Nh�m ph� ph�ch, tr��c ti�n h�y ��n T�n L�ng ��nh 50 con Nh�m.<enter>"
		..name.."<#>:  Ch� l� chuy�n nh�!<enter>",
		1,"K�t th�c ��i tho�i/Uworld1054_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 20, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1002 < 20 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n phe Trung t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Bi�n Kinh<color>t�m Ph� Nam B�ng.")
	else
		Talk(1,"","��i ng��i c� r�t �i�u k� di�u m� ta n�m m� c�ng ngh� kh�ng ra!")
	end
end

function Uworld1054_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,10)
	nt_setTask(1054,20)
	AddPlayerEvent(2) 
	Msg2Player("Li�u Nam V�n b�o b�n ��n D��ng Ch�u t�m Giang Nh�t Ti�u h�i th�m tin t�c Th�n binh xu�t th�, ��n T�n L�ng ��nh 50 con nh�m.")
end

function Uworld1055_zfz1()
	Uworld1055 = nt_getTask(1055) --����30-40��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1055 == 0 ) or ( Uworld1055 == 10 )) then
		nt_setTask(1055,10)
		Describe(DescLink_LiuNanYun.."<#>:  C� v� l�m �n l�n r�i.<enter>"
		..name.."<#>:  L�m �n?<enter> Ti�u xa c�a T�y B�c ti�u c�c li�n ti�p b� c��p, Ti�u s� h� t�ng kh�ng ai tho�t kh�i, c� 36 ti�u c�c b� m�t s� ti�n l�n �� b�n ta �i�u tra hung ph�m.<enter>"
		..name.."<#>:  Ng��i T�y B�c v�n r�t hi�u chi�n! <enter>Ng��i c� th� ��n Ph��ng T��ng t�m ch� nh�n c�a Song �ng ti�u c�c, �ng ta s� cho ng��i bi�t r� t�nh h�nh.<enter>",
		1,"K�t th�c ��i tho�i/Uworld1055_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 30, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1002 < 70 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n phe Trung t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Bi�n Kinh<color>t�m Ph� Nam B�ng.")
	else
		Talk(1,"","��i ng��i c� r�t �i�u k� di�u m� ta n�m m� c�ng ngh� kh�ng ra!")
	end
end

function Uworld1055_zfz2()
	AddOwnExp(15000)
	nt_setTask(1055,20)
	Msg2Player("G�n ��y T�y B�c x�y ra �n l�n, Li�u Nam V�n b�o b�n ��n Ph��ng T��ng t�m Ch� nh�n Song �ng ti�u c�c h�i r�.")
end

function Uworld1055_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level30();
end

function Uworld1056_zfz1()
	Uworld1056 = nt_getTask(1056) --����40-50��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 120 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1056 == 0 ) or ( Uworld1056 == 10 )) then
		nt_setTask(1056,10)
		Describe(DescLink_LiuNanYun.."<#>:  Ng��i c�m th�y l�m cao th� d� kh�ng?.<enter>"
		..name.."<#>:  Ta kh�ng bi�t, ch� c�m th�y d� ch�u.<enter> D� ch�u? �� l� v� ng��i ch�a g�p ph�i cao th� tuy�t th�! H�y �i D��ng Ch�u ��u th� m�t tr�n �i! <enter>",
		1,"K�t th�c ��i tho�i/Uworld1056_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 40, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1002 < 120 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n phe Trung t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Bi�n Kinh<color>t�m Ph� Nam B�ng.")
	else
		Talk(1,"","��i ng��i c� r�t �i�u k� di�u m� ta n�m m� c�ng ngh� kh�ng ra!")
	end
end

function Uworld1056_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,20) 
	Msg2Player("Li�u Nam V�n b�o b�n ��n t� v� tr��ng ��nh 1 tr�n, �� ch�ng t� b�n l�nh")	
end

function Uworld1056_zfz3()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,40)
end

function Uworld1056_zfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level40();
end

function Uworld1057_zfz1()
	Uworld1057 = nt_getTask(1057) --����50-60��֮���֧���������
	Uworld1002 = nt_getTask(1002) --���������������
	local name = GetName()
	if ( Uworld1002 >= 190 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ((  Uworld1057 == 0 ) or ( Uworld1057 == 10 ))  then
			nt_setTask(1057,10)
			Describe(DescLink_LiuNanYun.."<#>:...Ng�y ta v� ng��i b�n nhau s�p h�t.<enter>"
			..name.."<#>:  T�i sao t� nhi�n l�i n�i nh�ng l�i n�y?<enter> L�m s�t th� kh�ng th� l�m c� ��i. Tr�n tay nhu�m nhi�u m�u c�ng kh�ng ph�i l� chuy�n t�t.<enter>"
			..name.."<#>:  �ng mu�n ta r�a tay g�c ki�m?<enter> ��ng v�y! Ta �� chu�n b� m�t s� ti�n �� �� ng��i s�ng nh�ng ng�y c�n l�i.<enter>"
			..name.."<#>:......C�ng t�t.<enter>  Tr��c khi �i, Ta mu�n ng��i gi�p ta l�n cu�i.<enter>"
			..name.."<#>:  Li�u ��i ca xin c� n�i. <enter>Ng��i h�y ��n Chi�n tr��ng T�ng Kim, l�y 200 �i�m t�ch l�y. ��ng h�i ta nguy�n nh�n.<enter>",
			1,"K�t th�c ��i tho�i/Uworld1057_zfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a ng��i ch�a ��t y�u c�u c�a nhi�m v�, ��i ��n c�p 50, sau khi ti�p nh�n nhi�m v� Ch�nh tuy�n t��ng �ng m�i ��n t�m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� y�u c�u c�a nhi�m v�, kh�ng th� ti�p nh�n nhi�m v�.")
	elseif ( Uworld1002 < 190 ) then
		Talk(1,"","Xin l�i! B�n ch�a l�m nhi�m v� Ch�nh tuy�n phe Trung t��ng �ng v�i ��ng c�p, h�y ��n <color=red>Bi�n Kinh<color>t�m Ph� Nam B�ng.")
	else
		Talk(1,"","��i ng��i c� r�t �i�u k� di�u m� ta n�m m� c�ng ngh� kh�ng ra!")
	end
end

function Uworld1057_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(60000)
	nt_setTask(1012,10)
	nt_setTask(1057,20) 
	Msg2Player("Li�u Nam V�n b�o b�n tham gia ��i chi�n T�ng Kim, l�y 200 �i�m th��ng v�, xem ra c� nhi�m v� quan tr�ng �ang ch� b�n.")	
end

function Uworld1057_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level50();
end

function Uworld1000_zhfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --����16end 
	Msg2Player("Li�u Nam V�n b�o b�n v�o th�nh ngh� ng�i r�i h�y ��n t�m h�n.")	
end

function Uworld1000_zhfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --����17end 
	Msg2Player("Li�u Nam V�n b�o b�n �i t�m V� L�m Truy�n Nh�n.")	
	seteducationnpcpos()
end

function Uworld1000_zhfz3()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	AddOwnExp(20000)
	nt_setTask(186,10)
	nt_setTask(1000,440) --����22end
	Msg2Player("B�n ���c1 t�i th�, Li�u Nam V�n b�o b�n mau m� t�i th�, l�y th� trong �� t�m ng��i c�n t�m.")	
end

function Uworld1000_zhfz4()
	AddItem(6,1,131,1,0,0,0)  --��������İ���
	nt_setTask(186,10)
	Msg2Player("B�n ���c1 t�i th�, Li�u Nam V�n b�o b�n mau m� t�i th�, l�y th� trong �� t�m ng��i c�n t�m.")	
end

function Uworld1000_zhfz5()
	Talk(1,"","Ng��i h�y �i c�c T�n Th� Th�n t�m Long Ng�. Nh� gi� k� th� c�a h�n! N�u m�t th� ti�n d�n th� s� kh�ng ai tin ng��i ��u!")
	Msg2Player("Li�u Nam V�n b�o b�n �i v�o T�n Th� th�n t�m Long Ng�, s� c� nhi�m v� m�i!")		
end

function Uworld1000_no2()
	Talk(1,"","Tr�n giang h� ch�ng l�c s�ng y�n gi� l�ng, ng��i ph�i b�o tr�ng. Sau s� quay l�i ��y ta c� v�i nhi�m giao cho ng��i.")
end

function allprize_zhongli()
	Uworld197 = nt_getTask(197) --����ȫ����
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
	if ( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(197,SetBit(GetTask(197),1,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Tr�c Li�n Quang")
	elseif ( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(197,SetBit(GetTask(197),2,1))
	Msg2Player("Ch�c m�ng b�n ��t ���c 1  Kim Phong C�ng C�n Tam Th�n.")
	elseif ( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(197,SetBit(GetTask(197),3,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1  Kim Phong Lan ��nh Ng�c")
	elseif ( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(197,SetBit(GetTask(197),4,1))
	Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Kim Phong ��ng T��c Xu�n Th�m.")
	end	
	Msg2Player("B�n �� ho�n th�nh nhi�m v� c�a ��ng c�p n�y.")
end

function Uworld1000_finishzhongli()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B�n �� ho�n th�nh nhi�m v� s� nh�p.")
end

function no()
end