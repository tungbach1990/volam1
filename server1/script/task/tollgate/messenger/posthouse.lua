-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-04 15:30:14
-- Desc			:	����������ٽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\lib\\awardtemplet.lua")--�������ӿ�

IncludeLib("RELAYLADDER");	--���а�


--���������ȥ�������е����������Ӧ��        60-89����90-119����120��������
--citygo �Ĺ��췽ʽ
--�������е������������Ӧֵ����ǰ�������֣�ȥ���������֣�ϵ������id����ǰ����id��ȥ�����е�ͼid��x��y
--1201 ��a tin nhi�m v� phong chi k� nhi�m v� thay ��i l��ng 
--1202 ��a tin nhi�m v� mi�u s�n th�n nhi�m v� thay ��i l��ng 
--1203 ��a tin nhi�m v� thi�n b�o kho nhi�m v� thay ��i l��ng

citygo = {
---- D��ng Ch�u �i nh�ng th�nh th� kh�c (mapid:80) 
{1204,1,"D��ng Ch�u","Bi�n Kinh",1201,80,37,1601,3001}, 
{1204,2,"D��ng Ch�u","Ph��ng T��ng ",1201,80,1,1561,3114}, 
{1204,3,"D��ng Ch�u","L�m An",1201,80,176,1592,2925}, 
{1204,4,"D��ng Ch�u","Th�nh ��",1201,80,11,3021,5090}, 
{1204,5,"D��ng Ch�u","T��ng D��ng",1201,80,78,1596,3379}, 
{1204,6,"D��ng Ch�u","��i L�",1201,80,162,1674,3132}, 

---- bi�n kinh �i nh�ng th�nh th� kh�c (mapid:37) 
{1204,7,"Bi�n Kinh","D��ng Ch�u",1201,37,80,1676,3000}, 
{1204,8,"Bi�n Kinh","Ph��ng T��ng ",1201,37,1,1561,3114}, 
{1204,9,"Bi�n Kinh","L�m An",1201,37,176,1592,2925}, 
{1204,10,"Bi�n Kinh","Th�nh ��",1201,37,11,3021,5090}, 
{1204,11,"Bi�n Kinh","T��ng D��ng",1201,37,78,1596,3379}, 
{1204,12,"Bi�n Kinh","��i L�",1201,37,162,1674,3132},

---- ph��ng t��ng �i nh�ng th�nh th� kh�c (mapid:1) 
{1204,13,"Ph��ng T��ng","D��ng Ch�u",1202,1,80,1676,3000}, 
{1204,14,"Ph��ng T��ng","Bi�n Kinh",1202,1,37,1601,3001}, 
{1204,15,"Ph��ng T��ng","L�m An",1202,1,176,1592,2925}, 
{1204,16,"Ph��ng T��ng","Th�nh ��",1202,1,11,3021,5090}, 
{1204,17,"Ph��ng T��ng","T��ng D��ng",1202,1,78,1596,3379}, 
{1204,18,"Ph��ng T��ng","��i L�",1202,1,162,1674,3132}, 
-- 
---- tr��c khi an �i nh�ng th�nh th� kh�c (mapid:176) 
{1204,19,"L�m An","D��ng Ch�u",1202,176,80,1676,3000}, 
{1204,20,"L�m An","Ph��ng T��ng",1202,176,1,1561,3114}, 
{1204,21,"L�m An","Bi�n Kinh",1202,176,37,1601,3001}, 
{1204,22,"L�m An","Th�nh ��",1202,176,11,3021,5090}, 
{1204,23,"L�m An","T��ng D��ng",1202,176,78,1596,3379}, 
{1204,24,"L�m An"," ��i L� ",1202,176,162,1674,3132}, 
-- 
---- th�nh �� �i nh�ng th�nh th� kh�c (mapid:11) 
{1204,25,"Th�nh ��","D��ng Ch�u",1203,11,80,1676,3000}, 
{1204,26,"Th�nh ��","Ph��ng T��ng",1203,11,1,1561,3114}, 
{1204,27,"Th�nh ��","Bi�n Kinh",1203,11,37,1601,3001}, 
{1204,28,"Th�nh ��","L�m An",1203,11,176,1592,2925}, 
{1204,29,"Th�nh ��","T��ng D��ng",1203,11,78,1596,3379}, 
{1204,30,"Th�nh ��","��i L�",1203,11,162,1674,3132},

---- t��ng d��ng �i nh�ng th�nh th� kh�c (mapid:78) 
{1204,31,"T��ng D��ng","D��ng Ch�u",1203,78,80,1676,3000}, 
{1204,32,"T��ng D��ng","Ph��ng T��ng",1203,78,1,1561,3114}, 
{1204,33,"T��ng D��ng","Bi�n Kinh",1203,78,37,1601,3001}, 
{1204,34,"T��ng D��ng","L�m An",1203,78,176,1592,2925}, 
{1204,35,"T��ng D��ng","Th�nh ��",1203,78,11,3021,5090}, 
{1204,36,"T��ng D��ng","��i L�",1203,78,162,1674,3132}, 
-- 
---- ��i L� �i nh�ng th�nh th� kh�c (mapid:162) 
{1204,37,"��i L�","D��ng Ch�u",1201,162,80,1676,3000}, 
{1204,38,"��i L�","Ph��ng t��ng",1201,162,1,1561,3114}, 
{1204,39,"��i L�","Bi�n kinh",1202,162,37,1601,3001}, 
{1204,40,"��i L�","L�m An",1202,162,176,1592,2925}, 
{1204,41,"��i L�","T��ng D��ng",1203,162,78,1596,3379}, 
{1204,42,"��i L�","Th�nh ��",1203,162,11,3021,5090}, 

--�ɶ�ȥ��������(mapid:11)
{1204,1,"Th�nh ��","��i L�",1203,11,162,1674,3132}, 

-- ��i L� �i nh�ng th�nh th� kh�c (mapid:162) 
{1204,2,"��i L�","Th�nh ��",1203,162,11,3021,5090},

}

