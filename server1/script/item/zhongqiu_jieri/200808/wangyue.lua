--����
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
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Y�u c�u ��ng c�p ph�i tr�n 50 v� �� qua n�p th�.", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_Wangyue)
	if nCurExp >= zhongqiu0808_TSKV_Wangyue then
		Say(format("S� d�ng v�t ph�m n�y �� ��t gi�i h�n %d kinh nghi�m.", zhongqiu0808_TSKV_Wangyue), 0)
		return 1
	end
	
	local tbAward = {nExp = 500000}
	tbAwardTemplet:GiveAwardByList(tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_Wangyue, nCurExp + tbAward.nExp)
end