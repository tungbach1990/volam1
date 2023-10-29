-- ����֧������ű�
-- by xiaoyang(2005\1\11)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------��һ��--------------------------------------------------------------------------
function branch_jiangyixiao()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if (( Uworld1054 == 20) or ( Uworld1054 == 30 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,30)
			Describe(name.."<#>:  Giang ti�n sinh, Li�u Nam V�n b�o ta ��n t�m �ng.<enter>"
			..DescLink_JiangYiXiao.."<#>:  L�o Li�u �? �ng �y b�o ng��i ��n ��y l�m g�?.<enter>"
			..name.."<#>:  G�n ��y nghe n�i B�o kh� xu�t hi�n t�i D��ng Ch�u.<enter>�! Th� ra l� v� chuy�n n�y.<enter>"
			..name.."<#>:  Tr��c khi t�i h� ��n, �� gi�p �ng qu�t s�ch l� Nh�m.<enter> Giang Nh�t Ti�u: V�y �? ��y ch�c l� � c�a L�o Li�u. Ta c� quen L�c Thanh Thu th� sinh, y t�ng l� nh� b�nh ki�m n�i ti�ng. Ch� v� m�t l�n ngo�i � mu�n �� ph� c�nh tay, ng��i h�y ��n t�m �ng.<enter> "
			..name.."<#>: V�y c�m �n �ng.<enter>Giang Nh�t Ti�u: ��ng kh�ch s�o, thay ta h�i th�m l�o Li�u.<enter>",
			1,"K�t th�c ��i tho�i/branch_jiangyixiao1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_JiangYiXiao.."<#>:  D��ng Ch�u d� ch�u h�n T�n L�ng, nh�ng tr�ch nhi�m tr�n vai v�n �� n�ng.",1,"K�t th�c ��i tho�i/no")
	end
end
---------------------------------------------------------������-----------------------------------------------------------------------------
function branch_leqingqiu()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 40) or ( Uworld1054 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,50)
			Describe(name.."<#>:  L�c ti�n sinh, nghe n�i �ng bi�t b�nh ki�m, T�i h� ���c Giang ch� s� gi�i thi�u ��n.<enter>"
			..DescLink_LeQingQiu.."<#>: �, chuy�n c�a Giang ch� s� c�ng l� chuy�n c�a L�c m�, ch� ti�c hi�n ta kh�ng c� t�m tr�ng b�nh ki�m.<enter>"
			..name.."<#>:  Ti�n sinh c� chuy�n g� c� n�i ch�ng?<enter>L�c Thanh Thu: Ai da! Ng��i �� t�n ph�, c�n c� chuy�n g� �� n�i......<enter>"
			..name.."<#>:  Ti�n sinh ng��i n�i v�y l� c� � g�?<enter> Ta thi�u B�o k� s�ng b�c m�t m�n ti�n l�n, �� 30 n�m v�n ch�a tr� xong th� l�m sao m� n�i v� ki�m ��o n�a ch�.<enter>"
			..name.."<#>:  Chuy�n n�y d� th�i, ta gi�p �ng gi�i quy�t.<enter>",
			1,"K�t th�c ��i tho�i/branch_leqingqiu1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1054 == 110 ) or ( Uworld1054 == 120 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,120)
			Describe(name.."<#>:  L�c ti�n sinh, m�n s� s�ng b�c c�a �ng ta �� gi�i quy�t xong.<enter>"
			..DescLink_LeQingQiu.."<#>:  Ta bi�t r�i, th�t kh�ng ng�, ng��i tr� h�n ta nhi�u v�y m� d�ng c�m b�t khu�t. L�c m� coi nh� �� u�ng ph� c� cu�c ��i.<enter>"
			..name.."<#>:  L�c ti�n sinh ��ng n�i nh� th�, �ng l� ng��i r�t ki�n c��ng, n�u kh�ng Giang ti�n sinh �� kh�ng l�m b�n v�i �ng.<enter>B�ng h�u......T�t! Ng��i �em ki�m ��n ta s� b�nh ki�m cho.<enter>"
			..name.."<#>:  C�m �n!.<enter>L�c Thanh Thu: H�y ra ngo�i th�nh �o�t l�y b�o ki�m c�a (Nh�n v�t V� l�m) .<enter>",
			1,"K�t th�c ��i tho�i/branch_leqingqiu2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1054 == 140 ) or ( Uworld1054 == 150 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,150)
			Describe(name.."<#>:  L�c ti�n sinh, b�o ki�m ��y.<enter>"
			..DescLink_LeQingQiu.."<#>:  Thanh ki�m n�y, thanh ki�m n�y.<enter>"
			..name.."<#>:  Thanh ki�m n�y th� n�o?<enter>"
			..name.."<#>:  Ph� r�i? <enter>�!<enter>"
			..name.."<#>:  V�y, v�y......<enter>Ng��i kh�ng c�n ti�c, v�i s� anh d�ng c�a ng��i mai n�y nh�t ��nh s� l�m n�n chuy�n l�n.<enter>"
			..name.."<#>:  Th�t ��ng ti�c m�t thanh B�o ki�m.<enter>L�ng d�ng c�m m�i l� v� kh� quan tr�ng nh�t!<enter>"
			..name.."<#>:  �� l� c�i g�?<enter>N�m ��m! N�m ��m l� v� kh� l�i h�i nh�t m� ng��i c�, h�y d�ng n� �i d�p h�t chuy�n b�t b�nh c�a th� gian.<enter>"
			..name.."<#>:......C�m �n �ng, ta hi�u r�i.<enter>",
			1,"K�t th�c ��i tho�i/branch_leqingqiu3")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_LeQingQiu.."<#>:  C� ng��i su�t ��i ch� bi�t �n b�m v�o s� b� th� c�a ng��i kh�c!",1,"K�t th�c ��i tho�i/no")
	end
end
-----------------------------------------------------------�Ĺ�--------------------------------------------------------------------------
function branch_dugun()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 60) or ( Uworld1054 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,70)
			Describe(name.."<#>:  A, ng��i ��n r�i.<enter>"
			..DescLink_DuGun.."<#>:  N�i ai v�y?<enter>"
			..name.."<#>:  Ch�nh l� ng��i! Qua ��y.<enter> H�! Ng��i ch�n s�ng r�i �? <enter>"
			..name.."<#>:  ��ng ��a! L�c Thanh Thu n� ng��i bao nhi�u ti�n? <enter>Ng��i c� ti�n tr� kh�ng m� h�i?<enter>"
			..name.."<#>:  Chuy�n nh�! Ngo�i tr� ti�n c�n c�ch n�o kh�c kh�ng.<enter> C�n! Nh�ng ng��i kh�ng l�m n�i ��u.<enter>"
			..name.."<#>:  C� g� c� n�i ��ng �p �p m� m�.<enter> ���c! Ra ngo�i th�nh l�y m�ng L� Tr��ng Thi�n, m�n n� c�a h� L�c kh�ng ph�i tr�.<enter>"
			..name.."<#>: ���c.<enter>",
			1,"K�t th�c ��i tho�i/branch_dugun1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1054 == 90 ) or ( Uworld1054 == 100 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,100)
			Describe(name.."<#>:  Ng��i ta �� ti�u di�t xong.<enter>"
			..DescLink_DuGun.."<#>:  Ng��i.....th�t s� �� l�y m�ng L� Tr��ng Thi�n?<enter>"
			..name.."<#>:  Kh�ng tin �? H�y ��n Nha m�n xem th�.<enter> ��i hi�p! M�n n� c�a h� L�c �� ���c x�a.<enter>",
			1,"K�t th�c ��i tho�i/branch_dugun2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_DuGun.."<#>:  Thi�u n� tr� ti�n, gi�t ng��i ��n m�ng.",1,"K�t th�c ��i tho�i/no")
	end
end		
---------------------------------------------------˫ӥ�ھ�����------------------------------------------------------
function branch_shuangying()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 20) or ( Uworld1055 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,30)
			Describe(name.."<#>:  Ch�o �ng! Tal� ng��i c�a Nam V�n ph�i ��n!.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  Li�u S� ph� ph�i ng��i ��n?! B�ng h�u xin m�i ng�i.<enter>"
			..name.."<#>:  M�c d� ta ra giang h� ch�a l�u, nh�ng danh ti�ng Song �ng ti�u c�c nh� s�m n� b�n tai, l�n n�y t�i sao l�i th�m th�?<enter> So v�i Ti�u c�c kh�c ch�ng ta �� may m�n �t t�n th�t h�n. ��i th� qu� ra tay ��c �c, m�y m��i n�m qua ch�a g�p Th� ph� n�o m�nh th� nh� v�y.<enter>"
			..name.."<#>:  C� g� kh� n�i v�y?<enter> Ti�u c�c ta c� m�t ng��i may m�n tho�t kh�i, y t�n A Ng�u, �ang � trong th�nh, ng��i h�y ��n t�m h�n.<enter>"
			..name.."<#>:  ���c.<enter>Mong ng��i s�m t�m ra t�n kh�n ��, ta thay m�t 30 ti�u c�c c�m �n ng��i.<enter>",
			1,"K�t th�c ��i tho�i/branch_shuangying1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  V�n ti�u nhi�u n�m, h�m nay coi nh� xong r�i, s�m bi�t s� c� ng�y n�y.",1,"K�t th�c ��i tho�i/no")
	end
end		
-----------------------------------------------------��ţ------------------------------------------------------------------------------
function branch_aniu()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 40) or ( Uworld1055 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,50)
			Describe(name.."<#>:  A Ng�u, Ch� nh�n Ti�u c�c b�o ta ��n t�m huynh, h�i th�m tin t�c ti�u xa b� c��p.<enter>"
			..DescLink_ANiu.."<#>:  Ng��i l� tr� th� m� c�c ch� t�m ���c �?<enter>"	
			..name.."<#>:  ��ng! <enter>B�ng h�u, ng��i h�y v� �i! C�c ch� �� t�m ���c 3 v� cao th�, nh�ng ng��i n�y trong qu� tr�nh �i�u tra tung t�ch �� m�t t�ch m�t c�ch b� �n<enter>"
			..name.."<#>:  Ta �� nh�n l�i th� kh�ng bao gi� r�t lui.<enter>Ng��i khi�n ta c�m th�y h�m m�! Hy v�ng ng��i s� l� ng��i ngo�i l�.<enter>"
			..name.."<#>:  Ta s� ch�ng minh cho huynh th�y b�n l�nh c�a ta!<enter> T�t l�m! ��ng n�i su�ng nh�!<enter>"
			..name.."<#>:  Huynh kh�ng tin th� ta �i ��y!<enter>B�ng h�u! Khoan �i ��! Ta c� chuy�n mu�n n�i.<enter>"
			..name.."<#>:  Chuy�n g�?<enter>Kh�i gi�p n�y t�ng cho ng��i! Mong l� c�c ch� �� kh�ng nh�n l�m ng��i!<enter>"
			..name.."<#>:  �a t�!<enter>",
			1,"L�y ���c �o gi�p b�n h�y ki�m tra t� m�./branch_aniu1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_ANiu.."<#>:  ��m ng��i �� th�n ph�p nh� t�n b�n! Ng��i ph�i h�t s�c c�n th�n!",1,"K�t th�c ��i tho�i/no")
	end
end

----------------------------------------------------------��ǹ�ھ�����-------------------------------------------------------------------
function branch_lengqiang()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 60) or ( Uworld1055 == 70 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,70)
			Describe(name.."<#>:  Ho�c c�c ch�.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  Cho d� C�c h� l� ai, l�o phu �� r�a tay g�c ki�m, kh�ng m�ng chuy�n giang h� n�a.<enter>"
			..name.."<#>:  C� v�ng T�y B�c xu�t hi�n ��o t�c c��p ti�u xa, ph�m nhi�u huy�t �n. Ch�ng l� �ng ch� bi�t nh�n th�i �? <enter> Ti�u t�! Ng��i bi�t c�i g�? T�i ngh� bao nhi�u m� h�ng h�ch th�? <enter>"
			..name.."<#>:  Qu� C�ng T� kh�e kh�ng?<enter>Kh�ng xong r�i! ��i phu n�i n�u kh�ng c� 50 b� �c kh� � Th�c C��ng s�n th� ta s� ph�i g�p c�nh ng��i ��u b�c ti�n ng��i ��u xanh.<enter>"
			..name.."<#>:  V�y ���c!<enter>",
			1,"K�t th�c ��i tho�i/branch_lengqiang1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif (( Uworld1055 == 80) or ( Uworld1055 == 90 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,90)
			Describe(name.."<#>:  Ho�c c�c ch�, �c kh� ta �� �em v� r�i.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  B�ng h�u, ch�ng ta giang th�y t��ng ph�ng, ng��i h� t�t ph�i nh� th�.<enter>"
			..name.."<#>:  Gi�p nhau l� chuy�n th��ng t�nh <enter>���c r�i! Lai l�ch t�n n�y ta �� x�c ��nh r�. B�n h� l� H� Hoa ��o, th��ng xu�t hi�n g�n C�n L�n ph�i. Nh�ng xin C�c h� h�y tha cho h� con ���ng s�ng. Ta t�ng ng��i m�t vi�n B�o th�ch t� l� �� t� ch�t l�ng th�nh.<enter>",
			1,"K�t th�c ��i tho�i/branch_lengqiang2")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1055 == 110 ) or ( Uworld1055 == 120 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,120)
			Describe(name.."<#>:  Ho�c c�c ch�, ngh� t�nh �ng ta kh�ng gi�t b�n h�. Nh�ng ta mu�n h�i �ng t�i sao l�i tha cho b�n h�?<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  Th�t ra c�c c� �y ��u l� con nh� gia gi�o, Thanh Minh n�m �� khi ra ngo�i d�o b� t�n Ti�u S� l�m nh�c. Sau �� c�c c� ���c D� nh�n gi�p �� h�c ���c v� c�ng, b�n h� m�i b�t ��u c��p ti�u. Th�t s� b�n t�nh c�a h� kh�ng x�u.<enter>"
			..name.."<#>:  Th� ra l� th�, ai c�ng c� n�i kh� ri�ng, ch� mong qua l�n n�y b�n h� s� r�t ���c kinh nghi�m. N�u kh�ng s� c� ng�y b� ng��i kh�c gi�t ch�t.<enter>Ch� nh�n L�nh Th��ng Ti�u c�c: Ch� mong nh� th�.<enter>",
			1,"K�t th�c ��i tho�i/branch_lengqiang3")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  Ng��i trong giang h� s�m ��t cho ngo�i hi�u Ho�c L�nh Th��ng, nh�ng t� khi l�p gia th�t, ta �� kh�ng c�n nh� x�a n�a!",1,"K�t th�c ��i tho�i/no")
	end
end
---------------------------------------------------��׷��-----------------------------------------------------------------------------
function branch_longzhuiwu()
	Uworld1057 = nt_getTask(1057)
	local name = GetName()
	if ( Uworld1057 == 80) then
		if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
			Describe(name.."<#>:  Long Truy V�, ng��i bi�t Li�u Nam V�n kh�ng.<enter>"
			..DescLink_LongZhuiWu.."<#>:  H�! Sao l�i kh�ng bi�t! M��i n�m tr��c, ch�nh ta �� khi�n h�n tuy�t t� tuy�t t�n.<enter>"
			..name.."<#>:  M�n n� n�y h�m nay ng��i s� ph�i tr�.<enter> Ta � ngo�i th�nh ch� ng��i.<enter>",
			1,"K�t th�c ��i tho�i/branch_longzhuiwu1")
		else
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n v��t qu� ��ng c�p nhi�m v� y�u c�u, kh�ng th� ti�p nh�n n�a! Th�t ng�i qu�! ")
		end
	elseif ( Uworld1057 >= 90 ) then
		Talk(1,"","��ng gi�t ta! Ta ch� l� �� �� c�a Long Truy V�, gi� d�ng h�n g�t ng��i m� th�i.")
	else
		Talk(1,"","��ng c� su�t ng�y phi�n ta.")
	end
end


function branch_jiangyixiao1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_leqingqiu1()
	AddOwnExp(5000)
	nt_setTask(1054,60)
	Msg2Player("B�n h�a gi�p L�c Thanh Thu gi�i quy�t m�n n� c�a anh ta.")
end

function branch_leqingqiu2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,0)
	nt_setTask(1054,130)
	Msg2Player("L�c Thanh Thu n�i ki�m �ang b� (Nh�n v�t V� l�m) � ngo�i th�nh gi�, b�o b�n n�n nhanh tay �o�t l�y!")
