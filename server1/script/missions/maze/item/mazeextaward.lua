Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
tbMazeExtAward = {};
tbMazeExtAward.	tbTSK_GetBaoRuong = 3076;
tbMazeExtAward.tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 2e6}
tbMazeExtAward.tbServerAward = {-- Phan thuong server cu
	[1] = {
		{szName = "�i�m Kinh Nghi�m", nExp = 10e6},
	},
	[2] = {
			{{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=3},},
			{{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},},
			{{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.25},},
			{{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.25},},
			{{szName="B�o R��ng Kim � Y",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.25},},
			{{szName="B�o R��ng Kim � H�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.25},},
			{{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.25},},
			{{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.25},},
			{{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.25},},
			{{szName="B�o R��ng Kim � B�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.25},},
			{{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.125},},
			{{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.125},},
			{{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.0625},},
			{{szName="H�nh Hi�p L�nh",tbProp={6,1,2566,1,0,0},nCount=5,nRate=50},},
			{{szName="Th��ng Lang Th�ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=1},},
			{{szName="V�n L�c Th�ch",tbProp={6,1,2711,1,0,0},nCount=1,nRate=2},},
			{{szName="Thanh C�u Th�ch",tbProp={6,1,2710,1,0,0},nCount=1,nRate=2},},
			{{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.013},},
			{{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,Rate=0.0625},},
			{{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.0625},},
			{{szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.0025},},

	},		
}
function tbMazeExtAward:MazeBossAward(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	tbAwardTemplet:Give(self.tbServerAward[2], 1, {"KiemGiaMeCung", "KillBossLongCuuThienAward"})
	PlayerIndex = nOldPlayer
end

function tbMazeExtAward:_Message(CaptainName)
	local strMessage = format("T� ��i c�a <color=green> %s <color>�� ti�u di�t th�nh c�ng Boss Long C�u Thi�n t�i Th� Ki�m C�c",CaptainName)
	AddGlobalNews(strMessage)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function tbMazeExtAward:MazeStepFinishAward(mate)
		local tbMazeAward = {
			{szName="B�o R��ng Ki�m Gia",tbProp={6,1,30203,1,0,0},nCount=1},
		}
		local nOldPlayer = PlayerIndex
		PlayerIndex = mate.m_PlayerIndex
		if PlayerFunLib:CheckTaskDaily(self.tbTSK_GetBaoRuong, 5, format("H�m nay ng��i �� nh�n<color=yellow> 5 <color>l�n ph�n th��ng n�y, kh�ng th� nh�n th�m."), "<") then
			PlayerFunLib:AddTaskDaily(self.tbTSK_GetBaoRuong, 1)
			tbAwardTemplet:Give(tbMazeAward, 1, {"KiemGiaMeCung", "KillBossAward"})
		end	
		PlayerIndex = nOldPlayer
end
