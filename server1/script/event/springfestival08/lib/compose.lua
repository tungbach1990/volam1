--====��Ʒ�ϳɸ�ʽ====--
--
--�ϳɹ�ʽ��
--	COMPOSE = {Material, Award, Result_su, Result_er, Result_fa}
--
--	Award	�ϳɵõ�����Ʒ������� award.lua
--
--	Result_su, Result_er, Result_fa	�ֱ��Ǻϳɳɹ�������ʧ��ʱ�Ľ����ʾ���������ֱ��ʽ��
--		Result == "" ʱ	Say("�ϳɳɹ���", 0) / Say("ԭ�ϲ��ԣ�", 0) / Say("�ϳ�ʧ�ܣ�", 0)
--		type(Result) == "string"ʱ	Say(Result, 0)
--
--	Material	�ϳ��������
--	Material = {nAmount, tbProp, [strName]}
--		nAmount	�������������
--		tbProp	�������������
--			tbProp = {nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck}
--			6��Ԫ��ͬAddItem��6������������ģ�
--				���ĳ��Ԫ��Ϊnil�����ʾ�����Ƹ�����
--				���ĳ��Ԫ��Ϊ"+n"�����ʾ��������Ҫ >= n
--				���ĳ��Ԫ��Ϊ"-n"�����ʾ��������Ҫ <= n
--		strName	�ǲ��ϵ����ƣ���ѡ�ģ��������д��material_name������Ч��
--
--	��� Material = {Material1, Material2, ����} ���ʾ��Ҫ ���ֲ���
--	
--	�ص㣺�ύ��Ʒ�����ص�����Ҫ���Ͽ�����ģ���ġ���Ҫ����������Զ��ַ�ʽ���


if not springfestival08_lib_COMPOSE_HEAD then
springfestival08_lib_COMPOSE_HEAD = 1
Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\award.lua");
if not springfestival08_lib_TB_PLCOMPOSE then
	springfestival08_lib_TB_PLCOMPOSE = {}
end

--���ָ����Ʒ�����Ƿ����Ҫ��
function springfestival08_lib__checkprop(tb_needprop, tb_itemprop)
	
	for i = 1, getn(tb_needprop) do
		--print (tb_needprop[i])
		if (tb_needprop[i] ~= nil and tb_needprop[i] ~= tb_itemprop[i]) then
			return nil
		end
	end
	return 1;
end

--�����һ����Ʒ�Ƿ�����Ҫ�ģ���������Ҫ����
function springfestival08_lib__checkone(tb_need, tb_needcount, tb_itemprop, tb_itemcount)
	--print(tb_need);
	if (type(tb_needcount[1]) ==  "table") then
		for i = 1, getn(tb_needcount) do
			if springfestival08_lib__checkone(tb_need[i], tb_needcount[i], tb_itemprop, tb_itemcount) then
				return 1
			end
		end
		return nil
	else
		if tb_needcount[1] > 0 and springfestival08_lib__checkprop_ex(tb_need, tb_itemprop) then
			if (tb_needcount[1] >= tb_itemcount[1]) then
				tb_needcount[1] = tb_needcount[1] - tb_itemcount[1]
				return 1
			else
				tb_itemcount[1] = tb_itemcount[1] - tb_needcount[1]
				return nil
			end					
		end
	end
end

function springfestival08_lib__checkprop_ex(tb_need, tb_itemprop)
	local i;
	--print(tb_need.szName,tb_need.tbProp[1])
	if tb_need == nil or tb_itemprop == nil then
		return 0;
	end
	if tb_need.tbProp == nil or tb_itemprop.tbProp == nil then
		return 0;
	end
	if tb_need.nQuality ~= nil and tb_need.nQuality ~= tb_itemprop.nQuality then
		return 0;
	end
	if tb_need.nBindState ~= nil and tb_need.nBindState ~= tb_itemprop.nBindState then
		return 0;
	end
	
	if type(tb_need.tbProp[1]) == "table" then
		for i = 1, getn(tb_need.tbProp) do
--			local tb_new_need = {}
--			tb_new_need.tbProp = tb_need.tbProp[i]
--			tb_new_need.nCount = tb_need.nCount
--			tb_new_need.szName = tb_need.szName
			if springfestival08_lib__checkprop(tb_need.tbProp[i], tb_itemprop.tbProp) then
				return 1
			end
		end
		return nil
	else
		return springfestival08_lib__checkprop(tb_need.tbProp, tb_itemprop.tbProp)
	end
