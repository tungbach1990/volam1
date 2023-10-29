-- xingjiaoshang.lua 
-- �н����˽ű�
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")

-- ��[count]��[type2]��Ʒ�һ�[type1]��Ʒ�ĶԻ�
function exchange_talk(type1, type2, count)
	-- DEBUG
	print(format("exchange(%d,%d,%d)", type1, type2, count))

	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- �����Ѿ��һ�����
		Say("<#> L�n n�y " .. item1[1] .. "<#> �� ��i h�t r�i! L�n sau quay l�i nhe1", 1, "<#> ���c!/cancel")
	else
		local caption = "<#> ��i 1 " .. item1[1] .. "<#> c�n c� " .. count .. "<#> " .. item2[1] .. ". Ng��i x�c ��nh ��i ch�?"
		local options = {
			"<#> ���c! C� nh� v�y �i!/" .. format("#exchange(%d,%d,%d)", type1, type2, count),
			"<#> Kh�ng! �� ta ngh� l�i ��!/cancel"
		}
		Say(caption, getn(options), options)
	end
end

-- ��[count]��[type2]��Ʒ�һ�[type1]��Ʒ
function exchange(type1, type2, count)
	local item1 = tbl_material[type1]
	local item2 = tbl_material[type2]
	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	if (itemcount == 0) then
		-- �����Ѿ��һ�����
		Talk(1, "", "<#> Th�t ng�i qu�! H�ng c�a ta �� b�n h�t r�i! Quay l�i sau nh�!")
	else
		local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ���ζһ���ʱ��
		local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- �ϴζһ���ʱ��
		local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- �Ѿ��һ��Ĵ���
		if (exchtime ~= lasttime) then
			-- �һ���������
			exchcount = 0
		end
		if (exchcount >= tbl_exchange_limitcount[type1]) then
			-- �ﵽ�˶һ���������
			-- DEBUG
			print(format("exchcount:%d, limitcount:%d", exchcount, tbl_exchange_limitcount[type1]))
			Talk(1, "", "<#> Th�t ng�i qu�! Ta �� mua �� c�c v�t li�u r�i, sau n�y c�n g� ta s� gh� l�i.") 			
		elseif (CalcEquiproomItemCount(item2[2], item2[3], 1, -1) < count) then
			-- �����һ�����Ʒ��������
			Talk(1, "", "<#> Nguy�n li�u l�m b�nh ng��i �em ��n v�n ch�a �� ")
		else
			SetTask(VARV_MOONCAKE_EXCHANGETIME, exchtime)
			SetTask(VARV_MOONCAKE_EXCHANGECOUNT, exchcount + 1)
			WriteLog(format("%s %s(%s): exchange mooncake material %s(%d)==>%s(1)",
				date("%y-%m-%d %H:%M"),
				GetAccount(),
				GetName(),
				item2[1],
				count,
				item1[1]))
			ConsumeEquiproomItem(count, item2[2], item2[3], 1, -1)
			AddEventItem(item1[3])
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT, itemcount - 1)
			Msg2Player("<#> B�n nh�n ���c 1 <color=yellow>" .. item1[1] .. "<color>")
		end
	end
end

-- ʣ��ɶһ�����
function GetLeftCount(type)
	local exchtime = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME)	-- ���ζһ���ʱ��
	local lasttime = GetTask(VARV_MOONCAKE_EXCHANGETIME)		-- �ϴζһ���ʱ��
	local exchcount = GetTask(VARV_MOONCAKE_EXCHANGECOUNT)		-- �Ѿ��һ��Ĵ���
	if (exchtime ~= lasttime) then
		-- �һ���������
		exchcount = 0
	end
	return tbl_exchange_limitcount[type] - exchcount
end

-- �һ��Ի�
function ExchangeTalk()
	local material_type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	local material_name = tbl_material[material_type][1]
	local caption = "<#> Ta chu du c�c n�i mua ���c kh�ng �t k� tr�n b�o v�t, l�n n�y ta mang ��n ��y <color=red>" ..
		material_name .. 
		"<#> <color>, nh�ng th� ta c�n v�n ch�a mua ���c, n�u nh� ng��i c� " ..
		material_name .. 
		"<#> ch�ng ta c� th� trao ��i <color=red>" ..
		GetLeftCount(material_type) ..
		"<color>."
	local exchanges = GetExchangeList(material_type)
	local options = {}
	local index = 1
	while (index <= getn(exchanges)) do
		local obj_type = exchanges[index][1]
		local obj_count = exchanges[index][2]
		local obj_name = tbl_material[obj_type][1]
		local func = format("#exchange_talk(%d,%d,%d)", material_type, obj_type, obj_count)
		options[index] = "<#> Ta mu�n d�ng " .. obj_name .. "<#> �� trao ��i/" .. func
		index = index + 1
	end
	options[index] = "<#> Kh�ng! �� ta ngh� l�i ��!/cancel"
	
	Say(caption, getn(options), options)		
end

function OnTimer()
	-- �رն�ʱ��
	StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
	-- ���öһ�����״̬Ϊ��ʼ
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 1)
	-- ���ñ��ζһ���ʱ�䣬�����ж���ҵĶһ���������
	SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGETIME, GetCurrentTime())
	-- ����
	local city = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	local type = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE)
	-- DEBUG
	print(format("material type:%d", type))
	local itemname = tbl_material[type][1]
	local news = "<#> Nghe n�i � " ..
		tbl_cities[city] ..
		"<#> c� H�nh C��c th��ng nh�n mang theo r�t nhi�u ph�m v�t th��ng h�ng" ..
		itemname ..
		"<#>, nh�ng b�n h�t l� �ng ta �i ngay!"
	-- DEBUG
	print(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	AddGlobalNews(news)
	Msg2SubWorld(news)

	local itemcount = GetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT)
	WriteLog(format("%s: mooncake material quota: %s(%d)",
		date("%y-%m-%d %H:%M"),
		itemname,
		itemcount))
	-- DEBUG
	print("news: " .. news)
end

function main()
	local exchanging = GetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING)
	-- DEBUG
	print(format("exchanging: %d", exchanging))
	local msg = format("GetGlbValue(%d): %d", GBL_VAR_MOONCAKE_EXCHANGING, exchanging)
	print(msg)
	local mapid = GetGlbValue(GBL_VAR_MOONCAKE_CITY)
	if (mapid ~= SubWorldIdx2ID(SubWorld) or exchanging ~= 1) then
		-- ��û��ʼ�һ��±�����
		Talk(1, "", "<#> �y! N�m nay kh� l�m �n qu�! B�n h�ng c�a ta kh�ng bi�t sao gi� n�y v�n ch�a giao h�ng t�i!")
	else
		ExchangeTalk()
	end
end
