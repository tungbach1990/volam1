
Include("\\script\\task\\system\\task_string.lua");
if not pingzi0805_ComposeClass then
	
pingzi0805_ComposeClass = {}

function pingzi0805_ComposeClass:CheckMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nCount = tbItem.nCount or 1
		if nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < nCount then
				return 0;
			end	
		end
	end
	return 1;
end

function pingzi0805_ComposeClass:ConsumeMaterial(tbMaterial)
	local i
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nCount = tbItem.nCount or 1
		if nCount > 0 then
			local tbProp = tbItem.tbProp
			tbProp[4] = tbProp[4] or -1
			--print(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			if ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
				return 0;
			end	
		end
	end
	return 1;
end
function pingzi0805_ComposeClass:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","v�t ph�m ","S� l��ng")
	local i;
	for i=1,getn(tbMaterial) do
		szList = format("%s<enter>%-20s  %d",szList,tbMaterial[i].szName, tbMaterial[i].nCount or 1)
	end
	return szList
end
function pingzi0805_ComposeClass:Compose(szMsg, tbMaterial, nMoney, Awardfun,...)
	
	if self:CheckMaterial(tbMaterial) ~=1 then
		local szMsg = format("<dec><npc>%s, c�n: <enter>%s", szMsg, pingzi0805_ComposeClass:GetMaterialList(tbMaterial) )
		if nMoney ~= 0 then
			szMsg = format("%s<enter> v� %d l��ng �� h�p th�nh",szMsg,  nMoney)
		end
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
	if Awardfun then
		call(Awardfun, arg)
	end
	return 1;
end

end