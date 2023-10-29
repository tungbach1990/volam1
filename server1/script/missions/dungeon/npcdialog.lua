Include("\\script\\missions\\dungeon\\dungeonmanager.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--�����Ի���
	tbDailog:Show()
	
end

if not DungeonDlg then
	DungeonDlg = {};
end

function DungeonDlg:DungeonTempletDlg(szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	
	for i, n in tbDungeonManager.tbDungeonTempletList do
		if (i ~= "n") then
			tinsert(tbOpt, {i, DungeonDlg.DungeonInfoDlg, {DungeonDlg, i, szTile}})
		end
	end
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DungeonInfoDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";

	tinsert(tbOpt, {format("Khai m� [%s]",strDungeon), tbDungeonManager.OpenDungeon, {tbDungeonManager, strDungeon}});
	tinsert(tbOpt, {format("Ki�m tra khai m�  � [%s]",strDungeon), DungeonDlg.DungeonListDlg, {DungeonDlg, strDungeon, szTile}});
	tinsert(tbOpt, {format("Qu�n l� ta khai m� [%s]",strDungeon), DungeonDlg.OptDungeonDlg, {DungeonDlg, strDungeon, szTile}});
	tinsert(tbOpt, {"T�m bi�t",DungeonDlg.Cancel, {DungeonDlg}});
	
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DungeonListDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);

	for i,v in tbList do
		if (i ~= "n") then
			if (v.bHiden ~= 1 and (v.nMemberLimit ~= nil and getn(v.tbMember) < v.nMemberLimit)) then
				if (v.nOpenMapId == nil or v.nOpenMapId == SubWorldIdx2ID(SubWorld)) then
					tinsert(tbOpt, {format("[%s] khai m� � [%s]", v.strOwner, v.strDungeon), DungeonDlg.DungeonOpDlg, {DungeonDlg, v.nDungeonId, szTile}});
				end
			end
		end
	end
	tinsert(tbOpt, {"T�m bi�t",DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:MineDungeonListDlg(strDungeon, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);
	local strName = GetName();
	
	for i,v in tbList do
		if (i ~= "n" and (v.nOpenMapId == nil or v.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
			for j,u in v.tbMember do
				if (j ~= "n") then
					if (u.strName == strName) then
						tinsert(tbOpt, {format("[%s] khai m� � [%s]", v.strOwner, v.strDungeon), DungeonDlg.DungeonOpDlg, {DungeonDlg, v.nDungeonId, szTile}});
					end
				end
			end
			
		end
	end
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:OptDungeonDlg(strDungeon, szTile)
	local tbOpt = {};
	local szTempTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbList = tbDungeonInfo:GetDungeonList(strDungeon);
	local tbDungeon = nil;
	local strName = GetName();
	for i,v in tbList do
		if (i ~= "n") then
			if  (v.strOwner == strName) then
				tbDungeon = v;
				szTempTile = format("%s b�n d��i l� ng��i khai m� [<color=yellow>%s<color>] th�ng tin <enter>=====================================<enter>",szTempTile, tbDungeon.strDungeon);
				szTempTile = format("%sId:<color=green>%0.f<color><enter>",szTempTile, tbDungeon.nDungeonId);
				szTempTile = format("%s S� h�u :<color=yellow>%s<color><enter>",szTempTile, tbDungeon.strOwner);
				szTempTile = format("%s th�i gian m�: <color=green>%04d-%02d-%02d %02d:%02d<color><enter>",szTempTile, 
									tbDungeon.nOpenTime/100000000, 
									mod(tbDungeon.nOpenTime, 100000000)/1000000,  
									mod(tbDungeon.nOpenTime, 1000000)/10000,
									mod(tbDungeon.nOpenTime, 10000)/100,
									mod(tbDungeon.nOpenTime, 100));
				if (v.nLifeTime ~= nil) then
					szTempTile = format("%s th�i gian c�n l�i:<color=green>%0.f<color> gi�y<enter>",szTempTile, tbDungeon.nLifeTime);
				end
				szTempTile = format("%s th�nh vi�n( ch� m�u �� l� ng��i ch�i �ang � t�i [<color=yellow>%s<color>]):<enter>",szTempTile, tbDungeon.strDungeon);
				for j,u in v.tbMember do
					if (j ~= "n") then
						if (u.bInDungeon == 1) then
							szTempTile = format("%s<color=red>%s,<color>",szTempTile, u.strName);
						else
							szTempTile = format("%s%s,",szTempTile, u.strName);
						end
					end
				end
			end
		end
	end

	if (tbDungeon ~= nil) then
		if (tbDungeon.bHiden ~= 1) then
			tinsert(tbOpt, {"C�m l�m phi�n", DungeonDlg.Hiden, {DungeonDlg, tbDungeon.nDungeonId, 1}});
		else
			tinsert(tbOpt, {"B� c�m l�m phi�n", DungeonDlg.Hiden, {DungeonDlg, tbDungeon.nDungeonId, 0}});
		end
		
		tinsert(tbOpt, {"X� l� l�i m�i", DungeonDlg.OptApplyDlg, {DungeonDlg, tbDungeon.nDungeonId, szTile}});
		tinsert(tbOpt, {"Lo�i b� th�nh vi�n", DungeonDlg.DelMemberDlg, {DungeonDlg, tbDungeon.nDungeonId, szTile}});
		tinsert(tbOpt, {format("��ng [%s]", tbDungeon.strDungeon), DungeonDlg.CloseDungeon, {DungeonDlg, tbDungeon.nDungeonId}});
	end
	
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTempTile== nil or szTempTile == "" then
		szTempTile = format("Ng��i v�n ch�a m� [%s]",strDungeon);
	end
	CreateNewSayEx(szTempTile, tbOpt);
end

function DungeonDlg:DungeonOpDlg(nDungeonId, szTile)
	local tbOpt = {};
	local szTempTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local strName = GetName();
	local bMember = 0;
	if (tbDungeon ~= nil) then
		szTempTile = format("%s b�n d��i l� [<color=yellow>%s<color>] th�ng tin<enter>=====================================<enter>",szTempTile, tbDungeon.strDungeon);
		szTempTile = format("%sId:<color=green>%0.f<color><enter>",szTempTile, tbDungeon.nDungeonId);
		szTempTile = format("%s S� h�u :<color=yellow>%s<color><enter>",szTempTile, tbDungeon.strOwner);
		szTempTile = format("%s th�i gian m�:<color=green>%d-%02d-%02d %02d:%02d<color><enter>",szTempTile, 
							tbDungeon.nOpenTime/100000000, 
							mod(tbDungeon.nOpenTime, 100000000)/1000000,  
							mod(tbDungeon.nOpenTime, 1000000)/10000,
							mod(tbDungeon.nOpenTime, 10000)/100,
							mod(tbDungeon.nOpenTime, 100));
		if (tbDungeon.nLifeTime ~= nil) then
			szTempTile = format("%s th�i gian c�n l�i:<color=green>%0.f<color> gi�y<enter>",szTempTile, tbDungeon.nLifeTime);
		end
		szTempTile = format("%s th�nh vi�n( ch� m�u �� l� ng��i ch�i �ang � t�i [<color=yellow>%s<color>]):<enter>",szTempTile, tbDungeon.strDungeon);
		for j,u in tbDungeon.tbMember do
			if (j ~= "n") then
				if (u.strName == strName) then
					bMember = 1;
				end
				if (u.bInDungeon == 1) then
					szTempTile = format("%s<color=red>%s,<color>",szTempTile, u.strName);
				else
					szTempTile = format("%s%s,",szTempTile, u.strName);
				end
			end
		end
		
		if (tbDungeon.strOwner == strName) then
			tinsert(tbOpt, {format("V�o [%s]", tbDungeon.strDungeon), tbDungeonManager.EnterDungeon, {tbDungeonManager, nDungeonId}});
			tinsert(tbOpt, {format("Qu�n l� ta khai m� [%s]", tbDungeon.strDungeon), DungeonDlg.OptDungeonDlg, {DungeonDlg, tbDungeon.strDungeon, szTile}});
		elseif (bMember ~= 1) then
			tinsert(tbOpt, {"G�i y�u c�u gia nh�p", tbDungeonManager.ApplyJoinDungeon, {tbDungeonManager, nDungeonId, strName}});
		else
			tinsert(tbOpt, {format("V�o [%s]", tbDungeon.strDungeon), tbDungeonManager.EnterDungeon, {tbDungeonManager, nDungeonId}});
			tinsert(tbOpt, {format("Tho�t [%s]", tbDungeon.strDungeon), tbDungeonManager.DelMember, {tbDungeonManager, nDungeonId, strName}});
		end
		
	end
	
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTempTile== nil or szTempTile == "" then
		szTempTile = format("Ng��i v�n ch�a m� [%s]",strDungeon);
	end
	CreateNewSayEx(szTempTile, tbOpt);
end

function DungeonDlg:OptApplyDlg(nDungeonId, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		for i,v in tbDungeon.tbApply do
			if (i ~= "n") then
				tinsert(tbOpt, {format("��ng � gia nh�p [%s]",v), DungeonDlg.AddMember, {DungeonDlg, nDungeonId, v}});
			end
		end
	end
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:AddMember(nDungeonId, strName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeonManager:AddMember(nDungeonId, strName);
	end
end

function DungeonDlg:DelMemberDlg(nDungeonId, szTile)
	local tbOpt = {};
	szTile = szTile or "<npc>Xin ch�o! Ta l� ng��i qu�n l� ph� b�n n�y.";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	local strName = GetName();
	if (tbDungeon ~= nil) then
		if (tbDungeon ~= nil and tbDungeon.strOwner == strName and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
			for i,v in tbDungeon.tbMember do
				if (i ~= "n" and v.strName ~= tbDungeon.strOwner) then
					tinsert(tbOpt, {format("[%s] r�i kh�i [%s]", v.strName, tbDungeon.strDungeon), DungeonDlg.DelMember, {DungeonDlg, nDungeonId, v.strName}});
				end
			end
		end
	end
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:DelMember(nDungeonId, strName)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeonManager:DelMember(nDungeonId, strName);
	end
end

function DungeonDlg:Hiden(nDungeonId, bHiden)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		tbDungeon.bHiden = bHiden;
		Talk(1,"",bHiden == 1 and format("Ng��i �� thi�t ��t [%s] c� trang th�i c�m l�m phi�n!",tbDungeon.strDungeon) or
			 format("H�y b� [%s] tr�ng th�i l�m phi�n!",tbDungeon.strDungeon));
	end
end

function DungeonDlg:CloseDungeon(nDungeonId)
	local tbOpt = {};
	local szTile = "<npc> ";
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		szTile = format("Ng��i x�c nh�n mu�n ��ng [<color=red>%s<color>]?",tbDungeon.strDungeon);
		tinsert(tbOpt, {"X�c nh�n", DungeonDlg.CloseDungeonCommit, {DungeonDlg, tbDungeon.nDungeonId}});
	end
	tinsert(tbOpt, {"T�m bi�t", DungeonDlg.Cancel, {DungeonDlg}});
	if szTile== nil or szTile == "" then --��ֹ����
		szTile = " ";
	end
	CreateNewSayEx(szTile, tbOpt);
end

function DungeonDlg:CloseDungeonCommit(nDungeonId)
	local tbDungeon = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbDungeon ~= nil and tbDungeon.strOwner == GetName() and (SubWorldIdx2ID(SubWorld) == tbDungeon.nDungeonId or tbDungeon.nOpenMapId == nil or tbDungeon.nOpenMapId == SubWorldIdx2ID(SubWorld))) then
		WriteLog(format("[%s] %s close owen [%s] dungeon(id:%d), templet mapid is [%0.f].", GetLocalDate("%Y-%m-%d %H:%M:%S"), tbDungeon.strOwner, tbDungeon.strDungeon , tbDungeon.nDungeonId, tbDungeon.nMapTemplet));
		tbDungeonManager:CloseDungeon(nDungeonId);
	end
end

function DungeonDlg:Cancel()
end