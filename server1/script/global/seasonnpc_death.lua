
-- ====================== �ļ���Ϣ ======================

-- ������Եonline Ұ�������ű�
-- Edited by peres
-- 2006/12/26 PM 15:39

-- ��ʦ��Ϊ�Ҵ����·�ʱͻȻЦ��˵�������ó����Խ��Խˮ���ˡ�
-- ��������Ů��������Ժ���и����ĸ������ء�
-- Ů�ӳ����Ժ�һ���Ὣ�����и����������ҵ���΢΢�Ǻ���һ�¡�
-- ��ʦ�����������Ұ�ȹ�����ã���˵���ǵġ�
-- ��Ϊ������Ů��һ����������

-- ======================================================

function OnDeath()
	DoTeamProcess(addSeasonnpcExp);
end;


-- �����ж�Աִ��ͬһ����
function DoTeamProcess(funProcess)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();

	if (nMemCount == 0) then
		funProcess();
	else
		for i = 1, nMemCount do -- �����￪ʼѭ������ÿ�����
			PlayerIndex = GetTeamMember(i);
			funProcess();
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ѭ��������������黹����� ID
	end;
end;


function addSeasonnpcExp()
	AddOwnExp(50000);
	Msg2Player("Ho�n th�nh nhi�m v� D� T�u nh�n ���c <color=green>50000 �i�m kinh nghi�m<color>!");
end;