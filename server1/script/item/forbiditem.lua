IncludeLib("FILESYS")
IncludeLib("ITEM")
Include("\\script\\lib\\common.lua");

--��Ʒ���Ͷ�Ӧ����ʹ�õĵ�ͼ
tb_ItemType = {}
--��Ʒ��Ӧ������
tb_ItemDetail = {}
--��ͼID��Ӧ������
tb_MapDetail = {}
--��ͼ���Ͷ�Ӧ����ʹ�õ���Ʒ
tb_MapType = {}




--//��õ�ǰ��ͼID�����ͣ���������string������nil
function get_MapType(nMapID)
	return tb_MapDetail[nMapID]
end

function set_MapType(nMapID, szType)
	tb_MapDetail[nMapID] = szType
end

function del_MapType(nMapID)
	tb_MapDetail[nMapID] = nil
end

function add_Item2Map(szMapType, szItemType)
	tb_MapType[szMapType] = tb_MapType[szMapType] or {}
	tinsert(tb_MapType[szMapType], szItemType)
end


--//��õ�ǰ��ϸ�����Ʒ���ͣ���������string������nil
function get_ItemType(g, d, p)
	local str = pack_ItemDetail(g, d, p);
	if (str ~= nil and tb_ItemDetail[str]) then
		return tb_ItemDetail[str].itemtype;
	end;
	return nil;
end;


--//��Ʒ����->����ʹ�õ�ͼ
function LoadItemType()
	local b1 = TabFile_Load("\\settings\\item_type.txt", "ItemType");
	if (b1 ~= 1) then
		print("Kh�i ��ng t�p lo�i h�nh v�t ph�m th�t b�i!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("ItemType");
	for i = 3, nRowCount do
		local sType = TabFile_GetCell("ItemType", i, "ITEM_TYPE");
		local sMap = TabFile_GetCell("ItemType", i, "ONLY_IN_MAP_TYPE");
		if (sMap == "" or sMap == nil) then
			tb_ItemType[sType] = nil;	--??����������أ�
		else
			tb_ItemType[sType] = split(sMap);
		end;
	end;
end;
LoadItemType()


--//��Ʒ����->������Ʒ����
function LoadItemDetail()
	local b1 = TabFile_Load("\\settings\\item_detail.txt", "ItemDetail");
	if b1~=1 then
		print("Kh�i ��ng t�p ph�n lo�i v�t ph�m th�t b�i!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("ItemDetail");
	for i = 3, nRowCount do
		local sType = TabFile_GetCell("ItemDetail", i, "ITEM_TYPE");
		if (sType ~= "" and sType ~= nil) then
			local nG = tonumber(TabFile_GetCell("ItemDetail", i, "GENRE"));
			local nD = tonumber(TabFile_GetCell("ItemDetail", i, "DETAIL"));
			local nP = tonumber(TabFile_GetCell("ItemDetail", i, "PARTICULAR"));
			local szKey = pack_ItemDetail(nG, nD, nP);
			tb_ItemDetail[szKey] = {};
			tb_ItemDetail[szKey].itemtype = sType;
		end;
	end;
end;

function pack_ItemDetail(g, d, p)
	if (g ~= nil and d ~= nil and p ~= nil) then
		return g..","..d..","..p;
	end;
	return nil;
end;
LoadItemDetail()


--//��ͼ����->�����ͼID
function LoadMapDetail()
	local b1 = TabFile_Load("\\settings\\map_type.txt", "MapDetail");
	if (b1 ~= 1) then
		print("Kh�i ��ng t�p ph�n lo�i map th�t b�i!");
		return
	end;
	local nRowCount = TabFile_GetRowCount("MapDetail");
	for i = 3, nRowCount do 
		local szMapType = TabFile_GetCell("MapDetail", i, "MAP_TYPE");
		local str = TabFile_GetCell("MapDetail", i, "MAP_ID");
		str = replace(str, "\"", [[]]);
		local tbStr = split(str);
		for j = 1,getn(tbStr) do
			tbmap = split(tbStr[j], [[|]]);
			if (getn(tbmap) == 1) then
			local nmap = tonumber(tbmap[1]);
				tb_MapDetail[nmap] = szMapType;
			else
				nMap1 = tonumber(tbmap[1]);
				nMap2 = tonumber(tbmap[2]);
				for k = nMap1, nMap2 do 
					tb_MapDetail[k] = szMapType
				end;
			end;
		end;
		
		--//��ͼ����->��ֹʹ����Ʒ
		--tb_MapType = {}
		local szForbidType = TabFile_GetCell("MapDetail", i, "FORBIT_ITEM_TYPE");
		if (szForbidType ~= "" and szForbidType ~= nil) then
			tb_MapType[szMapType] = split(szForbidType);
		end;
	end;
end;
LoadMapDetail()

--//�����Ʒʹ��Ȩ��
--//����1���ã�-1������
function Check_ItemUsable(nSubWorldID, nItemGenre, nItemDetailType, nItemParticular)		
	if DynamicExecute("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua", "tbVNGForbidItem:CheckItemUsable", nSubWorldID, pack_ItemDetail(nItemGenre, nItemDetailType, nItemParticular)) == 0 then
		return 0
	end
	local szItemType = get_ItemType(nItemGenre, nItemDetailType, nItemParticular);
	if (szItemType == nil) then
		return 1;
	end;
	local szMapType = get_MapType(nSubWorldID);
	if (szMapType == nil) then
		szMapType = "";
	end;
	if (tb_ItemType[szItemType] ~= nil) then
		--����ʹ�õĵ�ͼ
		for i = 1, getn(tb_ItemType[szItemType]) do
			if (tb_ItemType[szItemType][i] == szMapType) then
				return 1;
			end;
		end;
		return 0;
	--��ͼ��ֹʹ����Ʒ
	elseif (tb_MapType[szMapType] ~= nil) then
		for i = 1, getn(tb_MapType[szMapType]) do
			if (tb_MapType[szMapType][i] == szItemType) then
				return 0;
			end;
		end;
	end;
	return 1;
end;
