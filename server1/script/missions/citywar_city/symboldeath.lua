Include("\\script\\missions\\citywar_city\\head.lua");
-------------------------------------------------------------------------
function OnDeath(DeathNpc)
	WriteLog(GetLoop()..":Th�ch tr� t�n h�i:"..DeathNpc);
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	DeathName = GetName();
	
	LaunName = GetName();

	svalue = GetMissionV(MS_SYMBOLBEGIN + SymbolId - 1);

	oldsvalue=svalue	
	if (oldsvalue == 1) then 
		svalue = 2
	elseif (oldsvalue == 2) then 
		svalue = 1
	end;

	msgstr = format("Tin b�o t� c�ng th�nh chi�n tr��ng: %s �� gi�nh ���c quy�n kh�ng ch� %s",GetGamerName(svalue),StonePos[SymbolId].Name);

	SetMissionV(MS_SYMBOLBEGIN + SymbolId - 1, svalue);
	nWinCount = CheckWin();
	if (nWinCount >= MS_SYMBOLCOUNT) then
		AddGlobalNews(msgstr);
		GameWin(2)
		return
	end;

	AddGlobalNews(msgstr);
	
	if (svalue == 1 )then 
		nNpcId = AddNpc(STONENPCID1, STONELEVEL1 + svalue - 1, SubWorld, StonePos[SymbolId].x, StonePos[SymbolId].y, 1, GetGamerName(svalue)..StonePos[SymbolId].Name, 1);
	else
		nNpcId = AddNpc(STONENPCID2, STONELEVEL1 + svalue - 1, SubWorld, StonePos[SymbolId].x, StonePos[SymbolId].y, 1, GetGamerName(svalue)..StonePos[SymbolId].Name, 1);
	end;
	WriteLog("T�ng th�m c�t �� m�i"..nNpcId);
	
	scriptname = format("\\script\\missions\\citywar_city\\symboldeath%d.lua", SymbolId);
	SetNpcDeathScript(nNpcId, scriptname);
		
	if (nNpcId > 0) then 
		if (svalue == 1) then 
			SetNpcCurCamp(nNpcId, 1);
		else
			SetNpcCurCamp(nNpcId, 2);
		end; 
	end;
	
end;
--------------------------------------------------------------------------------------
