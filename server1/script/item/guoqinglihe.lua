--�������
--by С�˶��
--2007.08.08

TB_LIBAO = 
{
	1000000,--�ܸ���
	{0.968,	{"Huy ch��ng Qu�c Kh�nh",	6,1,1496,1,}},--�������
	{0.003,	{"M�nh T�ng B�o �� 1",	4,490,1,1,}}, --��ͼ��Ƭ1
	{0.001,	{"M�nh T�ng B�o �� 2",	4,491,1,1,}}, --��ͼ��Ƭ2
	{0.003,	{"M�nh T�ng B�o �� 3",	4,492,1,1,}}, --��ͼ��Ƭ3
	{0.003,	{"M�nh T�ng B�o �� 4",	4,493,1,1,}}, --��ͼ��Ƭ4
	{0.003,	{"M�nh T�ng B�o �� 5",	4,494,1,1,}}, --��ͼ��Ƭ5
	{0.003,	{"M�nh T�ng B�o �� 6",	4,495,1,1,}}, --��ͼ��Ƭ6
	{0.003,	{"M�nh T�ng B�o �� 7",	4,496,1,1,}}, --��ͼ��Ƭ7
	{0.003,	{"M�nh T�ng B�o �� 8",	4,497,1,1,}},	--��ͼ��Ƭ8
	{0.001,	{"M�nh T�ng B�o �� 9",	4,498,1,1,}},	--��ͼ��Ƭ9
	{0.003,	{"M�nh T�ng B�o �� 10",4,499,1,1,}},	--��ͼ��Ƭ10
	{0.003,	{"M�nh T�ng B�o �� 11",4,500,1,1,}},	--��ͼ��Ƭ11
	{0.003,	{"M�nh T�ng B�o �� 12",4,501,1,1,}},	--��ͼ��Ƭ12
}
GUOQINGLIHE_DATE_END = 070924	--������ʹ��ʱ��
function main(sel)
	local nData = tonumber(GetLocalDate("%y%m%d"))
	if nData >= GUOQINGLIHE_DATE_END then
		Talk(1,"","Th�t ��ng ti�c, v�t ph�m n�y �� qu� h�n s� d�ng.")
		return 0 
	end
	if ( CalcFreeItemCellCount() < 5 ) then
		Talk(1,"","Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.")
		return 1
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
	Msg2Player(format("B�n nh�n ���c 1 <color=yellow>%s<color>",item[1]));
	WriteLog(format("[GuoQingLiHe]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s \t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),item[1]));

end