-------------------------------------------������ʹ�����������-------------------------------------------------
function especiallymessenger()
	if ( nt_getTask(1270) == 0 ) then
		nt_setTask(1270,1)
		nt_setTask(1205,0)
		Msg2Player("Xin l�i, ng��i nh�n nhi�m v� t�n s� �� qu� h�n.")
	end

	--�ߴ��������ֻ�гɶ��ʹ���������
	local _, _, nMapIndex = GetPos()
	--local MapId = SubWorldIdx2ID( nMapIndex )
	--if MapId ~= 11 and MapId ~= 162 then
		--Talk(1,"","Tham gia nhi�m v� t�n s�, xin m�i �i t�m D�ch Quan <color=red> Th�nh �� <color> ho�c l� <color=red> ��i L� <color>!")
		--return
	--end
	nt_setTask(1211,0)
	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);--��������
	Describe(DescLink_YiGuan..": tri�u ��nh qu�n c� g�n nh�t t�ng b� kim t�c bi�t tr��c, ta ho�i nghi c� n�i gian. Nh�ng l�, � ph�t hi�n nh�ng b�i ho�i n�y tr��c, ta mu�n �� cho th� nh�n c�ng bi�t, ng��i ngh� v� qu�c gia t�n m�t ph�n l�c sao?",7,
	"Ta ��ng �!/messenger_ido",
	"Ta mu�n giao nhi�m v� t�n s�/messenger_finishtask", 
        "Ta mu�n h�y nhi�m v� t�n s�/messenger_losemytask", 
        "Ta mu�n th�ng c�p nhi�m v� t�n s� danh hi�u/messenger_getlevel", 
        "Ta mu�n l�y �i�m t�n s� �� ��i ph�n th��ng/messenger_duihuanprize", 
        "Ta mu�n t�m hi�u nhi�m v� t�n s�/messenger_what", 
        "G�n ��y ta c� chuy�n b�n r�n/no")
end


-------------------------------------------����������ʹ�����������-----------------------------------------------


function messenger_ido()
	local _, _, nMapIndex = GetPos()
	
	local Uworld1204 = nt_getTask(1204)  --�Ǣ���ҵ����������ÿ���������ʱ���
	local Uworld1028 = nt_getTask(1028)  --�������������
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( GetLevel() < 120 ) then
		Describe(DescLink_YiGuan..": Th�t xin l�i, tr��c m�t c�p b�c c�a ng��i kh�ng �� 120 c�p. Ti�p t�c luy�n t�p sau �� t�i th�y ta.",1,"K�t th�c ��i tho�i/no")	
	elseif ( Uworld1204 ~= 0 )  then
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i nhi�m v� t�n s� kh�ng ho�n th�nh, kh�ng th� nh�n gi�ng nhau nhi�m v�, xin m�i ho�n th�nh nhi�m v� tr��c, c�m �n!",1,"K�t th�c ��i tho�i/no")
	elseif (  messenger_givetime() == 10 ) then  --�鿴�����Ƿ��йؿ�ʱ��
		Describe(DescLink_YiGuan.."Th�t xin l�i , ng�i h�m nay � nhi�m v� t�n s�, th�i gian �� hao h�t, xin m�i ng�y mai tr� l�i",1,"K�t th�c ��i tho�i/no")
	else
    	        local nTaskFlag = check_daily_task_count()--��黹��û���������
    	if nTaskFlag == 0 then
    		Describe(DescLink_YiGuan..":Th�t xin l�i, h�m nay ng��i �� r�t m�t m�i, ng�y mai tr� l�i �i",1,"K�t th�c ��i tho�i/no")
    		return
    	elseif nTaskFlag == -1 then
    		Describe(DescLink_YiGuan..": h�m nay ng��i �� r�t m�t m�i. N�u nh� ng��i c� <color=yellow> thi�n b�o kho l�m <color>, ta �em ph� l� cho ng��i tham gia n�a m�t l�n.",1,"K�t th�c ��i tho�i/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("Ng��i ch� �� � c�m thi�n b�o kho l�m tham gia nhi�m v� <color=yellow> nhi�m v� ho�n th�nh <color> ta �em thu h�i l�nh b�i")
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] Nh�n nhi�m v� t�n s�, h�m nay �� ho�n th�nh [%d] l�n",
				GetAccount(),
				GetName(),
				nTaskFlag
				)
			);
	if nTaskFlag == 2 then
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSuSuDungThienBaoKhoLenh")		
	else
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSu")
	end
		if ( MapId == 80 ) then
			local CityId = random(1,6)
			for i=1,6 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 37 ) then
			local CityId = random(7,12)
			for i=7,12 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 1 ) then
			local CityId = random(13,18)
			for i=13,18 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end	
		elseif ( MapId == 176 ) then
			local CityId = random(19,24)
			for i=19,24 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end		
		elseif ( MapId == 11 ) then
			

			local CityId = random(25,30)
			for i=25,30 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end		
		elseif ( MapId == 78 ) then
			local CityId = random(31,36)
			for i=31,36 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		elseif ( MapId == 162 ) then
			
			local CityId = random(37,42)
			for i=37,42 do
				if ( messenger_choice(CityId,i) == 10 ) then
					break
				end
			end
		else
			Msg2Player("Th�t xin l�i ! Kh�ng hi�u t�i sao ng��i kh�ng th� nh�n nhi�m v� t�n s�, xin li�n l�c GM!")
		end
	end
end

--ǰ��ǧ����
function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
end

-----------------------------------------------������Ҫ������һ��������ʹ���񣬲��ı�����ʹ��������͵���ؿ�����------------------------
function messenger_choice(CityIdTwo,j)
	if ( CityIdTwo == citygo[j][2] ) then	
		--�����ɴ˵�ȥ�˵ص��������	
		nt_setTask( 1204,citygo[j][2] )
		--����ȥ���ĸ��ؿ����������   
		nt_setTask( citygo[j][5],10) --������ʹ����Ĳ���
		local name = GetName()
		Talk(1,"","��i nh�n �� nh�n ���c nhi�m v� T�n S� t� "..citygo[j][3].." ��n "..citygo[j][4]..", h�y kh�i h�nh t�i D�ch Tr�m "..citygo[j][3]..". Xin b�o tr�ng "..name.." ��i nh�n!")		
		return 10
	end
end


