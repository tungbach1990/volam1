-- Created by Danielsun 2006-12-07
-- ʥ�����
-- �����ʻ��ʥ���������

TB_Giftbox = {
 --1.��Ʒ��	    2.��ƷID	3.���伸��
	{"Hoa tuy�t", 			1312,		20	},
	{"C� r�t",		1313,		20	},
	{"C�nh th�ng",	1314,		20	},
	{"N�n gi�ng sinh",		1315,		18	},
	{"Kh�n cho�ng (xanh)",	1316,		11	},
	{"Kh�n cho�ng (��)",	1317,		5		},
	{"C�y th�ng ",		1318,		1		},
}

function main()
	
	local PItem = 0;
	local PGetItem = random();
	local PGetItem = PGetItem * 100;
	for ngift,mgift in TB_Giftbox do
		PItem = PItem + TB_Giftbox[ngift][3];
		if(PGetItem < PItem) then
			AddItem(6,1,TB_Giftbox[ngift][2],1,0,0,0);
			Msg2Player("B�n nh�t ���c nguy�n li�u gi�ng sinh:"..TB_Giftbox[ngift][1]);
			return
		end
	end
	return 1;
end
