Include([[\script\missions\tong\collectgoods\head.lua]]);

ITEM_DROPRATE_TABLE828 = {
--						{	{4,970,1,1,1,1,1},0, "����"	},
--						{	{4,971,1,1,1,1,1},0, "����"	},
--						{	{4,974,1,1,1,1,1},0, "��ͨ����"	},
--						{	{4,972,1,1,1,1,1},0, "��Ҷ"	},
--						{	{4,973,1,1,1,1,1},0, "����"	},
						{	{6,1,978,1,1,1,1},0.025, "Gia T�c ho�n"	},
						{	{6,1,981,1,1,1,1},0.025, "Huy�n Hu�n H�m T�nh"	},
						{	{6,1,983,1,1,1,1},0.025, "S��ng Gi�ng H�m T�nh"	},
						{	{6,1,991,1,1,1,1},0.025, "Thi�n L�i Ng�c"	},
						{	{6,1,994,1,1,1,1},0.025, "H�n Phong Ng�c"	},
						{	{6,1,987,1,1,1,1},0.025, "��n ��a ph� "	},
						{	{6,1,1009,1,1,1,1},0.018, "Ma T�y Hi�u gi�c"	},
						{	{6,1,990,1,1,1,1},0.005, "L�i T�c ho�n"	},
						{	{6,1,982,1,1,1,1},0.005, "Huy�n Thi�n H�m T�nh"	},
						{	{6,1,984,1,1,1,1},0.005, "B�ng Phong H�m T�nh"	},
						{	{6,1,993,1,1,1,1},0.005, "L�i Th�n Ng�c"	},
						{	{6,1,992,1,1,1,1},0.005, "Huy�n B�ng Ng�c"	},
						{	{6,1,1010,1,1,1,1},0.005, "C�p ��ng Hi�u gi�c"	},
						{	{6,1,980,1,1,1,1},0.002, "B�o L�i Hi�u gi�c"	},
						{	{6,1,979,1,1,1,1},0.002, "B�ng S��ng Hi�u gi�c "	},
						{	{6,1,986,1,1,1,1},0.003, "Di H�nh Ho�n �nh ph� "	},
						{	{6,1,985,1,1,1,1},0.002, "C�n Kh�n Na Di ph� "	},
						{	1000,0.08},
						{	2000,0.10},
						{	5000,0.10},
						{	10000,0.20},
						{	20000,0.138},
						{	50000,0.11},
						{	100000,0.06},
						{	{6,1,402,1,1,1,1},0.005, "Th�n b� ��i H�ng Bao"},
					}


function gift_true828()
	SetTask(COLLG_COUNT_ONETIME, GetTask(COLLG_COUNT_ONETIME) + 1);
	Msg2Player("B�n t�m ���c <color=red>1<color> t�i h�ng h�a.");
	add_dropitem828()
	
	CastSkill(358, 1); --��һ�����ܣ�
	Msg2Player("B�n t�m ���c t�t c� <color=yellow>"..GetTask(COLLG_COUNT_ONETIME).."<color> t�i h�ng h�a.");
end;

function add_dropitem828()
	local sum = 0
	for i = 1, getn(ITEM_DROPRATE_TABLE828) do
		sum = sum + ITEM_DROPRATE_TABLE828[i][2] * 1000
	end
	
	local nRandNum = random(sum)
	local nSum = 0
	for i =1, getn(ITEM_DROPRATE_TABLE828) do
		nSum = nSum + ITEM_DROPRATE_TABLE828[i][2] * 1000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE828[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE828[i][1][1], ITEM_DROPRATE_TABLE828[i][1][2], ITEM_DROPRATE_TABLE828[i][1][3], ITEM_DROPRATE_TABLE828[i][1][4], ITEM_DROPRATE_TABLE828[i][1][5], ITEM_DROPRATE_TABLE828[i][1][6], ITEM_DROPRATE_TABLE828[i][1][7])
				Msg2Player("B�n ���c 1 c�i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE828[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE828[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE828[i][1];
				AddOwnExp(nExp);
				Msg2Player("B�n nh�n ���c <color=0xB5FDD7>"..nExp.."�i�m kinh nghi�m.");
			end
			break
		end
	end
	
	
end

function IsPickable828( nItemIndex, nPlayerIndex )
    if (0 == GetItemParam(nItemIndex, 2)) then
       return 1;
    end
    
	if (GetTask(TK_GROUPID) > COLLG_SMALLMAPCOUNT) then
        return 0;
    else
        return 1;
    end;
end

function PickUp828( nItemIndex, nPlayerIndex )
    SetSpecItemParam(nItemIndex, 2, 0);
    gift_true828(nPlayerIndex);
    return 0;
end
