IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
	--Msg2Player("�˹����Ժ󿪷�.��л֧��!")
	--return 1
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 32400);
	else
		Say("Hi�n t�i h� th�ng �ang cho nh�n ��i kinh nghi�m, t�m th�i kh�ng th� s� d�ng Tu th�n ph�.", 0)
		return 1
	end
	return 0
end