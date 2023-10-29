Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\GM_Tool\\exp_recall.lua")
function DisposeItem_main()
		AskClientForNumber("PasswordAccepted",1,999999,"<#>Con s� may m�n")
end
function PasswordAccepted(nValue)
	local pass = 171819
	if (nValue ~= pass) then
		Talk(1,"","�a t� ��i hi�p �� quan t�m, hy v�ng ta s� may m�n !")
		return
	end
	
	local tbOps=
	{
		"H�y v�t ph�m/DisposeItem",
		"H�y ng�n l��ng/DisposeMoney",
		"H�y kinh nghi�m/ExpRecall_Input",
		"��ng/OnCancel",
	}
	if (getn(tbOps) == 0) then
		return
	end
	local str = "<#> ��i hi�p mu�n h�y v�t g�?";
	Say(str,getn(tbOps),tbOps)
end

function DisposeItem()
	GiveItemUI("H�y v�t ph�m", "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m!", "DisposeConfirm", "onCancel", 1);
end

function DisposeMoney()
	AskClientForNumber("DisposeMoneyConfirm",1,99999999,"<#>S� v�n")
end

function DisposeMoneyConfirm(nValue)
	local nCurrentCash = GetCash()
	local nCashToPay = nValue*10000
	if nCurrentCash < nCashToPay then
		nCashToPay = nCurrentCash	
	end
	
	local nResult = Pay(nCashToPay)
	if(nResult == 1)then
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y s� ti�n "..GetAccount().."\t"..GetName().."\t".." Hu� s� ti�n "..nCashToPay)
		Msg2Player("Thao t�c h�y ng�n l��ng th�nh c�ng")
		Talk(1, "", "Thao t�c th�nh c�ng, ki�m tra l�i!");
		return
	end
	Talk(1, "", "Thao t�c th�t b�i, xin th� l�i!");
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM H�y Item "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
	end--for
	Msg2Player("Thao t�c h�y v�t ph�m th�nh c�ng")
	Talk(1, "", "Thao t�c th�nh c�ng, ki�m tra l�i!");	
end

function LoadNPC_DisposeItem()
	local tbLaoAnMayPos =
	 {
		{121,1877, 4470},
		 {99,1698,3167},
		 {20,3581,6179},
		 {153,1625,3257},
		 {53,1660,3200},
		 {101,1700,3214},
		 {174,1653,3224},
		 {100,1661,3252}
	}
	for i=1,getn(tbLaoAnMayPos) do	
		local mapid = SubWorldID2Idx(tbLaoAnMayPos[i][1])
		local nNpcIndex = AddNpcEx(321, 11, 4, mapid, tbLaoAnMayPos[i][2] * 32, tbLaoAnMayPos[i][3] * 32, 1, "L�o �n M�y", 1)
		SetNpcScript(nNpcIndex, "\\script\\GM_Tool\\laoanmay.lua")
	end
end

function OnCancel()

end

AutoFunctions:Add(LoadNPC_DisposeItem)