-- ������ϵͳ��ѧ������ҪNPC  ��\��Ϸ������Դ\script\global\dragonfive.lua��
-- ��һ�����е����ִ���ʦ��		 (\��Ϸ������Դ\script\global\���ɽ�������\�Ṧ_��ʦģ��.lua)
-- BY��XIAOYANG��2004-11-29��

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
Include("\\script\\task\\partner\\master\\partner_mastertask.lua")
---------------------------------����Ի�-------------------------------------

function Uworld1000_word()
	Say("Lo�n th� phong v�n, binh kh�i t� ph��ng, ta c� v�i nhi�m v� ph�i nh� ng��i gi�p",5,
		"Ta ��n nh�n nhi�m v� S� nh�p/iwantdotask",
		"Ta mu�n b� nhi�m v� s� nh�p/iwantkilltask",
		"Ta ��n l�m nhi�m v� Ch�nh tuy�n c�p 20 tr� l�n/iwantgetmastertask",
		"Ta ��n xem gi�i thi�u v� nhi�m v� /iwantseetask",
		"Sau n�y h�y n�i/no")
end

function iwantdotask()
	do return end
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1000 == 0 ) and ( GetLevel() <= 1 ) then --�ȼ�С��1���ҵ�һ�ε�½��Ϸ�����ﻹ���޸ġ�
		Say("Ch�o m�ng b�n ��n v�i th� gi�i V� L�m Truy�n K�. B�n c� mu�n t�m hi�u ki�n th�c s� l��c kh�ng? Nh�ng ki�n th�c n�y c� th� gi�p b�n �� sinh t�n trong th� gi�i n�y.",2,"T�t qu�! Ta mu�n c�n kh�ng ���c./Uworld1000_goon","Th�i kh�i! �ng th� bi�t c�i g� /Uworld1000_no")
	elseif ( GetLevel() > 1 ) and ( Uworld1000 == 0 ) then --�ȼ�����1��û��������ѧ��������
		Say("Hoan ngh�nh ng��i ��n th�n,  c� mu�n h�c v�i �i�u �� t�n t�i trong giang h� kh�ng?",2,"H�c ch�!/Uworld1000_goon","Th�i sau n�y h�y n�i./Uworld1000_no")
	elseif ( Uworld1000 == 40 ) or ( Uworld1000 == 50 ) then 
		nt_setTask(1000,50) --����3start
		Talk (9,"Uworld1000_good2",name.."<#>: Long th� l�nh, Ta �� t�m V� s� h�c v� xong.","Nhanh th� �?",name.."<#>: Ta �� th�ng c�p r�i.","Th� t�t, nh�n F3 m� giao di�n thu�c t�nh, th�y thanh s�ng s�c m�nh, th�n ph�p, n�i c�ng, ngo�i c�ng.",name.."<#>: Th�y r�i.","S�c m�nh �nh h��ng ��n s� d�ng v� kh� v� kh� n�ng c�ng k�ch ngo�i c�ng. M�i l�n t�ng 5 �i�m s�c m�nh t�n c�ng c� b�n t�ng 1 �i�m?th�n ph�p �nh h��ng ��n vi�c t�n c�ng c� b�n ngo�i c�ng.m�i l�n t�ng 5 �i�m th�n ph�p t�n c�ng c� b�n t�ng 1 �i�m. ��ng th�i th�n ph�p c�ng �nh h��ng ��n kh� n�ng n� tr�nh c�a nh�n v�t. m�i l�n t�ng 1 �i�m th�n ph�p, Kim M�c Th�y H�a Th� Th� ph�n bi�t t�ng 4 �i�m sinh l�c.",name.."<#>: Sao ph�c t�p th�?","Ta �� s�m b�o ng��i nh� nh�n F12 xem th� ta g�i cho ng��i, c� g� kh�ng hi�u nh�n F1 xem C�m nang.",name.."<#>: �, th� th� ti�n l�i h�n.")
	elseif (( Uworld1000 == 60 ) or ( Uworld1000 == 70 )) and ( GetLevel() >= 3 ) then
		nt_setTask(1000,70) --����4start
		Talk (5,"Uworld1000_high4",name.."<#>: Long th� l�nh, ta t� th�y m�nh c� ti�n b�.","Ti�n b�? Ng��i ra ngo�i ch� l� l�m m�i cho ng��i ta th�i.",name.."<#>:......","Chi�n tranh tri�n mi�n, hi�m nguy kh� l��ng! N�u g�p kh� kh�n h�y t�m c�c th��ng nh�n nh� ch� d��c �i�m, th� r�n, ch� t�p h�a �� h�c �t kinh nghi�m.",name.."<#>:......")	
	elseif ( Uworld1000 == 140 ) or (Uworld1000 == 150 ) then
		nt_setTask(1000,150) --����8start
		Talk (5,"Uworld1000_high8","Th� n�o, h�c ���c kh�ng �t ph�i kh�ng.",name.."<#>: C�ng t�m.","B�y gi� h�y �i u�ng n��c, l�n <color=red>c�p 5<color> ��n t�m ta, th� c�n h�c c�n nhi�u l�m, m�i ng��i ��u th� c�.",name.."<#>:  Hi�u r�i.","���c r�i, b�y gi� n�u kh�ng m�t, c� th� �i t�m V� s� h�c khinh c�ng, kh�ng h�c c�ng kh�ng sao.")
	elseif (( Uworld1000 == 160 ) or ( Uworld1000 == 170 )) and ( GetLevel() >= 5 ) then
		nt_setTask(1000,170) --����9start
		Talk (9,"Uworld1000_good3","V� r�i �? G�n ��y m�i l�c tr�ng tr�n ban ��m th��ng c� �c lang, ng��i ra ngo�i luy�n c�ng n�n c�n th�n.",name.."<#>: M�t hai con S�i th� c� ��ng g�?","Ch�ng ��ng g�? Ng��i c� gi�i th� �i gi�t m�t ng�n con v� ��y.",name.."<#>:? Mu�n l�m kh� ta sao?","H�! N�n khi�m t�n 1 ch�t! Ng��i d� d�ng t� m�n nh� th� sao ra giang h� ���c!",name.."<#>:...... Hi�u r�i.","Ng��i n�u kh�ng tin c� th� �i h�i ng��i kh�c xem. ",name.."<#>: L�m sao h�i?","�n ph�m (Enter) (nh� ch�n t�n s� t�n g�u) sau �� tr�c ti�p nh�p v�o l�i ng��i c�n n�i r�i l�i nh�n (Enter ) �� g�i �i")
	elseif (( Uworld1000 == 200 ) or ( Uworld1000 == 210 )) then
		nt_setTask(1000,210) --����11start
		Talk (5,"Uworld1000_high10","Th� n�o?",name.."<#>: L� ta sai!","���c r�i! Ng��i c� th� l�nh ng�, ch�ng t� t� ch�t kh�ng t�! Ng��i c� th� luy�n t�p th�m, kh�ng l�u sau ta s� cho ng��i bi�t m�t quy�t ��nh quan tr�ng.",name.."<#>: L� quy�t ��nh g�?","��i <color=red>c�p 10<color> r�i h�ng n�i,  trong th�n c� v� D� T�u,  �ng ta c� v�i nhi�m v� nh� cho ng��i,  n�u ho�n th�nh kh�ng nh�ng ���c �i�m kinh nghi�m m� c�n nh�n ���c v�t ph�m ��c bi�t.")
	elseif (( Uworld1000 == 220 ) or ( Uworld1000 == 230 )) and ( GetLevel() >= 10 ) then --���ִ�����������
		nt_setTask(1000,230) --����12start
		Talk (7,"Uworld1000_high11","Nhanh th� �? M�i ��y th�i �� h�c m�i th� � ta.",name.."<#>: H�c xong r�i?","Ch� v�i m�ng, ng��i ch� m�i �� t� c�ch gia nh�p Th�p ��i m�n ph�i trong V� l�m.",name.."<#>: Th�p ��i m�n ph�i l� g�?","Kh�ng th�y �� t� c�c ph�i trong th�n sao? K�t c�c T�ng Kim kh� �o�n, giang h� hi�m �c, c�c m�n ph�i ��u chi�u m� th�m �� t� �� t�ng th�m th� l�c. Ng��i trong giang h� th�n b�t do k�, con ���ng c�a ng��i t� quy�t ��nh l�y.",name.."<#>: Long......Ng�, �ng c�n g� c�n d�n g� n�a kh�ng?.","���ng xa hi�m tr�, n�n t� b�o tr�ng. �i t�m �� t� ti�p d�n Nh�p m�n �i. Nh�p m�n xong, t�m npc gi�p �� l� c� th� t�m ta, nh� ph�i li�n l�c v�i ta, ta c� ch�t chuy�n? Mu�n giao cho ng��i. Khi kh�ng r� g� v� nhi�m v� nh�n F12, v� thao t�c nh�n F1.")
	elseif ( Uworld1000 == 260 ) or (Uworld1000 == 270 ) then
		nt_setTask(1000,270) --����14start(1)
		Talk (3,"Uworld1000_good","Ta nghi�m kh�c v�i ng��i v� th�y ng��i c� t� ch�t, hy v�ng s� kh�ng ph� l�ng ta, v� c�ng chia l�m n�i c�ng v� ngo�i c�ng. Thu�c t�nh c�ngchia l�m h� n�i c�ng v� h� ngo�i c�ng.L�c ng��i luy�n v� c�ng n�n xem r�.",name.."<#>: N�i c�ng v� ngo�i c�ng kh�c nhau � ��u?","Tr�n v� kh� c� c�c thu�c t�nh h� tr� c� th� t�ng th�m v� c�ng c�a ng��i. N�u ng��i theo n�i c�ng th� c� n�i b�ng, n�i th�y, n�i ��c. Sau khi c�c thu�c t�nh c�a v� kh� ���c �� k�ch ho�t th� c� th� t�ng th�m. Ngo�i b�ng, ngo�i h�a kh�ng gi�p g� ng��i. V� ng��c l�i!",name.."<#>:  A! Th� ra l� th�.")	
	elseif (( Uworld1000 == 280 ) or ( Uworld1000 == 290) ) and ( GetLevel() >= 20 ) then
		nt_setTask(1000,290) --����15start
		Talk (5,"Uworld1000_high13","T�i sao l�i ��n, t�i sao l�i ��n?",name.."<#>:......Ng� Gia, l�u ng�y kh�ng g�p, �ng �� gi� nhi�u r�i.","Kim C�u m�y ng�y tr��c �i qua ��y, B� ch� ti�m t�p h�a b�......",name.."<#>: Ng� Gia!","Th�i r�i, u�ng c�ng ta ph� nhi�u c�ng s�c, ��n cu�i c�ng c�ng ��nh kh�ng l�i Kim C�u, ta �� gi� r�i, th� gi�i n�y l� c�a tu�i tr� c�c ng��i.")
	elseif ( Uworld1000 >= 10) and ( Uworld1000 <= 440 ) then
		Talk (1,"","Phi�u b�t giang h� r�t c�c kh�, ng��i n�n t� luy�n t�p th�m. C� g� kh�ng hi�u nh�n<color=red>F12<color>, xem th� nhi�m v�.")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","Giang h� hi�m �c, m�i chuy�n ng��i n�n c�n th�n. Sau n�y ta kh�ng th� lo cho ng��i, h�y b�o tr�ng!")
	end
