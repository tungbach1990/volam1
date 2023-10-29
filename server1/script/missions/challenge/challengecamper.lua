--CheckCondition() ��Ҫ�ú������ڼ���Ƿ���ϼ�������

Include("\\script\\missions\\challenge\\challengehead.lua");

function main()

	V = GetMissionV(MS_STATE);
	
	--��������׶εĻ���֪ͨʣ��ʱ��
	--���ս���׶εĻ���֪ͨս��ʣ��ʱ��
	if (V == 1) then 
		V1 = GetMissionV(MS_NEWSVALUE);
		RestTime = (GO_TIME - V1) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		str = "<#> Tr��ng ��u �ang trong giai �o�n b�o danh, th�i gian b�o danh c�n l�i:"..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
		Msg2Player(str);
	elseif(V == 2) then
		gametime = (floor(GetMSRestTime(MISSIONID,11) / 18));
		RestMin, RestSec = GetMinAndSec(gametime);
		str = "<#> Tr��ng ��u �ang trong giai �o�n chi�n ��u, th�i gian chi�n ��u c�n l�i:"..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
		Msg2Player(str);
	end
	
	--��չ��6��ֵ���Ϊ1����ʾ�ý�ɫ����ս������Ա��������Npc���볡����
	if (GetExtPoint(6) == 1 or GetCamp() == 6 ) then 
		Say("Huynh l� ng��i qu�n l� chi�n tr��ng � ��y? Ta c� th� gi�p g� kh�ng?", 7 ,  "C�m l�y v� kh� c�a phe v�ng /GetYellow", "C�m l�y v� kh� c�a phe t�m /GetPurple" , "C�m l�y v� kh� c�a ng��i b�n c�nh /GetWhite", "B� h�t t�t c� v� kh� trong ng��i ra /ClearItems", "V�o ��u tr��ng /GoWarCenter", "R�i kh�i ��u tr��ng /LeaveCenter",  "�� ta ngh� l�i xem /OnCancel");
		return
	end;
	
	--�����׶�	
	if (V == 1) then
		HaveCamp1 = HaveItem(350);--�Ʒ�
		HaveCamp2 = HaveItem(347);--�Ϸ�
		HaveCamp3 = HaveItem(348);--����
		
		--���û���κε��볡���ߵĻ�
		if (HaveCamp1 == 0 and HaveCamp2 == 0 and HaveCamp3 == 0) then 
			Say("B�n kh�ng c� b�t c� 'Anh h�ng l�nh b�i' n�o, kh�ng th� v�o trong!", 0)
			return
		end;
		if (GetTeamSize() == 0)  then
			Say("B�n ch�a l�p ��i ng�, ch�a th� v�o trong!",0);
			return
		end;
		
		str1 = "<#> ��i c�a ng��i c�"..GetTeamSize().."<#> ng��i! Ng��i mu�n gia nh�p phe n�o?";
		Say(str1 ,4, "ta mu�n gia nh�p v�o phe v�ng /JoinYellow", "ta mu�n gia nh�p v�o phe t�m /JoinPurple", "ta mu�n v�o �� tham quan /JoinWhite", "�� ta ngh� l�i xem /OnCancle");
	
	elseif (V == 2) then --��ս�׶�
		HaveCamp3 = HaveItem(348);
		if (HaveCamp3 == 1) then
			Say("B�n hi�n �ang c� Di�p L�c Anh H�ng l�nh. Mu�n v�o tham chi�n hay ra kh�i ��y?", 3, "��n trung t�m c�a ��u tr��ng /GoWarCenter", "R�i kh�i khu v�c ��u tr��ng /LeaveWar", "�� ta ngh� l�i xem /OnCancel");
		end;
	elseif (V == 0) then
		Say("Th�i gian b�o danh tr�n khi�u chi�n l�n n�y v�n ch�a ��n! ",0);
	end;
	
end;

function ClearItems()
	ClearItem(347);
	ClearItem(348);
	ClearItem(350);
