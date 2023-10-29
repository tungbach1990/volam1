ITEMTYPE = 1; --��������
szItem = "H�n Phong Ng�c"
szEffect = "Gi�m t�c �� 7 gi�y";
nSkillId = 674;
nSkillLevel = 15;
nTime = 7;

function main(nItemID, nNpcIndex)
	
	local nTargetPlayerIndex = NpcIdx2PIdx(nNpcIndex)
	if nTargetPlayerIndex == 0 then
		Msg2Player("��o c� n�y ch� c� th� s� d�ng ��i v�i ng��i ch�i!");
		return 1
	end
	
	local szSelfName = GetName()
	local szTargetName = GetNpcName(nNpcIndex)
	local szItemName = GetItemName(nItemID)
	
	local nOldPlayerIndex = PlayerIndex
	
	PlayerIndex = nTargetPlayerIndex
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player(format("%s s� d�ng v�i ng��i r�i :%s!", szSelfName, szItemName));
	PlayerIndex = nOldPlayerIndex
	
	Msg2Player(format("Ng��i ��i v�i m�c ti�u:%s s� d�ng :%s!", szTargetName, szItemName));
	
	return 0
end