end

function iwantkilltask()
	do return end
	Uworld1000 = nt_getTask(1000)
	Uworld1067 = nt_getTask(1067)
	local name = GetName()
	if ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		if ( Uworld1067 ~= 10 ) then
			education_changewuxing()
		end
		nt_setTask(1000,1000)
		Msg2Player("B�n �� x�a b� nhi�m v� s� nh�p. Tr�n giao di�n nhi�m v� s� hi�n th� nh�ng nhi�m v� �� ho�n th�nh, n�u b�n ch�a nh�n nhi�m v� c� th� ��n ��i tho�i v�i Long Ng�. Sau n�y b�n s� kh�ng th� l�m nhi�m v� s� nh�p n�a!")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","Ng��i �� ho�n th�nh nhi�m v� S� nh�p, kh�ng c�n l�m n�a.")
	else
		Talk(1,"","Ng��i ch�a nh�n nhi�m v� S� nh�p!")
	end
end

function iwantgetmastertask()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1001 == 320 ) then
		Talk(1,"Uworld1000_zhenghigh1000","Nhi�m v� kh� kh�n c�a M�c S�u giao, kh�ng ph�i ai c�ng l�m ���c! Long m� t� h�o v� ng��i!")
	elseif ( Uworld1002 == 310 ) then
		Talk(1,"Uworld1000_zhonghigh1000","S�t th� xu�t th�n t� L�m Uy�n Nhai ��u l� cao th� tuy�t th�! Ng��i h�y ��n �� �� r�n luy�n �i!")
	elseif ( Uworld1003 == 430 ) then
		Talk(1,"Uworld1000_xiepai1000","C� ch�t qu� n�y t�ng ng��i!")
	elseif  (GetLevel() >= 20 ) then -- �ȼ�����20�����
		Say("Ng��i tr�n giang h� �� c� ch�t c�n c�, c� mu�n nh�n v�i nhi�m v� kh�ng?",2,"Ta mu�n l�m nhi�m v� c�p 20 tr� l�n/Uworld1000_more","Ta ch� ��n ch�i /Uworld1000_no")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","��ng c�p c�a ng��i ch�a ��t y�u c�u, ��i c�p 20 h�y quay l�i.")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","Xin l�i! B�n ch�a gia nh�p m�n ph�i, nh�ng nhi�m v� n�y kh�ng th�ch h�p!")
	end
