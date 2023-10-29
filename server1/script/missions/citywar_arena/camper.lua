--����ĳһ����Npc��Ӧ�ű�
--BattleId�ⲿ��ȫ�ֱ�������ʾ��ǰ��ս����ͼ�ı��(1-8)

--HaveBeginWar(CityID) -- CityID(1-7)		//����ĳ�������Ƿ��ѿ�ս,����ֵΪһ��BOOLֵ
--GetCityAreaName(CityID)					//ȡ1��7�ĳ�������,����ֵΪһ���ַ���
--GetCityWarBothSides(CityID)				//��ù��������ط��İ����,���������ַ���,������ֱ�����������ط�
--NotifyWarResult(CityID, WarResult)		//��������֮��֪ͨRelay�������(WarResultΪBOOLֵ��ʾ���Ƿ��Ƿ�ʤ��)
--GetCityWarTongCamp(TongName)				//��ò��빥��ս��ػ�İ����Ӫ������INT����Ӫ����ֵ
--IsArenaBegin(ArenaID) -- ArenaID(0-7)		//��õ�ǰ������̨�����Ƿ�ʼ������BOOL
--GetArenaCityArea(nArenaID)				//��õ�ǰ���ڽ��е���̨��������ĸ�����,����ֵΪCityID
--GetArenaBothSides(ArenaID)				//���ĳһ����̨��˫��������,���������ַ���,������ֱ����׷��ҷ�
--NotifyArenaResult(ArenaID, ArenaResult)	//֪ͨһ����̨�������ı��������Relay, ArenaResultΪBOOLֵ��ʾ�ļ׷��Ƿ��ʤ
--GetArenaLevel()							//��õ�ǰ��̨�������ִΣ�����ֵ 0:�����Ѿ�����������δ��ʼ��1:��һ�֣�2/3/4/5�Դ�����
--GetArenaTotalLevel()						//��õ�ǰ��̨�������ִ�
--GetCurArenaInfo()							//��õ�ǰ�ִε�����
--GetArenaTotalLevelByCity(CityID)			//���ĳ��������̨�������ִ�
--GetArenaInfoByCity(CityID, ArenaLevel)	//���ĳ��������̨����������,ArenaLevel: 0-Based

Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\lib\\common.lua")
function main()
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		WorldID = SubWorldIdx2ID(SubWorld);
		ArenaID = WorldID - 213;
		if (IsArenaBegin(ArenaID) ~= 0) then
			Tong1, Tong2 = GetArenaBothSides(ArenaID);
			Tong1 = safeshow(Tong1)
			Tong2 = safeshow(Tong2)
			Say(Tong1.."v�"..Tong2.."L�p t�c chu�n b� chi�n ��u, ��u tr��ng �ang chu�n b�, m�i ng��i h�y s�n s�ng ", 0);
		else
			Say("Th�i gian chi�n ��u v�n ch�a ��n!", 1, "Bi�t r�i, ta �i tr��c ��y /OnCancel");
		end;
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(3)
	end;
end;

