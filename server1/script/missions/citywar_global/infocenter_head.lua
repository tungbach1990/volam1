IncludeLib("LEAGUE")
IncludeLib("TONG")
Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\citywar_function.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\citywar_global\\ladder.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

LGTSK_QINGTONGDING_COUNT = 1;	--������Ͷ�� ��ս������
LGTSK_CITYWAR_SIGNCOUNT = 2;	--��ǰ��Ͷ�Ĵ���

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
nCityWar_Item_ID_G = 6		--����ս����G ID
nCityWar_Item_ID_D = 1	--����ս����D ID
nCityWar_Item_ID_P = 1499		--����ս����P ID
TIAOZHANLING_TASK_DATE = 1839 --��ս���¼��ȡʱ��,1.ʱ��(��%y),2.ʱ��(��)��3.ʱ��(��),4.��ȡ����
TIAOZHANLING_TASK_COUNT = 1840 --��ս��ɴ���
	
function OnCancel()
end;

function PreEnterGame()
	--���������ڰ�����ڽ�����̨��,���Զ�����ó���
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;

	--����,������Լ�ѡ�������һ��
	EnterGame();
end;

function EnterGame()
	ExtraArenaInfo = {"<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) ", "<#> (Kho�ng tr�ng) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("B�n mu�n v�o c�ng th�nh chi�n d� tuy�n thi ��u l�i ��i kh�ng??", 9, "<#> L�i ��i 1"..ExtraArenaInfo[1].."/EnterBattle", "<#> L�i ��i 2"..ExtraArenaInfo[2].."/EnterBattle", "<#> L�i ��i 3"..ExtraArenaInfo[3].."/EnterBattle", "<#> L�i ��i 4"..ExtraArenaInfo[4].."/EnterBattle", "<#> L�i ��i 5"..ExtraArenaInfo[5].."/EnterBattle", "<#> L�i ��i 6"..ExtraArenaInfo[6].."/EnterBattle", "<#> L�i ��i 7"..ExtraArenaInfo[7].."/EnterBattle", "<#> L�i ��i 8"..ExtraArenaInfo[8].."/EnterBattle","Kh�ng �i n�a/OnCancel");
end;

function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	--���÷��ص�
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);

	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;


-- function main()
	--
--	ArenaMain();
-- end

--����ָ��������̨�� [wxb 2004-3-31](����2006-11-22)
function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nh�p s� ti�n ��u th�u v�o:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >th�nh, b�o danh tr�n L�i ��i ch�a b�t ��u ", 0);
	end;
end;

--����Ψһ�����ڱ����׶ε���̨�� [wxb 2004-3-31](����2006-11-22)
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nh�p s� ti�n ��u th�u v�o:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >th�nh, b�o danh tr�n L�i ��i ch�a b�t ��u ", 0);
	end;
end;

--�������Ͷ�������� [wxb 2004-3-31](����2006-11-22)
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);
end;

--��ѯ���쾺Ͷ��ս������
function citywar_CheckVotes()
	local nCityId = getSigningUpCity(1);
	local tbVotes = citywar_tbLadder:GetInfo()
	local szMsg = format("<dec><npc>B�n d��i l� bang h�i tham gia ��u gi� khi�u chi�n l�nh <%s>: <enter>%s%s%s<enter>", GetCityAreaName(nCityId), strfill_center("STT",4, " "), strfill_center("Bang h�i", 20, " "), strfill_center("S� l��ng", 20, " "))
	local res = {}
	for i = 1, getn(tbVotes) do
		tinsert(res, strfill_center(i, 4, " "))
		tinsert(res, strfill_center(tbVotes[i].szName, 20, " "))
		tinsert(res, strfill_center(tbVotes[i].nValue, 20, " "))
		tinsert(res, "<enter>")
	end
	PushString(szMsg)
	for i = 1, getn(res) do
		AppendString(res[i])
	end
	szMsg = PopString()
	TaskSayList(szMsg, "C�m �n! Ta �� r� r�i./OnCancel")