end

function iwantseetask()
	Describe(DescLink_LongWu.."<#>:  H� th�ng nhi�m v� m�i chia th�nh<color=red> s� nh�p, ch�nh tuy�n v� ph� tuy�n<color>.<color=red>Nhi�m v� s� nh�p<color>: t�t c� ng��i ch�i ��u c� th� ti�p nh�n, muc ��ch �� gi�i thi�u nh�ng ��c s�c v� thao t�c trong V� L�m Truy�n K�. C� th� b� <color=red> nhi�m v� s� nh�p<color>, nh�ng sau n�y s� kh�ng th� l�m ���c.<color=red> Nhi�m v� ch� tuy�n<color>:  t�<color=red> c�p 20<color> ��n<color=red> c�p 60<color>, m�i<color=red> 10 c�p<color> c� m�t nhi�m v�, g�m 3 phe: <color=red>Ch�nh ph�i, Trung l�p, T� ph�i<color> Ph�i nh�p m�n m�i c� th� ti�p nh�n nhi�m v�. Sau khi ho�n th�nh s� nh�n ���c Trang b� Ho�ng Kim v� �i�m kinh nghi�m. <color=red> Nhi�m v� ph� tuy�n<color> ph�i ti�p nh�n nhi�m v� t��ng �ng v�i ��ng c�p m�i c� th� ho�n th�nh, n�u b�n mu�n ti�p nh�n nhi�m v� ph� tuy�n t� c�p 30 ��n 39, b�n ph�i ti�p nh�n  nhi�m v� ch� tuy�n T� ph�i c�p 30 tr��c. Khi �ang l�m nhi�m v� s� nh�p kh�ng th� ti�p nh�n nhi�m v� ph� tuy�n. Gi�i th��ng c�a c�c nhi�m v� r�t phong ph�, hy v�ng b�n c� th� ��m m�nh v� th��ng"
	.."<color=red> N�u ng��i ch�i m�i b��c v�o th� gi�i c�a tr� ch�i, ch�ng ta s� cho m�t ng��i b�n ��ng h�nh c�ng b�n phi�u b�t giang h�. Ch� c�n nh�n'ta mu�n l�m nhi�m v� c�ng b�n ��ng h�nh' l� c� th� ch�n b�n ��ng h�nh.<color>",1,"K�t th�c ��i tho�i/no")