end;

function ClearItem(ItemId)

Count = GetItemCount(ItemId);
if (Count >= 1) then
	for i = 1, Count do 
		DelItem(ItemId)
	end;
end;

end;


function JoinYellow()
	if (HaveItem(350) >= 1) then
		CheckAndJoinCamp(1)		
	else
		Say("B�n kh�ng c� �m Ho�ng Anh H�ng l�nh, kh�ng th� v�o trong!",0);
	end;
end;

function JoinPurple()
	if (HaveItem(347) >= 1) then
		CheckAndJoinCamp(2)		
	else
		Say("B�n kh�ng c� Huy�t H�ng Anh H�ng l�nh, kh�ng th� v�o trong!",0);
	end;
end;

function JoinWhite()
	if (HaveItem(348) >= 1) then 
		CheckAndJoinCamp(6)
	else
		Say("B�n kh�ng c� Di�p L�c Anh H�ng l�nh, kh�ng th� v�o trong!", 0);
	end;
end;


function GetYellow()
	AddEventItem(350);
end;

function GetPurple()
	AddEventItem(347);
end;

function GetWhite()
	AddEventItem(348);
end;


function OnCancel()

end;

function GoWarCenter()
	AddMSPlayer(MISSIONID, 6);
	SetCurCamp(0)
	NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3]);
end;

function LeaveCenter()
	LeaveGame(0)	
	SetCurCamp(GetCamp())
end;


function CheckAndJoinCamp(Camp)
	
	if (IsCaptain() == 0) then
		Say("B�n ch�a l�p ��i ng� ho�c kh�ng ph�i l� ��i tr��ng, kh�ng th� v�o trong! ",0);
		return
	else
		bHaveJoin = GetMissionV(MS_S_JOINED + Camp - 1);
		if (bHaveJoin == 1) then 
			Say("Hi�n �� c� 1 ��i kh�c s� d�ng Anh H�ng l�nh c�ng m�u v�o tham chi�n r�i ", 0);
		return
		end;
	end;
				
	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT) then
		Say("Nh�n s� trong t� c�a b�n v��t h�n h�n ��nh, xin �i�u ch�nh l�i r�i m�i v�o thi ��u!" , 0);
		return
	else
		OldPlayer = PlayerIndex;
		W,X,Y = GetWorldPos();
		Size = GetTeamSize();
		
		for i = 1, Size do 
			PIdx = GetTeamMember(i);
			if (PIdx > 0) then 
				PlayerIndex = PIdx;
				W1,X,Y = GetWorldPos();
				if (W1 ~= W) then 
					PlayerIndex = OldPlayer
					Say("T� c�a b�n hi�n c� 1 ng��i kh�ng � trong khu v�c chu�n b�, xin �i�u ch�nh l�i r�i m�i v�o thi ��u!",0);
					return
				end;
			end
		end;
		
		PlayerIndex = OldPlayer;
		
		if (Camp == 1) then 
			DelItem(350);
		elseif (Camp == 2) then 
			DelItem(347)
		else
			DelItem(348)
		end

		JoinCampInTeam(Camp);
	end;
	
end;

function JoinCampInTeam(Camp)
	OldPlayer = PlayerIndex;
	local TeamTab = {};
	Size = GetTeamSize();
	Joined = 0;
	for i = 1, Size do 
		TeamTab[i] = GetTeamMember(i);
	end;
	for i = 1, Size do
		PlayerIndex = TeamTab[i];		
		if (Camp ~= 6 and GetLevel() < 30) then 
			Msg2MSAll(MISSIONID, GetName().."<#> ch�a h�n c�p 30, kh�ng th� tham gia!");
		else
			Joined = Joined + 1;
			JoinCamp(Camp)
		end;
	end;
	if (Joined >= 1) then
		SetMissionV(MS_S_JOINED + Camp - 1, 1);	
	end;

	PlayerIndex = OldPlayer;
	
end;
