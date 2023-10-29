--��������
--1��������ڵ�Npc�Ի���ѡ�����ڼ���ս��
--2��������ϲ������������ս���ڣ���һ�ŵ�ͼ��������0��Ӫģʽ����
--3����������ߵ�Npc�Ի�������ѡ��������Ӫ��
--4�����Pk�������Զ����Գ����⣬���ڱ���ͼ��
--5�����������ʱ�����Զ���ͬ��ͼ��������ҹ�����ǰ��ս����
--6��������ԣ����Դ�Npc�Ի����˽⵱ǰ��������
--7���������԰��յȼ��ֳɸ�������
--��ս����Npc��ѡ����Ӫ��Npc

Include("\\script\\missions\\hsbattle\\hshead.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\missions\\huashanqunzhan\\dailog.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
--[DinhHQ]
--20110330: change request 30/03/2011
--do
	--Talk(1, "", "Ch�c n�ng t�m ��ng")
	--return
--end
	local tbSay = 
	{
		"<dec><npc>��i hi�p t�m ta c� vi�c g�?",
		"L�i ��i Hoa S�n tuy�t ��nh/HSBattle_Dailog_Main",
	}
	tinsert(tbSay, "L�i ��i Hoa S�n/#huashanqunzhan_SignUpMain(1)")
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end;


function HSBattle_Dailog_Main()
	--���÷��ص�
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("Hi�n gi� v�n ch�a c� ai b�o danh L�i ��i ��n ��u! Ngh�a s� c� mu�n th� t�i kh�ng?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("Hi�n gi� v�n ch�a c� bang h�i n�o b�o danh thi ��u! Ngh�a s� c� mu�n th� t�i kh�ng?", 3, "���c th�i!/OnRegister", "Quy t�c bang h�i l�i ��i nh� th� n�o? /OnHelp", "�� ta suy ngh� l�i!/OnCancel");
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	
	SubWorld = OldSubWorld;
end


function OnHelp()
	Talk(8, "",	"L�i ��i bang h�i l� n�i h�c h�i v� ngh� gi�a c�c bang h�i tr�n giang h�! ��y s� l� n�i thi ��u c�ng b�ng",	"Mu�n tham gia L�i ��i bang h�i, tr��c h�t ph�i g�p ta �� xin ph�p! Ng��i xin ph�p ph�i l� bang ch� c�a bang h�i thi ��u!",	"Sau khi t� ��i, ��i tr��ng 2 b�n s� ��n b�o danh. Bang ch� hai b�n  m�i ng��i ph�i ��t c��c thi ��u 1000 v�n l��ng. ",	"Sau khi ��t c��c xong, xin ph�p thi ��u �� ho�n th�nh. Trong l�c c� 2 bang h�i kh�c �ang thi ��u, kh�ng cho ph�p b�o danh",	"Xin ph�p th�nh c�ng xong, th�nh vi�n c�a hai bang h�i c�10 ph�t gia nh�p ��u tr��ng. Sau �� thi ��u s� ch�nh th�c b�t ��u!" ,"Th�ng b�i ph� thu�c v�o �i�m t�ch l�y thi ��u c�a hai b�n. M�i th�nh vi�n bang h�i l�m tr�ng th��ng ��i ph��ng s� ���c 3 �i�m, ��i ph��ng b� tr� 1 �i�m", 	"K�t th�c thi ��u, bang h�i n�o t�ch l�y �i�m cao h�n s� gi�nh th�ng l�i!",	"Ngo�i ra, trong l�c thi ��u m�t b�n n�o kh�ng c�n th�nh vi�n n�o � l�i ��u tr��ng th� th�ng l�i s� thu�c v� b�n kia. ","Bang h�i chi�n th�ng c� th� thu h�i 500 v�n l��ng, ngo�i ra c�n ���c 400 v�n l��ng ti�n th��ng v� 12.000 �i�m kinh nghi�m bang h�i; b�n thua cu�c s� kh�ng l�y l�i ���c ti�n �� ��ng, m� c�n b� tr� 14.000 �i�m kinh nghi�m bang h�i. ");
end;

function OnRegister()
--����
	if (GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		return
	else
		if (IsCaptain() ~= 1) then 
			ErrorMsg(5)
			return
		end;
		
		OldPlayer = PlayerIndex;
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
			if (GetTongFigure() ~= TONG_MASTER or GetCash() < MS_SIGN_MONEY) then 
				PlayerIndex = OldPlayer
				ErrorMsg(2)
				return
			end;
		end;
		PlayerIndex = OldPlayer;
		
		TongIdTab = {};
		TongNameTab = {};
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
				if (Pay(MS_SIGN_MONEY) == 0) then
					WriteLog(GetTongName().."Bang h�i giao"..MS_SIGN_MONEY.."Thao t�c ph� thi ��u l�i ��i bang h�i kh�ng th�nh c�ng!!!! ");
					PlayerIndex = OldPlayer
					ErrorMsg(3)
					return
				else
					TongNameTab[i], TongIdTab[i] =  GetTongName();
					WriteLog(TongNameTab[i].."Bang h�i giao"..MS_SIGN_MONEY.."Th�nh c�ng thao t�c ph� thi ��u l�i ��i c�a bang h�i! ");
				end;
		end;
		PlayerIndex = OldPlayer;
		
		OldSubWorld = SubWorld;
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then
			ErrorMsg(3) 
			return
		end;
		SubWorld = idx;
		
		OpenMission(MISSIONID);
		for i  = 1, 2 do 
			SetMissionV(MS_TONG1ID + i - 1, TongIdTab[i]);
		end;
		
		SetMissionS(1, TongNameTab[1]); --1��2����MissionString��Ű�������
		SetMissionS(2, TongNameTab[2]);
		
		str = "<#> b�t ��u l�i ��i Bang h�i, hai b�n l� "..TongNameTab[1].."<#> v�i"..TongNameTab[2];
		AddGlobalNews(str);
		SubWorld = OldSubWorld;
		Msg2Team("C�c b�n �� ho�n t�t b�o danh! Xin h�y chu�n b�! Sau 10 ph�t n�a s� ch�nh th�c khai chi�n");
		Say("C�c b�n �� ho�n t�t b�o danh! Xin h�y chu�n b�! Sau 10 ph�t n�a s� ch�nh th�c khai chi�n",0);
	end;
end;

function OnReady()
	str = "<#> Hi�n t�i l�i ��i Bang h�i �ang trong giai �o�n v�o ��u tr��ng, m�i"..GetMissionS(1).."<#> v�i"..GetMissionS(2).." th�nh vi�n Bang h�i <#> nhanh ch�ng v�o ��u tr��ng, chu�n b� b�t ��u thi ��u!";
	Say(str, 2, "Ta th�ch h�p v�i �i�u ki�n, ta mu�n v�o ��u tr��ng /OnJoin", "Ta mu�n nh�n c� h�i n�y �� gi�p m�i ng��i trong bang h�i tr� n�n m�nh m�. /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang ch� hai b�n mu�n xin ph�p thi ��u tr��c h�t ph�i l�p nh�m r�i m�i xin ph�p. ",0)
elseif (ErrorId == 2) then 
	Say("Bang ch� b�o danh c�n ph�i l� ��i tr��ng c�a ��i ng� hi�n t�i v� ph�i mang theo �� 500 v�n l��ng",0)
elseif (ErrorId == 3) then 
	Say("B�o danh xu�t hi�n tr�c tr�c. Xin li�n h� ng��i qu�n l�!",0);
elseif (ErrorId == 4) then 
	Say("B�n kh�ng ph�i l� th�nh vi�n c�a 2 bang h�i �ang thi ��u, kh�ng th� v�o trong!", 0);
elseif(ErrorId == 5) then 
	Say("Bang ch� b�o danh c�n ph�i l� ��i tr��ng c�a ��i ng� hi�n t�i",0);
else
	
end;

return
end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	if (GetTongName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetTongName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 2) then
		SetFightState(1)
	elseif(ms_state == 1) then  
		SetFightState(0)
	else
		return
	end;
	SubWorld=OldSubWorld
	
end;

function OnFighting()
	str = "<#> Hi�n t�i l�i ��i Bang h�i �ang ti�n h�nh thi ��u, m�i"..GetMissionS(1).."<#> v�i"..GetMissionS(2).."<#> th�nh vi�n Bang h�i v�o ��u tr��ng thi ��u!";
	Say(str, 2, "Ta th�ch h�p v�i �i�u ki�n, ta mu�n v�o ��u tr��ng /OnJoin", "Ta kh�ng ph� h�p v�i �i�u ki�n, ta kh�ng mu�n v�o! /OnCancel");
end;

function OnCancel()
end;
