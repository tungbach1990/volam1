--CheckCondition() ��Ҫ�ú������ڼ���Ƿ���ϼ�������
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function main()

	if (GetMissionV(1) == 1) then 
			--δ����ս���Թ�
			if (GetTaskTemp(JOINSTATE) == 0) then
				Say("B�n mu�n tham gia phe V�ng hay phe T�m?", 4, "ta mu�n gia nh�p v�o phe v�ng /ChooseCamp", "ta mu�n gia nh�p v�o phe t�m /ChooseCamp", "Ta mu�n quan s�t tr��c ��, s� n�i chuy�n sau! /ChooseCamp", "�� ta ngh� l�i xem /OnCancel");
				return
			--�����Թ�
			else
				if (GetCurCamp() == 0) then 
					Say("B�n mu�n tham gia phe V�ng hay phe T�m?", 4, "ta mu�n gia nh�p v�o phe v�ng /ChooseCamp", "ta mu�n gia nh�p v�o phe t�m /ChooseCamp", "�� ta ngh� l�i xem /OnCancel", "Ta mu�n r�i kh�i chi�n tr��ng. /ChooseLeave");
					return
				else
					Say("Ng��i mu�n r�i kh�i chi�n tr��ng �?", 2, "V�ng, Ta mu�n ra /ChooseLeave", "Ta v�n ch�a ��nh xong, ch�a mu�n ra. /OnCancel");	
					return
				end
			end
	else
		Say("Hi�n v�n ch�a ��n th�i gian chi�n ��u!",0);
		return
	end;
end;

function ChooseCamp(nSel)
	
	if (CheckCondition() == 0) then
		return 
	end;
	
	if (nSel == 0) then
		JoinCamp(1)	
	elseif (nSel == 1) then
		JoinCamp(2)
	else 
		SetTaskTemp(JOINSTATE, 1);
		SetPos(CS_CampPos0[2], CS_CampPos0[3]);
	end;
end;

function OnCancel()

end;

function ChooseLeave()
	LeaveGame(0)	
end;

