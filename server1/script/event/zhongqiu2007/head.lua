--2007����ڻ
--by С�˶��
--2007-09-06

DA_ZHONGQIU2007_START = 0709220000	--��ʼʱ��
DA_ZHONGQIU2007_END 	= 0710142400	--����ʱ��
NZHONGQIU2007_LIHE_MAX = 400000000	--��о�������
NZHONGQIU2007_MAX = 400000000				--�±���������
TSK_ZHONGQIU2007_LIHE = 1844				--��о������ޱ���
TSK_ZHONGQIU2007 = 1843							--�±��������ޱ���
ZHONGQIU_LEVEL = 50		--�ȼ�����
SZYUEBING = ""				--��ȡ�����
TSK_TEMP = 51					--�����ʱ����

tb_content =
{
	sztalk1 = "Th� l�m b�nh: Th�t tho�i m�i, ta �ang ngh� ng�i v�i ng�y.",
	sztalk2 = "Th� l�m b�nh: L�i ��n Trung Thu n�a r�i, tay ngh� l�m b�nh c�a ta ai c�ng bi�t ��n, m�i n�m c� kh�ng �t nh�n s� ��n t�m ta gi�p l�m b�nh, kh�ch quan c�n g� �?",
	szgetlvdou = "Ta mu�n l�m 1 c�i b�nh ��u xanh/#makeyuebing(1)",
	szgetlianzi = "Ta mu�n l�m 1 c�i b�nh h�t sen/#makeyuebing(2)",
	szgetkaoji = "Ta mu�n l�m 1 c�i b�nh Trung Thu g� n��ng/#makeyuebing(3)",
	szkaozhu = "Ta mu�n l�m 1 c�i b�nh Trung Thu heo quay/#makeyuebing(4)",
	szlihe = "Ta mu�n l�m 1 h�p b�nh Trung Thu/#makeyuebing(5)",
	szno = "Nh�n ti�n gh� qua th�i/NoChoice",
	szmakeItemUI = "��ng v�y, ta mu�n l�m b�nh Trung Thu/makeItemUI",
	szlevel = "Th�t ��ng ti�c, ��ng c�p kh�ng �� 50, kh�ng th� tham gia ho�t ��ng n�y.",
	szmoney = "Th�t ��ng ti�c, ng�n l��ng mang theo kh�ng ��.",
	szpay = "Th�t ��ng ti�c, ng��i ch�i ch�a n�p th�, kh�ng th� d�ng b�nh Trung Thu.",
	szremake = "Tr� l�i/main",
	
}

--��л�ò��Ϻͼ���
tb_Mareial_LIHE = 	
{
	100000,
	{
		{G=6,D=1,P=1207,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1208,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1209,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1210,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1211,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1212,nrate=0.0125	,szname="M�nh tranh V�n Du"},
		{G=6,D=1,P=1213,nrate=0.0125	,szname="M�nh tranh Ti�n V�"},
		{G=6,D=1,P=1214,nrate=0.0125	,szname="M�nh tranh Ti�n V�"},
		{G=6,D=1,P=1215,nrate=0.0125	,szname="M�nh tranh Ti�n V�"},
		{G=6,D=1,P=1216,nrate=0.0125	,szname="M�nh tranh Ti�n V�"},
		{G=6,D=1,P=1217,nrate=0.0125	,szname="M�nh tranh Ti�n V�"},
		{G=6,D=1,P=1218,nrate=0.0125	,szname="M�nh tranh Ti�n V�"}
	}
}

--�±�������Ҫ����
tb_Mareial =
{
	szlvdou = {
		{G=6,D=1,P=1510,szname="B�nh ��u xanh",num=1,nMoney=50000},
		{G=6,D=1,P=1503,szname="T�i b�t",num=2},
		{G=6,D=1,P=1504,szname="T�i ���ng",num=2},
		{G=6,D=1,P=1505,szname="T�i tr�ng",num=2},
		{G=6,D=1,P=1506,szname="T�i ��u xanh",num=1},
		},
	szlianzi = {
		{G=6,D=1,P=1511,szname="B�nh h�t sen",num=1,nMoney=100000},
		{G=6,D=1,P=1503,szname="T�i b�t",num=2},
		{G=6,D=1,P=1504,szname="T�i ���ng",num=2},
		{G=6,D=1,P=1505,szname="T�i tr�ng",num=2},
		{G=6,D=1,P=1507,szname="T�i h�t sen",num=1},
		},
	szkaoji = {
		{G=6,D=1,P=1512,szname="B�nh Trung Thu g� n��ng",num=1,nMoney=150000},
		{G=6,D=1,P=1503,szname="T�i b�t",num=3},
		{G=6,D=1,P=1504,szname="T�i ���ng",num=3},
		{G=6,D=1,P=1505,szname="T�i tr�ng",num=3},
		{G=6,D=1,P=1508,szname="T�i th�t g�",num=1},
		},
	szkaozhu = {
		{G=6,D=1,P=1513,szname="B�nh Trung Thu heo quay",num=1,nMoney=200000},
		{G=6,D=1,P=1503,szname="T�i b�t",num=4},
		{G=6,D=1,P=1504,szname="T�i ���ng",num=4},
		{G=6,D=1,P=1505,szname="T�i tr�ng",num=4},
		{G=6,D=1,P=1509,szname="T�i th�t heo",num=1},
		},
	szlihe = {
		{G=6,D=1,P=1514,szname="H�p b�nh Trung Thu",num=1,nMoney=300000},
		{G=6,D=1,P=1510,szname="B�nh ��u xanh",num=1},
		{G=6,D=1,P=1511,szname="B�nh h�t sen",num=1},
		{G=6,D=1,P=1512,szname="B�nh Trung Thu g� n��ng",num=1},
		{G=6,D=1,P=1513,szname="B�nh Trung Thu heo quay",num=1},
		},		
}

function funmsg()
		SZYUEBING = getTaskItemName()
		szmsg = format("Ch�c m�ng b�n �� nh�n ���c %d <color=yellow>%s<color>.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"])
		return szmsg
end

function funtalkmake()
		SZYUEBING = getTaskItemName()
		sztalkmake = format("Th� l�m b�nh: Mu�n l�m %d c�i <color=red>%s<color> c�n %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> v� %d l��ng, ng��i ��ng � kh�ng?",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmake
end

function funtalkmlimit()
		SZYUEBING = getTaskItemName()
		sztalkmlimit= format("Th� l�m b�nh: Nguy�n li�u mang theo kh�ng ��, l�m %d <color=red>%s<color> c�n %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> v� %d l��ng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmlimit
end

function fungiveitemui()
		SZYUEBING = getTaskItemName()
		szgiveitemui= format("Th� l�m b�nh: Mu�n l�m %d %s c�n %d %s, %d %s, %d %s, %d %s v� %d l��ng.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return szgiveitemui
end

function check_zhongqiu2007_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > DA_ZHONGQIU2007_START ) and ( ndate < DA_ZHONGQIU2007_END ) ) then
		return 1
	end
	return 0
end

function check_item(szItemKey)	--�ж���Ʒ�Ƿ����
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--�жϵȼ�
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--�ж�Ǯ
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--���tb�����
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end

