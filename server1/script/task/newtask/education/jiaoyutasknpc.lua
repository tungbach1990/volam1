-- ������ϵͳ
-- BY:XIAOYANG(2004-11-29)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
-----------------------------------���ִ���ʦ-----------------------------
function education_wushi()
	Uworld1000 = nt_getTask(1000)      -- ������ϵͳ
	Uworld1065 = nt_getTask(1065)      -- ��¼���������ı���
	local name = GetName()  
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then   
		Talk(1,"Uworld1000_end1",name.."<#>:  S� ph�! Long th� l�nh b�o ta ��n t�m �ng. ��y l� th�t t��i c�a �ng.")
	elseif (( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) then  
		Talk(1,"Uworld1000_end1",name.."<#>:  S� ph�! Long th� l�nh b�o ta ��n t�m �ng. ��y l� th�t t��i c�a �ng.")
	elseif (( Uworld1000 == 10 ) or ( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) and ( Uworld1065 < 3 ) then 
		Talk(1,"","A! Th�t t��i c�ng kh�ng ��! B�ng h�u! Ng��i kh�ng c� th�nh � ch�t n�o. H�y �i l�y 3 mi�ng th�t t��i v�.")
	elseif ( Uworld1000 == 180 ) and ( Uworld1065 < 5 ) then
		Talk(1,"","Sao? L�i qu�n ��a th�t t��i cho ta, l�y �� 5 mi�ng r�i quay l�i.")
	elseif ( Uworld1000 == 180) or ( Uworld1000 == 190 ) then
		if ( Uworld1000 == 180 and Uworld1065 >= 5 ) then
			Uworld1065 = Uworld1065 - 5
			nt_setTask(1065,Uworld1065)
		elseif ( Uworld1000 == 180 ) then
			Talk(1,"no","Sao? L�i qu�n ��a th�t t��i cho ta, l�y �� 5 mi�ng r�i quay l�i.")
		end
			nt_setTask(1000,190) --����10start
			Talk(10,"Uworld1000_good4",
			name.."<#>:  S� ph�.","Ta kh�ng d�m nh�n, ta v� ng��i kh�ng ph�n l�n nh�. Sao? L�i �em th�t t��i ��n! Ha ha!",name.."<#>:  Long Ng� th�t s� khi�n ng��i t�c gi�n.","� �! Th�t ngon! Th�t ngon.",name.."<#>:  S� ph�! Con �ang n�i chuy�n v�i ng��i m� ","Ha ha...Long ��u Nhi l� ng��i th�ng th�n, th�t ra y v� t�t cho ng��i m� th�i. Kh�ng gi�o hu�n ng��i nghi�m kh�c sau n�y ra giang h� ch�t kh�ng k�p bi�t v� sao ch�t!",name.."<#>:  Nh�ng m� �ng �y n�i n�ng qu�.","V� s�: B�n tr�, m�i chuy�n n�n nh�n, ch� c� quy�t t�m luy�n t�p nh� kim cang b�t ho�i m�i c� th� l�m n�n ��i s�.",name.."<#>:  A! Th� ra l� th�.","V� s�: � trong th�n l�u r�i ch�c ng��i c�ng bu�n. C� mu�n k�t giao v�i v� b�ng h�u kh�ng?",name.."<#>:  Mu�n ch�!","H�y �n [F6] m� giao di�n h�o h�u, �n n�t ph�a d��i �� t�m ki�m, ho�c c� th� ch�n t�n ng��i ch�i xung quanh... Ho�c c� th� �n [Ctrl] + chu�t ph�i tr�n ngu�i c�a ��i ph��ng, ch�n: h�o h�u")
	else 
		Talk(1,"","Nam b�c ��u c� nh�ng phong t�c ri�ng, b�n ph�i h�c nhi�u m�i c� th� t�n t�i!")
	end
end

-----------------------------------�ӻ����ϰ�-----------------------------
function zboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
		if ( Uworld1000 == 120 ) or ( Uworld1000 == 130 ) then
			nt_setTask(1000,130) --����7start
			Describe(DescLink_ZaHuoPu.."<#>:  B�n tr� t�m ta c� vi�c g�?<enter>"
			..name.."<#>:  Long th� l�nh b�o ta ��n g�p �ng.<enter>A! T�n ch�t ti�t �� l�i sai ng��i ��n ph� ta! Ta kh�ng c� g� �� d�y ng��i c�!<enter>"
			..name.."<#>:  Sao l� v�y? <enter> M� n�y! Ng��i sau n�y h�nh t�u giang h� c� th� s� nghe n�i ��n 'Thi�n Ho�ng Long Kh�...<enter>"
			..name.."<#>:  Thi�n Ho�ng Long Kh�?<enter> �� l� b� �o gi�p th�n b� do T�n Th�y Ho�ng chi�u t�p th� r�n gi�i c�a 7 n��c l�m n�n. Nghe n�i b�n trong �n ch�a b� m�t r�t l�n<enter>"
			..name.."<#>:  H�?<enter> C� th� th� ta kh�ng r�! � ��ng r�i! Ta c� Th� ��a Ph�, sau n�y khi ng��i luy�n c�ng m�t m�i c� th� s� d�ng n� �� l�p t�c quay v� th�nh ho�c th�n!<enter>"
			..name.."<#>:  C� th� n�y th�t t�t! <enter> T�ng ng��i 2 t�m, n�u kh�ng t�n ch�t ti�t kia l�i n�i ta �ch k�! <enter>"
			..name.."<#>:  Ai? �! Long ��u l�nh h�? <enter>B�n tr� h�y c� g�ng nh�!",
			2,"Ta mu�n xem b�c h�a �� c�a Thi�n Ho�ng Long Kh� /Uworld1000_tianhuanglongqi","K�t th�c ��i tho�i/Uworld1000_high7")
		else 
			Talk(1,"","Phi�u b�t giang h� ch�ng b�ng � nh� s�ng nh�n nh� th� n�y!")
		end
end

------------------------------------ҩ���ϰ�----------------------------------
function yboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 80 ) or ( Uworld1000 == 90 ) then
		nt_setTask(1000,90) --����5start
		Talk(9,"Uworld1000_high5","Kh�ch quan c�n g�?",name.."<#>:  Ta kh�ng c� ti�n, l� Long th� l�nh b�o  ta ��n t�m �ng.","Ng� Gia b�o ng��i ��n �? Ta hi�u r�i! Th�t ra ta c�ng kh�ng c� g� �� d�y, tr��c ti�n t�ng ng��i 1 �t d��c d��c ph�m, c� l�c h�u d�ng",name.."<#>:  C�m �n.","��ng kh�ch s�o! N�n c� g�ng! Bi�t ��u sau n�y ng��i s� tr� th�nh m�t ��i hi�p, c� ch� �� ta n��ng nh�'",name.."<#>:  �ng kh�ch s�o r�i.","Sau n�y c� th��ng t�t, b�nh ho�n g� c� ��n t�m ta! N�u mu�n mua s� l��ng l�n c� th� �n ph�m [shift] v� nh�n chu�t ph�i",name.."<#>:  ���c, ta bi�t r�i.","Ng��i h�y �i t�m th� r�n � ") 
	else 
		Talk(1,"","L�c b� th��ng nh� u�ng thu�c, ph�ng b�nh h�n ch�a b�nh.")
	end
end

------------------------------------����--------------------------------------
function tboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName() 
	 	if ( Uworld1000 == 100 ) or ( Uworld1000 == 110 ) then
			nt_setTask(1000,110) --����6start
			Talk(11,"Uworld1000_high6"," A! Ng��i ��n r�i!",name.."<#>:  Uhm! Ch�nh t�i h�!","Mu�n mua th� g�?",name.."<#>:  Ta ��n h�i th�m tin t�c.","Ng��i c�a Ng� Gia?",name.."<#>:  ��ng v�y.","Ta binh kh� n�o c�ng c�. Chi�u theo Ng� h�nh m� ch�n binh kh� s� c� th� k�ch ho�t c�c thu�c t�nh �n",name.."<#>:  V�y sao!","Ng��i nh�n [F4] �� m� h�nh trang, ti�p theo nh�n [F3] �� m� giao di�n trang b�, �n gi� chu�t tr�i k�o thanh ki�m v�o ph�n giao di�n trang b� l� c� th� s� d�ng",name.."<#>:  C�m �n �ng.","��ng kh�ch s�o! B�y gi� �i t�m ch� t�p h�a �i!")
		else
			Talk(1,"","Ng��i n�n mua binh kh� ph�ng th�n.")
		end
end    

-----------------------------------��������-----------------------------------
function education_tiejiang()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 380 ) or ( Uworld1000 == 390 ) then
		nt_setTask(1000,390) --����20start
		Talk(12,"Uworld1000_repair","Th�n binh t�i xu�t, Thi�n h� s� c�ng h�n lo�n.Th�i ��i lo�n l�c n�y bao gi� m�i k�t th�c ��y.",name.."<#>:  Ti�n sinh, �ng n�i g� v�y?","L� ng��i c�a Ng� Ca ph�i ��n?",name.."<#>:  ��ng v�y.","Thi�n Ho�ng Long Kh� �� t�i xu�t giang h�, kh�ng bi�t s� ��m m�u bao l�u n�a.",name.."<#>:  'Thi�n Ho�ng Long Kh�' l� c�i g�?","Sau n�y ng��i s� r�. Ng� Ca c� �� 1 b� �o gi�p � ��y, ng��i l�y �i.",name.."<#>:  C�m �n �ng.","Th� n�y c�t trong m�t th�t l�u ng�y n�n �� r� s�t, l�y ch�t d�u lau n� �i.",name.."<#>:  V�y l�m th� n�o?","Sau n�y n�u trang b� c�a ng��i b� h�, nh�n v�o ch� s�a � d��i giao di�n trang b�, sau �� nh�p v�o m�n �� ng��i mu�n s�a.",name.."<#>:  V�y ta th� xem")
	elseif ( Uworld1000 == 400 ) or ( Uworld1000 == 410 ) then  --ȱ�ٶԿ����Ƿ�����õ��ж�
		nt_setTask(1000,410) --����21start
		Talk(9,"Uworld1000_luck1","Th� r�n: Ph�o, �� s�a xong r�i.",name.."<#>:  Qu� nhi�n l� kh�c h�n!","Ng��i th�y thu�c t�nh �n tr�n trang b� �� k�ch ho�t ch�a?",name.."<#>:  Th�y r�i, th�y r�i...Vi�c n�y l� th� n�o, ta kh�ng hi�u g� c�. Ta kh�ng t�m th�y trang b� k�ch ho�t.","B�i v� ng� h�nh c�a trang b� n�y t��ng sinh v�i ng� h�nh c�a ng��i n�n thu�c t�nh �n th� nh�t c�a trang b� s� t� ��ng ���c k�ch ho�t. Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim.",name.."<#>:  T�t qu�! Ta �� hi�u r� v� Ng� H�nh r�i.","B�y gi� ta s� cho ng��i m�t m�n qu� ��c bi�t.",name.."<#>:      L� g� v�y?","Ta s� cho ng��i m�t tr�ng th�i ��c bi�t, m�i gi� ���c 10 �i�m may m�n.")
	else 
		Talk(1,"","Ng��i n�n mua binh kh� ph�ng th�n.")
	end
