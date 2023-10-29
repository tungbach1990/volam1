--���黻�±�
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="Ng� s�c long ch�u (Kim)", tbProp={6, 1, 1807}},
			{szName="Ng� s�c long ch�u (M�c)", tbProp={6, 1, 1808}},
			{szName="Ng� s�c long ch�u (Th�y)", tbProp={6, 1, 1809}},
			{szName="Ng� s�c long ch�u (H�a)", tbProp={6, 1, 1810}},
			{szName="Ng� s�c long ch�u (Th�)", tbProp={6, 1, 1811}},

		},
		nMoney = 0,
		tbAward = 	{szName="Ph�ng Nguy�t Qu� Dung", tbProp={6, 1, 127, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="Ng� s�c ph�ng v� (Kim)", tbProp={6, 1, 1812}},
			{szName="Ng� s�c ph�ng v� (M�c)", tbProp={6, 1, 1813}},
			{szName="Ng� s�c ph�ng v� (Th�y)", tbProp={6, 1, 1814}},
			{szName="Ng� s�c ph�ng v� (H�a)", tbProp={6, 1, 1815}},
			{szName="Ng� s�c ph�ng v� (Th�)", tbProp={6, 1, 1816}},
		},
		nMoney = 0,
		tbAward = {szName="C�ng Nguy�t Ph� Dung", tbProp={6, 1, 128, 1, 0, 0}},
	},
}

function zhongqiu0808_longzhuhecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>C� hai lo�i b�u v�t, ��i hi�p mu�n ��i g�?<enter>C�ch 1: 1 b� 'Ng� s�c long ch�u'  ��i �Ph�ng nguy�t qu� dung'<enter>C�ch 2: 1 b� 'Ng� s�c ph�ng v�' ��i 'C�ng nguy�t ph� dung'.",
		"T�i h� mu�n ��i 'Ph�ng nguy�t qu� dung'./#zhongqiu0808_longzhuhecheng_select(1)",
		"T�i h� mu�n ��i 'C�ng nguy�t ph� dung'./#zhongqiu0808_longzhuhecheng_select(2)",
		"K�t th�c ��i tho�i/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_longzhuhecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	
	local szMsg = format("<dec><npc>��i <color=yellow>%s<color> c�n:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("X�c nh�n ��i/#zhongqiu0808_longzhuhecheng_comfirm(%d)", nSelectId),
				"K�t th�c ��i tho�i/OnCancel",
				
			}
		)
end

function zhongqiu0808_longzhuhecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "Ho�t ��ng L�m b�nh trung thu")
	
end

function OnCancel()
	
end