---------------------------------------------------������ʹ�ƺ�----------------------------------------------------------------------
function messenger_getlevel()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local messenger_reallevelname = ""
	if ( Uworld1206 == 1 ) then
		messenger_reallevelname = "M�c b�i t�n s�"
	elseif ( Uworld1206 == 2 ) then
		messenger_reallevelname = "��ng b�i t�n s�"
	elseif ( Uworld1206 == 3 ) then
		messenger_reallevelname = "Ng�n b�i t�n s�"
	elseif ( Uworld1206 == 4 ) then
		messenger_reallevelname = "Kim b�i t�n s�"
	elseif ( Uworld1206 == 5 ) then
		messenger_reallevelname = "Ng� t� kim b�i t�n s�"
	else	
		messenger_reallevelname = "Kh�ng c� b�t k� t�n s� n�o"
	end 
	Describe(DescLink_YiGuan.."Ng�i tr��c m�t l� "..messenger_reallevelname.." , ng�i t�ch l�y �i�m t�n s� v� "..Uworld1205.." �i�m, ng�i mu�n th�ng c�p l�m lo�i n�o t�n s� khi�n cho ��y",6,
		"M�c b�i t�n s�[50��]/messenger_levelmu",
		"��ng b�i t�n s�[150��]/messenger_leveltong",
		"Ng�n b�i t�n s�[450��]/messenger_levelyin",
		"Kim b�i t�n s�[800��]/messenger_leveljin",
		"Ng� t� kim b�i t�n s�[1500��]/messenger_levelyuci",
		"Ta ch�ng qua l� t�y ti�n xem m�t ch�t/no")
end

function messenger_levelmu()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 50 ) then
		if ( Uworld1206 < 1 ) then
			nt_setTask(1206,1)
			nt_setTask(1205,Uworld1205-50)
			Describe(DescLink_YiGuan..": Ch�c m�ng "..name.." ��i nh�n tr� th�nh t�n s� cho - m�c !",1,"K�t th�c ��i tho�i/no")
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_YiGuan..":"..name.."! Ng��i �� l� t�n s� - m�c, kh�ng c�n th�ng c�p , xin c� g�ng!",1,"K�t th�c ��i tho�i/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! C�p b�c c�a ng��i v��t qua t�n s� - m�c , xin/m�i l�a ch�n nh�ng kh�c tin/th� khi�n cho.",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th�t xin l�i ! Ng��i kh�ng ph� h�p th�ng c�p t�n s� - m�c �� �i�u ki�n, xin c� g�ng, c�m �n !!",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")
	end
end

function messenger_leveltong()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 150 )  then
		if ( Uworld1206 < 2 ) then
			nt_setTask(1206,2)
			nt_setTask(1205,Uworld1205-150)
			Describe(DescLink_YiGuan..": Ch�c m�ng "..name.." ��i nh�n �� l� t�n s� - ��ng !!",1,"K�t th�c ��i tho�i/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_YiGuan..":"..name.."! Ng��i �� l� t�n s� - ��ng, kh�ng c�n th�ng c�p, xin ti�p t�c c� g�ng !",1,"K�t th�c ��i tho�i/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! C�p b�c c�a ng��i v��t qua t�n s� - ��ng, xin m�i l�a ch�n nh�ng lo�i t�n s� kh�c.",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th�t xin l�i ! Ng��i kh�ng ��  �i�u ki�n ph� h�p th�ng c�p t�n s� - ��ng, xin ti�p t�c c� g�ng, c�m �n!",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")
	end
end

function messenger_levelyin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 450 ) then
		if ( Uworld1206 < 3 ) then
			nt_setTask(1206,3)
			nt_setTask(1205,Uworld1205-450)
			Describe(DescLink_YiGuan..": Ch�c m�ng "..name.." ng��i c�a th�ng c�p l�m ng�n t�n s�",1,"K�t th�c ��i tho�i/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_YiGuan..":"..name.."! Ng��i �� l� ng�n t�n s�, kh�ng c�n th�ng c�p, xin ti�p t�c c� g�ng !!",1,"K�t th�c ��i tho�i/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! C�p b�c c�a ng��i �� qua ng�n t�n s�, xin m�i l�a ch�n nh�ng t�n s� kh�c !",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th�t xin l�i ! Ng��i kh�ng �� �i�u ki�n ph� h�p th�ng c�p ng�n t�n s�, xin ti�p t�c c� g�ng !",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")
	end
end

function messenger_leveljin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 800 ) then
		if ( Uworld1206 < 4 ) then
			nt_setTask(1206,4)
			nt_setTask(1205,Uworld1205-800)
			Describe(DescLink_YiGuan..": Ch�c m�ng "..name.." ��i nh�n �� l� t�n s� - kim !",1,"K�t th�c ��i tho�i/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_YiGuan..":"..name.."! Ng��i �� l� t�n s� - kim, kh�ng c�n th�ng c�p, xin ti�p t�c c� g�ng !",1,"K�t th�c ��i tho�i/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! C�p b�c c�a ng��i �� qua t�n s� - kim, xin m�i l�a ch�n nh�ng t�n s� kh�c !",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th�t xin l�i ! Ng��i kh�ng �� �i�u ki�n ph� h�p th�ng c�p t�n s� - kim, xin ti�p t�c c� g�ng !",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")
	end
end

function messenger_levelyuci()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 1500 ) then
		if ( Uworld1206 < 5 ) then
			nt_setTask(1206,5)
			nt_setTask(1205,Uworld1205-1500)
			Describe(DescLink_YiGuan..": Ch�c m�ng "..name.." ��i nh�n th�ng c�p vi ng� t� t�n s� y�u b�i!",1,"K�t th�c ��i tho�i/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_YiGuan..":"..name.."Ng��i �� l� ng� t� t�n s� y�u b�i, kh�ng c�n th�ng c�p, xin ti�p t�c c� g�ng!",1,"K�t th�c ��i tho�i/no")				
		end
	else
		Describe(DescLink_YiGuan..":Th�t xin l�i ! Ng��i kh�ng �� �i�u ki�n ph� h�p th�ng c�p ng� t� t�n s� y�u b�i, xin ti�p t�c c� g�ng !",2,"Tr� v�/messenger_getlevel","K�t th�c ��i tho�i/no")
	end
end

--------------------------------------------����ʹ����------------------------------------------------------
function messenger_finishtask()
	local Uworld1201= nt_getTask(1201)	--���������֮���������
	local Uworld1202= nt_getTask(1202)	--��������ɽ�����������
	local Uworld1203= nt_getTask(1203)	--��������ǧ�����������
	local Uworld1204= nt_getTask(1204)	--�������������ص��������
	local Uworld1205= nt_getTask(1205)	--��ʹ����
	local Uworld1206= nt_getTask(1206)	--��ʹ�ƺ�
	local Uworld1208= nt_getTask(1208)	--��֮��ɱ�ּ�����
	local Uworld1209= nt_getTask(1209)	--ɽ����ɱ�ּ�����
	local Uworld1210= nt_getTask(1210)	--ǧ����ɱ�ּ�����
	local Uworld1218= nt_getTask(1218)  --��ʹ������ɴ���������

	if ( Uworld1201 == 30 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th�t xin l�i, ng��i kh�ng c� � ho�n th�nh t�n s� t�i nh�n l�y ph�n th��ng, nhi�m v� n�y xem th�t b�i !",1,"K�t th�c ��i tho�i/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.."Ch�c m�ng ng�i �� ho�n th�nh nhi�m v� hi�n t�i !",1,"Nh�n l�y ph�n th��ng/messenger_flyprize")
		end
	elseif ( Uworld1202 == 30 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th�t xin l�i, ng��i kh�ng c� � ho�n th�nh t�n s� t�i nh�n l�y ph�n th��ng, nhi�m v� n�y xem th�t b�i ",1,"K�t th�c ��i tho�i/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.."Ch�c m�ng ng�i �� ho�n th�nh nhi�m v� hi�n t�i",1,"Nh�n l�y ph�n th��ng/messenger_templeprize")
		end
	elseif ( Uworld1203 == 30 or Uworld1203 == 25 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan..":Th�t xin l�i, ng��i kh�ng c� � ho�n th�nh t�n s� t�i nh�n l�y ph�n th��ng, nhi�m v� n�y xem th�t b�i!",1,"K�t th�c ��i tho�i/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan..": Ch�c m�ng ng�i �� ho�n th�nh nhi�m v� hi�n t�i",1,"Nh�n l�y ph�n th��ng/messenger_treasureprize")
		end
	elseif ( Uworld1201 == 25 ) or ( Uworld1202 == 25 ) or ( Uworld1203 == 25 ) then   --����˼���ʹ����
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan.."Th�t xin l�i, ng��i kh�ng c� � ho�n th�nh t�n s� t�i nh�n l�y ph�n th��ng, nhi�m v� n�y xem th�t b�i",1,"K�t th�c ��i tho�i/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan.." Ch�c m�ng ng�i �� ho�n th�nh nhi�m v� hi�n t�i",1,"Nh�n l�y ph�n th��ng/messenger_simpleprize")	
		end
	elseif ( Uworld1201 ~= 0 or Uworld1202 ~= 0 or Uworld1203 ~= 0 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� t�n s� c�a ng�i ch�a ho�n th�nh, xin h�y ti�p t�c c� g�ng",1,"K�t th�c ��i tho�i/no")
	elseif Uworld1203 ~= 0 then
		Describe(DescLink_YiGuan..": Th�t xin l�i, ng��i c�n ch�a ho�n th�nh nhi�m v�. B�n c�nh ta c� l�o phu xe c� th� gi�p ng��i ��n nhi�m v� b�n �� !",1,"K�t th�c ��i tho�i/no")
	else
		Describe(DescLink_YiGuan..": Kh�ng ti�p nh�n v�, ng��i c�n t�i h�y nhi�m v� ! ng��i t�i, �em ng��i n�y cho ta l�m th�nh th�t ng��i b�nh bao !",1,"K�t th�c ��i tho�i/no")
	end
end

function messenger_flyprize()
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,4092,0,0,0}, nExpiredTime=43200, nBindState=-2}, "test", 1);
	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local Uworld1207 = nt_getTask(1207)
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch�c m�ng ng��i thu ���c "..i.." �i�m danh v�ng. ")
	if ( nt_getTask(1224) ~= 1 ) then
		if ( GetLevel()>=60 and GetLevel()<=89 ) then
			if ( nt_getTask(1223) >= 150 ) then
				messenger_giveplayerexp(1500000)
			end
		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
			if ( nt_getTask(1223) >= 200 ) then
				messenger_giveplayerexp(2000000)
			end			
		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
			if ( nt_getTask(1223) >= 300 ) then
				messenger_giveplayerexp(3000000)
			end		
		elseif ( GetLevel()>=130 ) then
			if ( nt_getTask(1223) >= 600 ) then
				messenger_giveplayerexp(6000000)
			end		
		end
	end
	
	nt_setTask(1201,0)	--���������֮���������
	nt_setTask(1204,0)	--�������������ص��������
	nt_setTask(1207,0)	--��������ǰɱ�ּ���
	nt_setTask(1211,0)
