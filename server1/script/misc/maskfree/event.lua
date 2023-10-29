Include("\\script\\lib\\basic.lua")

MASKFREE_SWITH = 1;		--1:Open   
											--nil:Close

TB_MASKFREE_1 = {
	{"M�t n� - L�c Quang", 369},
	{"M�t n� - Ng�n Nha", 370},
	{"M�t n� - S��ng �ao", 371},
	{"M�t n� - L�nh �ao", 372},
	{"M�t n� - H�n Th��ng", 373},
	{"M�t n� - B�n L�i", 374},
	{"M�t n� - ��c B� ", 375},
	{"M�t n� - Gi�ng Ch�y", 376},
	{"M�t n� - X�ch Ch��ng", 377},
	{"M�t n� - Lang B�ng", 378},
	--{"",},
}
TB_MASKFREE_2 = {
	{"M�t n� - Tr��ng T�ng Ch�nh", 379},
	{"M�t n� - Li�u Thanh Thanh", 380},
	{"M�t n� - Phi�n Kh�ch", 381},
}

TB_MASKFREE_3 = {
	{"M�t n� - Huy�n Gi�c ��i S� ", 382},
	{"M�t n� - Long Ng� ", 383},
}

TB_MASKFREEINFO_BYBIT = {
	--BIT		MASKTYPE					TABLE-MASK
	[1] = {"M�t n� lo�i 5000 VND ", TB_MASKFREE_1},
	[2] = {"M�t n� lo�i 20000 VND ", TB_MASKFREE_2},
	[3] = {"M�t n� lo�i 60000 VND", TB_MASKFREE_3},
--	[4] = {},
--	[5] = {},
--	[6] = {},
--	[7] = {},
--	[8] = {},
--	[9] = {},
--	[10] = {},
--	[11] = {},
--	[12] = {},
--	[13] = {},
--	[14] = {},
--	[15] = {},
--	[16] = {},
}

--print(getn(TB_MASKFREEINFO_BYBIT[1][2]))


function takeMaskFree()
	local aryMaskFree = {};
	local nExtValue = GetExtPoint(6);
	
	if (nExtValue <= 0) then
		Say("Qu� kh�ch ch�a �� �i�u ki�n nh�n qu� t�ng M�t n�! ", 0);
		return
	end;
	
	for nbit, maskinfo in TB_MASKFREEINFO_BYBIT do
		if (get_extpoint_bit(6, nbit) == 1 and getn(TB_MASKFREEINFO_BYBIT[nbit]) ~= 0) then
			tinsert(aryMaskFree, TB_MASKFREEINFO_BYBIT[nbit][1].."/#sure2takeMaskFree("..nbit..")")
		end;
	end;
	
	tinsert(aryMaskFree, "L�t n�a quay l�i /no")
	
	Say("Qu� kh�ch mu�n nh�n lo�i m�t n� n�o? ", getn(aryMaskFree), aryMaskFree);
end;

function sure2takeMaskFree(nbit)
	local tbMask = TB_MASKFREEINFO_BYBIT[nbit][2];
	local nItem = random(getn(tbMask));
	
	if (pay_extpoint_bit(6, nbit) == 1 and nItem > 0) then
		local szname, np = unpack(tbMask[nItem]);
		AddItem(0, 11, np, 1, 1, 1);
		Say("��y l� m�t n� "..szname..". C�m �n qu� kh�ch �� �ng h�!", 0);
		WriteLog("[MASKFREE]"..date().." Name:"..GetName().." Account:"..GetAccount().." take a mask : "..szname.." by bit:"..nbit);
	else
		print("ERROR!! PAY EXTPOINT6 FAIL! THE BIT:"..nbit)
	end;
end;

function get_extpoint_bit(nextp, nbit)
	local nvalue = GetExtPoint(nextp);
	return GetBit(nvalue, nbit)
end;

function pay_extpoint_bit(nextp, nbit)
	local npoint = 2^(nbit-1); -- nBit��1��ʼ����
	return PayExtPoint(nextp, npoint);
end;
