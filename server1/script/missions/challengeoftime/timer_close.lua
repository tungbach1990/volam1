-- description	: �رձ�����ʱ��
-- author		: wangbin
-- datetime		: 2005-07-13

Include("\\script\\missions\\challengeoftime\\include.lua")

function timeout()
	Msg2MSAll(MISSION_MATCH, "<#> Th�i gian l�m nhi�m v� �� k�t th�c, ��i ng� c�a b�n khi�u chi�n th�t b�i");
end

function OnTimer()
	timeout();
	-- �ر��Լ�
	close_close_timer();
	-- ��������
	close_match();
	-- �رչ��涨ʱ��
	close_board_timer();
end