end

function messenger_templeprize()

tbAwardTemplet:GiveAwardByList({tbProp = {6,1,4092,0,0,0}, nExpiredTime=43200, nBindState=-2}, "test", 1);
 	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local Uworld1207 = nt_getTask(1207)
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch�c m�ng ng��i thu ���c "..i.." �i�m danh v�ng. ")
	if ( nt_getTask(1224) ~= 1 ) then
		if ( GetLevel()>=60 and GetLevel()<=89 ) then
			if ( nt_getTask(1223) >= 150 ) then
				messenger_giveplayerexp(1500000)
			end
		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
			if ( nt_getTask(1223) >= 200 ) then
				messenger_giveplayerexp(2000000)
			end			
		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
			if ( nt_getTask(1223) >= 300 ) then
				messenger_giveplayerexp(3000000)
			end		
		elseif ( GetLevel()>=130 ) then
			if ( nt_getTask(1223) >= 600 ) then
				messenger_giveplayerexp(6000000)
			end		
		end
	end
	
	nt_setTask(1202,0)	--��������ɽ�����������
	nt_setTask(1204,0)	--�������������ص��������
	nt_setTask(1207,0)	--��������ǰɱ�ּ���
	nt_setTask(1211,0)
end

function messenger_treasureprize()
  local nTaskFlag = check_daily_task_count()--��黹��û���������
  if nTaskFlag == 0 then
  	Describe(DescLink_YiGuan..": Th�t xin l�i, h�m nay ng��i �� r�t m�t m�i. Ng�y mai tr� l�i ��i nhi�m v� �i",1,"K�t th�c ��i tho�i/no")
  	return
  elseif nTaskFlag == -1 then
  	Describe(DescLink_YiGuan..": Ng��i c� ph�i hay kh�ng c�m <color=yellow> thi�n b�o kh� l�nh <color> b� m�t ? T�m v� l�nh b�i m�i c� th� cho ng��i nh�n th��ng",1,"K�t th�c ��i tho�i/no")
  	return
  end
  
  --��鱳���ռ�
  local nTodayTaskCount = %get_task_daily(1205)
  local nBagCellNeed = 1
  if nTodayTaskCount == 0 then
  	nBagCellNeed = 2
  end
  if (CalcFreeItemCellCount() < nBagCellNeed) then
		Talk(1, "", format("<#>H�nh trang c�a ng��i ch�a �� ch� tr�ng, xin s�p x�p l�i trang b� l�u l�i %d ch� tr�ng, sau �� t�i nh�n th��ng",nBagCellNeed))
		return
	end
	local n_level = GetLevel();
	G_ACTIVITY:OnMessage("FinishMail", 1, n_level);	
	--�۳�ǧ������
	if nTaskFlag == 2 then
	--Fix bug �����ڰ�������ڿ۳�ǧ������- Modifiec by DinhHQ - 20110502
	    	if ConsumeEquiproomItem(1, 6, 1, 2813, -1) == 1 then--�۳�ǧ������
	    		Msg2Player("Ng��i �� n�p l�n thi�n b�o kh� l�nh")
	    	else
	    		Talk(1, "", "Ng��i thi�n b�o kh� l�nh �i n�i n�o, th� n�o ta kh�ng th�y?")
	    		return
	    	end
    end
    
   	%add_task_daily(1205, 1)
	nt_setTask(1201,0)	--
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	
	nTodayTaskCount = %get_task_daily(1205)--��ȡ�������ļ���ֵ
	WriteLog(format("Account:%s[Name:%s] Nh�n l�y ph�n th��ng nhi�m v� t�n s�, h�m nay �� ho�n th�nh [%d] l�n.",
			GetAccount(),
			GetName(),
			nTodayTaskCount
			)
		);
		
	--ÿ���һ�����������3��������
	if nTodayTaskCount == 1 then
		for i = 1, 3 do
			--Fix bug sai level ������- Modified by DinhHQ - 20110921
			AddItem(6,1,2566,1,0,0)--��ȡ��������Ϊ����״̬
		end;
		Msg2Player("Ng��i ��t ���c 3 c�i h�nh hi�p l�nh")
	end
	
	--ÿ�ν�������2����ʹ����
	for i = 1, 2 do
		AddItem(6,1,2812,0,0,0)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,4092,0,0,0}, nExpiredTime=43200, nBindState=-2}, "test", 1);
	end;
	Msg2Player("Ng��i ��t ���c 2 c�i t�n s� b�o r��ng")
