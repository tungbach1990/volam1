
-- = ===================== �ļ���Ϣ ======================

-- ������Եonline �������ر�ͼʵ�崦���ļ�
-- Edited by peres
-- 2005/10/19 PM 14:22

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");
IncludeLib("PARTNER");

-- ����ϵͳ֧��
IncludeLib("RELAYLADDER")


-- ��չ����ļ����֧��
Include("\\script\\class\\ktabex.lua");

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

-- ����д�� RELAY ս�����ݵ�ͷ�ļ�
Include("\\script\\lib\\gb_taskfuncs.lua");

-- ����Ի��ַ������ļ�
Include("\\script\\task\\system\\task_string.lua");

tabTreaPos = new(KTabFileEx, "\\settings\\task\\random\\trea_pos.txt", "TreaPos");
tabTreaItem = new(KTabFileEx, "\\settings\\task\\random\\trea_item.txt", "TreaItem");
tabTreaBoss = new(KTabFileEx, "\\settings\\task\\random\\trea_boss.txt", "TreaBoss");
tabTreaOldBox = new(KTabFileEx, "\\settings\\task\\random\\trea_oldbox.txt", "OldBox");

MISS_DIS_X = 6;  -- �ڱ�ʱ����ƫ�Ƶ� X �����ֵ
MISS_DIS_Y = 9;  -- �ڱ�ʱ����ƫ�Ƶ� Y �����ֵ

ID_USETREAMAP_TIME = 1738;  -- ��������ڱ��Ĵ���

--  CALL BOSS ����

-- ____________________
--|                    |
--|         01         |
--|     16  03  10     |
--| 11   06   07   08  |
--| 09  04 ��� 05  12 |
--|     13  14  15     |
--|         02         |
--|____________________|

aryBossPos = {

	[1]  = {0, -3},

	[16]  = {-2, -2},
	[3]  = {0, -2},
	[10]  = {1, -2},

	[11]  = {-2, -1},
	[6]  = {-1, -1},
	[7]  = {1, -1},
	[8]  = {2, -1},
	
	[9]  = {-2, 0},
	[4] = {-1, 0},
	[5] = {1, 0},
	[12] = {2, 0},
	
	[13] = {-1, 1},
	[14] = {0, 1},
	[15] = {1, 1},

	[2] = {0, 3},

}


-- ����һ�Ųر�ͼ
function CreateTreasureMap()

local nRow = SelectTreasurePos();

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- ��ȡ������Ӧ����д���һ��ħ������
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- ����Ĭ��Ϊδ����
	SetItemMagicLevel(nIndex, 2, 0);
	
	-- ͬ����Ʒħ������
	SyncItem(nIndex)
	
	CDebug:MessageOut("Xu�t hi�n 1 m�nh T�ng B�o ��, s� l��ng nh�n ���c l� "..nRow);
	
	-- ���زر�ͼ����
	return nRow;

end;


-- ��ָ�������������ر�ͼ
function CreateTreasureMapByRow(nRow)

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- ��ȡ������Ӧ����д���һ��ħ������
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- ����Ĭ��Ϊδ����
	SetItemMagicLevel(nIndex, 2, 1);
	
end;


-- ��ָ���������Ŵ���һ���������
function CreateBookByNum(nNum)

local nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);

	SetItemMagicLevel(nRandomItemIndex, 1, nNum);
	
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);

	Msg2Player("B�n nh�n ���c <color=green>nhi�m v� ng�u nhi�n!<color>");
	CDebug:MessageOut("ph�n th��ng c�a nhi�m v� l� ng�u nhi�n, ti�p theo l�:"..nRandomItemIndex);

end;


-- ѡ��һ���ر�ͼ��λ��
function SelectTreasurePos()

local nRow = random(2, tabTreaPos:getRow());
	CDebug:MessageOut("Ch�n ���c v� tr� kho t�ng "..nRow);
	return nRow;

end;


-- ���ر�ͼ��λ���Ƿ���ȷ
function MapCheckTreasurePos(nIndex)
	
local nRow = GetItemMagicLevel(nIndex, 1);
local nIsOpen = GetItemMagicLevel(nIndex, 2);

local nMapID = tonumber(tabTreaPos:getCell("MapID", nRow));
local nMx = tonumber(tabTreaPos:getCell("WorldX", nRow));
local nMy = tonumber(tabTreaPos:getCell("WorldY", nRow));

