
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\compose.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\timectrl.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
function jiaoshi0810_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	if not jiaoshi0810_IsActTime() then
		Talk(1,"", "Ho�t ��ng �� k�t th�c.")
		return 
	end
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."Ng�y Nh� Gi�o Vi�t Nam l� ng�y t�n vinh c�ng �n c�a nh�ng ng��i th�y, ng��i c� �� g�p c�ng gi�o d��ng ch�ng ta n�n ng��i. Nh�n d�p n�y, ta c� nhi�u m�n qu� �� t�ng cho c�c �� t� xu�t s�c v� hi�u th�o. Ng��i c� mu�n tham gia ho�t ��ng n�y kh�ng?",
		format("�� t� mu�n t�m hi�u n�i dung c�a ho�t ��ng/#jiaoshi0810_Content(%d, [[%s]])", nItemIndex, szDescLink),
		format("�� t� mu�n tham gia ho�t ��ng n�y/#jiaoshi0810_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"�� t� bi�t r�i, ta s� quay l�i sau./OnCancel"	
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink.."Ho�t ��ng ��p T� �n S� di�n ra t� ng�y 14-11-2008 ��n 23-11-2008. Trong th�i gian di�n ra s� ki�n, c�c �� t� c� th� s� d�ng c�c v�t ph�m thu th�p ���c trong qu� tr�nh b�n t�u giang h� �� l�m qu� t�ng cho �n S�.")
	tinsert(tbSay, "�� t� ch� gh� th�m �n S� th�i./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Huy�n tinh kho�ng th�ch (c�p 1)", tbProp={6, 1, 147, 1, 0, 0},nCount = 1},
			{szName="Ph�c Duy�n Tinh Th�ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 3},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="B� K�p Gia Truy�n", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Huy�n tinh kho�ng th�ch (c�p 2)", tbProp={6, 1, 147, 2, 0, 0},nCount = 1},
			{szName="Ph�c Duy�n Tinh Th�ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 10000}
		},
		tbProduct = 
		{
			{szName="B� K�p Gia Truy�n", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="M�t �� th�n b� ", tbProp={6, 1, 196},nCount = 1},
			{szName="Ph�c Duy�n Tinh Th�ch", tbProp={6, 1, 1835, 1, 0, 0},nCount = 1},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="B� K�p Gia Truy�n", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	},
	[4] =
	{
		tbMaterial = 
		{
			{szName="M�t �� th�n b� ", tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 40000}
		},
		tbProduct = 
		{
			{szName="B� K�p Gia Truy�n", tbProp={6, 1, 1834, 1, 0, 0}, nExpiredTime = 20081201},
		}
		
	}
}


function jiaoshi0810_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."Ta ch� mong s�m ���c g�p l�i c�c �� t� c�a ta �� tho� l�ng mong nh� nh� b�y l�u. Ta kh�ng c�n ��n nh�ng m�n qu� cao sang m� ch� mong nh�n ���c nh�ng m�n qu� th�t gi�n d�, �� l� b�ng ch�ng cho nh�ng th�nh t�ch trong qu� tr�nh r�n luy�n c�a c�c �� t�.<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"�� t� r� r�i, �a t� �n s�!/OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_MakeComposeMsg(tbFormula)
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = jiaoshi0810_TransferDigit2CnNum(tbMaterial[i].nJxb).." l��ng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
		
	end
	return szMsg
end

function jiaoshi0810_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("%s/#jiaoshi0810_Compose(%d,%d, [[%s]])",jiaoshi0810_MakeComposeMsg(%tbFormulaList[i]), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function jiaoshi0810_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."��i %s c�n: <enter>%s, ", %tbFormulaList[nId].tbProduct[1].szName ,jiaoshi0810_ComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("X�c nh�n/#jiaoshi0810_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"H�y b� /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function jiaoshi0810_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	
	
	if jiaoshi0810_ComposeClass:Compose(%tbFormulaList[nId], "jiaoshi0810_Compose"..jiaoshi0810_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


