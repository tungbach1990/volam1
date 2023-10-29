Include([[\script\event\springfestival07\head.lua]]);

GOODSNAME = "Phong ph�o ��i ��c bi�t";
FREECELLCOUNT = 0;
EXPVALUE = 5000;
TAB_GOODS = {
{"Huy�n Tinh Kho�ng Th�ch c�p 5",5,	147	,	0.674	},
{"Huy�n Tinh Kho�ng Th�ch c�p 6",6,	147	,	0.12	},
{"Huy�n Tinh Kho�ng Th�ch c�p 7",7,	147	,	0.005	},
{"Lam Th�y Tinh",1,	238	,	0.06	},
{"L�c Th�y Tinh",1,	240	,	0.06	},
{"T� Th�y Tinh",1,	239	,	0.06	},
{"��nh Qu�c Thanh Sa Tr��ng Sam",2,	159	,	0.003	},
{"��nh Qu�c � Sa Ph�t Qu�n",2,	160	,	0.003	},
{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",2,	161	,	0.003	},
{"��nh Qu�c T� ��ng H� uy�n",2,	162	,	0.003	},
{"��nh Qu�c Ng�n T�m Y�u ��i",2,	163	,	0.003	},
{"An Bang B�ng Tinh Th�ch H�ng Li�n",2,	164	,	0.0015	},
{"An Bang C�c Hoa Th�ch Ch� ho�n",2,	165	,	0.0015	},
{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",2,	166	,	0.0015	},
{"An Bang K� Huy�t Th�ch Gi�i Ch� ",2,	167	,	0.0015	},
};

function main()
	if (sf07_isgoodsactive() == 0) then
		Say("V�t ph�m n�y ch� s� d�ng trong d�p T�t.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th�<color> m�i c� th� s� d�ng ph�o.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() < FREECELLCOUNT) then
		Say("Xin h�y s�p x�p l�i h�nh trang tr��c ��!", 0);
		return 1;
	end;
	
	local nExp = EXPVALUE * UNIT_WAN;
	local nRemained = EXP_MAXIMUM - GetTask(TASKID_TOTALEXP);
	if (nExp > nRemained) then
		nExp = nRemained;
	end;
	local str = "B�n �� m� m�t <color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("B�n �� nh�n ���c <color=yellow>"..EXP_MAXIMUM.."<color> �i�m kinh nghi�m, kh�ng th� s� d�ng ph�o n�a!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."B�n nh�n ���c<color=yellow>"..nExp.."<color> �i�m kinh nghi�m.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(TAB_GOODS) do
		nSum = nSum + TAB_GOODS[i][4] * 10000;
		if (nSum >= nSeed) then
			if (TAB_GOODS[i][2] == 1) then
				AddItem(4, TAB_GOODS[i][3], 1, 1,0,0,0);
			elseif (TAB_GOODS[i][2] == 2) then
				AddGoldItem(0, TAB_GOODS[i][3]);
			else
				AddItem(6, 1, TAB_GOODS[i][3], TAB_GOODS[i][2],0,0,0);
			end;
			str = str.."Nh�n ���c 1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
			break;
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;