Include([[\script\missions\springfestival\head.lua]]);

ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.020, "Gia T�c ho�n"	},
						{	{6,1,981,1,1,1,1},0.010, "Huy�n Hu�n H�m T�nh"	},
						{	{6,1,982,1,1,1,1},0.005, "Huy�n Thi�n H�m T�nh"	},
						{	{6,1,983,1,1,1,1},0.020, "S��ng Gi�ng H�m T�nh"	},
						{	{6,1,984,1,1,1,1},0.010, "B�ng Phong H�m T�nh"	},
						{	{6,1,994,1,1,1,1},0.016, "H�n Phong Ng�c"	},
						{	{6,1,989,1,1,1,1},0.010, "Kinh nghi�m ph� "	},
						{	{6,1,988,1,1,1,1},0.005, "Kinh nghi�m ph� (cao c�p) "	},
						{	{6,1,985,1,1,1,1},0.005, "C�n Kh�n Na Di ph� "	},
						{	{6,1,986,1,1,1,1},0.005, "Di H�nh Ho�n �nh ph� "	},
						{	{6,1,979,1,1,1,1},0.010, "B�ng S��ng Hi�u gi�c "	},
						{	1000,0.15},
						{	2000,0.15},
						{	5000,0.15},
						{	10000,0.15},
						{	20000,0.1189},
						{	50000,0.015},
						{	100000,0.0001},
						{	{6,1,71,1,1,1,1},0.030, "Ti�n Th�o L� "},
					}


function main()
    if (GetTask(TK_CO_GROUPID) <= CO_SMALLMAPCOUNT) then
        return
    end;
	local nNpcIdx = GetLastDiagNpc();
	if (GetNpcParam(nNpcIdx, 4) == 0 ) then
		return
	end
	SetNpcParam(nNpcIdx,4,0)
	
	local nCount = GetTask(TK_CO_COUNT_ONETIME) + 1;
	SetTask(TK_CO_COUNT_ONETIME, nCount);
	DelNpc(nNpcIdx);
	
	add_dropitem()
	
	CastSkill(358, 1); --��һ�����ܣ�
	
	Msg2Player("B�n �� ch�n tr�ng"..nCount.."c�i"..CO_MOUSENAME);
end;

function add_dropitem()
	local nSum = 0
	local nRandNum = random(1, 10000)
	
	for i =1, getn(ITEM_DROPRATE_TABLE) do
		nSum = nSum + ITEM_DROPRATE_TABLE[i][2] * 10000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7])
				Msg2Player("B�n ���c 1 c�i<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * festival_get_exptimes();
				AddOwnExp(nExp);
				Msg2Player("B�n nh�n ���c <color=0xB5FDD7>"..nExp.."�i�m kinh nghi�m.");
			end
			break
		end
	end
	
	
end