end

function messenger_simpleprize()
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,4092,0,0,0}, nExpiredTime=43200, nBindState=-2}, "test", 1);

	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
	local i = random(1,5)
	AddRepute(i)
	Msg2Player("Ch�c m�ng ng��i thu ���c "..i.." �i�m danh v�ng.")
	nt_setTask(1201,0)	
	nt_setTask(1202,0)	
	nt_setTask(1203,0)	
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1211,0)
		
end

--------------------------------------------���ֻ�����-----------------------------------------------------
function messenger_duihuanprize()
	Describe(DescLink_YiGuan..": Ph�n th��ng bao g�m : t�n s� y�u b�i c�ng trang b� ho�ng kim. Y�u b�i c� th� gia t�ng nh�n v�t kh�ng t�nh, ho�ng kim trang b� c� th� gia t�ng kinh nghi�m. Ng��i ngh� ch�n lo�i n�o ?",3,
		"T�n s� y�u b�i /messenger_prize_yaopai",
		"Ho�ng kim trang b�/messenger_prize_huangjin",
		"��ng b�n t��ng quan/messenger_prize_partner",
		"Nh�ng v�t ph�m kh�c/messenger_prize_other",
		"�� ta suy ngh� l�i!/no")
end

function messenger_prize_partner()
	Describe(DescLink_YiGuan..": Th� l�nh Long N�m m�i v�a mang v� m�t �t <color=red> th�n b� ��ng h�nh m�t n� <color>, ng��i ngh� d�ng th� sao?",5,
		"��ng h�nh k� n�ng/no",
		"��ng h�nh m�t n�/messenger_prize_mianju",
		"��ng h�nh v�t ph�m/no",
		"Tr� v�/messenger_duihuanprize",
		"�� ta suy ngh� l�i!/no")
end

function messenger_prize_mianju()
	Describe(DescLink_YiGuan..": ��ng h�nh m�t n� chia l�m 2 lo�i : 1 l�n s� d�ng c�ng 10 l�n s� d�ng. mu�n ��i c�i ��?",4,
	"��i m�t n� 1 l�n/prize_mianju_dan",
	"��i m�t n� 10 l�n/prize_mianju_shi",
	"Tr� v�/messenger_prize_partner",
	"K�t th�c ��i tho�i !/no")

end

function prize_mianju_shi()
	Describe(DescLink_YiGuan..": Ng��i ngh� ��i m�t n� (10 l�n) thi�u ni�n v� s� l�i ki�m c�n l� thanh ni�n v� s� l�i ki�m ? th�y r� r�ng li�u sao ??",4,
	"��i m�t n� thi�u ni�n v� s� /prize_mianju_shi_shaonian", 
        "��i m�t n� thanh ni�n v� /prize_mianju_shi_qingnian", 
        "Tr� v� /messenger_prize_mianju", 
        "T�m th�i kh�ng th� ��i !/no")
end

function prize_mianju_shi_shaonian()
	Describe(DescLink_YiGuan..": b�t ��u ��i !",7, 
       "M�t n� (10 l�n ) - thi�u ni�n l�i ki�m [40000 ph�t ]/prize_mianju_shi_shaolin_leijian", 
       "M�t n� (10 l�n ) - thi�u ni�n c��i s��ng [40000 ph�t ]/prize_mianju_shi_shaolin_xiaoshuang", 
       "M�t n� (10 l�n ) - ng�n n�m l�a nh�n [40000 ph�t ]/prize_mianju_shi_shaolin_huoren", 
       "M�t n� (10 l�n ) - thi�u ni�n h�i ���ng [40000 ph�t ]/prize_mianju_shi_shaolin_haitang", 
       "M�t n� (10 l�n ) - thi�u ni�n kim phong [40000 ph�t ]/prize_mianju_shi_shaolin_jinfeng", 
       "Tr� v� /prize_mianju_shi", 
       "T�m th�i kh�ng th� ��i !/no")
end

