--ʱ����ƹ���
--��2008��09��05����2008��10��05��24��
zhongqiu0808_StartTime	= 080905
zhongqiu0808_EndTime	= 081005
zhongqiu0808_liheEndTime = 081005
zhongqiu0808_ItemEndTime = 081031
zhongqiu0808_ZhanGongStartTime = 080905
zhongqiu0808_ZhanGongEndTime = 081005

function zhongqiu0808_IsActDate()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate >= zhongqiu0808_StartTime and nDate <= zhongqiu0808_EndTime then
		return 1
	end
	return nil
end