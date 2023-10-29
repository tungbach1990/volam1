--by ��־ɽ [2006-09-12]
--2006����֮�����Ѱ������ͼ������ͼ.
--Illustration: ��Ů -- fairy au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--��Ů���ں���
function au06_entrance_fairy()
	if (au06_IsPayed_player() == 0) then
		Say("Ch� c� ng��i ch�i n�p th� m�i c� th� tham gia ho�t ��ng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta �� thu th�p �� c�c m�nh tranh./handup_picture",
		"Ch� ��n th�m �ng ch�t th�i!/oncancel"
	};
	Describe("Li�u �t th��ng nh�n �ang mu�n t�m hai b�c danh h�a H�ng Nga Ti�n T�. 2 b�c tranh n�y �� b� ph�n th�nh nhi�u m�nh t�n l�c kh�p n�i. Nghe n�i D� T�u �ang c� �� c�c m�nh tranh ��. N�u ng��i c� ���c nh�ng m�nh n�y, ta s� gi�p ng��i gh�p l�i.", getn(tab_Content), tab_Content);
end;

--�������
function handup_picture()
	--�������ﵽ����
	GiveItemUI("Giao tranh", "C�ch gh�p: x�p theo ��ng v� tr�, d�ng � ��u ti�n b�n tr�i l�m chu�n �� gh�p tranh.", "pic_award", "oncancel");
end;

tab_boxcheck = 
{{1207, 1208, 1209, 1210, 1211, 1212},
 {1213, 1214, 1215, 1216, 1217, 1218}
}
--�ж��Ƿ������
function pic_award(nCount)
	local bCorrectItem = 0
	local idxItem = 0

	if (nCount ~= 6) then
		Describe("M�t b�c tranh c� s�u m�nh, ng��i �em ��n ch�a ��.", 1, "V�y ta xin c�o t�./oncancel");
		return
	end
	
	bFull = 1;
	idxItem = GetGiveItemUnit(1);
	local g, d, p = GetItemProp(idxItem);
	local nIndex = 0;
	if (p <= 1212 and p >= 1207 and d == 1 and g == 6) then
		nIndex = 1;
	elseif(p <= 1218 and p >= 1213 and d == 1 and g == 6) then
		nIndex = 2;
	end;
	if (0 == nIndex) then
		Describe("Nh�ng m�nh tranh c�a ng��i kh�ng �� �� gh�p, h�y t�m �� r�i quay v� g�p ta.", 1, "V�y ta xin c�o t�./oncancel");
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
		Describe("Nh�ng m�nh tranh c�a ng��i kh�ng �� �� gh�p, h�y t�m �� r�i quay v� g�p ta.", 1, "V�y ta xin c�o t�./oncancel");
		return
	end
	
	--ɾ����
	for i = 1, nCount do
		idxItem = GetGiveItemUnit(i);
		RemoveItemByIndex(idxItem);
	end
	
	--������
	local str = "1 <color=yellow>Th��ng C� L�nh B�i<color>";
	AddItem(6, 1, 1252, 1, 0, 0, 0);
	
	--����ʾ
	Describe("Th�t kh�ng ng� ng��i c� th� t�m �� b�. ��y l� <color=yellow>Th��ng C� L�nh B�i<color>, mang �� 10 t�m l�nh b�i n�y ��n g�p Li�u �t th��ng nh�n � T��ng D��ng �� ��i l�y b�nh trung thu th�n k�", 1, "Nh�n ph�n th��ng/oncancel")
	Msg2Player("B�n ��t ���c"..str);
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

