-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - �ƽ�װ�����Ӷһ��ƽ�װ��
-- �ļ�������ex_goldequp_coin.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 13:59:02

-- ======================================================

Include("\\script\\lib\\composelistclass.lua")
IncludeLib("LEAGUE")

local tbGoldEquip_Coin = {
	[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "K� Nghi�p Kim B�i", tbProp = {6,1,2075,1,0,0}, nCount = 100}},
		tbProduct = {szName = "K� Nghi�p Huy�n V� Ho�ng Kim Kh�i", nQuality = 1, tbProp = {0,22}},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "M�ng Long Kim B�i", tbProp = {6,1,2076,1,0,0}, nCount = 100}},
		tbProduct = {szName = "M�ng Long Huy�n Ti Ph�t ��i", nQuality = 1, tbProp = {0,3}},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Minh �o Kim B�i", tbProp = {6,1,2077,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Minh �o U ��c �m Y", nQuality = 1, tbProp = {0,62}},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��a Ph�ch Kim B�i", tbProp = {6,1,2078,1,0,0}, nCount = 100}},
		tbProduct = {szName = "��a Ph�ch Ng� h�nh Li�n Ho�n Qu�n", nQuality = 1, tbProp = {0,86}},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� Tr�n Kim B�i", tbProp = {6,1,2079,1,0,0}, nCount = 100}},
		tbProduct = {szName = "V� Tr�n Ng�c N� T� T�m qu�n", nQuality = 1, tbProp = {0,41}},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "B�ch H�i Kim B�i", tbProp = {6,1,2080,1,0,0}, nCount = 100}},
		tbProduct = {szName = "B�ch H�i H�ng Linh Kim Ti ��i", nQuality = 1, tbProp = {0,53}},
	},
	[7] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� �o Kim B�i", tbProp = {6,1,2081,1,0,0}, nCount = 100}},
		tbProduct = {szName = "V� �o Tung Phong Tuy�t �nh ngoa", nQuality = 1, tbProp = {0,140}},
	},
	[8] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma Th� Kim B�i", tbProp = {6,1,2082,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Ma Th� Huy�t Ng�c Th�t S�t B�i", nQuality = 1, tbProp = {0,114}},
	},
	[9] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "T�ng m�o kim b�i", tbProp = {6,1,2203,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "M�ng Long Ch�nh H�ng T�ng M�o",
			[1]	= {szName = "M�ng Long Ch�nh H�ng T�ng M�o", nQuality = 1, tbProp = {0,1}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>M�ng Long Ch�nh H�ng T�ng M�o<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
			
	},
	[10] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "U lung kim b�i", tbProp = {6,1,2204,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "U Lung X�ch Y�t M�t trang",
			[1]	= {szName = "U Lung X�ch Y�t M�t trang", nQuality = 1, tbProp = {0,57}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>U Lung X�ch Y�t M�t Trang<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		},
	},
	[11] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma s�t kim b�i", tbProp = {6,1,2205,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Ma S�t C� H�a Li�u Thi�n Ho�n",
			[1]	= {szName = "Ma S�t C� H�a Li�u Thi�n Ho�n", nQuality = 1, tbProp = {0,104}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>Ma S�t C� H�a Li�u Thi�n Uy�n<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		}
	},
	[12] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "��ch kh�i kim b�i", tbProp = {6,1,2206,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "��ch Kh�i Tri�n M�ng y�u ��i",
			[1]	= {szName = "��ch Kh�i Tri�n M�ng y�u ��i", nQuality = 1, tbProp = {0,98}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>��ch  Kh�i Tri�n M�ng Y�u ��i<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},

}

local tbGoldEquip_Coin_2 = {
		[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "H�m Thi�n Kim B�i", tbProp = {6,1,2237,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "H�m Thi�n H� ��u Kh�n Th�c Uy�n",
			[1]	= {szName = "H�m Thi�n H� ��u Kh�n Th�c Uy�n", nQuality = 1, tbProp = {0,19}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>H�m Thi�n H� ��u Kh�n Th�c Uy�n<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Thi�n Quang Kim B�i", tbProp = {6,1,2238,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Thi�n Quang Th�c Thi�n Ph��c ��a Ho�n",
			[1]	= {szName = "Thi�n Quang Th�c Thi�n Ph��c ��a Ho�n", nQuality = 1, tbProp = {0,80}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>Thi�n Quang Th�c Thi�n Ph��c ��a Ho�n<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "B�ch H�i Kim B�i", tbProp = {6,1,2239,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "B�ch H�i H�ng L�ng Ba",
			[1]	= {szName = "B�ch H�i H�ng L�ng Ba", nQuality = 1, tbProp = {0,54}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>B�ch H�i H�ng L�ng Ba<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V� Ma Kim B�i", tbProp = {6,1,2240,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "V� Ma B�ng Tinh Ch� Ho�n",
			[1]	= {szName = "V� Ma B�ng Tinh Ch� Ho�n", nQuality = 1, tbProp = {0,38}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>V� Ma B�ng Tinh Ch� Ho�n<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "L�ng Nh�c Kim B�i", tbProp = {6,1,2241,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "L�ng Nh�c Thi�n ��a Huy�n Ho�ng gi�i",
			[1]	= {szName = "L�ng Nh�c Thi�n ��a Huy�n Ho�ng gi�i", nQuality = 1, tbProp = {0,120}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>L�ng Nh�c Thi�n ��a Huy�n Ho�ng Gi�i<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "S��ng Tinh Kim B�i", tbProp = {6,1,2242,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "S��ng Tinh Phong B�o ch� ho�n",
			[1]	= {szName = "S��ng Tinh Phong B�o ch� ho�n", nQuality = 1, tbProp = {0,130}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Ch�c m�ng cao th� %s �� nh�n ���c <color=yellow>S��ng Tinh Phong B�o Ch� Ho�n<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
}
function ex_goldequp_coin()
	if not tbComposeGoldEquipCoin then
		tbComposeGoldEquipCoin = tbComposeListClass:new("tbComposeGoldEquipCoin", %tbGoldEquip_Coin);
	end
	
	local szTitle = "<dec><npc>".."C�c h� mu�n ��i lo�i l�nh b�i n�o?";
		
	local tbSay = tbComposeGoldEquipCoin:MakeOptByProductName("��i");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel");
	
	CreateTaskSay(tbSay)
end

function ex_goldequp_coin_2()
	if not tbComposeGoldEquipCoin_b then
		tbComposeGoldEquipCoin_b = tbComposeListClass:new("tbComposeGoldEquipCoin_b", %tbGoldEquip_Coin_2);
	end
	
	local szTitle = "<dec><npc>".."C�c h� mu�n ��i lo�i l�nh b�i n�o?";
		
	local tbSay = tbComposeGoldEquipCoin_b:MakeOptByProductName("��i");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel");
	
	CreateTaskSay(tbSay)
end

