-- Ѱ���� �ϻ�
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")

function OnDeath(nNpcIndex)
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		Msg2Player("Ho�t ��ng �� k�t th�c");
		return
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		Msg2Player("Ho�t ��ng v�n ch�a b�t ��u, xin h�y ch� � th�i gian c�a ��t ho�t ��ng ��.");
		return
	end		
	
	-- ��¼��������ʱ��
	local nDeathTime = GetCurServerTime();
	local tbPlayerInfo = tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	
	if tbPlayerInfo == nil then
		tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()] = {nkillTime = nDeathTime, nAwardDate = 0,};
	else
		tbPlayerInfo.nkillTime = nDeathTime;
	end
	
	Msg2Player("��i hi�p �� �� b�i S�t Huy�t L�o H� r�i, xin h�y ��n L�u H��ng nh�n th��ng!");
	
end

