--������Ʒlib
--by С�˶��
--2007-09-06

tbclassname = {}
tbclassname.DA_START = 0803080000	--��ʼʱ��
tbclassname.DA_END 	= 0803162400	--����ʱ��
tbclassname.LIMIT_LEVEL = 50		--�ȼ�����

tbclassname.tb_content =
{
	sztalk1 = "L� quan: Qu�c t� ph� n� �? Ho�t ��ng �� k�t th�c r�i.",
	sztalk2 = "<dec>L� quan: Ng�y qu�c t� ph� n� 08/03 �� ��n r�i, ch�c t�t c� ph� n� trong thi�n h� s�c kh�e vui v� tr�n ��y h�nh ph�c, ho�t ��ng l�n n�y g�m c�:\n    <color=yellow>1.G�i hoa<color>\n        <color=red>(Th�i gian ho�t ��ng: t� 08-03-2008 ��n 24:00 ng�y 16-03-2008)<color>\n    <color=yellow>2.T�ng hoa<color>\n        <color=red>(Th�i gian ho�t ��ng: t� 08-03-2008 ��n 24:00 ng�y 31-03-2008)<color>\n    <color=yellow>3. Nhi�m v� B�c ��u L�o Nh�n.<color>\n        <color=red>(Th�i gian ho�t ��ng: t� 08-03-2008 ��n 24:00 ng�y 16-03-2008)<color> \nTa ��y r�t vui gi�p c�c v� g�i hoa.",
	nselectsum = 2,
	szselect1 = "Ta mu�n g�i th�nh b� hoa h�ng./#tbclassname:getmakeitemsign(1)",
	szselect2 = "Ta mu�n g�i th�nh b� hoa c�c./#tbclassname:getmakeitemsign(2)",
	--szselect3 = "������һ����ͨ����/#tbclassname:getmakeitemsign(3)",
	--szselect4 = "������һ�������±�/#tbclassname:getmakeitemsign(4)",
	--szselect5 = "������һ���±����/#tbclassname:getmakeitemsign(5)",
	szno = "Nh�n ti�n gh� qua th�i/NoChoice",
	szmakeItemUI = " ��ng! Xin s� ph� tr� t�i!/#tbclassname:makeItemUI(%d)",
	szlevel = "Th�t ��ng ti�c, ��ng c�p kh�ng �� 50, kh�ng th� tham gia ho�t ��ng n�y.",
	szmoney = "Th�t ��ng ti�c, ng�n l��ng mang theo kh�ng ��.",
	szpay = "Xin l�i, b�n v�n ch�a n�p th�, kh�ng th� g�i hoa.",
	szremake = "Tr� l�i/main",
	szitemfree="Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",
}

--������Ҫ����
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1681,szname="B� hoa h�ng",num=1,nMoney=100000},
		{G=6,D=1,P=1679,szname="C�nh hoa h�ng",num=10},
		},
	select2 = {
		{G=6,D=1,P=1682,szname="B� hoa c�c",num=1,nMoney=50000},
		{G=6,D=1,P=1680,szname="C�nh hoa c�c",num=10},
		},
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
					sztalkmake = format("L� quan: Mu�n g�i %d<color=red>%s<color>, c�n ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d <color=red>%s<color>,",
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