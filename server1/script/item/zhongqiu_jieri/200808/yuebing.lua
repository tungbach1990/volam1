--�±�
--zhongchaolong
--���ʣ�
--���ԣ����������ף���̯�����꣨0���������� 
--��Ʒ�ϵ�˵����
--��һ����ͨ���±���
--ʹ�÷����� �Ҽ����ʹ��
--ʹ�ý�ֹʱ�䣺 2008��10��31��24��
--���ƣ� 
--50�����ϵĳ�ֵ��Ҳ���ʹ��
--ÿ����ɫ���ֻ��ͨ��ʹ�á� �����±� �����2�ھ��� 





Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("V�t ph�m n�y �� qu� h�n.",0)
		return 0;
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("�� tr�nh m�t m�t t�i s�n, h�y b�o ��m h�nh trang c�n �� %d � tr�ng.", nCellFreeLimit),0)
		return 1
	end
	
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Y�u c�u ��ng c�p ph�i tr�n 50 v� �� qua n�p th�.", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_jiansanyue)
	
	if nCurExp >= zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) then
		Say(format("S� d�ng v�t ph�m n�y �� ��t gi�i h�n %u kinh nghi�m.", 1e6 * zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) ), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(zhongqiuyubing_tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_jiansanyue, nCurExp + floor(zhongqiuyubing_tbAward[1].nExp/1e6))
end