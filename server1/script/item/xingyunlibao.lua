--�������
--by С�˶��
--2007.04.13

TB_LIBAO = 
{
	1000000,--�ܸ���
	{0.00125,	{"C�u V� B�ch H� trang",					0,2,9,10,2,}}, --��β�׺���[ˮ����]
	{0.00125,	{"C�u V� B�ch H� trang",					0,2,9,10,3,}}, --��β�׺���[������]
	{0.00125,	{"Tuy�n Long b�o",							0,2,6,10,2,}}, --�����[ˮ����]
	{0.00125,	{"Tuy�n Long b�o",							0,2,6,10,3,}}, --�����[������]
	{0.00125,	{"Thi�n T�m Y�u ��i",						0,6,0,10,2,}}, --�������[ˮ����]
	{0.00125,	{"Thi�n T�m Y�u ��i",						0,6,0,10,3,}}, --�������[������]
	{0.00125,	{"B�ch Kim Y�u ��i",						0,6,1,10,2,}}, --�׽�����[ˮ����]
	{0.00125,	{"B�ch Kim Y�u ��i",						0,6,1,10,3,}}, --�׽�����[������]
	{0.15,		{"Ti�n Th�o L� ",							6,1,71,1,}},	 --�ɲ�¶
	{0.1796,	{"Qu� Hoa T�u",							6,1,125,1,}},	 --�𻨾�
	{0.0001,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",		0,164,}},			 --���� �C ����ʯ����
	{0.0001,	{"An Bang C�c Hoa Th�ch Gi�i Ch�",		0,165,}}, 		 --���� �C �ջ�ʯ��ָ
	{0.0001,	{"An Bang K� Huy�t Th�ch Gi�i Ch� ",		0,167,}},			 --���� �C ��Ѫʯ��ָ
	{0.0001,	{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",		0,166,}}, 		 --���� �C ���ʯ����
	{0.0004,	{"��nh Qu�c � Sa Ph�t Qu�n",			0,160,}}, 		 --���� �C ��ɰ����
	{0.0004,	{"��nh Qu�c Thanh Sa Tr��ng Sam",			0,159,}}, 		 --���� �C ��ɴ����
	{0.0004,	{"��nh Qu�c T� ��ng H� uy�n",			0,162,}},			 --���� �C ���ٻ���
	{0.0004,	{"��nh Qu�c Ng�n T�m Y�u ��i",			0,163,}},			 --���� �C ��������
	{0.0004,	{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",			0,161,}},			 --���� �C �����ѥ
	{0.0002,	{"Chi�u D� Ng�c S� T� ",					0,10,5,10,}},	 --��ҹ��ʨ��80����
	{0.0002,	{"X�ch Th� ",								0,10,5,2,}},	 --����80����
	{0.0002,	{"V� L�m M�t T�ch",						6,1,26,1,}},	 --�����ܼ�
	{0.0002,	{"T�y T�y Kinh",							6,1,22,1,}},	 --ϴ�辭
	{0.65,		{"B�ng hoa chi�n c�ng",							6,1,1414,1,}}	 --ս����
}

function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070513) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("Ng��i ch�i c�p 50 tr� l�n �� n�p th� m�i c� th� s� d�ng.");
		return 1;
	end;
	if ( CalcFreeItemCellCount() < 12 ) then
		Say("Xin s�p x�p l�i h�nh trang �� ��m b�o c� 12 � tr�ng.",0);
	return 1;
	end
	local SumPe =  TB_LIBAO[1];
	local Rand = random(1,SumPe);
	local Sum = 0;
	for i=2,getn(TB_LIBAO) do
		local pnum = TB_LIBAO[i][1];
		local item = TB_LIBAO[i][2];
		Sum = Sum + pnum * SumPe;
		if Rand < Sum then
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	local nidx ;
	if getn(item) == 3 then
		nidx = AddGoldItem(item[2], item[3]);
	elseif getn(item) == 5 then
		nidx = AddItem(item[2], item[3], item[4], item[5],0,0);
	elseif getn(item) == 6 then
		nidx = AddQualityItem(2,item[2], item[3], item[4], item[5],item[6],255,-1,-1,-1,-1,-1,-1)
	end
	Msg2Player("B�n nh�n ���c m�t"..item[1]);
	WriteLog(format("[xingyunlibao]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end