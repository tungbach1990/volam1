-- ��������.lua (�����������ļ�)
-- By: Dan_Deng(2003-12-08)

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua")


Define_City = {"<#> L�m An","<#> Ph��ng T��ng","<#> Th�nh ��","<#> ��i L� ","<#> Bi�n Kinh","<#> T��ng D��ng","<#> D��ng Ch�u"}

function default_talk(letter_laststation)

local nParTaskState = GetMasterTaskState(PARID_TASK_MASTER_002);
local aryTalk = {"<dec><npc>�� l�u ta kh�ng m�ng ��n chuy�n tr�n giang h�, th�i cu�c l�c n�y qu� h�n lo�n, �t h�n tri�u ��nh s� c� nhi�u vi�c ph�i l�m."};

	if nParTaskState==nil then nParTaskState = 0; end;

	tinsert(aryTalk, "Ta mu�n v� tri�u ��nh g�p ch�t s�c l�c./especiallymessenger");
	tinsert(aryTalk, "Ta ch� l� ti�n ���ng gh� qua!/no");
	
	CreateTaskSay(aryTalk);

end

function lastdefault_talk(letter_station)
	Uworld12 = GetTask(12)
	if (Uworld12 == 0) then				-- ��ʱ���Կ�ʼ������ǰδ������
		W12_get(letter_station)
	elseif (Uworld12 < 256) then		-- ������
		check_letter(letter_station)
	elseif (GetGameTime() >= Uworld12) then		-- �ѳ����ظ�ʱ�����ƣ������ٴν���������ʱʹ������ʱ�䣩
		W12_get(letter_station)
	else													-- �ȴ��ظ�����������
		Talk(1,"","Hi�n th�i ch�a c� c�ng v�n n�o nh� ng��i gi�p! H�y quay l�i sau nh�! ")
	end
end

function W12_get(start_city)
	dest_city = random(1,7)				-- ������7������
	if (dest_city == start_city) then		-- ���������ŵ�Դ������Ŀ������ظ�
		Talk(1,"","Hi�n th�i ch�a c� c�ng v�n n�o nh� ng��i gi�p! H�y quay l�i sau nh�! ")
	else
		SetTaskTemp(3,start_city*10+dest_city)		-- ʮλ��Ϊ��ʼ�أ���λ��ΪĿ���
		Say("Ng�y nay chi�n s� t�ng t�ng, c�ng v�n nhi�u, ng��i ��a th� trong kh�ng ��, ng��i mu�n gi�p ��a th� kh�ng? M�i l�n ��u c� th� lao! ",2,"��ng �!/W12_get_yes","Kh�ng b�ng l�ng/no")
	end
end

function check_letter(get_city)
	x = GetTask(12)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ӧ�ÿ϶�������
	if (dest_city == get_city) then			-- Ŀ�����
		if (HaveItem(231+x) == 1) then			-- ���ź��ܶ�Ӧ�ϣ��������
			Talk(1,"","<#> Nh�n ���c"..Define_City[start_city].."<#> l�m t�t l�m! ��y l� 500 l��ng h�u t�!")
			DelItem(231+x)
			SetTask(12,GetGameTime()+7200)				-- ��Сʱ��7200�룩����ظ�������
			i = random(1,10)		-- �������������
			AddRepute(i)
			Msg2Player("<#> Chuy�n h�m th� th�nh c�ng ��n D�ch tr�m m�c ti�u, nhi�m v� ho�n th�nh. Danh v�ng c�a b�n t�ng th�m "..i.."<#> �i�m.")
			AddNote("Chuy�n h�m th� th�nh c�ng ��n D�ch tr�m m�c ti�u, nhi�m v� ho�n th�nh.")
			Earn(500)
		else												-- �ź���ʧ��ȡ������
			Say("C�ng v�n quan tr�ng m� l�i l�m m�t? L�n n�y phi�n l�m ��y!  ��a ta 2000 l��ng ta s� gi�u chuy�n n�y �i",2,"N�p ti�n/W12_cancel","Ta �i ki�m th�m ti�n/no")
		end
	elseif (start_city == get_city) then	-- ��ʼ����
		if (HaveItem(231+x) == 0) then			-- �ź���ʧ��ȡ������
			Say("C�ng v�n quan tr�ng m� l�i l�m m�t? L�n n�y phi�n l�m ��y!  ��a ta 2000 l��ng ta s� gi�u chuy�n n�y �i",2,"N�p ti�n/W12_cancel","Ta �i ki�m th�m ti�n/no")
		else
			Talk(1,"","��y l� c�ng v�n r�t g�p!  Phi�n ng��i ��a nhanh m�t t�! ")
		end
	else 																					-- �������������δ��ɣ�
		Talk(1,"","<#> H�m th� n�y kh�ng ph�i chuy�n ��n ��y! Ng��i ph�i chuy�n ��n "..Define_City[dest_city].."<#> ")
	end
end

function W12_cancel()
	if (GetCash() >= 2000) then
		Pay(2000)
		SetTask(12,0)
		Msg2Player("Nhi�m v� chuy�n th� c�a b�n �� b� h�y.")
		AddNote("Nhi�m v� chuy�n th� c�a b�n �� b� h�y.")
		Talk(1,"","L�n n�y ta b� qua!  Sau n�y c�n ph�i c�n th�n! ")
	else
		Talk(1,"","2000 l��ng c�ng kh�ng c�!  Ng��i ngh�o v�y sao? C� ti�n r�i h�y ��n t�m ta! ")
	end
end

function W12_get_yes()
	x = GetTaskTemp(3)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ӧ�ÿ϶�������
	Talk(1,"","<#> H�y gi�p ta chuy�n b�c h�m th� n�y ��n"..Define_City[dest_city].."<#>!")
	Msg2Player(Define_City[start_city].."<#> H�y gi�p ta chuy�n b�c h�m th� n�y ��n"..Define_City[dest_city].."<#> ")
	AddNote("<#> Nhi�m v� chuy�n th� ��n"..Define_City[start_city].."<#> "..Define_City[dest_city]..".")
	SetTask(12,x)
	AddEventItem(231+x)		-- �ź���242��ʼ�����д�1��ʼ
end

function no()
end
