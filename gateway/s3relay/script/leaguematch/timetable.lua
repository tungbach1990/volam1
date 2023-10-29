--�ճ̰���
_tmp_calender = {
	weekend = {	--��ĩ�ճ̣������塢�����ղ���
		--��ʼʱ�䣨���ӣ�����������
		{18*60, 4},	--��һ��
		{21*60, 4},	--�ڶ���
	},
	common = {	--һ���ճ̣���û���ر���ʱ����
		--��ʼʱ�䣨���ӣ�����������
		{18*60, 4},
		{21*60, 4},	--�ڶ���
	}
}

--��������
-- ���ͣ�1��˫�ˣ�2�����ɣ�3��ʦͽ��4�����ˣ�5����ϵ��ˣ�6��ͬϵ˫�ˣ�7�����˫��
WLLS_SEASON_TB = {
	--[ID]={����, 	��ʼ����,	��������,	��������,	�ճ̰���}
	[0] = {2,		0,			0,			0,			{}},	--�������������������
	
	-- 10������
	[40] = {2,		100108,		100128,		48,		_tmp_calender},
	[41] = {1,		100208,		100228,		48,		_tmp_calender},
	[42] = {2,		100308,		100328,		48,		_tmp_calender},
	[43] = {5,		100408,		100428,		48,		_tmp_calender},
	[44] = {3,		100508,		100528,		48,		_tmp_calender},
	[45] = {6,		100608,		100628,		48,		_tmp_calender},
	[46] = {2,		100708,		100728,		48,		_tmp_calender},
	[47] = {1,		100808,		100828,		48,		_tmp_calender},
	[48] = {4,		100908,		100928,		48,		_tmp_calender},
	[49] = {5,		101008,		101028,		48,		_tmp_calender},
	[50] = {3,		101108,		101128,		48,		_tmp_calender},
	[51] = {6,		101208,		101228,		48,		_tmp_calender},
	
	-- 11������
	[52] = {5,		110108,		110128,		48,		_tmp_calender},
	[53] = {1,		110208,		110228,		48,		_tmp_calender},
	[54] = {2,		110308,		110328,		48,		_tmp_calender},
	[55] = {4,		110408,		110428,		48,		_tmp_calender},
	[56] = {1,		110508,		110528,		48,		_tmp_calender},
	[57] = {4,		110608,		110628,		48,		_tmp_calender},
	[58] = {5,		110708,		110728,		48,		_tmp_calender},
	[59] = {1,		110808,		110828,		48,		_tmp_calender},
	[60] = {4,		110908,		110928,		48,		_tmp_calender},
	[61] = {5,		111008,		111028,		48,		_tmp_calender},
	[62] = {3,		111108,		111128,		48,		_tmp_calender},
	[63] = {4,		111208,		111228,		48,		_tmp_calender},
	
	-- Update l�ch cho n�m 2012 - modified By DinhHQ -2120109
	[64] = {5,		120108,		120128,		48,		_tmp_calender},
	[65] = {1,		120208,		120228,		48,		_tmp_calender},
	[66] = {2,		120308,		120328,		48,		_tmp_calender},
	[67] = {2,		120408,		120428,		48,		_tmp_calender},
	[68] = {1,		120508,		120528,		48,		_tmp_calender},
	[69] = {4,		120608,		120628,		48,		_tmp_calender},
	[70] = {5,		120708,		120728,		48,		_tmp_calender},
	[71] = {1,		120808,		120828,		48,		_tmp_calender},
	[72] = {4,		120908,		120928,		48,		_tmp_calender},
	[73] = {5,		121008,		121028,		48,		_tmp_calender},
	[74] = {3,		121108,		121128,		48,		_tmp_calender},
	[75] = {4,		121208,		121228,		48,		_tmp_calender},
	
	--Schedule for 2013
	[76] = {5,		130108,		130128,		48,		_tmp_calender},
	[77] = {1,		130208,		130228,		48,		_tmp_calender},
	[78] = {2,		130308,		130328,		48,		_tmp_calender},
	[79] = {2,		130408,		130428,		48,		_tmp_calender},
	[80] = {1,		130508,		130528,		48,		_tmp_calender},
	[81] = {4,		130608,		130628,		48,		_tmp_calender},
	[82] = {2,		130708,		130728,		48,		_tmp_calender},
	[83] = {2,		130808,		130828,		48,		_tmp_calender},
	[84] = {4,		130908,		130928,		48,		_tmp_calender},
	[85] = {5,		131008,		131028,		48,		_tmp_calender},
	[86] = {3,		131108,		131128,		48,		_tmp_calender},
	[87] = {4,		131208,		131228,		48,		_tmp_calender},
	
	--Schedule for 2014
	[88] = {5,		140108,		140128,		48,		_tmp_calender},
	[89] = {1,		140208,		140228,		48,		_tmp_calender},
	[90] = {2,		140308,		140328,		48,		_tmp_calender},
	[91] = {2,		140408,		140428,		48,		_tmp_calender},
	[92] = {1,		140508,		140528,		48,		_tmp_calender},
	[93] = {4,		140608,		140628,		48,		_tmp_calender},
	[94] = {5,		140708,		140728,		48,		_tmp_calender},
	[95] = {1,		140808,		140828,		48,		_tmp_calender},
	[96] = {4,		140908,		140928,		48,		_tmp_calender},
	[97] = {5,		141008,		141028,		48,		_tmp_calender},
	[98] = {3,		141108,		141128,		48,		_tmp_calender},
	[99] = {4,		141208,		141228,		48,		_tmp_calender},
}

--��β�������������⼫�����
WLLS_SEASON_TB[getn(WLLS_SEASON_TB)+1] = {2,	999998,	999998,	0,	_tmp_calender}
WLLS_SEASON_TB[getn(WLLS_SEASON_TB)+1] = {2,	999999,	999999,	0,	_tmp_calender}
