-- ������ �һ��� ·��_����.lua
-- by: Dan_deng(2004-05-15)

Include("\\script\\missions\\autohang\\head.lua")
g_mapList = {235, 236, 237, 238, 239, 240, 241};
function main()
	-- ���˫����
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- ���˫��������
		Say("G�n ��y linh kh� c�a ��o Hoa ��o r�t th�nh. Kh�ng c�n d�ng ch�o L�p B�t c�ng c� th� luy�n c�ng. C� h�i t�t th� n�y. C�n ph�i bi�t t�n d�ng. N�u nh� mu�n tr� v� ph�i tr� 1800 ng�n l��ng. ", 2, "V� th�nh/go_yes", "Ch�a v� /no")		
		return 1;
	end
	
	nValue = GetTask(AEXP_TASKID);
	if (nValue > AEXP_TIME_UPDATE) then -- ���йһ�ʱ��
		Say("V� kh�ch n�y! Xem th�n kh� c�a ng��i nh� v�y, nh�t ��nh l� �� d�ng th� ch�o truy�n thuy�t L�p B�t � ��y r�i ph�i kh�ng? Nghe n�i ch�o L�p B�t ch� c� � ��o Hoa ��o n�y m�i c� c�ng hi�u. Ch� c� m�t gi�, c�n ph�i t�n d�ng. N�u nh� mu�n v� th�nh th� ph�i tr� 1800 ng�n l��ng.", 2, "V� th�nh/go_yes", "Ch�a v� /no")
	else 
		Say("V� kh�ch n�y! Xem th�n kh� c�a ng��i nh� v�y, nh�t ��nh l� �� d�ng th� ch�o truy�n thuy�t L�p B�t � ��y r�i ph�i kh�ng? Nghe n�i ch�o L�p B�t ch� c� � ��o Hoa ��o n�y m�i c� c�ng hi�u. Ch� c� m�t gi�, c�n ph�i t�n d�ng. N�u nh� mu�n v� th�nh th� ph�i tr� 1800 ng�n l��ng.",2,"V� th�nh/go_yes","Ch�a v� /no")
	end
end

function go_yes()
	if (GetCash() >= 1800) then
		Pay(1800)
		Msg2Player("Ng�i ch�c nh�! Ch�ng ta v� th�nh ")
		SetAutoHangMapFlag(0) -- �����˳��һ���ͼ���(�ſ�ԭ�������εĹ��ġ��سǵȹ���)
		
		-- ��¼�뿪ʱ������ʱ��
		nOLTime = GetGameTime();
		SetTask(AEXP_OLTIME_TASKID, nOLTime);
		
		back_home();
		SetFightState(1)
	else
		Talk(1,"","Mu�n v� th�nh ph�i tr� 1800 ng�n l��ng. Mau l�y ti�n ra ��y")
	end
end;

function back_home()
	nSubWorldID = SubWorldIdx2ID();

	if (nSubWorldID == g_mapList[1]) then
		NewWorld(176, 1614, 2561) -- �ٰ�
	elseif (nSubWorldID == g_mapList[2]) then
		NewWorld(80, 1345, 3359) -- ����
	elseif (nSubWorldID == g_mapList[3]) then
		NewWorld(78, 1299, 3483) -- ����
	elseif (nSubWorldID == g_mapList[4]) then
		NewWorld(37, 1938, 2459) -- �꾩
	elseif (nSubWorldID == g_mapList[5]) then
		NewWorld(162, 1642, 2935) -- ����
	elseif (nSubWorldID == g_mapList[6]) then
		NewWorld(11,3100,4822) -- �ɶ�
	elseif (nSubWorldID == g_mapList[7]) then
		NewWorld(1, 1528, 2733) -- ����
	else
		Msg2Player("B�o l�i! B�n �� �i t� th�nh th� n�o ��n ��o Hoa ��o? Xin l�p t�c li�n h� v�i GM �� ph�n �nh!");
	end	
end;

function no()
end;