function prize_mianju_shi_qingnian()
	Describe(DescLink_YiGuan..": b�t ��u ��i !",7, 
        "M�t n� (10 l�n ) - thanh ni�n l�i ki�m [40000 ph�t ]/prize_mianju_shi_qinglin_leijian", 
        "M�t n� (10 l�n ) - thanh ni�n c��i s��ng [40000 ph�t ]/prize_mianju_shi_qinglin_xiaoshuang", 
        "M�t n� (10 l�n ) - thanh ni�n l�a nh�n [40000 ph�t ]/prize_mianju_shi_qinglin_huoren", 
        "M�t n� (10 l�n ) - thanh ni�n h�i ���ng [40000 ph�t ]/prize_mianju_shi_qinglin_haitang", 
        "M�t n� (10 l�n ) - thanh ni�n kim phong [40000 ph�t ]/prize_mianju_shi_qinglin_jinfeng", 
        "Tr� v� /prize_mianju_shi", 
        "T�m th�i kh�ng  th� ��i!/no")
end

function prize_mianju_shi_qinglin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,112,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,113,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("B�n nh�n ���c m�t m�t n� th�n thi�n")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_qinglin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,114,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_qinglin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,115,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,116,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_shaolin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,102,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,103,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_shaolin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,104,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_shaolin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,105,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_shi_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,106,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 ��ng h�nh m�t n�")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m ng��i t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan()
	Describe(DescLink_YiGuan..": Ng��i ngh� ��i m�t n� (1 l�n ) thi�u ni�n v� s� l�i ki�m c�n l� thanh ni�n v� s� l�i ki�m ? th�y r� r�ng nh�n sao?",4,
	"��i m�t n� thi�u ni�n v� s� /prize_mianju_dan_shaonian", 
        "��i m�t n� thanh ni�n V� s�/prize_mianju_dan_qingnian", 
        "Tr� v� /messenger_prize_mianju", 
        "T�m th�i kh�ng th� ��i !/no")
end

function prize_mianju_dan_qingnian()
	Describe(DescLink_YiGuan..": b�t ��u ��i.",7, 
        "M�t n� (1 l�n ) - thanh ni�n l�i ki�m [10000 ph�t ]/prize_mianju_dan_qinglin_leijian", 
        "M�t n� (1 l�n ) - thanh ni�n c��i s��ng [10000 ph�t ]/prize_mianju_dan_qinglin_xiaoshuang", 
        "M�t n� (1 l�n ) - thanh ni�n l�a nh�n [10000 ph�t ]/prize_mianju_dan_qinglin_huoren", 
        "M�t n� (1 l�n ) - thanh ni�n h�i ���ng [10000 ph�t ]/prize_mianju_dan_qinglin_haitang", 
        "M�t n� (1 l�n ) - thanh ni�n kim phong [10000 ph�t ]/prize_mianju_dan_qinglin_jinfeng", 
        "Tr� v� /prize_mianju_dan", 
        "T�m th�i kh�ng th� ��i !/no")
end

function prize_mianju_dan_shaonian()
	Describe(DescLink_YiGuan..": b�t ��u ��i.",7, 
        "M�t n� (1 l�n ) - thi�u ni�n l�i ki�m [10000 ph�t ]/prize_mianju_dan_shaolin_leijian", 
        "M�t n� (1 l�n ) - thi�u ni�n c��i s��ng [10000 ph�t ]/prize_mianju_dan_shaolin_xiaoshuang", 
        "M�t n� (1 l�n ) - ng�n n�m l�a nh�n [10000 ph�t ]/prize_mianju_dan_shaolin_huoren", 
        "M�t n� (1 l�n ) - ng�n n�m h�i ���ng [10000 ph�t ]/prize_mianju_dan_shaolin_haitang", 
        "M�t n� (1 l�n ) - ng�n n�m kim phong [10000 ph�t ]/prize_mianju_dan_shaolin_jinfeng", 
        "Tr� v� /prize_mianju_dan", 
        "T�m th�i kh�ng th� ��i !/no")
end

function prize_mianju_dan_shaolin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,97,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,98,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_shaolin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,99,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_shaolin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,100,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,101,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_qinglin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,107,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,108,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_qinglin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,109,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_qinglin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,110,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_mianju_dan_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,111,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 m�t n� ��ng h�nh")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end


function messenger_prize_yaopai()
	Describe(DescLink_YiGuan..": T�n s� y�u b�i c�ng ng��i ��t t�i t�n s� cho danh hi�u t��ng ��i �ng. T� nh� ng��i l� kim t�n s�, �em c� th� ��i b�t k� t�n s�, n�u nh� ng��i l� m�c t�n s�, th� kh�ng th� ��i kim t�n s�. Hi�u kh�ng ? b�t ��u ��i �i . .",7, 
        "T�n s� l�nh - m�c [50 �i�m ]/prize_yaopai_mu", 
        "T�n s� l�nh - ��ng [150 �i�m ]/prize_yaopai_tong", 
        "T�n s� l�nh - ng�n [450 �i�m ]/prize_yaopai_yin", 
        "T�n s� l�nh b�i [800 �i�m ]/prize_yaopai_jin", 
        "Ng� t� l�nh b�i - kim [1500 �i�m ]/prize_yaopai_yuci", 
        "Tr� v� /messenger_duihuanprize", 
        "T�m th�i kh�ng th� ��i !/no")
end

function prize_yaopai_mu()
	if ( nt_getTask(1205) >= 50 ) then
		AddItem(6,1,885,1,0,0)
		local Uworld1205 = nt_getTask(1205) - 50
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c t�n s� - m�c.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i kh�ng �� �i�m t�ch l�y.",1,"K�t th�c! /no")
	end 
end

function prize_yaopai_tong()
	if ( nt_getTask(1205) >= 150 ) then
		AddItem(6,1,886,2,0,0)
		local Uworld1205 = nt_getTask(1205) - 150
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c t�n s� - ��ng.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i kh�ng �� �i�m t�ch l�y.",1,"K�t th�c! /no")
	end 
end

function prize_yaopai_yin()
	if ( nt_getTask(1205) >= 450 ) then
		AddItem(6,1,887,3,0,0)
		local Uworld1205 = nt_getTask(1205) - 450
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c t�n s� - ng�n.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i kh�ng �� �i�m t�ch l�y.",1,"K�t th�c! /no")
	end
end

function prize_yaopai_jin()
	if ( nt_getTask(1205) >= 800 ) then
		AddItem(6,1,888,4,0,0)
		local Uworld1205 = nt_getTask(1205) - 800
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c t�n s� - kim.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i kh�ng �� �i�m t�ch l�y.",1,"K�t th�c! /no")
	end 
end

function prize_yaopai_yuci()
	if ( nt_getTask(1205) >= 1500 ) then
		AddItem(6,1,889,5,0,0)
		local Uworld1205 = nt_getTask(1205) - 1500
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 t�n s� l�nh b�i")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! Ng��i kh�ng �� �i�m t�ch l�y.",1,"K�t th�c! /no")
	end 
