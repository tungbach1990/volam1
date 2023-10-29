--����2007� �̶��±�
--by С�˶��
--2007-09-07

--�������
TSK_TEMP = 51					--�����ʱ����
function makeItemUI()
	--�������ﵽ����
	GiveItemUI("Giao tranh", "C�ch gh�p: x�p theo ��ng v� tr�, d�ng � ��u ti�n b�n tr�i l�m chu�n �� gh�p tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{	
	{1207, 1208, 1209, 1210, 1211, 1212},
	{1213, 1214, 1215, 1216, 1217, 1218}
}
--�ж��Ƿ������
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("Vi�n ngo�i: B�c tranh g�m c� 6 m�nh tranh, ng��i giao ch�a �� s�.", 1, "V�y ta xin c�o t�./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	local nsign = GetTaskTemp(TSK_TEMP)
	local nitem = 0
	if nsign == 1 then 
		if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
			nIndex = 1;
			nitem = 128;
		end
	elseif nsign == 2 then
		if(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
			nIndex = 2;
			nitem = 127;
		end
	end
	if (0 == nIndex) then
		Describe("Vi�n ngo�i: Nh�ng m�nh tranh n�y kh�ng th� gh�p th�nh 1 b�c tranh ho�n ch�nh, h�y t�m ��ng c�c m�nh gh�p r�i h�y ��n t�m ta.", 1, "V�y ta xin c�o t�./oncancel");
		return
	end

	tab_items = {};
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxItem)
		if (d ~= 1 or g ~= 6) then
			bFull = 0;
			break
		end
		tab_items[i] = p;
	end
	
	tab_items = au06_sort(tab_items); -- ��������
	
	for i = 1, getn(tab_items) do
		if (tab_items[i] ~= tab_boxcheck[nIndex][i]) then
			bFull = 0;
			break;
		end;
	end;
	
	if (0 == bFull) then
		Describe("Vi�n ngo�i: Nh�ng m�nh tranh n�y kh�ng th� gh�p th�nh 1 b�c tranh ho�n ch�nh, h�y t�m ��ng c�c m�nh gh�p r�i h�y ��n t�m ta.", 1, "V�y ta xin c�o t�./oncancel");
		return
	end
	
	--ɾ����
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--������
	local nidx = AddItem(6,1,nitem,1,0,0)
	Msg2Player(format("B�n nh�n ���c 1 <color=yellow>%s<color>",GetItemName(nidx)));
	WriteLog(format("[zhongqiu2007_qiannenyuebing]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	SetTaskTemp(9,0)
	SetTaskTemp(10,0)
end;

function au06_sort(table)
	if (not table or type(table) ~= "table") then
		return {};
	end;
	
	local nCount = getn(table);
	for i = 2, nCount do	--����һ��ð������
		for j = nCount, i, -1 do
			if (table[j] < table[j - 1]) then	--���ý���������
				temptab = table[j];
				table[j] = table[j - 1];
				table[j - 1] = temptab;
			end;
		end;
	end;
	
	return table;
end

