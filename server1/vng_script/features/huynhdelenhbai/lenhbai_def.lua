Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("PET")
IncludeLib("SETTING");

tbHuynhdelenhbai = tbHuynhdelenhbai or {};
tbHuynhdelenhbai.szPathFile = "\\vng_script\\features\\huynhdelenhbai\\taskhuynhde.lua"
tbHuynhdelenhbai.MINLEVEL	 = 1
tbHuynhdelenhbai.MAXLEVEL	 = 200
tbHuynhdelenhbai.EVENT_LOG_TITLE = "LOG_LB_HUYNH_DE_TUONG_PHUNG"
tbHuynhdelenhbai.TASK_INFOR_HD_LB = {nTaskID = 2787,nStartBit = 1,nBitCount = 6,nMaxValue = 60}
tbHuynhdelenhbai.TASK_ID_RESET_01 = 2787
tbHuynhdelenhbai.TASK_ID_RESET_02 = 2788

tbHuynhdelenhbai.EXT_POINT_ID_1 = {nID = 3, nBit = 15, nVer = 1} --K�ch ho�t m� code t�i web

tbHuynhdelenhbai.TASK_ID_MAP = {	
		[6] = {--EventID
			[168] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 10,nMaxValue = 1000}, --NPCID: 168
		},	
		[7] = {--EventID
			[15] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 10,nMaxValue = 1000}, 
		},	
		[8] = {
			[588] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},	
		[9] = {
			[150] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},		
		[10] = {
			[169] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[11] = {
			[557] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},	
		[12] = {
			[155] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[13] = {
			[706] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[14] = {
			[703] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[15] = {
			[704] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[16] = {
			[146] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[17] = {
			[148] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},
		},
		[18] = {
			[561] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[19] = {
			[559] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[20] = {
			[561] =   {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},			
		},
		[21] = {
			[559] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},				
		},
		[22] = {
			[537] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[23] = {
			[538] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[24] = {
			[595] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[25] = {
			[594] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[26] = {
			[596] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},		
		},
		[27] = {
			[599] = {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[28] = {
			[598] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},	
		},
		[29] = {
			[601] =  {nTaskID = 2787,nStartBit = 7,nBitCount = 13,nMaxValue = 5000},		
		},
	}

--Ph�n t�nh n�ng
tbHuynhdelenhbai.TASK_INFOR_ABOUNT = {
	[1] = {
		[1] = {nRequires = 10}, -- Ng�n l��ng		
	},
	[2] = {
		[1] = {nLevelRequires = 10 }, --Ph�m t�t F1
	},
	[3] = {
		[1] = {szName = "Kim S�ng D��c ti�u", tbProp={1,0,0,0,0,0}, nRequires = 2 }, -- 2Kim s�ng d��c ti�u
	},
	[4] = {
		[1] = {szName = "Th� ��a Ph�", tbProp={5,0,0,0,0,0},nRequires = 1}, -- Th� ��a Ph�
	},
	[5] = {	
		[1] = {nFactionRequires = 1}, --Gia Nh�p M�n Ph�i	
	},
	[12] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[13] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[14] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[15] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[16] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[17] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[18] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 3}, -- T�ng kim
	},
	[19] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[20] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[21] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[22] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[23] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount =4,nMaxValue = 4}, -- T�ng kim
	},
	[24] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[25] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[26] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[27] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[28] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
	[29] = {
		[6] = {nTaskID = 2788,nStartBit = 1,nBitCount = 4,nMaxValue = 4}, -- T�ng kim
	},
}
tbHuynhdelenhbai.TASK_NAME_TASK = {
	[1] = "Ng�n L��ng",
	[2] = "Ph�m T�t F1",
	[3] = "Kim S�ng D��c (ti�u)",
	[4] = "Th� ��a Ph�",
	[5] = "Gia Nh�p M�n Ph�i",
	[6] = "T�ng Kim",
}
tbHuynhdelenhbai.TASK_NAME_NPC = {
	-- map 24
	[6] = {--mapID
		[168] =  "Lam C�n",	--Npc ID
	},	
	[7] = {
		[15] =  "T�n H�ng",
	},
	[8] = {
		[588] =  "B�n L�i",	
	},
	[9] = {
		[150] =  "Thanh Mi",		
	},
	[10] = {
		[169] =  "K� Ch�y",	
	},
	[11] = {
		[557] =  "K�n ��t",	
	},
	[12] = {
		[155] =  "H�c C�n",		
	},
	[13] = {
		[706] =  "M�c T�c",
	},
	[14] = {
		[703] =  "Phi Sa",
	},
	[15] = {
		[704] =  "T�u Th�ch",
	},
	[16] = {
		[146] =  "�o�t M�nh Li�m",	
	},
	[17] = {
		[148] =  "B�o ��m",	
	},
	[18] = {
		[561] =  "L�u V�n",		
	},
	[19] = {
		[559] =  "L�u Phong",		
	},
	[20] = {
		[561] =  "L�u V�n",
	},
	[21] = {
		[559] =  "L�u Phong",
	},
	[22] = {
		[537] =  "T�t Vi�m",
	},
	[23] = {
		[538] =  "T�t �i�m",
	},
	[24] = {
		[595] =  "L�c Quang",
	},
	[25] = {
		[594] =  "�ao Tr�m",
	},
	[26] = {
		[596] =  "H�n Th��ng",
	},
	[27] = {
		[599] =  "L�nh Cung",
	},
	[28] = {
		[598] =  "S��ng �ao",
	},
	[29] = {
		[601] =  "S�n V�",
	},
}

--Tr� v� th�ng tin c�a nhi�m v� theo ID
function tbHuynhdelenhbai:GetAwardInfo(nEventId)
	if(not nEventId or not self.tbAllAwards[nEventId]) then
		return
	end
	return self.tbAllAwards[nEventId]
end

--Tr� v� th�ng tin gammer c� th� nh�n, �ang trong qu� tr�nh x� l� ho�c l� �� ho�n th�nh ���c nhi�m v� theo ID
--1: �� nh�n nhi�m v�
--2: �� ho�n th�nh nhi�m v� nh�ng ch�a nh�n th��ng
--3: �� nh�n th��ng nhi�m v�
--4: Ch�a nh�n nhi�m v�
function tbHuynhdelenhbai:GetEventIdInfo(nID)
	for i=1, self.nMaxEventId do
		local tbAward = self:GetAwardInfo(i)
		if(self:IsShowDlg(i,tbAward[1].nTaskIDStart,tbAward[1].nBitStart) == nID) then
			return i
		end
	end
end

function tbHuynhdelenhbai:IsShowDlg(nEventId,nTaskID,nBit)
	local tbAward = self:GetAwardInfo(nEventId)
	if(not tbAward) then
		return 0
	end
	local nPlayerLevel = GetLevel()
--		print("----- IsShowDlg - nPlayerLevel :"..nPlayerLevel)
--		print("----- IsShowDlg - tbAward[1].nMaxLevel :"..tbAward[1].nMinLevel)
--		print("----- IsShowDlg - tbAward[1].nMinLeve :"..tbAward[1].nMaxLevel)
	if(nPlayerLevel < tbAward[1].nMinLevel or nPlayerLevel > tbAward[1].nMaxLevel) then
		return 0
	end
	local tbBitTSK = {nTaskID = nTaskID,nStartBit = nBit,nBitCount = 2,nMaxValue = 3}
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbBitTSK)
	if(nCurTskVal ~= 0) then
		return nCurTskVal
	end
	return 4
end
--Function ki�m tra ng��i ch�i m�i
--C� th�p ni�n l�nh b�i & K�ch ho�t m� code
function tbHuynhdelenhbai:IsNewPlayer()
	if (tbExtPointLib:GetBitValueByVersion(self.EXT_POINT_ID_1) == 0)then
		return 0
	end
	if(CalcItemCount(-1, 6, 1, 30592, -1) < 1) then
		return 2
	end
	return 1
end


--Function t�ng ��ng c�p c�a nh�n v�t
_AddLevel = function (nId,nLevel,szLog)
	local szMsg = "T�ng l�n c�p %d"
	if(nId ==  1) then	
		ST_LevelUp(nLevel - GetLevel())
	elseif nId == 2 then --id 2: add diem danh vong
		AddRepute(nLevel)
		szMsg = "Nh�n ���c %d �i�m Danh v�ng"
	end
	if(not szLog) then szLog = "NhanLevel" end
	Msg2Player(format(szMsg,nLevel))
	tbLog:PlayerActionLog(tbHuynhdelenhbai.EVENT_LOG_TITLE,szLog,format(szMsg,nLevel))
end



tbHuynhdelenhbai.tbAward_List = {
	[1] = {		
		[1] = {szName = "T�ng c�p l�n 10", pFun = function()  _AddLevel(1,10,"NhiemVu_1") end },
		[2 ]= {szName="Kim Phong Thi�n L� Th�o Th��ng Phi",tbProp={0,184},nCount=1,nQuality = 1,nBindState=-2},
	},
	[2] = {	
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,20,"NhiemVu_10") end },
		[2] = {szName="Kim Phong Tr�c Li�n Quang",tbProp={0,179},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong K� L�n Huy�t",tbProp={0,178},nCount=1,nQuality = 1,nBindState=-2},
		[4] = {szName="Ng�n l��ng",nJxb=10000,nCount=1,},
	},
	[3] = {	
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,30,"NhiemVu_20") end },
		[2] = {szName="Kim Phong Thanh D��ng Kh�i",tbProp={0,177},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong Lan ��nh Ng�c",tbProp={0,183},nCount=1,nQuality = 1,nBindState=-2},
	},
	[4] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,40,"NhiemVu_30") end },
		[2] = {szName="Kim Phong C�ng C�n Tam Th�n",tbProp={0,180},nCount=1,nQuality = 1,nBindState=-2},
		[3] = {szName="Kim Phong �o�t H�n Ng�c ��i",tbProp={0,181},nCount=1,nQuality = 1,nBindState=-2},
	},
	[5] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,50,"NhiemVu_40") end },
		[2] = {szName="Kim Phong H�u Ngh� d�n cung",tbProp={0,182},nCount=1,nQuality = 1,nBindState=-2},
	},
	[6] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,60,"NhiemVu_50") end },
		[2] = {szName="Kim Phong ��ng T��c Xu�n Th�m",tbProp={0,185},nCount=1,nQuality = 1,nBindState=-2},		
	},
	[7] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,70,"NhiemVu_60") end },
		[2] = {szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
		[3] = {szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
	},
	[8] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,75,"NhiemVu_70") end },
		[2] = {szName="Tinh H�ng B�o Th�ch",tbProp={4,353,1,1,0,0},nCount=6,nExpiredTime=43200,nBindState=-2},
	},
	[9] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,80,"NhiemVu_75") end },
		[2] = {
					{szName="B� K�p Th�p ��i Ph�i 90",tbProp={6,1,30576,1,0,0},nCount=1,nBindState=-2,nExpiredTime=1440},				
			},
	},
	[10] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,85,"NhiemVu_80") end },
		[2] = {szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
		[3] = {szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nBindState=-2,nExpiredTime=30*24*60},
	},
	[11] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,90,"NhiemVu_85_level") end },
		[2] = {szName = " T�ng c�p", pFun = function()  _AddLevel(2,300,"NhiemVu_85_Danhvong") end },	
	},
	[12] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,92,"NhiemVu_90") end },
	},
	[13] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,94,"NhiemVu_92") end },
	},
	[14] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,96,"NhiemVu_94") end },
	},
	[15] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,97,"NhiemVu_96") end },
	},
	[16] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,98,"NhiemVu_97") end },
	},
	[17] = {
		[1] = {szName = " T�ng c�p", pFun = function()  _AddLevel(1,99,"NhiemVu_28") end },
	},
	[18] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[19] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[20] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[21] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[22] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[23] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[24] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[25] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[26] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[27] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[28] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
	},
	[29] = {
		[1] = {szName = "100.000.000 �i�m Kinh Nghi�m", nExp=100e6},
		[2] = {
			{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
			{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount=1,nQuality = 1,nExpiredTime=90*24*60,nBindState=-2},
		}
	},
}