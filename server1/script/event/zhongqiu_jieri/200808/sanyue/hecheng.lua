--�ϳ��±�
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="L�ng ��n b��m b��m", tbProp={6, 1, 1796}, nCount = 2},
			{szName="L�ng ��n ng�i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="L�ng ��n �ng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="L�ng ��n tr�n", tbProp={6, 1, 1799}, nCount = 2},
			{szName="Huy�n tinh kho�ng th�ch (c�p 2)", tbProp={6, 1, 147, 2}, nCount = 1},
		},
		nMoney = 0,
		tbAward = {szName="B�nh trung thu V�ng Nguy�t", tbProp={6, 1, 1801, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="L�ng ��n b��m b��m", tbProp={6, 1, 1796}, nCount = 2},
			{szName="L�ng ��n ng�i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="L�ng ��n �ng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="L�ng ��n tr�n", tbProp={6, 1, 1799}, nCount = 2},
			{szName="Ph�c Duy�n L� (Ti�u) ", tbProp={6, 1, 122},nCount = 1}
		},
		nMoney = 30000,
		tbAward = {szName="B�nh trung thu Ki�n Nguy�t", tbProp={6, 1, 1802, 1, 0, 0}},
	},
	[3] = 
	{
		tbMaterial = 
		{
			{szName="L�ng ��n b��m b��m", tbProp={6, 1, 1796}, nCount = 2},
			{szName="L�ng ��n ng�i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="L�ng ��n �ng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="L�ng ��n tr�n", tbProp={6, 1, 1799}, nCount = 2},
			{szName="N�n th��ng nguy�t", tbProp={6, 1, 1800}, nCount = 1},

		},
		nMoney = 0,
		tbAward = {szName="B�nh trung thu Th��ng Nguy�t", tbProp={6, 1, 1803, 1, 0, 0}},
	}
}

function zhongqiu0808_hecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>Ho�t ��ng B�nh trung thu Th��ng Nguy�t ���c di�n ra t� 05-09-2008 ��n 24:00 ng�y 05-10-2008. Trong th�i gian ho�t ��ng, ng��i ch�i ��nh qu�i s� thu th�p ���c c�c �H�p L�ng ��n�. M� h�p l�ng ��n s� ���c c�c lo�i l�ng ��n, ng��i ch�i c� th� ��i t� l�ng ��n sang c�c lo�i b�nh trung thu. S� d�ng B�nh Trung Thu s� nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�.",
		"��i b�nh trung thu V�ng Nguy�t/#zhongqiu0808_hecheng_select(1)",
		"��i b�nh trung thu Ki�n Nguy�t/#zhongqiu0808_hecheng_select(2)",
		"��i b�nh trung thu Th��ng Nguy�t/#zhongqiu0808_hecheng_select(3)",
		"K�t th�c ��i tho�i/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_hecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	if zhongqiu0808_PlayerLimit() ~= 1 then
		return Say("Y�u c�u ��ng c�p ph�i tr�n 50 v� �� qua n�p th�.", 0)
		
	end
	local szMsg = format("<dec><npc>��i <color=yellow>%s<color> c�n:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("X�c nh�n ��i/#zhongqiu0808_hecheng_comfirm(%d)", nSelectId),
				"K�t th�c ��i tho�i/OnCancel",
				
			}
		)
end

function zhongqiu0808_hecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "Ho�t ��ng L�m b�nh trung thu")
	
end

function OnCancel()
	
end