end

function messenger_prize_huangjin()
	Describe(DescLink_YiGuan..": Tri�u ��nh mu�n nh�n th��ng ng��i, cho n�n cho ng��i chu�n b� m�t b� trang b� ho�ng kim, khi ng��i gi�t ��ch l�c �em ��t ���c g�p ��i kinh nghi�m. Ng��i ngh� ��i c�i �� ?",6, 
        "H�ng �nh tr�m vi�n v�n t�y [100000 �i�m]/prize_huangjin_shenyuan", 
        "H�ng �nh ki�m qu�i t�y ph��ng [70000 �i�m]/prize_huangjin_guajian", 
        "H�ng �nh m�c t�c t��ng vong [70000 �i�m]/prize_huangjin_muxu", 
        "H�ng �nh h�ng t� chi�u [50000 �i�m]/prize_huangjin_hongxiu", 
        "Tr� v�/messenger_duihuanprize", 
        "T�m th�i kh�ng ��i /no")
end

function messenger_prize_other()
	Describe(DescLink_YiGuan..": Tri�u ��nh c� r�t nhi�u nh�n th��ng, tr��c m�t ng��i v�t ph�m c� th� ��i :",3, 
       "Th�n b� ��i h�ng bao [2000 ph�t]/prize_other_hongbao", 
       "Tr� v�/messenger_duihuanprize", 
       "T�m th�i kh�ng ��i /no")
end

function prize_other_hongbao()
	if ( nt_getTask(1205) >= 2000 ) then
		local Uworld1205 = nt_getTask(1205) - 2000 
		nt_setTask(1205,Uworld1205)
		AddItem(6,1,402,0,0,0)
		Msg2Player("Ng��i �� ��i 1 th�n b� ��i h�ng bao.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_huangjin_shenyuan()
	if ( nt_getTask(1205) >= 100000 ) then
		AddGoldItem(0,204)
		local Uworld1205 = nt_getTask(1205) - 100000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 trang b� ho�ng kim h�ng �nh.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_huangjin_guajian()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,205)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 trang b� ho�ng kim h�ng �nh.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_huangjin_muxu()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,206)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 trang b� ho�ng kim h�ng �nh.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end

function prize_huangjin_hongxiu()
	if ( nt_getTask(1205) >= 50000 ) then
		AddGoldItem(0,207)
		local Uworld1205 = nt_getTask(1205) - 50000
		nt_setTask(1205,Uworld1205)
		Msg2Player("Ng��i ��t ���c 1 trang b� ho�ng kim h�ng �nh.")
	else
		Describe(DescLink_YiGuan..": Th�t xin l�i ! �i�m t�ch l�y kh�ng ��.",1,"K�t th�c! /no")
	end 
end
-------------------------------------------ȡ����ʹ����----------------------------------------------------
function messenger_losemytask()
	if ( GetTask(1204) == 0 ) then
		Describe(DescLink_YiGuan..": Ng��i kh�ng ti�p nh�n nhi�m v� t�n s� kh�ng th� h�y",1,"K�t th�c ��i tho�i/no")
	else
		Describe(DescLink_YiGuan..": Ng��i mu�n h�y nhi�m v� ",2,"H�y !/messenger_lostall","K�t th�c ��i tho�i!/no")
	end
end
--------------------------------------------����ʲô����ʹ����----------------------------------------------
function messenger_what()
	Describe(DescLink_YiGuan..": Nhi�m v� t�n s� l� tr� gi�p tri�u ��nh ��a tin cho c�c th�nh ph� ��ch d�ch quan nhi�m v�, b�i v� g�n nh�t t�i tri�u ��nh xu�t hi�n ph�n t�c, cho n�n, � ��a tin ��ch th�i �i�m g�p ph�i kh�ng �t nguy hi�m. Kh�ng c� tr� d�ng song to�n ng��i c�ng v�i �o�n k�t h�p t�c tinh th�n ng��i �em r�t kh� ho�n th�nh nhi�m v�. Ch� c� ��t t�i <color=red> 120 c�p tr� l�n <color> m�i c� th� tham gia. Tr��c m�t ng��i g�p ��n nh� sau c�a kh�u ��ch tr� ng�i : <color=red> thi�n b�o kho <color>. ? n�i n�y ch�t quan b�n trong , c� v� s� gi�ng nhau ��ch nh�n v� k� qu�i c� quan, ng��i c�n d�ng th�ng minh c�ng tr� kh�n �i ch�nh x�c l�a ch�n . ta ch� c� th� ch�c ng��i th�nh c�ng, c� g�ng , chi�n h�u !!",4, 
       "Gi�i thi�u c�p b�c b�n �� /messenger_levelmap", 
       "Gi�i thi�u phong chi k� quan/messenger_flyhorse", 
       "Gi�i thi�u S�n th�n mi�u quan t�p /messenger_mountaindeity", 
       "Gi�i thi�u thi�n b�o kh�/messenger_storehouse", 
       "Gi�i thi�u t�n s� y�u b�i/messenger_orderlevel", 
       "Gi�i thi�u nhi�m v� h�n l�c/messenger_limittotask", 
       "K�t th�c ��i tho�i /no")
end

function messenger_levelmap()
	Describe(DescLink_YiGuan..": D�a theo c�p b�c ng��i ch�i, ch�ng ta ph�n chia ba lo�i b�t ��ng c��ng �� ��ch b�n �� cho ng�i. C�p b�c khu ph�n l� <color=red>60-89 c�p, 90-119 c�p, 120<color> tr� l�n ba lo�i. ",2,"Tr� v�/messenger_what","K�t th�c ��i tho�i /no")
	--Describe(DescLink_YiGuan..": Tr��c m�t ch� c� <color=red> 120 c�p tr� l�n <color> nhi�m v� tr�nh �� ",2," tr� v� /messenger_what"," k�t th�c ��i tho�i /no")
end

