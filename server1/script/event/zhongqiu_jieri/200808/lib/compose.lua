
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
if not zhongqiu0808_ComposeClass then
	
zhongqiu0808_ComposeClass = {}

function zhongqiu0808_ComposeClass:CheckMaterial(tbMaterial)
	local i
	local flag = 1
	local tbCount  = {}
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		tbItem.nCount = tbItem.nCount or 1
		if tbItem.nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			tbCount[i] = nCurCount
			if nCurCount < tbItem.nCount then
				flag =  0;
			end	
		end
	end
	return flag, tbCount;
end

function zhongqiu0808_ComposeClass:ConsumeMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		tbItem.nCount = tbItem.nCount or 1
		if tbItem.nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
				return 0;
			end	
		end
	end
	return 1;
end
function zhongqiu0808_ComposeClass:GetMaterialList(tbMaterial, nMoney)
	local szList = format("%-20s  %s","v�t ph�m ","S� l��ng")
	local flag, tbCount = self:CheckMaterial(tbMaterial)
	local i;
	for i=1,getn(tbMaterial) do
		local szColor = "<color=green>"
		if tbCount[i] < tbMaterial[i].nCount then
			szColor = "<color=red>"
		end
		szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,tbMaterial[i].szName, szColor, tbCount[i], tbMaterial[i].nCount)
	end
	if nMoney ~= 0 then
			szList = format("%s<enter> v� %d l��ng �� h�p th�nh",szList,  nMoney)
		end
	return szList
end
function zhongqiu0808_ComposeClass:Compose(tbMaterial, nMoney, Awardfun,...)
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = "<dec><npc><color=red>Nguy�n li�u mang theo kh�ng ��<color>."
		CreateTaskSay(
			{
				szMsg,
				"Th�t ng�i qu�, ta s� quay l�i sau./OnCancel",
				
			}
		)
		return 0;
	end
	if nMoney > 0 and Pay(nMoney) == 0 then
		Say(format("Kh�ng ���c r�i, kh�ng mang theo �� ti�n, c�n c� <color=yellow>%d<color> l��ng",nMoney),0)
		return 0;
	elseif nMoney ~= 0 then
		Msg2Player(format("C�n <color=yellow>%d<color> l��ng",nMoney))
	end

	if self:ConsumeMaterial(tbMaterial) ~= 1 then
		--Say("����ʧ�ܣ�������Ʒ��ʧ��",0)
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	if type(Awardfun) == "function" then
		call(Awardfun, arg)
	elseif type(Awardfun) == "table" then
		tbAwardTemplet:GiveAwardByList(Awardfun, arg[1] )
	end
	return 1;
end

end