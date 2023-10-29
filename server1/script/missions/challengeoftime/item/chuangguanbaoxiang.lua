-- ���ر�����Ʒ��������һ����Ʒ��
-- By: Wangjingjun(2011-03-02)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\task\\metempsychosis\\translife_6.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch�c m�ng cao th� <color=yellow>%s<color=green> �� nh�n ���c <color=yellow><%s><color=green> t� <color=yellow><B�o R��ng V��t �i><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbCOT_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbCOT_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="�i�m kinh nghi�m 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "B�o r��ng v��t �i")
					end,
					nRate = 52,
		},
		{szName="�i�m kinh nghi�m 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "B�o r��ng v��t �i")
					end,
					nRate = 30,
		},
		{szName="�i�m kinh nghi�m 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "B�o r��ng v��t �i")
					end,
					nRate = 10,
		},
		{szName="�i�m kinh nghi�m 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "B�o r��ng v��t �i")
					end,
					nRate = 5,
		},
		{szName="�i�m kinh nghi�m 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "B�o r��ng v��t �i")
					end,
					nRate = 3,
		},		
	},	
	-- Thay ��i ph�n th��ng s� d�ng B�o r��ng v��t �i  -Modifiled by ThanhLD - 20140226
	["chiakhoavang"] = 
	{
		-- {szName="Ch�n Nguy�n �an",tbProp={6,1,4134,1,0,0},nCount=10,nRate=5},
		-- {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=7,nRate=8,nBindState=-2},
		-- {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=7,nRate=5,nBindState=-2},
		-- {szName="H�n nguy�n ch�n ��n",tbProp={6,1,30301,1,0,0},nCount=1,nRate=2},
		-- {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=50,nRate=9.376},
		-- {szName="Huy�t Long ��ng C�p 9",tbProp={6,1,30289,9,0,0},nCount=5,nRate=1.2},
		-- {szName="Huy�t Long ��ng C�p 11",tbProp={6,1,30289,11,0,0},nCount=5,nRate=1.1},
		-- {szName="Huy�t Long ��ng C�p 12",tbProp={6,1,30289,12,0,0},nCount=5,nRate=0.5},
		-- {szName="Tinh Tinh Kho�ng",tbProp={6,1,3811,1,0,0},nCount=1,nRate=1},
		-- {szName="Tinh Thi�t Kho�ng",tbProp={6,1,3810,1,0,0},nCount=1,nRate=0.5},
		-- {szName = "�� Ph� ��ng Long Y", tbProp = {6, 1, 30529,1,0,0}, nRate = 0.002,},
		-- {szName = "�� Ph� ��ng Long Kh� Gi�i", tbProp = {6, 1, 30537,1,0,0}, nRate = 0.001,},
		-- {szName = "Tinh S��ng L�nh", tbProp = {6, 1, 30506,1,0,0}, nRate = 0.052,},
		-- {szName = "Huy�n Thi�t", tbProp = {6, 1, 30507,1,0,0}, nRate = 0.035,},
		-- {szName = "�� Ph� Tinh S��ng Y", tbProp = {6, 1, 30006,1,0,0}, nRate = 0.320,},
		-- {szName = "�� Ph� Tinh S��ng Kh� Gi�i", tbProp = {6, 1, 30505,1,0,0}, nRate = 0.23,},
		-- {szName = "�� Ph� Nguy�t Khuy�t H�ng Li�n", tbProp = {6, 1, 30329,1,0,0}, nRate = 0.0052},
		-- {szName = "�� Ph� Nguy�t Khuy�t Kh�i", tbProp = {6, 1, 30330,1,0,0}, nRate = 0.0035},
		-- {szName = "�� Ph� Nguy�t Khuy�t Th��ng Gi�i Ch�", tbProp = {6, 1, 30331,1,0,0}, nRate = 0.0052},
		-- {szName = "�� Ph� Nguy�t Khuy�t H� Uy�n", tbProp = {6, 1, 30332,1,0,0}, nRate = 0.0052},
		-- {szName = "�� Ph� Nguy�t Khuy�t Y�u ��i", tbProp = {6, 1, 30333,1,0,0}, nRate = 0.0052},
		-- {szName = "�� Ph� Nguy�t Khuy�t Y", tbProp = {6, 1, 30334,1,0,0}, nRate = 0.0022},
		-- {szName = "�� Ph� Nguy�t Khuy�t Kh� Gi�i", tbProp = {6, 1, 30335,1,0,0}, nRate = 0.0013},
		-- {szName = "�� Ph� Nguy�t Khuy�t H�i", tbProp = {6, 1, 30336,1,0,0}, nRate = 0.0052},	
		-- {szName = "�� Ph� Nguy�t Khuy�t B�i", tbProp = {6, 1, 30337,1,0,0}, nRate = 0.0052},	
		-- {szName = "�� Ph� Nguy�t Khuy�t H� Gi�i Ch�", tbProp = {6, 1, 30338,1,0,0}, nRate = 0.0052},
		{szName="�i�m kinh nghi�m 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000,"B�o r��ng v��t �i")
					end,
					nRate = 27.3436,
		},
		{szName="�i�m kinh nghi�m 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000,"B�o r��ng v��t �i")
					end,
					nRate = 16,
		},
		{szName="�i�m kinh nghi�m 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000,"B�o r��ng v��t �i")
					end,
					nRate = 12,
		},
		{szName="�i�m kinh nghi�m 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(6000000,"B�o r��ng v��t �i")
					end,
					nRate = 6,
		},
		{szName="�i�m kinh nghi�m 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000,"B�o r��ng v��t �i")
					end,
					nRate = 4,
		},	
		{szName="�i�m kinh nghi�m 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000,"B�o r��ng v��t �i")
					end,
					nRate = 2,
		},
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbCOT_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbCOT_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("C�n ph�i c� Ch�a Kh�a V�ng ho�c Ch�a Kh�a Nh� � m�i c� th� m� ���c B�o R��ng V��t �i", 1, "��ng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d�ng Ch�a kh�a nh� �/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d�ng Ch�a kh�a v�ng/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "��ng/Oncancel")
		Say("S� d�ng ch�a kh�a �� m� r��ng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnCOTBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbCOT_Key_Require[strKeyType]
	local tbAward = tbCOT_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("C�n ph�i c� Ch�a Kh�a V�ng ho�c Ch�a Kh�a Nh� � m�i c� th� m� ���c B�o R��ng V��t �i", 1, "��ng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2742, -1) ~= 1 then
		Say("Kh�ng t�m th�y B�o R��ng V��t �i", 1, "��ng/no")
		return
	end
	
	if strKeyType == "chiakhoavang" then
		%TransLife6:OnFinishEvent(%TASK_ID_BOX)
	end
	
	tbAwardTemplet:Give(tbAward, 1, {"chuangguan", "use chuangguanbaoxiang"})
	AddStatData("baoxiangxiaohao_kaichuangguanbaoxiang", 1)	--��������һ��
	EventSys:GetType("OpenFuncAwardBox"):OnPlayerEvent("OpenAwardBoxEvent", PlayerIndex)
end
