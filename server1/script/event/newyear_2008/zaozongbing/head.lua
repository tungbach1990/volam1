--������Ʒlib
--by С�˶��
--2007-09-06
newyear2008_makezongzi = {}
tbclassname = newyear2008_makezongzi
tbclassname.TITLE = "L�m b�nh ch�ng"
tbclassname.DA_START = 0802020000	--��ʼʱ��
tbclassname.DA_END 	= 0803022400	--����ʱ��
tbclassname.LIMIT_LEVEL = 50		--�ȼ�����

--�±�������Ҫ����
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1662,szname="B�nh ch�ng th��ng h�ng",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L� b�nh",num=4},
		{G=6,D=1,P=1654,szname="G�o n�p",num=3},
		{G=6,D=1,P=1655,szname="��u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th�t heo ",num=1},
		{G=6,D=1,P=1660,szname="B� quy�t l�m b�nh ch�ng th��ng h�ng",num=1},
		},
	select2 = {
		{G=6,D=1,P=1663,szname="B�nh ch�ng h�o h�ng",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="L� b�nh",num=4},
		{G=6,D=1,P=1654,szname="G�o n�p",num=3},
		{G=6,D=1,P=1655,szname="��u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th�t heo ",num=1},
		{G=6,D=1,P=1661,szname="B� quy�t l�m b�nh ch�ng h�o h�ng",num=1}
		},
	select3 = {
		{G=6,D=1,P=1664,szname="B�nh ch�ng th��ng",num=1,nMoney=20000},
		{G=6,D=1,P=1653,szname="L� b�nh",num=4},
		{G=6,D=1,P=1654,szname="G�o n�p",num=3},
		{G=6,D=1,P=1655,szname="��u xanh",num=2},
		{G=6,D=1,P=1656,szname="Th�t heo ",num=1},
		},
--	select4 = {
--		{G=6,D=1,P=1513,szname="�����±�",num=1,nMoney=200000},
--		{G=6,D=1,P=1503,szname="�۰�",num=4},
--		{G=6,D=1,P=1504,szname="�ǰ�",num=4},
--		{G=6,D=1,P=1505,szname="������",num=4},
--		{G=6,D=1,P=1509,szname="�����",num=1},
--		},
--	select5 = {
--		{G=6,D=1,P=1514,szname="�±����",num=1,nMoney=300000},
--		{G=6,D=1,P=1510,szname="�̶��±�",num=1},
--		{G=6,D=1,P=1511,szname="�����±�",num=1},
--		{G=6,D=1,P=1512,szname="�����±�",num=1},
--		{G=6,D=1,P=1513,szname="�����±�",num=1},
--		},		
}

tbclassname.tb_content =
{
	sztalk1 = "Th� b�nh: �ang r�nh, d�o n�y sau ta kh�ng c� vi�c g� l�m nh�!",
	sztalk2 = "Th� b�nh: Th�i gian qua th�t nhanh, ch�p m�t �� ��n t�t r�i, tay ngh� l�m b�nh ch�ng c�a ta v�n n�i ti�ng x�a nay. M�i n�m ��u kh�ng �t ng��i ��n nh� ta l�m gi�m, v� kh�ch quan n�y ch�ng hay mu�n l�m lo�i n�o?",
	nselectsum = 3,
	szselect1 = format("Ta mu�n l�m 1 c�i %s/#tbclassname:getmakeitemsign(1)",tbclassname.tb_Mareial.select1[1].szname),
	szselect2 = format("Ta mu�n l�m 1 c�i %s/#tbclassname:getmakeitemsign(2)",tbclassname.tb_Mareial.select2[1].szname),
	szselect3 = format("Ta mu�n l�m 1 c�i %s/#tbclassname:getmakeitemsign(3)",tbclassname.tb_Mareial.select3[1].szname),
	szno = "Nh�n ti�n gh� qua th�i/NoChoice",
	szmakeItemUI = "��ng! Xin l�o b�i tr� t�i!/#tbclassname:makeItemUI(%d)",
	szlevel = "Th�t ��ng ti�c, ��ng c�p kh�ng �� 50, kh�ng th� tham gia ho�t ��ng n�y.",
	szmoney = "Th�t ��ng ti�c, ng�n l��ng mang theo kh�ng ��.",
	szpay = "Xin l�i, t�i kho�n c�a b�n ch�a n�p th�, kh�ng th� th��ng th�c v� ch� t�o b�nh ch�ng th�m ngon.",
	szremake = "Tr� l�i/main",
	szitemfree="Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang."
	
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("Ch�c m�ng b�n �� nh�n ���c %d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, b�n mu�n l�m kh�ng?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("%s thi�u kh�ng th� l�m. H�nh nh� nguy�n li�u l�m b�nh ch�ng kh�ng ��.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("Th� b�nh: Mu�n l�m %d c�i <color=red>%s<color>, c�n ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d c�i <color=red>%s<color>, ",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--�жϵȼ�
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--�ж�Ǯ
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--���tb�����
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --�ж�����ʣ�����
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end