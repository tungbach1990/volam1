--zhongchaolong

--	��ұ�����ʱ��ϵͳ�����Ѳ����ٸ������Ʒ��
--��û������ӵ������йܶ����жϣ��й�ʱ�䱻ˢ�¡� (�������йܻ�þ����Ĺ���)
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
function zhongqiu0808_tuoguan(nSpecialD)
	
	
	if nSpecialD <= 0.5 * 0.5 then
	
		return
	end
	if zhongqiu0808_IsActDate()	~= 1 then
		return 
	end
	
	local tbItem = {szName="H�p Ti�n V�", tbProp={6, 1, 1795, 1, 0, 0}}
	
	if ST_GetOffliveState() == 0 then
		local nCount = CalcEquiproomItemCount(tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
	
		if CalcFreeItemCellCount() >= 1 or (nCount > 0 and nCount < 50 )  then
	
			tbAwardTemplet:GiveAwardByList(tbItem, "Ho�t ��ng �y th�c thu th�p")
		else
			Msg2Player(format("H�nh trang c�a b�n �� ��y, kh�ng th� nh�n %s.", tbItem.szName))
		end
	end
end