end

function branch_leqingqiu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level20();
end

function branch_dugun1()
	AddOwnExp(5000)
	nt_setTask(1054,80)
	Msg2Player("B�o k� s�ng b�c b�o b�n ch� c�n ti�u di�t Bang ch�  L� Tr��ng Thi�n s� x�a kho�n n� c�a L�c Thanh Thu.")
end

function branch_dugun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shuangying1()
	AddOwnExp(15000)
	nt_setTask(1055,40)
	Msg2Player("Ch� nh�n Song �ng Ti�u c�c b�o b�n �i t�m A Ng�u, �ng hy v�ng b�n c� th� gi�i quy�t kh� kh�n n�y.")
end

function branch_aniu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang1()	
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(15000)
	nt_setTask(1012,10)
	nt_setTask(1055,80)
	AddPlayerEvent(3) 
	Msg2Player("Ch� nh�n L�nh Th��ng Ti�u c�c b�o b�n �i Th�c C��ng S�n gi�t 50 con kh� x�m, l�y �c kh� v� tr� b�nh cho con �ng ta.")
end

function branch_lengqiang2()	
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang3()	
	AddOwnExp(15000)
	nt_setTask(1055,130)
	Msg2Player("Ch� nh�n L�nh Th��ng Ti�u c�c cu�i c�ng �� r� lai l�ch th�t s� c�a H� Hoa ��o. B�n c� th� quay v� g�p Li�u Nam V�n ph�c m�nh.")
end

function branch_longzhuiwu1()
	Msg2Player("Long Truy V� khinh th��ng b�n, n�i r�ng h�n ��i b�n ngo�i th�nh.")
end

function no()
end