end

function Uworld1000_repair() --����˫�ӹ�����һ��
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 390 ) then
		local nItemIdx = 0;
		if ( GetSex() == 0 ) then --��
				if (GetSeries() == 0 ) then
					nItemIdx = AddItem(0,2,0,1,2,255,7);--ˮ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --ľ
					nItemIdx = AddItem(0,2,0,1,3,255,7);--����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --ˮ
					nItemIdx = AddItem(0,2,0,1,1,255,7);--ľ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --��
					nItemIdx = AddItem(0,2,0,1,4,255,7);--����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --��
					nItemIdx = AddItem(0,2,0,1,0,255,7);--����
					SetCurDurability(nItemIdx,14)
				end
			else 
				if (GetSeries() == 0 ) then --��
					nItemIdx = AddItem(0,2,9,1,2,255,7);--Ůˮ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --ľ
					nItemIdx = AddItem(0,2,9,1,3,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --ˮ
					nItemIdx = AddItem(0,2,9,1,1,255,7);--Ůľ��
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --��
					nItemIdx = AddItem(0,2,9,1,4,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --��
					nItemIdx = AddItem(0,2,9,1,0,255,7);--Ů����
					SetCurDurability(nItemIdx,14)
			end
		end
	end
	nt_setTask(1000,400) --����20end
	Msg2Player("Th� r�n ��a b�n �o gi�p �� s�a xong.")	
end

function Uworld1000_luck1()
	local name = GetName()  
	Talk(4,"Uworld1000_luck2",name.."<#>:      Ngh�a l� g� v�y?","May m�n l� l�c ng��i ��nh nhau v�i th� d� s� c� kh� n�ng nh�t ���c trang b� t�t. �i�m may m�n cao nh�t l� 100. Hi�n gi� ng��i ���c m�t gi� may m�n, h�y c� m� t�n d�ng.",name.."<#>:  �a t�, ta bi�t r�i."," ���c r�i, h�y quay l�i g�p ng��i �� sai ng��i ��n ��y, h�n s� giao 1 b�c th� c�a Ng� Ca cho ng��i.")
end

function Uworld1000_luck2()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 410 ) then
	  	AddSkillState(441, 1, 1, 64800)        --��������10һСʱ���ж�
		AddOwnExp(2000)
	end
	nt_setTask(1000,420) --����21end
	Msg2Player("B�n nh�n ���c 1 gi� may m�n c� th� l�y nh�t ���c trang b� t�t.")
	if  ( curCamp == 0 ) then
		Msg2Player("Th� r�n b�o b�n c� th� v� Ph��ng T��ng t�m Ng�o V�n T�ng.")
	elseif  ( curCamp == 2 ) then
		Msg2Player("Th� r�n b�o b�n c� th� �i Bi�n Kinh t�m Th�c B�t Ho�i Xuy�n.")
	elseif  ( curCamp == 1 )  then
		Msg2Player("Th� r�n b�o b�n c� th� �i L�m An t�m Li�u Nam V�n.")
	end
end

----------------------------�ٰ�Ǯׯ�ϰ�----------------------------------------

function education_qianzhuanglaoban()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		nt_setTask(1000,370) --����19start
		Talk(4,"Uworld1000_yinpiao","Ng��i l� ng��i c�a Ng� Ca?",name.."<#>:  ��ng v�y."," M�i ng�i, n�m x�a ch�u �n c�a Ng� Ca, chuy�n c�a �ng ta c�ng l� chuy�n c�a ta.",name.."<#>:  Th�t ra Ng� Gia b�o ta v�o th�nh d�o.","Ta n�i cho ng��i bi�t nh�ng chuy�n c�n l�u � khi h�nh t�u giang h�.")
	end
end

---------------------------�����˴���-----------------------------------------------
function education_wulinmengchuanren()
Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 340 ) or ( Uworld1000 == 350 ) then 
		nt_setTask(1000,350) --����18start
		Talk(8,"Uworld1000_goon3","Cu�i c�ng ng��i c�ng ��n r�i",name.."<#>:  �ng bi�t ta s� ��n?","T�i h� v�n c� th� �o�n ���c s� m�nh, nh�n duy�n t�i l�c...th� sao l�i kh�ng bi�t!",name.."<#>:  Ti�n sinh th�t bi�t ��a.","���c r�i, ta s� cho ng��i bi�t m�t ch�t v� ph�c duy�n. Ph�c duy�n l� ph��ng th�c t�ch l�y 2 gi� ch�i th� c� th� ��n 7 th�nh l�n ho�c ��o Hoa Nguy�n t�m V� L�m Truy�n Nh�n nh�n l�nh. Sau �� ��n T��ng D��ng t�m Th�n B� Th��ng Nh�n d�ng �i�m Ph�c duy�n ��i p",name.."<#> �! C� chuy�n �� n�a sao! Ph�n th��ng c� nhi�u kh�ng?","C�n ph�i h�i! Y r�t gi�u c�, giang h� hi�m c�...",name.."<#>:  V�y c� h�n ch� g� kh�ng?");
	end