end

function Uworld1000_goon()
	Talk (1,"Uworld1000_title","Ch�ng ta b�t ��u h�c. N�i tr��c, �� v�o th�n xem nh� ng��i m�t nh�, n�u th�y ta nghi�m kh�c th� th�i v�y! Tr��c khi b�t ��u ng��i c� th� ch�n m�t ng��i b�n ��ng h�nh c�ng phi�u b�t giang h�. H�y nh�n v�o d�ng 'Ta mu�n l�m nhi�m v� ��ng h�nh'.")
end


function Uworld1000_more() --�˴�Ϊ20����������֮һ
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	if (( Uworld1001 < 10 ) or ( Uworld1002 < 10 ) or ( Uworld1003 < 10 ))  and ( GetLastFactionNumber() ~= -1 ) then
	Say("Ng��i mu�n l�m nhi�m v� phe n�o?",4,"Phe Ch�nh/Uworld1000_camp1","Phe Trung l�p/Uworld1000_camp2","Phe T� ph�i/Uworld1000_camp3","�� ta ngh� l�i!/Uworld1000_no")
	elseif ( HaveCommonItem(6,1,131) > 0 ) then
		Talk(1,"","Ch�ng ph�i ng��i �� nh�n ���c t�i th� c�a ta �, mau m� ra xem.")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","Ng��i ch�a nh�p m�n ph�i n�o,kh�ng th� ti�p nh�n nhi�m v�.")
	else
		Talk(1,"","B�ng h�u, sau n�y ng��i ph�i t� b�o tr�ng.")
	end
