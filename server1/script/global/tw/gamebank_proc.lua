-- �ٰ���ְ�ܡ�Ǯׯ�ϰ�
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ��ͳһ�����ƶ�������Ʊ���˶���
-- Update: Fanghao_Wu(2004-9-04) ����Ԫ���һ�ͭǮ����

-- Include("\\script\\global\\Ǯׯ����.lua")

-- function main(sel)
--	Talk(1,"main_proc","Ǯׯ�ϰ壺����Ǯׯ����һ�򶼺õúܣ��Ӳ�ƭ�ˡ�")
-- end;

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
Include("\\script\\global\\head_qianzhuang.lua") -- ͷ����

function gamebank_proc()
	local msg = {
		"��������ҵ�Ԫ��/use_ingot",
		"��������ҵ���Ʊ/use_ticket",
		"����ͭǮ/onAboutCoin",
		"�����/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "Ǯׯ�ϰ壺������λ����ҪЩʲô����";
	else
		talk = "Ǯׯ�ϰ壺������λ����ҪЩʲô����";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_GOLDSILVER_OPEN) then
		tinsert(btns, msg[1])
	end
	
	if  (SYSCFG_GAMEBANK_TICKET_OPEN) then
		tinsert(btns, msg[2])
	end
	
	tinsert(btns, msg[3])
	tinsert(btns, msg[4])
	
	Say(talk,  getn(btns), btns);
end

function use_ticket()
	local msg = {
		"����ȡ����Ʊ����/get_ticket",
		"�����������Ʊ�������������/pay_ticket",
		"�����������Ʊ�һ���ͭǮ/change_ticket_to_coin",
		"��һ����������˶�����Ʊ/show_ticket",
		"�����/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "Ǯׯ�ϰ壺������ҪЩʲô����";
	else
		talk = "Ǯׯ�ϰ壺������ҪЩʲô����";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_TICKET_GET) then
		tinsert(btns, msg[1])
	end

	if  (SYSCFG_GAMEBANK_TICKET_PAY) then
		tinsert(btns, msg[2])
	end
	
	if  (SYSCFG_GAMEBANK_TICKET_COIN) then
		tinsert(btns, msg[3])
	end
		
	tinsert(btns, msg[4])
	tinsert(btns, msg[5])
	
	Say(talk, getn(btns), btns);
end

