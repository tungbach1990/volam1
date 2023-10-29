-- ��ɽ ���� ����NPC
-- By��Dan_Deng(2003-09-23)
--edit by С�˶��(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include("\\script\\tong\\tong_check.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
--Include("\\script\\task\\metempsychosis\\translife_6.lua")
--Include("\\script\\task\\metempsychosis\\translife_7.lua")
--Include("\\script\\task\\metempsychosis\\translife_8.lua")

function about_tong()
	Talk(6,"","Ng��i h�i l�p bang h�i c�n c� nh�ng �i�u ki�n g�? �� t� t� ta gi�i th�ch cho nghe!","Ph�i l� ng��i �� xu�t s�, kh�ng � trong b�t c� bang h�i n�o. L�c th�ng so�i th�p nh�t 30 �i�m!","Sau khi h�i �� nh�ng y�u c�u tr�n, ng��i c� th� tham gia chi�n tr��ng T�ng Kim l�y ���c c�y V� V��ng ki�m �� l�m t�n v�t bang ch�, sau �� ti�n h�nh l�p bang h�i","Tr��c ti�n ng��i ph�i c� n�ng l�c, trong 3 ng�y ph�i t�m �t nh�t 16 ng��i c�ng ch� h��ng gia nh�p, n�u kh�ng c�ng ch�ng c� c�ch n�o. 3 ng�y �� c� th� g�i l� 'Th�i k� kh�o nghi�m'.","Sau khi bang h�i c�a ng��i ���c �t nh�t 16 ng��i, tr�n giang h� s� ti�n h�nh kh�o nghi�m. N�u sau 3 ng�y v�n ch�a �� 16 ng��i th� giang h� v�n ch�a th�a nh�n bang h�i n�y","Cu�i c�ng! �� l�p ���c bang ph�i th� c�n ph�i c� s� v�n l�n. H�y n� l�c ��t ���c m�c ti�u nh�!")
end



function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Ti�p t�c l�p bang h�i c�a ng��i, b�t ��u s� nghi�p giang h� �i!",2,"B�t ��u l�p bang/Direct_CreateTong","��i th�m m�t ch�t/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay","Cho h�i ta l�m sao c� th� gi�ng nh� ng�i, l�p bang ph�i v� l�m bang ch�?","Tr��c ti�n ng��i ph�i c� n�ng l�c, trong 3 ng�y ph�i t�m �t nh�t 16 ng��i c�ng ch� h��ng gia nh�p, n�u kh�ng c�ng ch�ng c� c�ch n�o. 3 ng�y �� c� th� g�i l� 'Th�i k� kh�o nghi�m'.","Sau khi bang h�i c�a ng��i ���c �t nh�t 16 ng��i, tr�n giang h� s� ti�n h�nh kh�o nghi�m. N�u sau 3 ng�y v�n ch�a �� 16 ng��i th� giang h� v�n ch�a th�a nh�n bang h�i n�y","Sau khi ng��i c� �� n�ng l�c l�nh ��o v� uy t�n giang h�, th� t�m m�t v�t ph�m ��c bi�t �� l�m t�n v�t c�a ch��ng m�n. V� d� nh� tham gia T�ng Kim l�y ���c Nh�c V��ng ki�m","Nh�c V��ng ki�m? Ng�i n�i l� c�y ki�m n�y ph�i kh�ng?","Ho� ra ng��i �� c� n�! Kh�ng sai! Qu� l� tu�i tr� t�i cao!")
	else				-- �˲���Ϊȱʡ�Ի��������䡣
		local tbOpt = {
			{"H�i v� vi�c th�nh l�p bang h�i", about_tong},
			--{"Ta H�i xem l�m th� n�o �� tr�ng sinh 6", TransLife6.ShowMainDlg, {TransLife6}},
			--{"H�i xem l�m th� n�o Tr�ng sinh 7", TransLife7.ShowMainDlg, {TransLife7}},
			--{"Mu�n h�i v� tr�ng sinh 8", TransLife8.ShowMainDlg, {TransLife8}},
			{"Kh�ng c� vi�c g�", nothing},
		}
		CreateNewSayEx("<npc> Ng��i c� chuy�n g� kh�ng v�y?", tbOpt)
	end
end

function create_pay()
	Say("B�y gi� ch� c�n ng��i c� th�m s� v�n l�n l� ���c, c� th� l� 100 v�n l��ng",2,"Kh�ng th�nh v�n ��, ta �� c� �� 100 v�n l��ng r�i./create_pay_yes","Sao nhi�u th�? �t l�i m�t ch�t ���c kh�ng?/create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		if not %tong_check_create()then
			return
		end
		Pay(1000000)				-- �շ�
		DelItem(195)			-- ɾ����ص���
		SetTask(99,1)				-- �����ϱ�ǣ�ͬʱ����Ϊ�����еĵ�һ���ˣ����������ˣ���
		Direct_CreateTong()		-- ��ʼ����
	else
		Talk(1,"","D��ng nh� ng��i kh�ng c� �� ti�n, nh� th� kh�ng �n, ��i khi ng��i c� �� ti�n th� ��n t�m ta.")
	end
end

function create_pay_no()
	Talk(1,"","�� duy tr� bang h�i ho�t ��ng b�nh th��ng th� m�t r�t nhi�u ti�n, n�u ng��ic�n � ��y tr� gi� th� ta e bang h�i s� kh� th�nh l� ")
end

function Direct_CreateTong()
	CreateTong(1)				-- ��������Ի��򣬽����ű�����
end

function wait_a_moment()
end

--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

-- ����콱����
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ph�i chi�m ���c th�nh th� m�i nh�n ���c ph�n th��ng, h�y d�n anh em c�a m�nh �i chi�m m�t th�nh n�o �i!")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ch� m�i m�i l�nh ���c ph�n th��ng c�a bang ph�i, g�i bang ch� c�a c�c ng��i t�i ��y")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- ���������ڼ���
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>9:00~20:00 th� hai h�ng tu�n m�i l� th�i gian nh�n th��ng, xin h�y nh�n n�i ch� ��i")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ph�n th��ng tu�n n�y �� l�nh r�i, h�n tu�n sau h�y t�i")
		end
		return 0
	end

	return 1
end

-- ��ȡ������ά��
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> Nh�n ph�n th��ng Th�nh ch� bang ph�i",
			2,
			"<#> ta mu�n l�nh 60 c�i/#take_tong_award(60)",
			"<#> T�m th�i ta kh�ng l�nh ��u/nothing")
	end
end

-- ��ȡ���
function take_tong_award(count)
	-- һ�����ռһ������
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> H�nh trang c�a ng��i �� ��y, ch�nh l� l�i xong m�i ��n l�nh th��ng.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- �����
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#>��i h�ng bao from Kim S�n Ch��ng M�n Nh�n"
	WriteLog(msg);
	Talk(1, "", "<#> ��y l� ph�n th��ng c�a c�c ng��i nh�n l�y �i")
end
