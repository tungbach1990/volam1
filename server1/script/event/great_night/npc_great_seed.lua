function main()
	local nPlayerLevel = GetLevel();
	local nNpcIdx = GetLastDiagNpc();
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	local nSeedLevel = GetNpcParam(nNpcIdx, 1)
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then -- ������𲻶�,���ܽ���ʰȡ
		--���������Ҽ��𲻶�,����ʰȡ
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Ch� c� ng��i ch�i c�p d��i 90 m�i c� th� h�i qu� n�y!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo�i qu� n�y ch� t� c�p 90 ��n c�p 119 ng��i ch�i m�i c� th� h�i ���c.")
		else
			Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 120 tr� l�n m�i c� th� h�i!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("Ch� c� ng��i ch�i t� c�p 120 tr� l�n m�i c� th� h�i qu� n�y!")
			return
	end;
	Msg2Player("Qu� v�n ch�a ch�n, ph�i ��i 5 ph�t n�a.")
end;