end
--���
function ArenaMain()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Say(format("Hi�n t�i c�ng th�nh chi�n th�nh <%s> �ang cho b�o danh, ng��i mu�n ��ng k� kh�ng?",GetCityAreaName(nCityId)), 7, "B�o danh c�ng th�nh chi�n/SignUpCityWar", "Ta mu�n xem t�nh h�nh b�o danh c�ng th�nh chi�n/ViewCityWarTong","Ta mu�n xem s� l��ng khi�u chi�n l�nh c�a bang/ViewTiaoZhanLing","T�m hi�u t�nh h�nh c�ng th�nh chi�n/GameInfo", "S� ngh� Th�nh chi�n l�nh b�i/TokenCard", "Mua d�ng c� h� tr� C�ng th�nh chi�n/AskDeal", "Kh�ng mu�n g� c� /OnCancel");
	else
		Say("��y l� n�i ngh� s� c�ng th�nh chi�n, ng��i ��n c� vi�c g�?",
			7,
			"Ta ��n giao l�nh b�i/GiveTiaoZhanLing",
			"Xem t�nh h�nh ��u gi� khi�u chi�n l�nh/citywar_CheckVotes" ,
			"Ta mu�n xem s� l��ng khi�u chi�n l�nh c�a bang/ViewTiaoZhanLing",
			"T�m hi�u t�nh h�nh c�ng th�nh chi�n/GameInfo",
			"S� ngh� Th�nh chi�n l�nh b�i/TokenCard",
			"Mua d�ng c� h� tr� C�ng th�nh chi�n/AskDeal",
			"Kh�ng mu�n g� c� /Cancel");
	end;
end;

--�鿴�Ѿ������μӹ���ս�İ��
function ViewCityWarTong()
	local caption = nil
	local nCityId = getSigningUpCity(1);
	local nlgID = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId)) 
	--LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId),
	local nlgcount = LG_GetMemberCount(nlgID)
	if nlgcount == 0 then
		caption = "<dec>Hi�n tai ch�a c� bang h�i n�o b�o danh c�ng th�nh."	
	else
		caption = "<dec>Bang h�i b�o danh c�ng th�nh chi�n: \n"
		PushString(caption)
		for nindex=0,nlgcount do
			szTongName = LG_GetMemberInfo(nlgID,nindex)
			AppendString("<color=yellow>")
			AppendString(szTongName)
			AppendString("<color>\t")
		end
		caption = PopString()
	end
	local option = {"Tr� v�/ArenaMain", "Tho�t ra/OnCancel"}
	TaskSay(caption, option)
end

--������ս��
function GiveTiaoZhanLing()
	if checkBangHuiLimit() == 0 then
			Say("Xin l�i! ��i hi�p ch�a gia nh�p bang h�i n�o c�!",0);
			return 0;
	end
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCount >= 300) then
			Say("M�i ng�y giao n�p t�i �a 300 l�nh b�i. H�m nay ng��i �� giao 300 l�nh b�i r�i, ng�y mai h�y ti�p t�c.",0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end

	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	local szTongName, nTongID = GetTongName();
	local nsum = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nsum >= 2000000000 then   --���޴�20���������ύ
		Say("T�ng s� v� l�m l�nh �� ��t gi�i h�n. L�c kh�c th� l�i v�y.",0)
		return 0;
	end
	--**�ύ��ս��
	GiveItemUI("Giao n�p khi�u chi�n l�nh", "Khi�u chi�n l�nh c� th� ��i 50000 �i�m kinh nghi�m, d�ng �� b�o danh c�ng th�nh chi�n cho bang h�i.", "sure_GiveTiaoZhanLing", "OnCancel");
end

function sure_GiveTiaoZhanLing(nCount)
	if nCount <= 0 then
		Say("Th�t ��ng ti�c, ng��i ch�a giao v�t ph�m nhi�m v� cho ta",2,"Giao l�i v�t ph�m/GiveTiaoZhanLing","�� ta suy ngh� l�i/OnCancel");
		return 0;
	end
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= nCityWar_Item_ID_G or d ~= nCityWar_Item_ID_D or p ~= nCityWar_Item_ID_P) then
			Say("Ta kh�ng nh�n nh�ng th� kh�c, ch� c�n ��a ta <color=yellow>Khi�u chi�n l�nh<color> l� ���c r�i.", 2,"Giao l�i v�t ph�m/GiveTiaoZhanLing","�� ta suy ngh� l�i/OnCancel");
			return 0;
		end;
	end;
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCountall = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCountall+nCount > 300) then
			Say(format("Th�t ��ng ti�c, h�m nay ng��i �� n�p v�o %d khi�u chi�n l�nh, ch� c�n n�p %d l�nh b�i n�a l� ���c r�i.",nCountall,300-nCountall),0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end
	local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local szplayName = GetName()
	--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName);
	--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
	--local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE, szTongName, szplayName, LGTSK_QINGTONGDING_COUNT);
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	--ConsumeEquiproomItem(nCount, nCityWar_Item_ID_G, nCityWar_Item_ID_D, nCityWar_Item_ID_P, -1);
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;
	SetTask(TIAOZHANLING_TASK_COUNT,nCountall+nCount);
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "");
	
	
	--print(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "")
	--���Ӿ���,�ύ1������5����
	nAddExp = nCount * 50000
	AddOwnExp(nAddExp)
	Msg2Player(format("B�n �� n�p v�o %d khi�u chi�n l�nh, nh�n ���c %d �i�m kinh nghi�m",nCount,nAddExp))
	WriteLog(format("[C�ng th�nh chi�n_giao khi�u chi�n l�nh]Date:%s Account:%s Name:%s Tong:%s Count:%d Exp:%d",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szTongName,nCount,nAddExp))