function use_ingot()
	local msg = {
		"����ȡ��Ԫ������/get_ingot",
		"��������Ԫ���������������/pay_ingot",
		"��������Ԫ���һ���ͭǮ/change_ingot_to_coin",
		"��һ����������˶���Ԫ��/show_ingot",
		"�����/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "Ǯׯ�ϰ壺������ҪЩʲô����";
	else
		talk = "Ǯׯ�ϰ壺������ҪЩʲô����";
	end

	local btns ={}
	if  (SYSCFG_GAMEBANK_GOLD_GET or SYSCFG_GAMEBANK_SILVER_GET) then
		tinsert(btns, msg[1])
	end

	if  (SYSCFG_GAMEBANK_GOLD_PAY or SYSCFG_GAMEBANK_SILVER_PAY) then
		tinsert(btns, msg[2])
	end
	
	if  (SYSCFG_GAMEBANK_GOLD_COIN or SYSCFG_GAMEBANK_SILVER_COIN) then
		tinsert(btns, msg[3])
	end
	
	tinsert(btns, msg[4])
	tinsert(btns, msg[5])
	
	Say(talk, getn(btns), btns);
end

------------- ��ѯ��Ʊ --------------------
function show_ticket()
	local count = GetExtPoint(EXTPOINT_TICKET) + GetExtPoint(EXTPOINT_TICKET_NEW);
	if (count >= EXTPOINT_MAXVAL or count <= 0) then
		Say("Ǯׯ�ϰ壺��������û����С�żĴ���Ʊ��", 1, "֪����/no")
	else
		Say("<#>Ǯׯ�ϰ壺������С���ܹ��Ĵ��� <color=green>" .. count .. "<color> ����Ʊ��", 1, "֪����/no")
	end
end

------------- ��ѯԪ�� --------------------
function show_ingot()
	i = GetExtPoint(1)
	if (i >= 32768) then
		i = 0
	end
	if (i <= 0) then
		Say("Ǯׯ�ϰ壺��������û����С�żĴ����Ԫ����",1,"֪����/no")
	else
		Say("<#>Ǯׯ�ϰ壺С�����Ĵ��Ԫ��һ������Ԫ��������ÿһ����Ԫ����������ĸ���Ԫ����������С���ܹ��Ĵ���"..i.."<#>����Ԫ����",1,"֪����/no")
	end
end

------------- ȡԪ�� -----------------------
function get_ingot()
--	Talk(1,"","Ǯׯ�ϰ壺�Բ��𣬴���ҵ�����ڳﱸ�У���ʱ��û�п�ͨ���������������")
	i = GetExtPoint(1)	
	if (i >= 32768) then
		i = 0
	end
	if (i <= 0) then					-- û����չ����
		Talk(1,"","Ǯׯ�ϰ壺�Բ��𣬿�������û����С�żĴ����Ԫ����")
	elseif (i < 4) then				-- ����4��ֱ�Ӹ���Ԫ��
		if (SYSCFG_GAMEBANK_SILVER_GET) then -- �Ƿ�����ȡ��Ԫ����
			get_ingot_10()
		end
--	elseif (mod(i, 4) == 0) then	-- ��4����������ֱ�Ӹ���Ԫ��
--		get_ingot_35()
	else							-- ��������ѡ��Ҫȡ��Ԫ��������Ԫ��
		if (SYSCFG_GAMEBANK_GOLD_GET == nil and SYSCFG_GAMEBANK_SILVER_GET) then -- ������ȡ��Ԫ����������ȡ��Ԫ��
			get_ingot_10()
		elseif (SYSCFG_GAMEBANK_GOLD_GET and SYSCFG_GAMEBANK_SILVER_GET == nil) then -- ������ȡ��Ԫ����������ȡ��Ԫ��
			get_ingot_35()
		else
			Say("Ǯׯ�ϰ壺��������С�żĴ��˽�������Ԫ������֪����ȡ�����أ�",3,"ȡ����Ԫ��/get_ingot_35","ȡ����Ԫ��/get_ingot_10","��ȡ��/no")
		end
	end
end

------------- ȡ��Ʊ -----------------------
function get_ticket()
	if (SYSCFG_GAMEBANK_TICKET_GET == nil) then -- ������~~
		print("get_ticket have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	local count = GetExtPoint(EXTPOINT_TICKET) + GetExtPoint(EXTPOINT_TICKET_NEW);
	local msg = "";
	if (count >= EXTPOINT_MAXVAL or count <= 0) then				-- û����չ����
		msg = "Ǯׯ�ϰ壺�Բ��𣬿�������û����С�żĴ���Ʊ��";
		Talk(1, "", msg)
	else 
		Say("Ǯׯ�ϰ壺������ȷ����Ҫ�ڱ���ȡ��Ʊ��(��ȷ���������˳��ͻ��ˣ�)", 2, "ȷ��/get_ticketok", "ȡ��/no");
	end
end

function get_ticketok()
	local nCountOld = GetExtPoint(EXTPOINT_TICKET);
	local nCountNew = GetExtPoint(EXTPOINT_TICKET_NEW);
	if (nCountOld > 0) then
		PayExtPoint(EXTPOINT_TICKET, 1);
		Msg2Player("����Ϊ����ȡ��Ʊ�У��ڴ˹����������˳���Ϸ�����Եȡ�����")
	elseif (nCountNew > 0) then
		PayExtPoint(EXTPOINT_TICKET_NEW, 1);
		Msg2Player("����Ϊ����ȡ��Ʊ�У��ڴ˹����������˳���Ϸ�����Եȡ�����")
	else
		msg = "Ǯׯ�ϰ壺�Բ��𣬿�������û����С�żĴ���Ʊ��";
		Talk(1, "", msg);
	end;
end

function get_ingot_35()
	if (SYSCFG_GAMEBANK_GOLD_GET == nil) then -- ������~~
		print("get_gold35 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetExtPoint(1) < 4) then
		Talk(1,"","Ǯׯ�ϰ壺�Բ������ǵ��ʱ������ļ�¼������Щ���Ծ��������ȵȣ����ǻᾡ�������ʵ���塣ʵ�ڲ�����˼�����������ѽ�Ԫ����������������һС��ʱ�䡣")
		return
	end
	Say("Ǯׯ�ϰ壺������ȷ����Ҫ�ڱ���ȡ��Ԫ����(��ȷ���������˳��ͻ��ˣ�)", 2, "ȷ��/get_ingot35ok", "ȡ��/no");
end

function get_ingot35ok()
	PayExtPoint(1,4)
	Msg2Player("����Ϊ����ȡԪ���У��ڴ˹����������˳���Ϸ�����Եȡ�����")
end

function get_ingot_10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- ������~~
		print("get_silver10 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetExtPoint(1) < 1) then		-- С�����ѳɹ�
		Talk(1,"","Ǯׯ�ϰ壺�Բ������ǵ��ʱ������ļ�¼������Щ���Ծ��������ȵȣ����ǻᾡ�������ʵ���塣ʵ�ڲ�����˼��������������Ԫ����������������һС��ʱ�䡣")
		return
	end
	Say("Ǯׯ�ϰ壺������ȷ����Ҫ�ڱ���ȡ��Ԫ����(��ȷ���������˳��ͻ��ˣ�)", 2, "ȷ��/get_ingot10ok", "ȡ��/no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("����Ϊ����ȡ��Ԫ���У��ڴ˹����������˳���Ϸ�����Եȡ�����")
end;
------------- ����Ԫ�� ---------------------
function pay_ingot()
--	Talk(1,"","Ǯׯ�ϰ壺�Բ��𣬴���ҵ�����ڳﱸ�У���ʱ��û�п�ͨ���������������")
	i = GetItemCountEx(343)
	j = GetItemCountEx(342)
	if (i > 0) and (j > 0) and (SYSCFG_GAMEBANK_GOLD_PAY and SYSCFG_GAMEBANK_SILVER_PAY)then			-- ���ֶ��У�ѯ�ʶ�������
		Say("Ǯׯ�ϰ壺�����ϴ������Ԫ���������������һ���أ�",5,"�ѽ�Ԫ�����ֳ�25��/pay_ingot_35a","�ѽ�Ԫ�����ֳ�600��/pay_ingot_35b","����Ԫ�����ֳ�6��/pay_ingot_10a","����Ԫ�����ֳ�150��/pay_ingot_10b","��������/no")
	elseif (i > 0) and (SYSCFG_GAMEBANK_GOLD_PAY) then						-- ֻ�н�Ԫ��
		Say("Ǯׯ�ϰ壺û���⣬��������ϵ�<color=red>��Ԫ��<color>���ֳ�ʲô��ʽ�أ�",3,"�ѽ�Ԫ�����ֳ�25��/pay_ingot_35a","�ѽ�Ԫ�����ֳ�600��/pay_ingot_35b","��������/no")
	elseif (j > 0) and (SYSCFG_GAMEBANK_SILVER_PAY) then						-- ֻ����Ԫ��
		Say("Ǯׯ�ϰ壺û���⣬��������ϵ�<color=green>��Ԫ��<color>���ֳ�ʲô��ʽ�أ�",3,"����Ԫ�����ֳ�6��/pay_ingot_10a","����Ԫ�����ֳ�150��/pay_ingot_10b","��������/no")
	elseif (i <= 0 and SYSCFG_GAMEBANK_GOLD_PAY) or (j <= 0 and SYSCFG_GAMEBANK_SILVER_PAY) then	-- һ�ֶ�û��
		Say("Ǯׯ�ϰ壺������û��Ԫ������",1,"���ˣ������ڼ�����/no")
	end
end

------------- ������Ʊ ---------------------
function pay_ticket()
	if (SYSCFG_GAMEBANK_TICKET_PAY == nil) then -- ������~~
		print("pay_ticket have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	local msg = {
		"Ǯׯ�ϰ壺û���⣬��������ϵ�<color=red>��Ʊ<color>���ֳ�ʲô��ʽ�أ�",
		"����Ʊ���ֳ�30Сʱ/pay_ticket_hours",
		"����Ʊ���ֳ�7��/pay_ticket_days",
		"��������/no"
	};
	local count = GetItemCountEx(QUESTKEY_TICKET) + GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (count > 0) then			-- ѯ�ʶ�������
		Say(msg[1], 3, msg[2], msg[3], msg[4])
	else
		Say("Ǯׯ�ϰ壺������û����Ʊ����", 1, "���ˣ������ڼ�����/no")
	end
end

--��ȡ�۳���Ʊ������
function pay_ticket_typediff()
	local tab_TicketType = {
		{QUESTKEY_TICKET, 2},
		{QUESTKEY_TICKET_NEW, 3}
		};
	local nOldSilverCount = GetItemCountEx(QUESTKEY_TICKET);
	local nNewSilverCount = GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (nOldSilverCount > 0) then
		return tab_TicketType[1];
	elseif (nNewSilverCount > 0) then
		return tab_TicketType[2];
	else
		return nil;
	end;
end;
-- ����Ʊ���ֳ�30Сʱ
function pay_ticket_hours()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("Ǯׯ�ϰ壺������û����Ʊ����", 1, "���ˣ������ڼ�����/no");
		return
	end;
	DelItemEx(tab_TicketType[1]);
	UseSilver(tab_TicketType[2], 0, 1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a TICKET for 30 HOUR CHARGE", 0, 0, 0, -1 );
	Say("Ǯׯ�ϰ壺<color=red>��Ʊ<color>�һ���<color=red>30Сʱ<color>��������ĺ˲顣", 1, "֪����/no")
end

-- ����Ʊ���ֳ�7��
function pay_ticket_days()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("Ǯׯ�ϰ壺������û����Ʊ����", 1, "���ˣ������ڼ�����/no");
		return
	end;
	DelItemEx(tab_TicketType[1])
	UseSilver(tab_TicketType[2], 1, 1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a TICKET for 7 DAY CHARGE", 0, 0, 0, -1 );
	Say("Ǯׯ�ϰ壺<color=red>��Ʊ<color>�һ���<color=red>7��<color>��������ĺ˲顣", 1, "֪����/no")
end

function pay_ingot_35a()
	if (SYSCFG_GAMEBANK_GOLD_PAY == nil) then -- ������~~
		print("pay_gold35 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end

	if (GetItemCountEx(343) > 0) then 
	DelItemEx(343)
	UseSilver(0,1,1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a GOLD for 25 DAY CHARGE", -1, 0, 0, 0 );
	Say("Ǯׯ�ϰ壺<color=red>��Ԫ��<color>�һ���<color=red>25��<color>��������ĺ˲顣",1,"֪����/no")
	end
end

function pay_ingot_35b()
	if (SYSCFG_GAMEBANK_GOLD_PAY == nil) then -- ������~~
		print("pay_gold35 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetItemCountEx(343) > 0) then
	DelItemEx(343)
	UseSilver(0,0,1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a GOLD for 600 POINT CHARGE", -1, 0, 0, 0 );
	Say("Ǯׯ�ϰ壺<color=red>��Ԫ��<color>�һ���<color=green>600��<color>��������ĺ˲顣",1,"֪����/no")
	end
end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetItemCountEx(342) > 0) then 
	DelItemEx(342)
	UseSilver(1,1,1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a SILVER for 6 DAY CHARGE", 0, -1, 0, 0 );
	Say("Ǯׯ�ϰ壺<color=green>��Ԫ��<color>�һ���<color=red>6��<color>��������ĺ˲顣",1,"֪����/no")
	end
end

function pay_ingot_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetItemCountEx(342) > 0) then 
	DelItemEx(342)
	UseSilver(1,0,1)
	-- SaveQuickly()
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") USE a SILVER for 150 POINT CHARGE", 0, -1, 0, 0 );
	Say("Ǯׯ�ϰ壺<color=green>��Ԫ��<color>�һ���<color=green>150��<color>��������ĺ˲顣",1,"֪����/no")
	end
end

------------- ȷ����Ʊ�һ�ͭǮ---------------------
function change_ticket_to_coin()
	if (SYSCFG_GAMEBANK_TICKET_COIN == nil) then -- ������~~
		print("coin_ticket have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	local count = GetItemCountEx(QUESTKEY_TICKET) + GetItemCountEx(QUESTKEY_TICKET_NEW);
	if (count > 0) then
		Say( "Ǯׯ�ϰ壺��ȷ��Ҫ����Ʊ�һ���ͭǮ��", 2, "<#>����Ʊ�һ���"..COIN_CHANGE_COUNT_OF_TICKET.."<#>��ͭǮ/confirm_ticket_to_coin", "���һ���/no");
	else
		Say( "Ǯׯ�ϰ壺������û����Ʊ����", 1, "���ˣ������ڼ�����/no");
	end
end

------------- ��Ʊ�һ�ͭǮ---------------------
function confirm_ticket_to_coin()
	local tab_TicketType = pay_ticket_typediff();
	if (not tab_TicketType) then
		Say("Ǯׯ�ϰ壺������û����Ʊ����", 1, "���ˣ������ڼ�����/no");
		return
	end;
	DelItemEx(tab_TicketType[1]);
	AddStackItem(COIN_CHANGE_COUNT_OF_TICKET, 4, 417, 1, 1, 0, 0, 0);
	UseSilver(tab_TicketType[2], 2, 1); -- ��Ʊ�һ�ΪͭǮ������ͳ��
	-- SaveQuickly();
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a TICKET into "..COIN_CHANGE_COUNT_OF_TICKET.." COINS", 0, 0, COIN_CHANGE_COUNT_OF_TICKET, -1 );
	Say( "<#>Ǯׯ�ϰ壺������Ʊ�ѳɹ��һ���" .. COIN_CHANGE_COUNT_OF_TICKET .. "<#>��ͭǮ������ĺ˲顣", 2, "֪����/no", "�ٶһ�һЩͭǮ/change_ticket_to_coin" );
end

------------- Ԫ���һ�ͭǮ---------------------
function change_ingot_to_coin()	
	local nGoldCount = GetItemCountEx( 343 );		-- ��Ԫ������
	local nSilverCount = GetItemCountEx( 342 );		-- ��Ԫ������
	
	if( nGoldCount > 0 and nSilverCount > 0 ) and (SYSCFG_GAMEBANK_GOLD_COIN and SYSCFG_GAMEBANK_SILVER_COIN) then			-- ���ֶ��У�ѯ�ʶ�������
		Say( "Ǯׯ�ϰ壺����һ��ĸ�Ԫ���أ�", 3, "<#>�ѽ�Ԫ���һ���"..COIN_CHANGE_COUNT_OF_GOLD.."<#>��ͭǮ/change_gold_to_coin", "<#>����Ԫ���һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ/change_silver_to_coin", "���һ���/no");
	elseif( nGoldCount > 0 and SYSCFG_GAMEBANK_GOLD_COIN) then							-- ֻ�н�Ԫ��
		Say( "Ǯׯ�ϰ壺����һ��ĸ�Ԫ���أ�", 2, "<#>�ѽ�Ԫ���һ���"..COIN_CHANGE_COUNT_OF_GOLD.."<#>��ͭǮ/change_gold_to_coin", "���һ���/no");
	elseif( nSilverCount > 0 and SYSCFG_GAMEBANK_SILVER_COIN) then							-- ֻ����Ԫ��
		Say( "Ǯׯ�ϰ壺����һ��ĸ�Ԫ���أ�", 2, "<#>����Ԫ���һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ/change_silver_to_coin", "���һ���/no");
	elseif (nGoldCount <= 0 and SYSCFG_GAMEBANK_GOLD_COIN) or (nSilverCount <= 0 and SYSCFG_GAMEBANK_SILVER_COIN) then	-- һ�ֶ�û��
		Say( "Ǯׯ�ϰ壺������û��Ԫ������", 1, "���ˣ������ڼ�����/no");
	end
end

function change_gold_to_coin()
	if (SYSCFG_GAMEBANK_GOLD_COIN == nil) then -- ������~~
		print("coin_gold have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end

	if (GetItemCountEx(343) > 0) then
	DelItemEx( 343 );
	AddStackItem( COIN_CHANGE_COUNT_OF_GOLD, 4, 417, 1, 1, 0, 0, 0 );
	UseSilver(0, 2, 1); -- ��Ԫ���һ�ΪͭǮ������ͳ��
	-- SaveQuickly();
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a GOLD into "..COIN_CHANGE_COUNT_OF_GOLD.." COINS", -1, 0, COIN_CHANGE_COUNT_OF_GOLD, 0 );
	local nGoldCount = GetItemCountEx( 343 );		-- ��Ԫ������
	local nSilverCount = GetItemCountEx( 342 );		-- ��Ԫ������
	if( nGoldCount > 0 or nSilverCount > 0 ) then
		Say( "<#>Ǯׯ�ϰ壺���Ľ�Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_GOLD.."<#>��ͭǮ������ĺ˲顣", 2, "֪����/no", "�ٶһ�һЩͭǮ/change_ingot_to_coin" );
	else
		Say( "<#>Ǯׯ�ϰ壺���Ľ�Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_GOLD.."<#>��ͭǮ������ĺ˲顣", 1, "֪����/no" );
	end
	end
end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- ������~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("���ܳ���");
		return
	end
	
	if (GetItemCountEx(342) > 0) then
	DelItemEx( 342 );
	AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
	UseSilver(1, 2, 1); -- ��Ʊ�һ�ΪͭǮ������ͳ��
	-- SaveQuickly();
	SaveNow(); -- ��������
	WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER, 0 );
	local nGoldCount = GetItemCountEx( 343 );		-- ��Ԫ������
	local nSilverCount = GetItemCountEx( 342 );		-- ��Ԫ������
	if( nGoldCount > 0 or nSilverCount > 0 ) then
		Say( "<#>Ǯׯ�ϰ壺������Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ������ĺ˲顣", 2, "֪����/no", "�ٶһ�һЩͭǮ/change_ingot_to_coin" );
	else
		Say( "<#>Ǯׯ�ϰ壺������Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ������ĺ˲顣", 1, "֪����/no" );
	end
	end
end

------------ ����ͭǮ ------------------
function onAboutCoin()
	local msg = {
		"Ǯׯ�ϰ壺ͭǮ���Դ���������Ԫ������Ʊ���ã�Ԫ������Ʊ����ͭǮ�󲻿����ٻ��ء�",
		"<#>Ǯׯ�ϰ壺һ��<color=yellow>��Ԫ��<color>�ɶһ�<color=yellow>"..COIN_CHANGE_COUNT_OF_GOLD.."<color>öͭǮ��һ��<color=yellow>��Ԫ��<color>�ɶһ�<color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color>ö��һ��<color=yellow>��Ʊ<color>�ɶһ�<color=yellow>"..COIN_CHANGE_COUNT_OF_TICKET.."<color>ö��",
		"Ǯׯ�ϰ壺��ͭǮ�����ڸ������е��㷷���������ϡ����Ʒ��",
		"Ǯׯ�ϰ壺���������Ҫ���ŵ�ͭǮ������ƶ�����һ��ͭǮ���������������ͭǮ�ͻ���ŵ�һ��ÿ��ͭǮ���ŵ�������<color=yellow>100<color>������ס<color=yellow>Shift<color>�������������Ҫ��ֵ�ͭǮ������������ͭǮ������������ɲ�֡�"
	};
	Talk(4, "", msg[1], msg[2], msg[3], msg[4]);
end

----------------------------------------
function no()
end
