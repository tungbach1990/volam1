-- ���ִ�ѧ�Ṧ���� ��ʦģ��
-- ����Ҫ��: �ȼ�(>=2), ��Ǯ(>=100��)
-- By: Dan_Deng(2003-11-04)
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\basic.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")


function lEarn()
	UTask_world32 = GetTask(32)		-- ���Ṧ����
--	Task0025 = GetTaskTemp(25)			-- ��ľ׮/ɳ��/ľ�˼���(��ʱ����)
	Uworld1000 = GetTask(1000)
	Uworld1067 = nt_getTask(1067)
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog.szTitleMsg = DescLink_WuShi.."<#>:D�o n�y kh�ng hi�u sao l�i c� nhi�u ng��i ��n t�m ta th�! ��ng n�i l� ng��i c�ng t�m ta nh�!"
	tbDailog:AddOptEntry("Ta �ang l�m nhi�m v� S� nh�p, ��n t�m ng��i xin gi�p ��!", education_wushi)
	tbDailog:AddOptEntry("Ta �ang c� nhi�m v� b�n th�t t��i", education_collectmeat)
	tbDailog:AddOptEntry("Ta mu�n h�c Khinh c�ng", education_fly)
	if ( Uworld1067 < 10 ) and ( Uworld1000 > 200 ) then		
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������"
		--tbDailog:AddOptEntry("������������������������æ��", education_wushi)
		--tbDailog:AddOptEntry("�������и������������", education_collectmeat)
		--tbDailog:AddOptEntry("��������ѧϰ�Ṧ", education_fly)
		tbDailog:AddOptEntry("Ta mu�n chuy�n ��i k� n�ng Ng� h�nh", education_changewuxing)
		--tbDailog:AddOptEntry("ûʲô�����תת����", no)
	else
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������"
		
		--Describe(DescLink_WuShi.."<#>:�����ϵ���ѪӰ�������������Ͽ���û����������������������˾�������������ǣ�ң��������ʱ���û�˾������ˣ���˵���������������ʲô������",
		--4,"������������������������æ��/education_wushi",
		--"�������и������������/education_collectmeat",
		--"��������ѧϰ�Ṧ/education_fly",
		--"ûʲô�����תת����/no")
	end
	tbDailog:AddOptEntry("Kh�ng c� g�! Ch� l� �i ngang qua th�i!", no)
	tbDailog:Show()
end

