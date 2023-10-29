Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE,V + 1);

--�����׶�
if (timestate == 1) then 
	ReportMemberState(V);
elseif (timestate == 2) then 
	ReportBattle(V);

--����ѳ�����һ�׶Σ�����δ���κ���������ʱ
	if (V >= SHOWKINGTIME1 and GetMissionV(MS_FIRSTSHOW) == 0) then
		s_show = GetMissionV(MS_S_SHOWKING);
		j_show = GetMissionV(MS_J_SHOWKING);

--�����ǰֻ��һ�����ϻ�������������Ҫ����������������
		if (s_show == 1 and j_show == 0) then 
			SetMissionV(MS_FIRSTSHOW, 1)
			ShowTheKing(1)
			SetMissionV(MS_S_SHOWKING,2)
			return
		end;

		if (s_show == 0 and j_show == 1) then 
			SetMissionV(MS_FIRSTSHOW, 2)
			ShowTheKing(2)
			SetMissionV(MS_J_SHOWKING,2)
			return
		end;

--����������ﵽ��������������Ҫ�������˫���ĵ�ǰ����ȷ��
		if (s_show == 1 and j_show == 1) then
			s_dpk  = GetMissionV(MS_S_DEATHCOUNT);--���PK��������
			j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
			s_dnpc = GetMissionV(MS_S_NPCDEATH);--NPC��������
			j_dnpc = GetMissionV(MS_J_NPCDEATH);

			if (s_dpk * 1.5 + s_dnpc > j_dpk * 1.5 + j_dnpc) then
				SetMissionV(MS_FIRSTSHOW, 1)
				ShowTheKing(1)
				SetMissionV(MS_S_SHOWKING,2)
				return
			else
				SetMissionV(MS_FIRSTSHOW, 2)
				ShowTheKing(2)
				SetMissionV(MS_J_SHOWKING,2)
				return
			end
		end;
	end;

--����Ѿ����˵ڶ��׶Σ������Ʒ��������Գ�����
	if (V >= SHOWKINGTIME2) then
		--�����ǰ���κη��������֣���ֱ�ӷ���
		local fstshow = GetMissionV(MS_FIRSTSHOW);
		if (fstshow <= 0) then
			return
		end

--��¼���Ʒ��Ĵ��� 1song ,2jing
		nextgroup = 0;
		if (fstshow == 1) then	
			nextgroup = 2
		else
			nextgroup = 1
		end;

--����÷�����������Ҫ���Ѿ��ﵽ��������������
		local canshow = GetMissionV(MS_S_SHOWKING + nextgroup - 1);

		if (canshow == 1) then
			ShowTheKing(nextgroup);
			SetMissionV(MS_S_SHOWKING + nextgroup - 1, 2);
		end;
	end;
elseif (timestate == 3) then 
	Msg2MSAll("Chi�n d�ch k�t th�c ");
	StopMissionTimer(1,1);
end;

end;

function ReportMemberState(V)
--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������

if (V == GO_TIME) then
	if (GetMSPlayerCount(1,1) <= 10 or GetMSPlayerCount(1,2) <= 10) then
		AddGlobalCountNews("Th�i gian b�o danh chi�n tr��ng T�ng Kim �� ��n, nh�ng hi�n gi� s� ng��i c�a ��i b�n ch�a ph� h�p y�u c�u, tr�n chi�n l�n n�y b� h�y b�! ");
		GiveBackBonus()
		CloseMission(1)
		return
	else
		AddGlobalCountNews("Th�i gian b�o danh chi�n tr��ng T�ng Kim �� ��n, tr�n chi�n ch�nh th�c b�t ��u! ",3);
		logstr = "<#>Tr�n chi�n T�ng Kim ch�nh th�c b�t ��u!, s� l��ng ng��i tham gia chi�n ��u cho ��i b�n T�ng Kim l� "..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
		WriteLog(logstr)
		Msg2MSAll(1, logstr)
		RunMission(1);
		return
	end
end;

if (mod(V, 18) == 0) then 
	RestTime = (GO_TIME - V) * 1800 / GO_TIME;
	RestMin, RestSec = GetMinAndSec(RestTime);
	local str1 = "<#>T�ng Kim ��i chi�n �ang cho b�o danh, nh�ng ng��i mu�n tham gia h�y nhanh ch�n ��n hai c�a v�o chi�n tr��ng T�ng Kim, th�i gian b�o danh c�n l�i l�: "..RestMin.."<#>Ph�t. �i�u ki�n tham chi�n: ��ng c�p �t nh�t l� 40, ph� b�o danh 3000 l��ng. ";
	AddGlobalCountNews(str1, 2);
end;

--str = "<#>�����׶�:�Ρ���˫����ǰ������Ϊ:"..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
--Msg2MSAll(1, str);

end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	s_death = GetMissionV(4) + GetMissionV(8);
	j_death = (GetMissionV(3) + GetMissionV(9));
	gametime = (floor(GetMSRestTime(1,5)/18));

	RestMin, RestSec = GetMinAndSec(gametime);

	s_dpk  = GetMissionV(MS_S_DEATHCOUNT);
	j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
	s_dnpc = GetMissionV(MS_S_NPCDEATH);
	j_dnpc = GetMissionV(MS_J_NPCDEATH);

	s_result = floor(j_dpk * 1.5 + j_dnpc);
	j_result = floor(s_dpk * 1.5 + s_dnpc);
	
	str1 = "<#>giai �o�n chi�n ��u: T�nh h�nh th��ng vong hi�n gi�: Qu�n T�ng "..s_death.."<#>Ng��i, t�ng c�ng "..s_result.."<#>; Qu�n Kim "..j_death.."<#>Ng��i, t�ng c�ng "..j_result.."<#>. Th�i gian c�n l�i: "..RestMin.."<#>ph�t"..RestSec.."<#> gi�y";

	Msg2MSAll(1, str1);

--ȫ�򹫸�ս�����ܹر� 2004.11.5
--	if (mod(V, 24) == 0) then
--		str2 = "�ν�ս�����ڽ��м��ҵ�ս��!Ŀǰ�ν�����Ϊ"..s_death..":"..j_death;
--		AddGlobalCountNews(str2 , 1);
--	end;

end;
 