end;

--��ѯ��ս��
function ViewTiaoZhanLing()
		local szTongName, nTongID = GetTongName();
		if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then
			Say("Th�t ��ng ti�c, ch� c� bang ch� v� tr��ng l�o m�i c� th� xem th�ng tin s� l��ng Khi�u Chi�n L�nh.", 0);
			return 0
		end
		--local szlgname = GetTongName();
		--****�ж��Ƿ񴴽��˸�����
		checkCreatLG(szTongName);
	
		--**�ж��Ƿ�����˸�����
		checkJoinLG(szTongName);
		--local nCityId = getSigningUpCity(1);
		--local szTongName, nTongID = GetTongName();
		--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE, szTongName);
		--local szplayName = GetName()
		--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
		--Msg2Player(nlid)
		--local nCurCount = LG_GetMemberTask(nlid, LGTSK_TIAOZHANLING_COUNT)
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		
		Say(format("Qu� bang �� n�p v�o <color=yellow>%d<color> khi�u chi�n l�nh.",nCurCount),0)
end

--�������ƵĴ��� start************************************************
function TokenCard()
	Say("Th�nh Chi�n l�nh b�i d�nh cho nh�ng ng��i mu�n v�o chi vi�n cho bang h�i c�ng th� th�nh! Xin cho h�i m�c ��ch c�a ngh�a s�?", 4, "Mua Th�nh chi�n l�nh b�i/BuyCard", "Th� l�nh b�i/CheckCard", "Tr� l�i l�nh b�i/ReturnCard", "Kh�ng l�m g� c� /OnCancel");
end;

function BuyCard()
	if (GetName() == GetTongMaster()) then
		TongName, result = GetTong()
		for i = 1, 7 do
			Tong1, Tong2 = GetCityWarBothSides(i);
			if (Tong1 == TongName) then
				SetTaskTemp(15, CardTab[i * 2 - 1]);
				str_format = format("Th� ra ��i hi�p l� ng��i khi�u chi�n th�nh %s, l�i h�i qu�, � ��y c� b�n l�nh b�i c�ng th�nh c� hi�u l�c trong 5 ng�y d�nh li�n minh c�a qu� bang, m�i l�nh b�i gi� %s l��ng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua m�t �t/DealBuyCard", "T�m th�i kh�ng c�n/OnCancel");
				return
			elseif (Tong2 == TongName) then
				SetTaskTemp(15, CardTab[i * 2]);
				str_format = format("Th� ra ��i hi�p l� th�i th� th�nh %s, t�i ��y c� b�n l�nh b�i th� th�nh c� hi�u l�c 5 ng�y d�nh cho li�n minh c�a qu� bang, m�i l�nh b�i gi� %s l��ng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua m�t �t/DealBuyCard", "T�m th�i kh�ng c�n/OnCancel");
				return
			end;
		end;
		Say("B�n kh�ng c� quan h� g� v�i c�c bang ph�i c�ng th� th�nh! Kh�ng th� s� d�ng Th�nh chi�n l�nh b�i!", 0);
	else
		Say("Ch� c� bang ch� m�i ���c mua Th�nh Chi�n l�nh b�i", 0);
	end;
end;

function DealBuyCard(CardID)
	AskClientForNumber("PayForCard", 1, 30, "B�n c�n bao nhi�u?");
end;

