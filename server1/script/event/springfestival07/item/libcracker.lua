Include([[\script\event\springfestival07\head.lua]]);

function main()
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th�<color> m�i c� th� s� d�ng ph�o.", 0);
		return 1;
	end;
	
	if (sf07_isgoodsactive() == 0) then
		Say("V�t ph�m n�y ch� s� d�ng trong d�p T�t.", 0);
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
	local str = "B�n �� m� m�t <color=yellow>"..GOODSNAME.."<color>";
	Msg2Player(str);
	if (nExp <= 0) then
		Say("B�n �� nh�n ���c <color=yellow>"..EXP_MAXIMUM.."<color> �i�m kinh nghi�m, kh�ng th� s� d�ng ph�o n�a!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = "B�n nh�n ���c <color=yellow>"..nExp.."<color> �i�m kinh nghi�m.";
	SetTask(4000, GetTask(4000)+EXPVALUE)
	str = str.."<enter>B�n nh�n ���c <color=yellow>"..EXPVALUE.."<color> �i�m Ch�n Nguy�n.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	if (TAB_GOODS and getn(TAB_GOODS) > 0) then
		for i = 1, getn(TAB_GOODS) do
			AddItem(TAB_GOODS[i][2], TAB_GOODS[i][3], TAB_GOODS[i][4], TAB_GOODS[i][5],0,0,0);
			str = str.."<enter>B�n nh�n ���c 1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
		end;
	end;
	Msg2Player(str);
	--CastSkill(764, 3);
end;