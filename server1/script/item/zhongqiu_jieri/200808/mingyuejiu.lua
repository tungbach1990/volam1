--zhongchaolong
--���¾�
--��ɫʹ�����¾ƺ��������չͨ��2���±��� �����±� ���͡� �����±� ���ľ������� ����15�ڵ�30�ھ��顣
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
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
	if GetTask(zhongqiu0808_TSK_mingyuejiu) == 1 then
		Say("B�n �� s� d�ng ��o c� n�y r�i.")
		return 1
	end
	
	SetTask(zhongqiu0808_TSK_mingyuejiu, 1)
	Msg2Player("Sau khi s� d�ng Minh Nguy�t t�u, m�c gi�i h�n kinh nghi�m t� 2 lo�i b�nh Trung thu Ki�n Nguy�t v� b�nh Trung thu Th��ng Nguy�t s� t�ng l�n m�c 3 t� �i�m.")
end