end

function Uworld1000_camp1()
	Uworld1001= nt_getTask(1001)
	Uworld183 = nt_getTask(183)
  	if ( Uworld1001 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(183,10)
	  	Msg2Player("Nh�n ���c m�t t�i th� c�a Long Ng�.")
	else 
		Talk(1,"","Ng��i ch�ng ph�i �ang l�m nhi�m v� phe Ch�nh sao? T�i sao c�n mu�n l�m n�a.")
	end
end

function Uworld1000_camp2()
	Uworld186 = nt_getTask(186)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 < 10 ) then
  	AddItem(6,1,131,0,0,0)
  	nt_setTask(186,10)
  	Msg2Player("Nh�n ���c m�t t�i th� c�a Long Ng�.")
  else 
		Talk(1,"","Ch�ng ph�i ng��i �ang l�m nhi�m v� Phe Trung l�p sao?")
	end
end

function Uworld1000_camp3()
	Uworld189 = nt_getTask(189)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(189,10)
	  	Msg2Player("Nh�n ���c m�t t�i th� c�a Long Ng�.")
  	else 
		Talk(1,"","Ch�ng ph�i ng��i �� ti�p nh�n nhi�m v� Phe T� ph�i sao? T�i sao mu�n l�m n�a.")
	end
end

function Uworld1000_no()
	Talk (1,"","Khi n�o g�p nguy hi�m h�y nh�n F1, xem C�m nang c� th� gi�p ���c b�n.")
end