function PayForCard(count)
	CardItemID = GetTaskTemp(15);
	if (CardItemID > 0 and count > 0) then
		if (Pay(count * CardPrice) ~= 0) then
			for i = 1,count do
				AddEventItem(CardItemID);
			end;
			Say("Xin h�y gi� k�! L�nh b�i n�y d�ng �� ki�m ch�ng ��ng minh tr�n chi�n tr��ng! Xin ch� � th�i gian tr�n l�nh b�i, ch� c� hi�u l�c 5 ng�y, n�u qu� th�i gian s� kh�ng s� d�ng ���c,c� th� quay l�i ��y tr� l�i v� l�y l�i ph� ", 0);
		end;
	end;
end;

function CheckCard()
	count = 0;
	CardItemID = 0;
	for i=1,14 do
		newcount = count + GetItemCountEx(CardTab[i])
		if (newcount > count) then
			CardItemID = CardTab[i];
			count = newcount;
		end;
	end;
	if (count == 0) then
		Say("B�n kh�ng h� c� l�nh b�i n�o trong ng��i!", 0);
	elseif (count > 1) then
		Say("B�n mang qu� nhi�u Th�nh Chi�n l�nh b�i, kh�ng bi�t b�n mu�n ki�m ch�ng c�i n�o! Xin ch� mang m�t l�nh b�i th�i!", 0);
	elseif (CardItemID ~= 0) then
		life = GetItemLife(CardItemID);
		if (life < 0) then
			Say("T�nh tr�ng t�m l�nh b�i n�y l�.......", 0);
		elseif (life < 7200) then
			Say(format("S� l�nh b�i c�ng th�nh n�y ph�i ���c ph�t tr��c %s ng�y, hi�n v�n c�n hi�u l�c.",floor(life/1440)), 0)
		else
			Say(format("S� l�nh b�i c�ng th�nh n�y ph�i ���c ph�t tr��c %s ng�y, hi�n �� qu� h�n, kh�ng c�n hi�u l�c s� d�ng.",floor(life/1440)), 0);
		end;
	end;
end;

function ReturnCard()
	count = 0;
	for i=1,14 do
		count = count + GetItemCountEx(CardTab[i]);
	end;
	if (count <= 0) then
		Say("B�n kh�ng h� c� l�nh b�i n�o trong ng��i!", 0);
	else
		str_format = format("L�nh b�i c�ng th�nh ���c thu l�i v�i gi� %s l��ng, ng��i ��ng � tr� l�i kh�ng?",count*ReturnCardPrice);
		Say(str_format, 2, "ta mu�n tr� l�i /DealReturnCard", "Kh�ng, ta ch� h�i ch�t th�i/OnCancel");
	end;
end;

function DealReturnCard()
	money = 0;
	for i=1,14 do
		count = GetItemCountEx(CardTab[i]);
		if (count > 0) then
			money = money + count * ReturnCardPrice;
			for j=1,count do DelItemEx(CardTab[i]) end;
		end;
	end;
	Earn(money);
end;
--�������ƵĴ��� end**************************************************

--AskDeal����ս�������� ת��citywar_global\\citywar_function.lua

--�˽⹥��ս��� start************************************************
function GameInfo()
Say("Mu�n t�m hi�u th�ng tin th�nh th� n�o?", 9, GetCityAreaName(1).."/CityInfo", GetCityAreaName(2).."/CityInfo", GetCityAreaName(3).."/CityInfo", GetCityAreaName(4).."/CityInfo", GetCityAreaName(5).."/CityInfo", GetCityAreaName(6).."/CityInfo", GetCityAreaName(7).."/CityInfo", "Tr� v�/ArenaMain", "Kh�ng c�n ��u/OnCancel");
end;

--"���̰���/ArenaInfo", 
--"������/AllArenaInfo", 
function CityInfo(nSel)
	local nCityId =  nSel + 1;
	SetTaskTemp(245, nCityId);
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(format("Mu�n t�m hi�u th�ng tin g� v� c�ng th�nh chi�n %s?",GetCityAreaName(nCityId)), 4, 
		"T�nh h�nh b�o danh/RegisterInfo", 
		"C�ng th�nh chi�n s� /CityWarInfo", 
		"Tr� v�/GameInfo", 
		"Kh�ng c�n ��u/OnCancel");
end;

function RegisterInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	
	local nHour = tonumber(GetLocalDate("%H"));
	if (nHour<18 or nHour>=19) then
		Say("Hi�n t�i kh�ng ph�i l� th�i gian b�o danh c�ng th�nh chi�n.", 2, "Tr� v�/GameInfo", "Kh�ng c�n ��u/OnCancel");
		return 0;
	end;
	if (nCityId ~= getSigningUpCity(1) or getSignUpState(nCityId) ~= 1) then
		Say(format("Hi�n t�i c�ng th�nh chi�n <%s> kh�ng � giai �o�n b�o danh.",GetCityAreaName(nCityId)), 2, "Tr� v�/GameInfo", "Kh�ng c�n ��u/OnCancel");
		return 0;
	end;
	
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<����>"
	if (szElector == "" or szElector == nil) then
		szElector = "<T�m th�i kh�ng>";
	end;
Say(format("C�ng th�nh chi�n <%s> �ang ���c chu�n b�, bang h�i thi �ua l�nh b�i x�p h�ng th� nh�t l� : %s<color=red><enter>N�u c� bang n�o c� s� l��ng l�nh b�i b�ng v�i bang x�p th� 1, th� h� th�ng s� ng�u nhi�n ch�n ra bang c�ng th�nh cho ng�y mai.<color>",GetCityAreaName(nCityId),szElector), 2, "Tr� v�/GameInfo", "Kh�ng c�n ��u/OnCancel");
end;