local pMap, pMx, pMy = GetWorldPos();	

	-- �����ͼ�����ԣ��򷵻� 0
	if pMap~=nMapID then return 0; end;
	
	-- �����δ�������򷵻� 2
	if nIsOpen==0 then return 2; end;

	-- ���� X �����
	if (nMx>pMx and nMx-pMx<=MISS_DIS_X) or (nMx<pMx and pMx-nMx<=MISS_DIS_X) or (nMx==pMx) then
		-- ���� Y �����
		if (nMy>pMy and nMy-pMy<=MISS_DIS_Y) or (nMy<pMy and pMy-nMy<=MISS_DIS_Y) or (nMy==pMy) then
			return 1;
		end;
	end;
	
	return 0;
		
end;



-- ʹ��һ�Ųر�ͼ
-- ����ֵ��1Ϊ���ϵص㡢0Ϊ������
function UseTreasurePos(nIndex)

	-- ���ϵص��ʼ�ڱ�
	PayTreasure();
	
	-- ��¼����ڱ��Ĵ���
	SetTask(ID_USETREAMAP_TIME, GetTask(ID_USETREAMAP_TIME) + 1);
	
	-- д������
	Ladder_NewLadder(10237, GetName(), GetTask(ID_USETREAMAP_TIME), 1);

end;


-- ��ʾ�ر�ͼ����ϸ��Ϣ
function ShowTreasureMapInfo(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);
local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local picLink = "";

	if nIndex==0 or nIndex==nil or nRow<1 or nRow==nil then
		Say("H�m, t�m T�ng B�o �� n�y �� b� ph� r�i, c�p m�t l�o gi� n�y l�m sao m� ��c ���c?",0);
		return
	else
		picLink = "<link=image:"..picPath..">Th�ng tin v� T�ng B�o ��:<link> Sau khi b� m�t s� ti�n l�n, cu�i c�ng b�n c�ng �� ���c Ph� L�i Th� ch� coh v� tr� kho b�u<color=yellow>"..strInfo.."<color>.";
	end;

	Describe(picLink, 1, "K�t th�c ��i tho�i/OnExit");

end;


-- ���������Ʒ�Ƿ�Ϊ�����Ĳر�ͼ
function CheckTreasureMap(nCount)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
local nIndex = 0;

	if nCount~=1 then
		Say("Ng��i gi�u g� ��? Ta ch� c�n <color=yellow>1 t�m T�ng B�o ��<color> l� �� r�i!", 0);
		return
	end;
	
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(GetGiveItemUnit(1));
	nIndex  = GetGiveItemUnit(1);
	
	if nGenre==6 and nDetail==2 and nParticular==3 then
		
		-- ���û�м����Ļ������
		if GetItemMagicLevel(nIndex, 2)==0 then
			
			-- �۳���ҵĽ�Ǯ
			if Pay(300000)==1 then
				SetItemMagicLevel(nIndex, 2, 1);
				SyncItem(nIndex);
				Msg2Player("<color=yellow>B�n ��a cho Ph� L�i Th� 30 v�n l��ng!<color>");
			else
				Say("Haha�B�n tr�, kh�ng �� ti�n th� n�i l�m g�, ��ng t��ng l�o gi� n�y ngu mu�i. Ng��i v� v�t k� tr�n d� b�o tuy�t th� n�y c� th� l� v� duy�n r�i.",0);
				return
			end;
			
		elseif GetItemMagicLevel(nIndex, 2)==1 then
			Say("T�m T�ng B�o �� n�y �� qua ki�m ��nh, ng��i xem c� hi�u kh�ng? N�u kh�ng hi�u h�y t�m hi�u k� l�i!", 0);
			return
		end;
		
		ShowTreasureMapInfo(GetGiveItemUnit(1));
		return
	else
		Say("Ng��i gi�u g� ��? Ta ch� c�n <color=yellow>1 t�m T�ng B�o ��<color> l� �� r�i!", 0);
		return
	end;

end;


-- ��������
function PayTreasure()

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nType = SelectTreasureType();
	CDebug:MessageOut("B�t ��u ��o t�m kho b�u "..nType);

	-- ������ж��Ƿ������Ǯ���� 45% �ĸ���
	if random(1, 100)<=45 then
		SelectTreasureMoney();
	end;

	if nType==1 then   -- ����
		
		SelectTreasureItem();
		return 1;
		
	elseif nType==2 then   -- BOSS
	
		-- ����Ƿ�ս��״̬��ôֻ������
		if GetFightState()==0 then
			SelectTreasureItem();
		else
			SelectTreasureBoss();
		end;
		return 1;
	
	elseif nType==3 then   -- ��������	--by �ӷ��� 2008/02/22 ȥ���������
		
		AddItem(6, 1, 902, 1, 0, 0, 0);
		Msg2SubWorld("Ng��i ch�i <color=yellow>"..GetName().."<color> s� d�ng T�ng B�o ��<color=green>"..mapname.."<color> �� ��o ���c 1 <color=green>B�o r��ng c�<color>!");
		return 1;
	
	end;