function messenger_flyhorse()
	Describe(DescLink_YiGuan..": ? phong k� quan b�n trong, ng��i c� th� k� ti�p ��n xu�t kh�u, nh� v�y coi nh� l� ho�n th�nh nhi�m v�, nh�ng l�, ch� t��ng th��ng danh v�ng tr� gi�. ? quan b�n trong, ch�ng ta c� m�t �t ��n gi�n nhi�m v� : d�c theo ���ng �i, ng��i �em th�y r�t nhi�u qu�n ta l�u l�i k� hi�u, ��ng th�i c� r�t nhi�u kim qu�c gi�n �i�p. Ng��i ch� c�n ti�p x�c 5 c� t�a �� li�n c� th� ��n xu�t kh�u t�m b�ch d�c t��ng qu�n v��t qua ki�m tra. Nh�ng l� bi�u hi�n c�a ng��i ��u t�i ta c�a ph�i �i ��ch �i�u tra vi�n trong m�t. ��i v�i ng��i ��ch y�u b�i th�ng c�p r�t c� l�i . .",2,"Tr� v� /messenger_what","K�t th�c ��i tho�i /no")
end

function messenger_mountaindeity()
	Describe(DescLink_YiGuan..": ? mi�u s�n th�n quan b�n trong, ng��i c� th� k� ti�p tr�c ti�p ��n ��i m�n, nh� v�y coi xong th�nh nhi�m v�, nh�ng l�, ch� t��ng th��ng danh v�ng tr� gi�. ? quan b�n trong, ch�ng ta c� m�t �t ��n gi�n nhi�m v� : � trong n�i xu�t hi�n th�n �ao doanh kinh s� ph�n �� b�n h� � trong n�i ng�n tr� tin/th� khi�n cho. B�n h� ��u l�nh g�i l� �ao y�u . ng��i ch� c�n ��nh b�i 2 c� �ao y�u l� c� th� ��n l�n c�a t�m kia lang khuynh th�nh v��t qua ki�m tra. N�u nh� ho�n th�nh nhi�m v�, ��i v�i ng��i th�ng c�p r�t c� tr� gi�p.",2,"Tr� v�/messenger_what","K�t th�c ��i tho�i /no")
end

function messenger_storehouse()
	Describe(DescLink_YiGuan..": Ng��i s�ng ng��i ��i tr��ng nh�n thi�n b�o kho x�ng quan nhi�m v� l�c, h� th�ng �em ng�u nhi�n ph�n ph�i, ��t ���c 5 c�i s� ��m , c�n c� <color-red> d�a theo s� ��m tr�t t� <color> m� ra <color=red> b�o r��ng <color> li�n c� th� x�ng quan. D� nhi�n, c�n m� ra b�o r��ng, ng��i mu�n ��nh b�i <color=red> b�o r��ng b�n c�nh thi�n b�o kho ng��i b�o v� boss<color>. <color=red> Ng� h�nh ph� <color> � k� tr�n c�c c� b�n, m� ra c� th� ��t ���c r�t lui kim ph�, r�t lui m�c ph�, r�t lui n��c ph�, r�t lui l�a ph� , r�t lui ��t ph�, s� d�ng sau c� th� gi�p ng��i d� d�ng ��nh b�i thi�n b�o kho ng��i b�o v� boss",2," Tr� v� /messenger_what","K�t th�c ��i tho�i /no")
end

function messenger_orderlevel()
	Describe(DescLink_YiGuan..": C�n c� ng��i � ��y quan b�n trong ��ch bi�u hi�n, ch�ng ta �em phong cho ng��i m�t �t quan h�m, ng��i �em ��t ���c r�t nhi�u ph�n th��ng. Tr��c m�t , y�u b�i chia l�m t�n s� l�nh - m�c, t�n s� l�nh - ��ng, t�n s� l�nh - ng�n, t�n s� l�nh - kim c�ng v�i t�n s� l�nh - kim. ��ng th�i, ng��i theo nh� <color=red>F12<color>, nh�n b�ng b�n trong <color=red> t�ch l�y <color> t�n s� l�nh cho nhi�m v� , bi�t m�nh ch�c n�ng v� tr�. Ng��i c� th� d�ng t�ch ph�n ��i th� t�n khi�n cho danh hi�u. Sau ��, c� th� d�ng t�n s� l�nh cho t�ch �i�m ��i l�y l�nh b�i. Nh�ng th� n�y y�u b�i �em gia t�ng n�ng l�c <color=red> kh�i ph�c <color> ng��i, t�c d�ng c�a n� v� <color=red>1 gi� <color>, s� d�ng s� l�n v� <color=red>5 l�n <color>.",2,"Tr� v� /messenger_what","K�t th�c ��i tho�i /no")
end

function messenger_limittotask()
	Describe(DescLink_YiGuan..": Nh�n nhi�m v� t�n s�, ng��i c� l�c �ang l�c <color=red>2 gi� <color> �� ho�n th�nh. M�i ng�y l�m nhi�m v� th�i gian l� <color=red>2 gi� <color>. Ch� �, khi � quan b�n trong l�c, ng��i b� gi�t ho�c l� tang c�a coi nh� l� <color=red> nhi�m v� th�t b�i <color>!",2,"Tr� v� /messenger_what","K�t th�c ��i tho�i /no")
end

function messenger_giveplayerexp(playerexp)

	local j =random(1,3)

	if ( j == 1 ) then
		tl_addPlayerExp(playerexp-500000)
	elseif ( j == 2 ) then
		tl_addPlayerExp(playerexp)
	elseif ( j == 3 ) then
		tl_addPlayerExp(playerexp+500000)
	end
	Msg2Player("B�i v� ng��i l�m nhi�m v� t�n s� bi�u hi�n ho�n h�o, d�ch tr�m cho ng��i m�t kinh nghi�m nh�n th��ng!")
	nt_setTask(1224,1)  --���õ��콱������Ϊ��  
	nt_setTask(1223,0)
end

function messenger_lostall()
	nt_setTask(1201,0)
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1212,0)
	nt_setTask(1213,0)
	nt_setTask(1214,0)
	nt_setTask(1215,0)
	Msg2Player("B�n b� m�t nhi�m v� t�n s� th�nh c�ng")
	WriteLog(format("Account:%s[Name:%s] T� b� nhi�m v�",
			GetAccount(),
			GetName()
			)
		);
end

function no()
end

function check_daily_task_count()
	local nNormalTaskLimit = 2--һ���ֻ����������ͨ����
	local nIBTaskLimit = 1--һ���ֻ����1��IB����
	local nTodayCnt = %get_task_daily(1205)
	if nTodayCnt < nNormalTaskLimit then
		return 1--������ͨ�������
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = CalcItemCount(-1, 6, 1, 2813, -1)
		if nCountIb >= 1 then
			return 2--����ʹ�õ��߱���
		else
			return -1--����ʹ�õ��ߵ�������û��
		end
	end
	return 0--û�����������
end