end

function Uworld1000_tianhuanglongqi()
	Describe("<link=image:\\spr\\Ui3\\������ϵͳ\\����ͼ��\\tianhuanglongqi_01.spr>Thi�n Ho�ng Long Kh�<link>",1,"K�t th�c/Uworld1000_high7")
end

function Uworld1000_high7()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 130 ) then
		if ( GetSex() == 0 ) then 
			AddItem(0,5,1,1,1,20)         --����һ˫Ь��
		elseif ( GetSex() == 1 ) then 
			AddItem(0,5,3,1,1,20)
		end
		AddItem(5,0,0,0,0,0)         --���������سǷ�
		AddItem(5,0,0,0,0,0)
		AddOwnExp(200)
		nt_setTask(1000,140) --����7end
		Msg2Player("B�n nh�n ���c 2 t�m H�i Th�nh Ph�.")
		Msg2Player("B�n nh�n ���c 1 ��i gi�y.")
		Msg2Player("H�y quay v� g�p Long Ng�.")
		seteducationnpcpos()
	end
end

function Uworld1000_high5()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 90 ) then
		for i=1,3 do
			AddItem(1,0,0,2,0,0)                          --������ƿ��ҩ
		end
		AddOwnExp(200)
		nt_setTask(1000,100) --����5end
		Msg2Player("B�n nh�n ���c 3 b�nh H�ng D��c Th�y.")
		Msg2Player("H�y quay v� ��i tho�i v�i th� r�n.")
		seteducationnpcpos()
	end