function OnHelp()
	Talk(8, "",	"L�i ��i bang h�i l� n�i h�c h�i v� ngh� gi�a c�c bang h�i tr�n giang h�! ��y s� l� n�i thi ��u c�ng b�ng",	"Mu�n tham gia L�i ��i bang h�i, tr��c h�t ph�i g�p ta �� xin ph�p! Ng��i xin ph�p ph�i l� bang ch� c�a bang h�i thi ��u!",	"Sau khi t� ��i, ��i tr��ng 2 b�n s� ��n b�o danh. Bang ch� hai b�n  m�i ng��i ph�i ��t c��c thi ��u 1000 v�n l��ng. ",	"Sau khi ��t c��c xong, xin ph�p thi ��u �� ho�n th�nh. Trong l�c c� 2 bang h�i kh�c �ang thi ��u, kh�ng cho ph�p b�o danh",	"Xin ph�p th�nh c�ng xong, th�nh vi�n c�a hai bang h�i c�10 ph�t gia nh�p ��u tr��ng. Sau �� thi ��u s� ch�nh th�c b�t ��u!" ,"Th�ng b�i ph� thu�c v�o �i�m t�ch l�y thi ��u c�a hai b�n. M�i th�nh vi�n bang h�i l�m tr�ng th��ng ��i ph��ng s� ���c 3 �i�m, ��i ph��ng b� tr� 1 �i�m", 	"K�t th�c thi ��u, bang h�i n�o t�ch l�y �i�m cao h�n s� gi�nh th�ng l�i!",	"Ngo�i ra, trong l�c thi ��u m�t b�n n�o kh�ng c�n th�nh vi�n n�o � l�i ��u tr��ng th� th�ng l�i s� thu�c v� b�n kia. ","Bang h�i chi�n th�ng c� th� thu h�i 1000 v�n l��ng �� ��ng, ngo�i ra c�n ���c 800 v�n l��ng ti�n th��ng v� 12.000 �i�m kinh nghi�m bang h�i. Bang h�i thua cu�c s� kh�ng l�y l�i ���c ti�n �� ��ng, m� c�n b� tr� 14.000 �i�m kinh nghi�m bang h�i");
end;

function OnReady()
	V = GetMissionV(MS_NEWSVALUE);
	RestTime = (GO_TIME - V) * 20;
	
	if (RestTime < 0) then 
		RestTime=0
	end;
	
	RestMin, RestSec = GetMinAndSec(RestTime);

	str = "<#> N�i n�y �ang di�n ra tranh ��u"..GetMissionS(3).."<#> c�ng th�nh khi�u chi�n, hi�n t�i bang h�i thi ��u l�:"..GetMissionS(1).."<#> v�i"..GetMissionS(2).."<#>, th�i gian nh�p tr��ng c�n l�i"..RestMin.."<#> ph�t "..RestSec.."<#> gi�y.";
	Say(str, 2, "Ta th�ch h�p v�i �i�u ki�n, ta mu�n v�o ��u tr��ng /OnJoin", "ta kh�ng mu�n v�o ��u tr��ng /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang ch� hai b�n mu�n xin ph�p thi ��u tr��c h�t ph�i l�p nh�m r�i m�i xin ph�p. ",0)
elseif (ErrorId == 2) then 
	Say("��n b�o danh ph�i l� ��i tr��ng c�a bang h�i mu�n thi ��u, m�i bang ch� ph�i mang �� 1000 v�n l��ng",0)
elseif (ErrorId == 3) then 
	Say("B�o danh xu�t hi�n tr�c tr�c. Xin li�n h� ng��i qu�n l�!",0);
elseif (ErrorId == 4) then 
	Say("B�n kh�ng ph�i l� th�nh vi�n c�a hai bang h�i thi ��u ho�c s� ng��i trong ��u tr��ng �� ��y, kh�ng th� v�o ���c!", 0);
elseif(ErrorId == 5) then 
	Say("Bang ch� b�o danh c�n ph�i l� ��i tr��ng c�a ��i ng� hi�n t�i",0);
else
	
end;

return
end;

function OnJoin()
	if (GetTongName() == GetMissionS(1)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(1);
		else
			Say("Th�i gian b�n gia nh�p bang h�i qu� ng�n, kh�ng th� tham gia chi�n ��u!", 0);
		end;
	elseif (GetTongName() == GetMissionS(2)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(2);
		else
			Say("Th�i gian b�n gia nh�p bang h�i qu� ng�n, kh�ng th� tham gia chi�n ��u!", 0);
		end;
	else
		ErrorMsg(4)
	end;
end;

function OnFighting()
	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> nh�n s� 2 b�n hi�n t�i l�:"..GetMSPlayerCount(MISSIONID, 1).."<#> "..GetMSPlayerCount(MISSIONID, 2).."<#>. Th�i gian c�n d� "..RestMin.."<#> ph�t "..RestSec.."<#> gi�y.";
	str = "<#> hi�n t�i bang h�i"..GetMissionS(1).."<#> v�i"..GetMissionS(2).."<#> �ang ti�n h�nh";
	Say(str..str1, 0);
end;

function OnCancel()

end;