function Uworld1000_title()
	local name = GetName()  
	Talk (4,"Uworld1000_and","Hoan ngh�nh ng��i ��n ��y, ta l� tr��ng th�n. B�y gi� b�n ngo�i r�t h�n lo�n. B�n gi�c Kim d� man gi�t ng��i kh�ng ch�p m�t, xa xa c� th� nghe th�y ti�ng v� ng�a, ti�ng g��m �ao lo�ng xo�ng. Ban ��m m�y m� x�m x�t, kh�i l�a kh�p n�i, l�ng d�n ho�ng lo�n. Ng��i �i ���ng nh�t ��nh ph�i c�n th�n",name.."<#>:  Ta m�i ��n n�n c� nhi�u vi�c kh�ng hi�u, xin ��i ca ch� d�y!","Trong th�n v�a m� l�p d�y nh�ng ng��i tr� tu�i nh� ng��i, h�c m�t �t c�ng l� t�t v� ng��i c� th� m�t m�ng b�t c� l�c n�o","Cho d� th� n�o c�ng ph�i c� gi� l�y t�nh m�ng",name.."<#>:  � ta c� m�t l� t��ng, �� l� s� c� m�t ng�y ta.....")
	
end

function Uworld1000_and()
	local name = GetName()
	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --����
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>209/186<color>.")
	elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --��Ȫ��
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>197/216<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --������
		Talk(1,"","Khoan n�i ��!! Mau ra ngo�i th�n t�m v� s� �i, tr��c khi �i ��nh v�i con th�, l�y 3 mi�ng th�t t��i ��a cho �ng ta. T�a �� <color=red>237/239<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --ʯ����
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>207/203<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --�����
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>208/184<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --������
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>207/214<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --������
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>217/192<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --�����
		Talk(1,"","Khoan n�i ��! Mau ra ngo�i th�n t�m v� s� �i! Tr��c �� h�y gi�t v�i con heo r�ng, l�y 3 mi�ng th�t heo ��a cho �ng ta. T�a �� <color=red>454/391<color>.")
 	end
 	Talk(5,"Uworld1000_find","�ng �y r�t th�ch u�ng r��u, �em ch�t m�i qua, kh�ng ch�ng s� d�y ng��i ch�t v� c�ng. �i kh�ng nhanh c� th� b�m n�t R �� ch�y.","C� th�y b�n �� nh� ph�a tr�n b�n ph�i kh�ng?  N�u kh�ng th�y nh�n tab m� ra. Ph�a tr�n c� v� tr�,  s� th� nh�t l� h��ng ��ng T�y, b�n tr�i l� ph�a T�y, b�n ph�i l� ph�a ��ng. S� th� hai l� h��ng Nam B�c, b�n tr�n l� ph�a B�c, � d��i l� ph�a Nam.","C� theo v� tr� m� �i, ph�a d��i b�n ph�i b�n �� nh� c� v�i bi�u t��ng nh�, ng��i xem qua s� bi�t. Gi� chu�t ph�i ch� v�o b�n �� c� th� xem c�c khu v�c kh�c. Th�i ta m�t r�i, ng��i �i �i.",name.."<#>:  Hi�u r�i.","��ng r�i, sau n�y n�u kh�ng nh� chuy�n ta n�i v�i ng��i, nh�n <color=red>F12<color>, xem th� c�a ta g�i cho ng��i s� r�.")
end


function Uworld1000_find()
	nt_setTask(1000,10) --�����ȥ����ʦ�����������Ϊ10������һstart
	Msg2Player("Long Ng� b�o b�n ra ngo�i th�n t�m V� s�, tr��c khi �i h�y ��nh th� l�y ���c 3 mi�ng th�t t��i.") 
	seteducationnpcpos()
end


function Uworld1000_good2()
	local name = GetName()
	Talk(4,"Uworld1000_high3","Ngo�i c�ng t�ng sinh l�c, n�i c�ng t�ng n�i l�c. Ng� h�nh t��ng kh�c, t�ng sinh l�c v� n�i l�c c�ng kh�ng gi�ng nhau. Gi� ng��i c� th� th� xem, quy t�c l�: t�ng 1 �i�m ngo�i c�ng �ng v�i Kim M�c Th�y H�a Th� m�i th� t�ng 8, 5, 6, 7, 3 �i�m sinh l�c.",name.."<#>:  V�y n�i c�ng th� sao?","M�i l�n t�ng 1 �i�m n�i c�ng �ng v�i Kim M�c Th�y H�a Th� m�i th� t�ng 1, 3, 3, 2, 4 �i�m n�i l�c.",name.."<#>:  Th� ra l� v�y, xem ra ta ph�i th�n trong t�ng �i�m.","H�m nay c�ng m�t r�i, ngh� ng�i tr��c ��, ng�y mai quay l�i t�m ta. H�y nh�, tr��c h�t h�y luy�n ��n c�p 3")
	
end

function Uworld1000_high3()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 50 ) then
		AddOwnExp(350)						
		nt_setTask(1000,60) --����3end
		Msg2Player("Long Ng� Ng��i ��t ��n c�p 3 h�y ��n t�m ta")
	end