end

function Uworld1000_high6()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 110 ) then
		AddOwnExp(200)
		nt_setTask(1000,120) --����6end
		Msg2Player("Quay v� ��i tho�i v�i B� ch� ti�m t�p h�a.")
		seteducationnpcpos()
	end
end

function Uworld1000_end1()
	local name = GetName()  
	local Uworld1065 = nt_getTask(1065)
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) then
		Uworld1065 = Uworld1065-3
		nt_setTask(1065,Uworld1065)
	end
	nt_setTask(1000,30) --����2start
	Talk(5,"Uworld1000_wuxing","L�i l� th�t t��i? G�n ��y nhi�u ng��i ��n h�c v� v�y. M�t ch�t �i ���c!",name.."<#>:  N� n��c th� nh�, c�n ph�i b�o!","Th�t kh�ng ng� ng��i l�i c� ch� kh� nh� v�y. Ta d�y ng��i b�i h�c ��u ti�n: �n ph�m [V] l� c� th� ng�i xu�ng h�i ph�c kh� huy�t. Sau n�y khi phi�u b�t giang h�, h�y d�ng c�ch n�y �� l�y l�i ch�t h�i s�c gi� ���c m�ng s�ng",name.."<#>:  �a t� s� ph�!","�m D��ng t��ng sinh, Ng� H�nh t��ng kh�c. B�y gi� ta s� d�y ng��i 1 b� Ng� H�nh quy�n ph�p.")