end;


-- ѡ���ڳ����ı�������
-- ����ֵ��1 ���ߡ�2 BOSS��3 ��������
function SelectTreasureType()

-- ���ֱ��صĸ��ʣ����ߡ�BOSS���������ӣ����뱣֤���Ϊ 100
local aryRate = {50,50,0}	--by �ӷ��� 2008/02/22 ȥ���������
local i,j,k = 0,0,0;
local nType = 0;

	k = random(1,100);

	for i=1, getn(aryRate) do
		j = j + aryRate[i];
		if j>=k then
			nType = i;
			break;
		end;
	end;
	
	return nType;

end;


-- ����ҵ���Χ����һ�ѵ�Ǯ
function SelectTreasureMoney()

local i=0;

	for i=1, 25 do AddMoneyObj(random(5000, 12000)); end;
	
	Msg2Player("<color=yellow>B�n nh�n ���c m�t ��ng ti�n l�n!<color>");

end;


-- ѡ���ڳ��ı�����Ʒ
function SelectTreasureItem()

local nRow = tabTreaItem:countArrayRate("ItemRate");

local nGoods = {"",0,0,0,0,0,0,0};

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

	nGoods[1] = tabTreaItem:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaItem:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaItem:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaItem:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaItem:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaItem:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaItem:getCell("GoodsFive", nRow));
	nGoods[8] = tonumber(tabTreaItem:getCell("Magiclevel", nRow));

	if (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("B�n l�y ���c m�t <color=yellow>"..nGoods[1].."<color>!");
		AddGlobalCountNews("Ng��i ch�i "..GetName().." s� d�ng T�ng B�o ��"..mapname.."l�y ���c trang b� ho�ng kim "..nGoods[1].."m�t b�!", 2);
	else
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("B�n l�y ���c m�t <color=yellow>"..nGoods[1].."<color>!");
		-- Msg2SubWorld("���<color=yellow>"..GetName().."<color>���òر�ͼ��<color=yellow>"..mapname.."<color>���ڵ���<color=yellow>"..nGoods[1].."<color>��");
	end;

end;


-- ѡ������ BOSS �ڱ��صص�
function SelectTreasureBoss()

local nRow = tabTreaBoss:countArrayRate("Rate");  -- ���ȡ��һ�� BOSS ������

	-- ���ȡ������ȷ�������򷵻�
	if nRow<1 or nRow==nil then
		CDebug:MessageOut("T�ng B�o �� CALL BOSS: d�y s� kh�ng t�n t�i!");
		return
	end;

local nIndex   = tonumber(tabTreaBoss:getCell("NpcIndex", nRow));  -- BOSS INDEX
local nMin     = tonumber(tabTreaBoss:getCell("NumMin", nRow));    -- ������Сֵ
local nMax     = tonumber(tabTreaBoss:getCell("NumMax", nRow));    -- �������ֵ
local nFive    = tabTreaBoss:getCell("Five", nRow)

local strName  = tabTreaBoss:getCell("Name", nRow);

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nBossNum = random(nMin, nMax);

local aryOrg, aryDec = {},{};

local i,j = 0,0;


	-- �Զᱦ�������⴦��
	if strName=="�o�t B�o T�c" then
		for i,j in aryBossPos do
			tinsert(aryOrg, i);
		end;
		
		for i=1,nBossNum do
		
--			AddNpcEx(random(nIndex, nIndex + 8),  -- ��10��ɽ����������ѡһ������
--							95,
--							random(0,4),
--							mapindex,
--							(x+aryBossPos[i][1]) *32, -- ���� X ƫ��
--							(y+aryBossPos[i][2]) *32, -- ���� Y ƫ��
--							1,
--							strName,
--							1);
			
			-- ������������� n ���߲����Ϊ�������
			if nFive=="n" or "" then
				nFive = random(0,4);
			else
				nFive = tonumber(nFive);
			end;
			
			AddNpcEx(random(nIndex, nIndex + 8),  -- ��10��ɽ����������ѡһ������
							95,
							nFive,
							mapindex,
							x*32, -- ���� X ƫ��
							y*32, -- ���� Y ƫ��
							1,
							strName,
							1);
		end;
					
		Msg2SubWorld("Ng��i ch�i <color=yellow>"..GetName().."<color> khi s� d�ng T�ng B�o �� nh�n ���c m�t<color=green>"..strName.."<color>");
		return 1;
	else

		-- ������������� n ���߲����Ϊ�������
		if nFive=="n" or "" then
			nFive = random(0,4);
		else
			nFive = tonumber(nFive);
		end;
				
		AddNpcEx(nIndex, 95, nFive, mapindex, x*32, y*32, 1, strName, 1);
		
		-- AddGlobalCountNews("���棺��� "..GetName().." ���òر�ͼ��"..mapname.."�ڱ�ʱ������"..strName.."�����ӣ�", 2);
		return 1;
	end;

end;


-- ����һ���žɵı���
function OpenOldBox()

local nRow = tabTreaOldBox:countArrayRate("ItemRate");
local nGoods = {"",0,0,0,0,0,0,0};
local nIsPublic = 0;

	nGoods[1] = tabTreaOldBox:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaOldBox:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaOldBox:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaOldBox:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaOldBox:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaOldBox:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaOldBox:getCell("GoodsFive", nRow));
	
	-- �Ƿ񹫸�
	nIsPublic = tonumber(tabTreaOldBox:getCell("IsPublic", nRow));
	
	-- ���ڰ��˽��ӵļ��
	if nGoods[1]=="V� Danh Ch� Ho�n" or nGoods[1]=="V� Danh Gi�i Ch� " then
		
		-- ����� 180 �����Ƿ���������˽����е��κ�һ��
		if CheckItemEnableData(nGoods[1], 180)==1 then
			
			AddGoldItem(0, nGoods[3]);
			
			-- д�� RELAY ��ǰ��ϵͳ����
			WriteItemEnableData(nGoods[1]);
			
			WriteTaskLog("M� B�o r��ng nh�n ���c m�t:"..nGoods[1]);
			
			Msg2SubWorld("Ng��i ch�i <color=yellow>"..GetName().."<color> M� B�o r��ng c� h�t s�c ng�c nhi�n, ph�t hi�n <color=green>"..nGoods[1].."<color>!!!");
			
			AddGlobalCountNews("Ng��i ch�i "..GetName().." M� B�o r��ng c� h�t s�c ng�c nhi�n, ph�t hi�n"..nGoods[1].."!!!!!", 5);
			
			return
		else
			-- ����Ѿ��������Ļ��򲹳�һ����ԭ����
			AddItem(6, 1, 68, 1, 1, 0, 0);
			
			Msg2SubWorld("Ng��i ch�i <color=yellow>"..GetName().."<color> M� B�o r��ng c� h�t s�c ng�c nhi�n, ph�t hi�n <color=green>B�nh ch�ng<color>!");
			
			WriteTaskLog("M� B�o r��ng ng�u nhi�n nh�n ���c m�t:"..nGoods[1]..", nh�ng do h�n ch� v� th�i gian n�n l�y B�nh ch�ng �� ��n b�!");
			return
		end;
		
	end;
	
	if nGoods[1]=="T�ng B�o ��" then
		CreateTreasureMap();
		Msg2Player("B�n nh�n ���c m�t <color=yellow>T�ng B�o ��<color>!");
	elseif (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("B�n nh�n ���c m�t <color=yellow>"..nGoods[1].."<color>!");
	elseif (nGoods[2]==0) then
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("B�n nh�n ���c m�t <color=yellow>"..nGoods[1].."<color>!");
	end;
	
	-- д�� LOG
	WriteTaskLog("M� B�o r��ng nh�n ���c m�t:"..nGoods[1]);
	
	if nIsPublic==1 then
		AddGlobalCountNews("Ng��i ch�i"..GetName().." M� B�o r��ng c� h�t s�c ng�c nhi�n, ph�t hi�n"..nGoods[1], 1);
	end;
	
end;


-- ���һ����Ʒ�Ƿ��Ѿ��ﵽ�˲��������ڽ���
-- ������� strItemName����Ʒ����
-- ������� nDay����Ҫ��������
-- ���ز��� nEnable��1Ϊ������CALL�� 0Ϊ����CALL����
function CheckItemEnableData(strItemName, nDay)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- ��ȡϵͳ��������
local nOldTime = gb_GetTask(strItemName, 1);  -- ��ȡ֮ǰ��¼�ĸ���Ʒ��������

	-- ��������������������Ҫ���Ƶ����ڣ������ͨ��
	-- ÿ���� 86400 ��
	if nNowTime - nOldTime >= nDay*86400 then
		return 1;
	else
		return 0;
	end;
	
end;


-- д�� RELAY ��Ʒ����������
-- ������� strItemName����Ʒ����
function WriteItemEnableData(strItemName)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- ��ȡϵͳ��������

	gb_SetTask(strItemName, 1, nNowTime);
	
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog(" [H� th�ng nhi�m v�]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]").." [m�t m�:"..GetAccount().."] [nh�n v�t:"..GetName().."]"..strMain);
end;


function OnExit()

end;