end

function Uworld1000_high4()			
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 70 ) then
		AddOwnExp(350)			
		nt_setTask(1000,80) --����4end
		Msg2Player("Long Ng� b�o b�n ��n ��i tho�i v�i Ch� ti�m t�p h�a.")
		seteducationnpcpos()
	end
end

function Uworld1000_high8()
	nt_setTask(1000,160) --����8end
	Msg2Player("Long Ng� b�o b�n ��t ��n c�p 5 h�y ��n, b�y gi� ��n g�p V� s� h�c khinh c�ng.")
end

function Uworld1000_good3()
	local name = GetName()
	Talk(6,"Uworld1000_high9","Trong tr� ch�i b�n g�p b�t c� v�n �� g� ��u c� th� th�ng qua c�ch ��i tho�i v�i ng��i ch�i kh�c t�m tr� gi�p. Nh�n<color=red> ctrl<color> d�ng chu�t ch� v�o ng��i b�n mu�n ��i tho�i l� c� th� ��i tho�i. L�c m�i b�t ��u, ch� c� th� ch�n k�nh <Ng��i ch�i ph� c�n> �� ��i tho�i v�i ng��i kh�c.",name.."<#>:  �ng n�i v�i ta nhi�u th� �� l�m g�?","H�! Th� �i h�i m�i ng��i xem, m�t t�n t�m t�p c�a T�n Th� th�n nh� ng��i th� c� ��ng g�? Ng��i t��ng m�nh l� ��i hi�p giang h� r�i sao?",name.."<#>: �ng n�ng n�y qu�!","H�y �i t�m V� s�, ��ng qu�n �em <color=red>5 mi�ng th�t t��i.<color>! C� g�ng luy�n t�p.",name.."<#>:......")
end

function Uworld1000_high9()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 170 ) then
		AddOwnExp(800)
		nt_setTask(1000,180) --����9end
		Msg2Player("Long Ng� mu�n b�n �i t�m ng��i n�i chuy�n, sau �� �i t�m V� s�. ��ng qu�n �em theo 5 mi�ng th�t t��i.")
		seteducationnpcpos()
	end
end

function Uworld1000_high10()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 210 ) then
		AddOwnExp(400)
		nt_setTask(1000,220) --����11end
		Msg2Player("Long Ng� mu�n b�n ��n c�p 10 m�i ��n �ng ta.")
	end
end

function Uworld1000_high11()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 230 ) then
		AddOwnExp(3000)
		nt_setTask(1000,240) --����12end
		Msg2Player("Long Ng� b�o b�n c� th� nh�p m�n Th�p ��i ph�i, h�y v�o th�n t�m �� t� ti�p d�n c�a M�n ph�i. Sau khi nh�p m�n ��n ch� NPC tr� gi�p t�m Long Ng�.")
	end
end

function Uworld1000_good()
	local name = GetName()
	Talk(4,"Uworld1000_high12","C� th� �n [F5] �� xem t�t c� c�c k� n�ng �� h�c. N�u mu�n chuy�n ��i nhanh chi�u th�c, c� th� nh�p chu�t v�o bi�u t��ng k� n�ng s� d�ng � d��i g�c ph�i giao di�n cho xu�t hi�n c�c chi�u th�c theo h�ng ngang, sau �� ch� chu�t v�o chi�u th�c b�t k�.","D�ng c�c ph�m <color=red><q>, <w>, <e>, <a>, <s>, <d>, <z>, <x>, <c><color> �� chuy�n ��i nhanh khi s� d�ng.",name.."<#>:  �, nh� th� l� c� th� thao t�c ���c r�i.","Sau n�y luy�n v� s� ng�y c�ng c�c kh�, ng��i chu�n b� xong r�i th� �i �i. ��n c�p 20 ��n t�m ta, ta s� ��i ng��i � ��y.")