end

function Uworld1000_wuxing()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 30 ) then
		AddOwnExp(350)	
		if ( GetSeries() == 0 ) then
			AddMagic(445)   --��
		elseif ( GetSeries() == 1 ) then
			AddMagic(446) 	--ľ
		elseif ( GetSeries() == 2 ) then	
			AddMagic(447) 	--ˮ
		elseif ( GetSeries() == 3 ) then
			AddMagic(448) 	--��
		elseif ( GetSeries() == 4 ) then
			AddMagic(449) 	--��
		end
	end
		nt_setTask(1000,40) --����2end
		seteducationnpcpos()
		Msg2Player("B�n h�c ���c Ng� H�nh quy�n ph�p.")
		Talk(2,"","B� v� c�ng n�y ch� �� h� th�n, luy�n t�p r�t ch�m! Ch� c�n ng��i hi�u ���c nguy�n l� 'Sinh kh�c' th� hi�u qu� kh�c ch� k� ��ch s� t�ng g�p b�i: Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim","V� h�c l�y chuy�n c�n luy�n t�p l� ch�nh... Ai da! Mi�ng l�i kh�t r�i! Th�i ng��i h�y quay v� t�m Long ��u �i!")
end

function Uworld1000_good4()
	local name = GetName()  
	Talk(9,"Uworld1000_changewuxing",name.."<#>:  �, h�a ra l�i ti�n l�i nh� v�y.","Ng��i c� th� th� xem r�i h�y ��n t�m ta.",name.."<#>:  Ta �� th� xong.","N�u ng��i mu�n ti�n th�m m�t b��c, c�ng b�n b� k�t th�nh huynh �� chi giao th� c� th� ��n Nam Nh�c tr�n t� mi�u, t�m T�nh ��c thi�n s�!",name.."<#> ���c! Ta nh� r�i","Tr�n n�o ���ng b�n t�u Giang h�, c� nhi�u b�ng h�u t�c l� c� nhi�u s� tr� gi�p","���c r�i, ta t�ng ng��i 1 b�o ki�m c� thu�c t�nh �n! v� c� 1 s�i d�y chuy�n c� thu�c t�nh, trang b� ch�ng, ng��i s� th�y ���c hi�u nghi�m c�a Ng� H�nh: thu�c t�nh �n tr�n ki�m c�a ng��i s� ���c k�ch ho�t",name.."<#>:  Qu� nhi�n l� huy�n di�u!","Sau n�y mu�n k�ch ho�t trang b�, �n [F4], th�y � d��i xem � d��i d�ng m�u v�ng c�a d�ng trang b� s� bi�t thu�c t�nh c�a trang b�. B�y gi� ng��i v� �i, c� g� kh�ng hi�u �n [F1] ra xem, v� ph��ng di�n nhi�m v� th� nh�n [F11]")