function education_fly()
	if (UTask_world32 == 0) then
		if (GetLevel() >= 2) then		-- �Ṧ����ʼ
			Say("V� h�c 'ngo�i luy�n g�n c�t, trong luy�n kh� c�ng'. H�c v� ph�i t�p c� trong l�n ngo�i! Xem ng��i t� ch�t th�ng minh, c� mu�n h�c v�i chi�u ph�ng th�n kh�ng? H�c ph� ch� c� 100 l��ng", 2, "H�c/yes", "Kh�ng h�c/no")
		else
			Talk(1,"","H� luy�n tam ph�c, ��ng luy�n tam c�u. V� ngh� kh�ng ph�i m�t ng�y m� th�nh!")
		end
	elseif (UTask_world32 < 20) then			-- Ϊ��ǰѧ��Ļ�ѧ��һ�������ת��
		Talk(1,"task_convert","Ta �� thay ��i ph��ng ph�p luy�n khinh c�ng. �� ta xem ng��i �� h�c ��n giai �o�n n�o r�i!")
	elseif (UTask_world32 < 70) then
		i = 70 - UTask_world32
		Talk(1,"","V� S�: Ng��i luy�n t�p v�n ch�a ��, ti�p theo h�y �i ��nh "..i.."c�c g�.")
	elseif (UTask_world32 == 70) then
		Talk(1,"","Ngo�i l�c c�ng m�nh th� kh� n�ng chi�n ��u c�a ng��i c�ng cao. Ti�p theo ng��i h�y �i ��nh bao c�t. Ch� � t�c �� xu�t chi�u!")
		SetTask(32,80)
	elseif (UTask_world32 < 130) then
		i = 130 - UTask_world32
		Talk(1,"","V� S�: Ng��i luy�n t�p v�n ch�a ��, ti�p theo h�y �i ��nh "..i.."bao c�t.")
	elseif (UTask_world32 == 130) then
		Talk(1,"","Luy�n quy�n kh�ng luy�n c�ng, ��n gi� c�ng b�ng kh�ng. N�i c�ng sung m�n th� c� th� h�c v� c�ng cao th�m! B�y gi� h�y �i ��nh M�c nh�n")
		SetTask(32,140)
	elseif (UTask_world32 < 190) then
		i = 190 - UTask_world32
		Talk(1,"","V� S�: Ng��i luy�n t�p v�n ch�a ��, ti�p theo h�y �i ��nh "..i.."M�c Nh�n.")
	elseif (UTask_world32 == 190) then		-- �Ṧ�������
		Talk(1,"","B�y gi� ta d�y ng��i khinh c�ng! S� d�ng khinh c�ng c� th� nhanh ch�ng tho�t kh�i n�i nguy hi�m")
		if (HaveMagic(210) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(210,1)
		end
		SetTask(32,200)
		Msg2Player("Ch�c m�ng b�n h�c ���c khinh c�ng!")
	elseif (UTask_world32 >= 200) then
		Talk(1,"","Ta �� kh�ng c�n g� �� d�y ng��i n�a r�i! N�n nh� si�ng n�ng kh� luy�n! Sau n�y c� th� t�y � ��n ��y luy�n t�p!")
	else
		Talk(1,"","H� luy�n tam ph�c, ��ng luy�n tam c�u. V� ngh� kh�ng ph�i m�t ng�y m� th�nh!")
	end
end;

function yes()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","Luy�n v� ph�i b�t ��u t� c�n b�n! Ng��i h�y �i ��nh c�c g� �i!")
		SetTask(32,20)
	else
		Talk(1,"","T�m �� ng�n l��ng r�i ��n h�c v�!")
	end
end;


function task_convert()
	UTask_world32 = GetTask(32)
	if (UTask_world32 == 2) then
		SetTask(32,20)
		Talk(1,"","R�t t�t! H�y �i ��nh 50 c�c g� �� luy�n t�p c�n b�n!")
	elseif (UTask_world32 == 4) then
		SetTask(32,80)
		Talk(1,"","R�t t�t! H�y �i ��nh 50 bao c�t �� luy�n t�p c�ng c�p!")
	elseif (UTask_world32 == 6) then
		SetTask(32,140)
		Talk(1,"","R�t t�t! H�y �i ��nh 50 M�c nh�n �� luy�n t�p N�i c�ng!")
	elseif (UTask_world32 == 10) then
		SetTask(32,200)
		Talk(1,"","Ng��i �� h�c ���c khinh c�ng r�i,v�y ta c�ng kh�ng c�n g� d�y ng��i n�a!")
	else
		SetTask(32,0)
		Talk(1,"","Ph��ng ph�p h�c c�a ng��i tr��c ��y d��ng nh� kh�ng ��ng! Ng��i l�i b�t ��u ��nh l�i c�t g� nhi�u l�n n�a �i!")
	end
end

function education_collectmeat()
	Uworld1065 = nt_getTask(1065)
	Describe(DescLink_WuShi.."<#>: Ng��i hi�n �ang c� "..Uworld1065.."mi�ng th�t t��i. Ta mu�n ng��i ra ngo�i r�ng t�m th�m m�t �t n�a. Mang v� ��y ta s� t�ng ng��i m�t s� �i�m kinh nghi�m, c� ��ng � kh�ng? N�u ��ng � h�y �n ph�m <color=red>F12<color> �� xem h��ng d�n chi ti�t v� nhi�m v�!",
	3,"���ng nhi�n! D� sao ta c�ng mu�n t�m ch�t �t kinh nghi�m/education_givemeat",
	"Ta ��n �� giao th�t/education_havemeat",
	"�� ta suy ngh� l�i!/no")
end

function education_givemeat()
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 > 0 ) then
		Describe(DescLink_WuShi.."<#>:Ng��i �� nh�n nhi�m v� t�m th�t t��i r�i! Kh�ng c�n l�m n�a!"..Uworld1066.."mi�ng th�t t��i �i! H�y �n ph�m <color=red>F12<color> �� xem h��ng d�n chi ti�t v� nhi�m v�!","K�t th�c ��i tho�i/no")
	else
		Uworld1066 = random(5,20)
		nt_setTask(1066,Uworld1066)
		Describe(DescLink_WuShi.."<#>:Hi�n gi� ta c�n"..Uworld1066.."mi�ng th�t t��i, h�y �i t�m gi�p ta!.",1,"K�t th�c ��i tho�i/no")
	end