end

function Uworld1000_high12()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 270 ) then
		AddOwnExp(3000)
		nt_setTask(1000,280) --����14end
		Msg2Player("Long Ng� n�i v�i b�n ch� ��n c�p 20 ��n g�p �ng ta.")
	end
end

function Uworld1000_high13()
	local name = GetName()
	local curCamp = nt_getCamp();
	if  ( curCamp == 0 ) then --ȱ��֧��npc������
		Talk(3,"Uworld1000_find2","B�n h�y ��n Ph�ng T��ng t�m Ng�o V�n T�ng, �ng ta s� ti�p t�c gi�p �� b�n",name.."<#>:  Ng� Gia, sau n�y �ng c� d� t�nh g�?","Y�n t�m �i, h� Long ta kh�ng d� ch�t nh� v�y ��u, ta c�n ph�i ��u v�i b�n Kim C�u t�i c�ng!")
	elseif  ( curCamp == 1 ) then --ȱ��֧��npc������
		Talk(3,"Uworld1000_find2","Ng��i ��n t�m Li�u Nam V�n, �ng ta s� ti�p t�c gi�p ng��i! �ng ta � L�m An.",name.."<#>:  Ng� Gia, sau n�y �ng c� d� t�nh g�?","Y�n t�m �i, h� Long ta kh�ng d� ch�t nh� v�y ��u, ta c�n ph�i ��u v�i b�n Kim C�u t�i c�ng!")
	elseif  ( curCamp == 2 ) then --ȱ��֧��npc������
	  	Talk(3,"Uworld1000_find2","Ng��i h�y ��n Bi�n Kinh t�m Ti�u s� c�a Th�c B�t Ho�i Xuy�n, �ng ta s� gi�p ng��i, y �ang � Bi�n Kinh.",name.."<#>:  Ng� Gia, sau n�y �ng c� d� t�nh g�?","Y�n t�m �i, h� Long ta kh�ng d� ch�t nh� v�y ��u, ta c�n ph�i ��u v�i b�n Kim C�u t�i c�ng!")
	end
end

function Uworld1000_find2()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 290 ) then
		AddOwnExp(5000)
		nt_setTask(1000,300)
		Msg2Player("Long Ng� b�o b�n �i t�m m�t ng��i, y c� th� gi�p b�n.")
	end
end

function Uworld1000_zhenghigh1000()
Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 320 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("B�n �� ho�n th�nh nhi�m v� M�c S�u giao, Long Ng� v� c�ng h�i l�ng, nh�ng b��c ���ng giang h� ch� m�i b�t ��u.")
	end
end

function Uworld1000_zhonghigh1000()
Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 == 310 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("B�n �� ho�n th�nh nhi�m v� s�t th� Ph� Nam B�ng giao, tr�n giang h� b�n �� c� ch�t danh ti�ng, ��y c�ng kh�ng ph�i l� chuy�n t�t, trong th�nh c� nhi�u tai m�t theo d�i")
	end
end

function Uworld1000_xiepai1000()
Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 == 430 ) then
		prize()
		
		Msg2Player("B�n �� ho�n th�nh nhi�m v� ch� tuy�n T� ph�i, sau n�y c� l� c� nhi�u tr�n chi�n �ang ch� ng��i, m�t k� m�u l�nh.")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		nt_setTask(1067,10)
		Msg2Player("Ng� h�nh tr��c ��y c�a b�n ch� �� h� th�n, kh�ng th� chi�n ��u! Hi�n �� thay ��i  k� n�ng chi�n ��u cho b�n!")
	end
end