function getCityWarElector(szLeagueName)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)

	if (leagueObj == 0) then
		return 
	end;
	local nMem = LG_GetMemberCount(leagueObj);
	if (nMem < 1) then
		return
	end;
	local szMem = "";
	local tbMem = {};
	for i = 0, nMem - 1 do
		szMem = LG_GetMemberInfo(leagueObj, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	--local szMem = LG_GetMemberInfo(leagueObj, 0)
	return tbMem[random(getn(tbMem))][1];
	--return LG_GetMemberInfo(leagueObj, 0)
end;

--���̰���-(����2006-11-22)
function ArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(GetArenaSchedule(nCityId), 0);
end;

function AllArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	--Say(GetArenaInfoByCity(nCityId), 0);
end;

function CityWarInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	local str_format = format("C�ng th�nh chi�n <%s> ng�y mai: ",GetCityAreaName(nCityId));
	local str1, str2 = GetCityWarBothSides(nCityId);
	if (str1 ~= "" and str2 ~= "" ) then
		if (nCityId == getSigningUpCity(2)) then
			str_format = format("C�ng th�nh chi�n <%s> h�m nay: ",GetCityAreaName(nCityId));
			if (HaveBeginWar(nCityId) == 1) then 
				str_format = format("Tr��c m�t <%s> �ang � giai �o�n c�ng th�nh chi�n: ",GetCityAreaName(nCityId));
			end;
		end;
		str_format = format("Phe th� %s l� %s, phe c�ng l� %s!",str_format,str2,str1);
		Say(str_format , 2, "Tr� v�/GameInfo", "Kh�ng c�n ��u/OnCancel");
	else
		Say(format("Tr��c m�t %s ch�a b��c v�o giai �o�n c�ng th�nh chi�n!",GetCityAreaName(nCityId)) , 2, "Tr� v�/GameInfo", "Kh�ng c�n ��u/OnCancel");
	end;
end;


--�˽⹥��ս��� end**************************************************

--��ȡ�������� start**************************************************
	function checkIsTakeQingtongDing(szTongName, nTongID, nCityId)
		if (nTongID == 0 or GetTongMaster()~= GetName()) then
			Say("Ch� c� bang ch� bang b�o danh c�ng th�nh v� bang th�t b�i trong cu�c thi th� l�nh b�i m�i c� th� nh�n l�i t�n v�t.", 0);
			return 0;
		end;
		if (nCityId < 1 or nCityId > 7) then
			return 0;
		end;
		
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour < 19) then
			Say("Th�i gian nh�n l�i t�n v�t c�ng th�nh chi�n �� h�t, trong kho�ng th�i gian t� 19h00 ��n 24h00 m�i ng�y, bang h�i tranh �ua l�nh b�i th�t b�i c� th� ��n ch� ta �� nh�n l�i khi�u chi�n l�nh.", 0)
			return 0;
		end;
		
		if (getSignUpState(nCityId) == 1) then
			Say(format("B�o danh tham gia tranh �ua l�nh b�i th�nh %s cho ng�y mai v�n ch�a k�t th�c, h�y ti�p t�c tham gia.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityWarBothSides(nCityId);
		if (szChallenger == szTongName) then
			Say(format("Qu� bang �� tr� th�nh bang c�ng th�nh %s v�o ng�y mai, t�n v�t c�ng th�nh ta �� giao l�i cho th�i th� r�i.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityOwner(nCityId);
		if (szChallenger == szTongName) then
			Say(format("Ng��i �� l� th�i th� th�nh %s, kh�ng c�n ph�i nh�n t�n v�t c�ng th�nh n�a.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
		if (FALSE(nlid)) then
			Say("Ch�a b�o danh tham gia c�ng th�nh chi�n ng�y mai, � ��y kh�ng c� t�n v�t c�a ng��i.", 0);
			return 0;
		end;
		return 1;
	end;
	
	function getSignUpState(nCityId)
		return LG_GetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), 1);
	end;
	
function TakeQingtongDing()
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) ~= 1) then
		return 0
	end;
	local ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	if (ncount < 1) then
		Say("T�n v�t b�o danh c�ng th�nh ta �� tr� l�i h�t cho ng��i r�i.", 0);
	else
		Say(format("Ng��i c� %s khi�u chi�n l�nh, h�y s�p x�p l�i h�nh trang tr��c khi nh�n l�i l�nh b�i.",ncount), 3, "Ta mu�n nh�n l�nh/#sure_takeQingtongDing("..ncount..")", "Tr� v�/ArenaMain", "L�t n�a quay l�i /OnCancel");
	end;
end;

function sure_takeQingtongDing(ncount)
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) == 1) then
		local nFree = CalcFreeItemCellCount();
		if (nFree > 6) then
			local szMsg = format("��y l� <color=yellow>%s<color> khi�u chi�n l�nh c�a ng��i.",ncount);
			if (nFree < ncount) then
				szMsg = format("Ng��i c� <color=yellow>%s<color> khi�u chi�n l�nh, v� h�nh trang kh�ng ��, ta tr� l�i tr��c %s c�i. V�n c�n <color=yellow>%s<color> c�i ch�a nh�n, h�y nh�n tr��c 24h00 ng�y h�m nay!",ncount,nFree,(ncount - nFree));
				ncount = nFree;
			end;
			for i =1, ncount do
				AddItem(nCityWar_Item_ID_G,nCityWar_Item_ID_D,nCityWar_Item_ID_P,1,1,1);--qingtongding
			end;
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, -nFree);
			WriteLog(format("[Tranh �ua c�ng th�nh chi�n]%s Name:%s Account:%s Tong:%s Th�nh th�: %s Nh�n l�i khi�u chi�n l�nh %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),ncount));
			Say(szMsg, 0);
		else
			Say("H�nh trang kh�ng �� ch� tr�ng. Ch� � l� tr��c 24h00 ph�i ��n nh�n l�i t�n v�t, n�u kh�ng s� kh�ng th� nh�n l�i n�a.", 0);
		end;
	end;
end;

--��ȡ�������� end****************************************************

--��������ս start****************************************************
function SignUpCityWar()
	local nCityId = getSigningUpCity(1);
	
	local szTongName, nTongID = GetTongName();
	
	if (checkSignUpCityWar(szTongName, nTongID, nCityId) ~= 1) then
		return 0;
	end;
	
	local szMsg = format("<dec>Hi�n t�i �ang ti�n h�nh b�o danh th�nh %s.",GetCityAreaName(nCityId));
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<����>"
	
	if (szElector == "" or szElector == nil) then
		szElector = "<T�m th�i kh�ng>";
	end;

	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	if (FALSE(nlid)) then
		szMsg = szMsg.."Ch� c�n c� 'Khi�u chi�n l�nh' th� c� th� tham gia tranh �ua. Qui t�c tranh �ua: Bang h�i ch�a chi�m th�nh c�p 18 tr� l�n c� th� s� d�ng 'Khi�u chi�n l�nh' �� tham gia tranh �ua. Th�i gian tranh �ua l� 18h00 ��n 19h00 m�i ng�y. Tr��c 19h00, bang h�i n�o ��t v�o s� l��ng khi�u chi�n l�nh nhi�u nh�t s� nh�n ���c quy�n c�ng th�nh chi�n ng�y mai.<color=red><enter>N�u c� bang h�i c� c�ng s� l�nh b�i v�i bang x�p th� 1 th� h� th�ng s� ng�u nhi�n ch�n ra m�t bang c�ng th�nh cho ng�y mai.<color><enter>Bang h�i hi�n t�i x�p th� 1 l�: "..szElector
	else
		
		local nCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
		
		--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT)
		szMsg = format("%sQui t�c tranh �ua : Bang h�i ch�a chi�m th�nh c�p 18 tr� l�n c� th� s� d�ng 'Khi�u chi�n l�nh' �� tham gia tranh �ua. Th�i gian tranh �ua l� 18h00 ��n 19h00 m�i ng�y. Tr��c 19h00, bang h�i n�o ��t v�o s� l��ng khi�u chi�n l�nh nhi�u nh�t s� nh�n ���c quy�n c�ng th�nh chi�n ng�y mai.<color=red><enter>N�u c� bang h�i c� c�ng s� l�nh b�i v�i bang x�p th� 1 th� h� th�ng s� ng�u nhi�n ch�n ra m�t bang c�ng th�nh cho ng�y mai.<color><enter>Bang h�i hi�n t�i x�p th� 1 l�: %s<enter>S� l��ng khi�u chi�n l�nh tranh �ua %s c�a qu� bang l�: %s",szMsg,szElector,szTongName,nCount)
	end;
	TaskSayList(szMsg, "Ta mu�n tranh �ua l�nh b�i/want_signupcitywar", "Tr� v�/ArenaMain", "�� ta suy ngh� l�i/OnCancel");
end;

function want_signupcitywar()
	--local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCurCount <= 0 then
		Say("Qu� bang kh�ng c� khi�u chi�n l�nh, kh�ng th� giao n�p, h�y thu th�p khi�u chi�n l�nh r�i h�y ��n t�m ta.",0)
		return 0
	end
	if nCurCount > 1000000 then
		nCurCount = 1000000
	end
	AskClientForNumber("sure_signupcitywar", 0,nCurCount,"Giao n�p khi�u chi�n l�nh")
	--if (FALSE(nlid)) then
		--if (GetCash() >= 10000000) then
			--GiveItemUI("����ս����", "�뽫����ս�������ս��Ž�ȥ�ɡ�", "sure_signupcitywar", "OnCancel");
		--else
			--Say("��һ�α�������ս��Ҫ����<color=yellow>1000W��<color>���ӣ�������û�д���ô��Ǯ������׼���ñ����������ɡ�", 0);
		--end;
	--else
		--local nNum = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName,LGTSK_CITYWAR_SIGNCOUNT);
		--if (nNum >= 3) then
			--Say("���ľ�Ͷ�����Ѿ��ﵽ<color=yellow>3��<color>�������ڲ��ܼ���Ͷע�������ȴ���Ͷ����Ĺ�����", 0);
		--else
			--GiveItemUI("����ս����", "ÿ����ս����Ի�ȡ5��㾭�飬��ս�������������ṥ��ս��", "sure_signupcitywar", "OnCancel");
		--end;
	--end;