end


--�õ�һ����Ҫ������Ʒ��������Ӧ��������������
function springfestival08_lib__checkneed(tb_material)
	if (type(tb_material[1]) ==  "table") then
		local tb_cound = {}
		local n_count = 0
		local n
		for i = 1, getn(tb_material) do
			n, tb_cound[i] = springfestival08_lib__checkneed(tb_material[i])
			n_count = n_count + n
		end
		return n_count, tb_cound
	else
		tb_material.nCount = tb_material.nCount or 1
		return tb_material.nCount, {tb_material.nCount}
	end
end

function springfestival08_lib__MakeItemTable(nItemIndex)
	local tbItem		= {}
	tbItem.tbProp		= {}									--ID
	tbItem.szName		= GetItemName(nItemIndex)				--����
	tbItem.nQuality		= GetItemQuality(nItemIndex);			--Ʒ��
	tbItem.nBindState	= GetItemBindState(nItemIndex);			--�ж�״̬
	tbItem.tbItemParams	= GetItemAllParams(nItemIndex)			--Paramsֵ
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1	--��������
	
	
	if tbItem.nQuality == 0 then -- ��ͨ��Ʒ
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --�ƽ� or �׽�
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- ��ɫװ��
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end


--���������Ʒ�Ƿ���Ϻϳ�Ҫ���������Ҫ����ɾ�� tb_need ��Ҫ�Ĳ��ϣ�n_count ����UI�������Ŀ
function springfestival08_lib__checkall(tb_need, n_count)
	local n_needcount, tb_count = springfestival08_lib__checkneed(tb_need) --��Ҫ�Ĳ�������,ÿ��������Ҫ��

	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		
		local tb_p = springfestival08_lib__MakeItemTable(n_itemidx)
		local n_itemcount = GetItemStackCount(n_itemidx)
		n_needcount = n_needcount - n_itemcount
		--print(i..": idx="..n_itemidx .. "("..n_itemcount..")")
		if (not springfestival08_lib__checkone(tb_need, tb_count, tb_p, {n_itemcount})) then
			return nil
		end
	end
	
	if (n_needcount ~= 0) then
		return nil
	end
	
	for i=1, n_count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	return 1
end

--����Ի��ص�����
function springfestival08_lib__compose(n_count)
	local tb_compose = springfestival08_lib_TB_PLCOMPOSE[PlayerIndex]
	if (springfestival08_lib__checkall(tb_compose[1], n_count)) then
		if (award_give(tb_compose[2]) > 0) then
			springfestival08_lib__tellresult(tb_compose[3], "H�p th�nh th�nh c�ng!")
		else
			springfestival08_lib__tellresult(tb_compose[5], "H�p th�nh th�t b�i!")
		end
	else
		springfestival08_lib__tellresult(tb_compose[4], "Kh�ng ��ng nguy�n li�u!")
	end
	springfestival08_lib_TB_PLCOMPOSE[PlayerIndex] = nil	--�������ˢ
end

--��֪���
function springfestival08_lib__tellresult(var_result, str)
	local str_type = type(var_result)
	if (str_type == "string") then
		if (var_result == "") then
			Say(str, 0)
		else
			Say(var_result, 0)
		end
	elseif (str_type == "function") then
		var_result()
	elseif (str_type == "table" and type(var_result[1]) == "function") then
		var_result[1](unpack(var_error,2))
	end
end


--�򿪸������
function springfestival08_lib_material_compose(tb_compose, str_title, str_text)
	springfestival08_lib_TB_PLCOMPOSE[PlayerIndex] = tb_compose
	if (str_text == nil) then
		str_text = "Y�u c�u:"..springfestival08_lib_material_name(tb_compose[1])
	end
	GiveItemUI(totext(str_title), totext(str_text), "springfestival08_lib__compose","OnCancel",1)
end

--�õ�������Ʒ����������
function springfestival08_lib_material_name(tb_material, b_front)
	if (type(tb_material[1]) ==  "table") then
		local str = ""
		local n_materials = getn(tb_material)
		for i = 1, n_materials do
			local b_f = i < n_materials
			if (i > 1) then
				if (b_front or b_f) then
					str = str .. " , "
				else
					str = str .. "H�a "
				end
			end
			str = str .. springfestival08_lib_material_name(tb_material[i], b_f)
		end
		return str
	else
		return format("%d %s", tb_material.nCount or 1, tb_material.szName)
	end
end
end