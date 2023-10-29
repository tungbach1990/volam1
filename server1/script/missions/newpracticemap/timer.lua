IncludeLib("TIMER")
Include("\\script\\missions\\newpracticemap\\head.lua")

function OnTimer()
	
	-- ��鵱ǰ�� mapid
	local nMapType = tbNewPracticeMap:checkMapId();
	
	if nMapType ~= 1 and nMapType ~= 2 then
		if tbNewPracticeMap.bDeBug == 1 then
			print("Wrong Map");
		end
		return
	end
	
	-- ��鲢Ԥ�۳���ҵ�ʣ���ʱ��
	local nTimeLeft;
	
	if nMapType == 1 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_A) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_A, nTimeLeft);
	elseif nMapType == 2 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_B) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_B, nTimeLeft);
	end

	if tbNewPracticeMap.bDeBug == 1 then
		print("Name:"..GetName().." MapType:"..nMapType.." TimeLeft:"..nTimeLeft);
	end
	
	-- ������һ��Timer
	TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	
	if nTimeLeft < 0 then
		Msg2Player("Th�i gian tu luy�n c�a ��i hi�p �� k�t th�c, s� b� c��ng ch� ��y kh�i b�n ��!");
		local nSubWorldId, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nSubWorldId, nX/32, nY/32);
		return
	end
		
	if nTimeLeft <= tbNewPracticeMap.WarningTime then
		Msg2Player("Th�i gian tu luy�n c�a ��i hi�p �� k�t th�c, h�y chu�n b� r�i kh�i b�n ��!");
	end
		
end

