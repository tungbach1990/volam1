function main()
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();--��������
	if nMemCount == 0 then
		Msg2Player("B�n nh�n ���c ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 30 ph�t.")
		AddSkillState(440, 1, 1, 32400);
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember( i );--�����е�i����PlayerIndex
			Msg2Player("B�n nh�n ���c ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 30 ph�t.")
			AddSkillState(440, 1, 1, 32400);
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end