end

function Uworld1000_changewuxing()
	local name = GetName()  
	Talk(2,"Uworld1000_high9","V� c�ng l�n tr��c d�y ng��i ch� th� xem s� nh�n n�i c�a ng��i. B�y gi� ta s� d�y ng��i v� c�ng ch�nh t�ng","Ch� c�n d�a theo b� v� c�ng n�y, ch�m ch� luy�n t�p. Ng�y tr� th�nh cao th� s� kh�ng c�n xa.")
end

function Uworld1000_high9()
	Uworld1000 = nt_getTask(1000)
	local Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld1000 == 190 ) then
		if ( GetSex() == 0 ) then 
			if ( GetSeries() == 0 ) then--��
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,1,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 1 ) then--ľ
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,0,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 2 ) then--ˮ	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,3,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 3 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 4 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --����  
			end
		else 
			if ( GetSeries() == 0 ) then--��
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,1,60,2,2,0,0,0,0) --����  		
			elseif ( GetSeries() == 1 ) then--ľ
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,0,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 2 ) then--ˮ	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,3,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 3 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --����  
			elseif ( GetSeries() == 4 ) then--��
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --��    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --����  
			end
		end
	end
	if (( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 )) and ( Uworld1067 <  10 ) then
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
	end
	AddOwnExp(800)
	nt_setTask(1000,200) 
	Msg2Player("V� s� h��ng d�n b�n c�ch t�m h�o h�u, c� th� nh�n F1 m� C�m nang ra xem. B�n c� th� quay v� g�p Long Ng�.")
	Msg2Player("B�n nh�n ���c 1 thanh B�o ki�m v� s�i d�y chuy�n, c� th� d�ng d�y chuy�n k�ch ho�t ki�m.")
	Msg2Player("B�n �� h�c ���c k� n�ng c�ng k�ch Ng� h�nh.")
	seteducationnpcpos()
end

function Uworld1000_yinpiao()
	local name = GetName()  
	Talk(1,"Uworld1000_get","Ng�n phi�u c�ng t��ng ���ng v�i Nguy�n b�o, c� th� ��i ra gi� ch�i ho�c ti�n ��ng. Ng��i h�y �i t�m th� r�n �� h�i th�m")
end

function Uworld1000_get()
	AddOwnExp(5000)
	nt_setTask(1000,380)	--����19end
	Msg2Player("Ch� ti�n trang b�o b�n ��n t�m Th� r�n trong th�nh")	
	seteducationnpcpos()
end


function Uworld1000_goon3()
	local name = GetName()  
	Talk(3,"Uworld1000_queding","C� ch�, n�p th� m�i c� th� l�nh qu�!",name.."<#>:  Ta hi�u r�i!","Ng��i t� ch�t th�ng minh, gi� h�y ��n L�m An t�m Ch� ti�n trang (180, 191) ,�ng ta s� ch� �i�m cho ng��i.T�m Xa phu trong th�nh ��a ng��i �i.")
end

function Uworld1000_queding()
	AddOwnExp(5000)
	nt_setTask(1000,360) --����18end 
	Msg2Player("V� L�m Truy�n Nh�n b�o b�n t�m Ch� ti�n trang L�m An.")	
	seteducationnpcpos()
end

function no()
end