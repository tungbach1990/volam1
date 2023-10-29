
Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\shengdan_jieri\\200811\\timectrl.lua")
Include("\\script\\lib\\string.lua")
function shengdan0811_DailogMain(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	if not shengdan0811_IsActTime() then
		Talk(1,"", "Ho�t ��ng �� k�t th�c.")
		return 
	end
	szDescLink = szDescLink or "<npc>"
	local tbSay = 
	{
		"<dec>"..szDescLink.."Gi�ng sinh n�m nay di�n ra t� 05-12-2008 ��n 24:00 04-01-2008. C�c v� ��ng ��o mu�n t�m hi�u n�i dung v� chu�n b� tham gia ho�t ��ng n�o?",
		format("T�i h� mu�n t�m hi�u ho�t ��ng l�n n�y./#shengdan0811_Content(%d,[[%s]])", nItemIndex, szDescLink),
		format("T�i h� mu�n tham gia ho�t ��ng l�n n�y/#shengdan0811_Attend(%d, [[%s]])",nItemIndex, szDescLink),
		"Ta nh�t ��nh s� quay tr� l�i./OnCancel"	
	}
	CreateTaskSay(tbSay);
end

function shengdan0811_Attend(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	
	
	
	tinsert(tbSay, 1, "<dec>"..szDescLink.."Qu� ��ng ��o mu�n ��i nguy�n li�u th�nh ph�n th��ng g�?")
	tinsert(tbSay, "Ta s� quay l�i sau./OnCancel")
	CreateTaskSay(tbSay)
end

local tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="N�n Gi�ng Sinh", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 3},
			{szName="Chu�ng Gi�ng Sinh", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 3},
			{szName="V� Gi�ng Sinh", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 3},
			{szName="Thi�p Gi�ng Sinh", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 3},
			{szName="Ph�c Duy�n Tinh Th�ch", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="B�nh Kem D�u", tbProp={6, 1, 1848, 1, 0, 0}, nExpiredTime = 20090111

		}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			
			{szName="N�n Gi�ng Sinh", tbProp={6, 1, 1843, 1, 0, 0}, nCount = 1},
			{szName="Chu�ng Gi�ng Sinh", tbProp={6, 1, 1844, 1, 0, 0}, nCount = 1},
			{szName="V� Gi�ng Sinh", tbProp={6, 1, 1845, 1, 0, 0}, nCount = 1},
			{szName="Thi�p Gi�ng Sinh", tbProp={6, 1, 1846, 1, 0, 0}, nCount = 1},
			{szName="Ng�i Sao Gi�ng Sinh", tbProp={6, 1, 1847, 1, 0, 0}, nCount = 3},
			{szName="Ph�c Duy�n Tinh Th�ch", tbProp={6, 1, 1835, 1, 0, 0}, nCount = 3},
			{nJxb = 2e4}
		},
		tbProduct = 
		{
			szName="B�nh Kem Socola", tbProp={6, 1, 1849, 1, 0, 0}, nExpiredTime = 20090111
		}
		
	},
}


function shengdan0811_Content(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = "<dec>"..szDescLink.."Ho�t ��ng gi�ng sinh n�m nay di�n ra t� 05-12-2008 ��n 04-01-2009. Trong th�i gian ho�t ��ng ng��i ch�i c� th� thu ���c h�p qu� xanh th�ng qua ��nh qu�i v� thu ���c h�p qu� �� th�ng qua �y th�c tr�n m�ng. M� c�c h�p qu� tr�n, qu� ��ng ��o s� thu th�p ���c c�c v�t ph�m c�n thi�t �� ��i l�y c�c lo�i b�nh kem t�i NPC �ng Gi� Tuy�t. S� d�ng c�c lo�i b�nh kem s� ���c kinh nghi�m v� c�c ph�n qu� gi� tr�. Ngo�i ra, qu� ��ng ��o c�n c� kh� n�ng nh�n ���c c�c lo�i ph�n th��ng ��c bi�t nh�: Ti�u B�ng Tinh, N�n Tr�ng v� N�n Xanh khi s� d�ng B�nh Kem Socola<enter>C�c h� c�n c� �� nh�ng v�t ph�m sau ��y �� ��i l�y c�c lo�i B�nh Kem:<enter>"
	for i=1, getn(%tbFormulaList) do
		szMsg = szMsg..shengdan0811_MakeComposeMsg(%tbFormulaList[i]).."<enter>"
	end
	local tbSay = 
	{
		szMsg,
		"Ta �� bi�t r�i. /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_MakeComposeMsg(tbFormula, nType)
	if nType == 1 then
		return tbFormula.tbProduct.szName
	end
	local tbMaterial = tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." l��ng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
	end
	szMsg = szMsg.."="..tbFormula.tbProduct.szName
	return szMsg
end

function shengdan0811_MakeComposeListOpt(nItemIndex, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbOpt = {}
	for i=1, getn(%tbFormulaList) do
		tinsert(tbOpt, format("T�i h� mu�n ��i %s/#shengdan0811_Compose(%d,%d, [[%s]])",shengdan0811_MakeComposeMsg(%tbFormulaList[i], 1), nItemIndex, i, szDescLink))
	end
	return tbOpt
end

function shengdan0811_Compose(nItemIndex, nId, szDescLink)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local szMsg = format("<dec>"..szDescLink.."��i %s c�n: <enter>%s, ", %tbFormulaList[nId].tbProduct.szName ,tbComposeClass:GetMaterialList(%tbFormulaList[nId].tbMaterial))
	local tbSay = 
	{
		szMsg,
		format("X�c nh�n/#shengdan0811_ComposeConfirm(%d, %d)", nItemIndex, nId),
		"H�y b� /OnCancel"
	}
	CreateTaskSay(tbSay)
end

function shengdan0811_ComposeConfirm(nItemIndex, nId)
	nItemIndex = nItemIndex or -1
	
	
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 0
		end
	end
	--�����жϱ����ռ�
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng!",0);
		return
	end
	
	if tbComposeClass:Compose(%tbFormulaList[nId], "shengdan0811_Compose"..shengdan0811_MakeComposeMsg(%tbFormulaList[nId]) ) == 1 then
		if tbItemJingnianshijian then
			 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
		end
		return 1
	end
	return 0
end



function OnCancel()
	
end