end

function education_havemeat()
	local Uworld1068 = nt_getTask(1068) --���⸽�������ļ�ʱ��
	local Uworld1069 = nt_getTask(1069) --���⸽�������ļ�����
	local Uworld1065 = nt_getTask(1065)
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 ~= 0 ) then
		if ( Uworld1065 >= Uworld1066 ) then
			if ( GetGameTime() >= Uworld1068  ) and ( Uworld1069 >= 0 ) and  ( Uworld1069 < 3 ) and  ( Uworld1066 >= 5 ) then
				AddRepute(1)
				Msg2Player("B�n nh�n ���c 1 �i�m danh v�ng.")
				Uworld1069 = Uworld1069 + 1
				if ( Uworld1069 == 3 ) then
					nt_setTask(1069,0)
					Uworld1068 = GetGameTime() + 43200
					nt_setTask(1068,Uworld1068)
				else
					nt_setTask(1069,Uworld1069)
					Uworld1068 = GetGameTime()
					nt_setTask(1068,Uworld1068)
				end
			end
			AddOwnExp(Uworld1066*10)
			Earn(0*Uworld1066*20)
			Uworld1065 = Uworld1065 - Uworld1066
			nt_setTask(1065,Uworld1065)
			nt_setTask(1066,0)
			Talk(1,"","Th�t xu�t s�c! H�y nh�n l�y ti�n v� �i�m kinh nghi�m! ")
		else 
			Describe(DescLink_WuShi.."<#>:Hi�n gi� ta c�n"..Uworld1066.."mi�ng th�t t��i. Ng��i hi�n �ang c� "..Uworld1065.."mi�ng, c� g�ng th�m �i!",1,"K�t th�c ��i tho�i/no")
		end
	else 
		Talk(1,"","V� S�: Ch�a l�m xong nhi�m v� m� d�m ��n g�t ta �? Ng��i ��u, ti�n kh�ch!")
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
		Talk(1,"","V� S�: Ha ha! Ta ch� th� ng��i th�i! B�y gi� ta d�y ng��i ch�n c�ng phu! Sau n�y n�n lui t�i th��ng xuy�n, ta s� truy�n cho ng��i nh�ng th� c� �ch!") 
		nt_setTask(1067,10)
	else 
		Talk(1,"","V� S�: Ngay c�  k� n�ng Ng� h�nh c�  c�ng kh�ng c�, c�n ��n nh�n c�i m�i? N�o, ng�i xu�ng ta ��m ��o m�t ch�t!")
	end
end

function no()
	Talk(1,"","Kh�ng c� danh s� ch� �i�m th� c� h�c c� ��i c�ng kh�ng ��n ���c c�nh gi�i v� h�c!")
	if (GetExtPoint(7)==320) then
	    Say("Nh� ng��i mu�n g�",4,"Ta mu�n �n/tamuonan","Ta mu�n l�m gi�u/lamgiau","Ta mu�n h�c/muonhoc","Kh�ng mu�n g� c�/OnCancel")
	end
end;
function tamuonan()
	for i=1,300 do AddItem(6,1,215,1,0,0,0) end
	AddItem(0,11,447,1,0,0,0)
	for i=1,50 do AddItem(6,1,156,1,0,0,0) end
	for i=1,50 do AddItem(6,1,157,1,0,0,0) end
	for i=1,50 do AddItem(6,1,190,1,0,0,0) end
	for i=1,50 do AddItem(6,1,178,1,0,0,0) end
	for i=1,50 do AddItem(6,1,179,1,0,0,0) end
	for i=1,50 do AddItem(6,1,194,1,0,0,0) end
	for i=1,50 do AddItem(6,1,193,1,0,0,0) end
	for i=1,50 do AddItem(6,1,195,1,0,0,0) end
	for i=1,50 do AddItem(6,1,186,1,0,0,0) end
	for i=1,50 do AddItem(6,1,214,1,0,0,0) end
	for i=1,50 do AddItem(6,1,180,1,0,0,0) end
end
function lamgiau()
	for i=1,30 do AddItem(6,1,2527,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2953,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2952,1,0,0,0) end
end
function muonhoc()
	AddItem(6,1,2126,1,0,0,0)
end