end;

function sure_signupcitywar(nCount)
	--Msg2Player(nCount)
	
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if not (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Talk(1, "", "Hi�n t�i kh�ng ph�i l� th�i gian b�o danh c�ng th�nh chi�n.")
		return 1
	end
	
	
	
	
	local szTongName, nTongID = GetTongName();
	local nTongCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCount > nTongCurCount or nCount > 1000000 then
		Say("Khi�u chi�n l�nh kh�ng ��, kh�ng th� giao n�p, xin h�y thu th�p ti�p r�i quay l�i.",0)
		return 1
	end
	local nCityId = getSigningUpCity(1);
	local nlg = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	if (FALSE(nlid)) then
			local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
			--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
			LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
			LG_AddMemberToObj(nlg, nMemberID);
			local ret = LGM_ApplyAddMember(nMemberID, "", "")
			LGM_FreeMemberObj(nMemberID)
	end;

	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	local nCurCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount, "", "");
	--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount)
	citywar_tbLadder:AddOneInGameServer(nTongID, cityid_to_lgname(nCityId), szTongName, nCount)
	
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, -nCount, "", "");
	
	WriteLog(format("[Tranh �ua c�ng th�nh chi�n]%s Name:%s Account:%s TongName:%s Th�nh th�: %s S� l��ng tranh �ua c�ng th�nh: %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),(nCount + nCurCount)));
	
	local szFirstTong = checkFirstSignUpChallenger(cityid_to_lgname(nCityId), szTongName, nCount + nCurCount);
	if (szFirstTong == szTongName) then
		Say(format("S� l��ng khi�u chi�n l�nh bang %s hi�n t�i l�: <color=yellow>%s<color> c�i, t�m th�i x�p th� 1, tuy nhi�n, h�y lu�n theo d�i t�nh h�nh bi�n ��ng.",szTongName,(nCount + nCurCount)), 0);
	else
		Say(format("S� l��ng khi�u chi�n l�nh bang %s hi�n t�i l�: <color=yellow>%s<color> c�i. Bang h�i x�p th� 1 l� %s, qu� bang h�y ti�p t�c n� l�c.",szTongName,(nCount + nCurCount),szFirstTong), 0);
	end;
end;

function checkSignUpCityWar(szTongName, nTongID, nCityId)
	local nHour = tonumber(GetLocalDate("%H"));
	if (nTongID == 0 or GetTongMaster() ~= GetName()) then
		Say("Ng��i kh�ng ph�i l� bang ch�. Trong kho�ng th�i gian t� 18h00 ��n 19h00, bang ch� bang h�i ch�a chi�m th�nh c�p 18 tr� l�n c� th� ��n b�o danh tham gia c�ng th�nh chi�n cho ng�y h�m sau.", 0);
	elseif (nHour < 18 or nHour >= 19) then
		Say("Hi�n t�i kh�ng ph�i l� th�i gian b�o danh c�ng th�nh chi�n. M�i ng�y t� 18h00 ��n 19h00, bang h�i ch�a chi�m th�nh c�p 18 tr� l�n c� th� ��n ��y b�o danh tham gia c�ng th�nh chi�n cho ng�y h�m sau.", 0);
	elseif (TONG_GetExpLevel(nTongID) < 18) then
		Say("��i h�i ��ng c�p bang h�i ��t c�p 18 tr� l�n m�i c� th� b�o danh c�ng th�nh chi�n cho ng�y h�m sau.", 0);
	elseif (checkCityOwner(szTongName) ~= 0) then
		Say("Ng��i �� l� ch� th�nh, kh�ng c�n ph�i b�o danh c�ng th�nh.", 0);
	elseif (checkCItyChallenger(szTongName) ~= 0) then
			Say(format("Ng��i �� l� phe khi�u chi�n %s, kh�ng th� tranh �ua l�nh b�i trong ng�y h�m nay.",GetCityAreaName(checkCItyChallenger(szTongName))), 0);
	elseif (getSignUpState(nCityId) ~= 1) then
		Say("Hi�n t�i b�o danh c�ng th�nh v�n ch�a b�t ��u, h�y chu�n b� tinh th�n s�n s�ng", 0);
	else
		return 1;
	end;
	return 0;
end;

function checkCityOwner(szTongName)
	for i=1, 7 do
		if (GetCityOwner(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkCItyChallenger(szTongName)
	for i=1, 7 do
		if (GetCityWarBothSides(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkFirstSignUpChallenger(szLeagueName, szTongName, nCurCount)
	local szFirstTong = getCityWarElector(szLeagueName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)
	
	if (FALSE(szFirstTong)) then
		local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
		LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		
		LGM_FreeMemberObj(nMemberID);
		if (ret == 1) then
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szTongName, LGTSK_QINGTONGDING_COUNT, nCurCount);
		end;
		return szTongName;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLeagueName);
	local nCount = LG_GetMemberCount(nlid);
	local szTemTong = szFirstTong;
	for i = 0, nCount - 1 do
		local szMem = LG_GetMemberInfo(nlid, i);
		if (szMem == szFirstTong) then
			local nMemCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
			
			if (nMemCount <= nCurCount) then
				szTemTong = szTongName;
				break
			end;
		end;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
	if (szTemTong ~= szFirstTong) then
		local nMemberID = LGM_CreateMemberObj() -- �������ų�Ա���ݶ���(���ض���ID)
		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
		LGM_SetMemberInfo(nMemberID, szTemTong, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		LGM_FreeMemberObj(nMemberID);
		--LG_ApplyDoScript(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong, "\\script\\event\\citywar.lua", "citywar_removemem", szLeagueName.." "..szFirstTong);
		--LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong);
	end;
	return getCityWarElector(szLeagueName);
end;
--��������ս end******************************************************

