--��Ʒ��
--2007-04-04
--by С�˶��

TB_GIFT = {
	--��Ʒ�� ����				��ƷID
	100000, -- �ܸ���
	{0.25,		{"Thi�t La H�n",	6,1,23,0,0,0}},
	{0.25,		{"Ph�c Duy�n L� (��i) ",	6,1,124,0,0,0}},
	{0.0002,	{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",	0,166}},
	{0.0002,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	0,164}},
	{0.0002,	{"An Bang C�c Hoa Th�ch Ch� ho�n",	0,165}},
	{0.0002,	{"An Bang K� Huy�t Th�ch Gi�i Ch� ",	0,167}},
	{0.0002,	{"��nh Qu�c Thanh Sa Tr��ng Sam",	0,159}},
	{0.0002,	{"��nh Qu�c � Sa Ph�t Qu�n",	0,160}},
	{0.0002,	{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	0,161}},
	{0.0003,	{"��nh Qu�c T� ��ng H� uy�n",	0,162}},
	{0.0003,	{"��nh Qu�c Ng�n T�m Y�u ��i",	0,163}},
	{0.2,			{"��i b� th�n �an",	6,1,1398,0,0,0	}},
	{0.01,		{"Th�p to�n ��i b� th�n �an",	6,1,1399,0,0,0}},
	{0.288,		{"Ti�n Th�o L� ",6,1,71,0,0,0}},
}
function main(sel)
	if CalcFreeItemCellCount() < 12 then
		Say("H�nh trang ��i hi�p nhi�u qu�, c� kh� n�ng s� nh�n ���c trang b� chi�m nhi�u �. H�y c�t b�t v�t ph�m �� ��m b�o c� 12 � tr�ng r�i h�y m�.",0);
		return 1;
	end
	local prob = TB_GIFT[1];
	local sum = 0;
	local num = random(1,prob);
	--print(num.."\t"..getn(TB_GIFT).."\t")
	for i = 2,getn(TB_GIFT) do
		local odds = TB_GIFT[i][1];
		local item = TB_GIFT[i][2];
		sum = sum + odds * prob;
		if num < sum then
			--print(item[1]);
			award_item(item);
			break;
		end
	end
end

function award_item(item)
	if getn(item) == 3 then
		AddGoldItem(item[2], item[3]);
	elseif getn(item) == 7 then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	WriteLog(format("[chuanguanGiftBox]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));
end