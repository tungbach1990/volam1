-- teamhead.lua ���鶨���ͷ�ļ�
-- By: Dan Deng(2003-12-30)

function OtherPlayer(Player1Index, Fun, param1, param2)		-- �ڱ������ϒ@�нű�����
	OldPlayer=PlayerIndex;
	PlayerIndex=Player1Index;
	Result = Fun(param1, param2)
	PlayerIndex = OldPlayer;
	return Result;
end
