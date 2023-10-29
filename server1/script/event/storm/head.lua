--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskID��ʼֵ

STORM_TASKID_DAY			= STORM_TASKID_BASE+1	--��һ�δ�����ϵͳ��������2005��1��1����ĵڼ��죩
STORM_TASKID_DAY_POINT		= STORM_TASKID_BASE+2	--�����ܻ���
STORM_TASKID_DAY_LASTPOINT	= STORM_TASKID_BASE+3	--�����ܻ���
STORM_TASKID_DAY_AWARD		= STORM_TASKID_BASE+4	--�Ƿ�����ȡÿ�ս�����1���ǣ�0����
STORM_TASKID_DAY_LASTAWARD	= STORM_TASKID_BASE+5	--�Ƿ�����ȡ���ս�����1���ǣ�0����

STORM_TASKID_WEEK			= STORM_TASKID_BASE+6	--��һ�δ�����ϵͳ��������2005��1��1����ĵڼ��ܣ�
STORM_TASKID_WEEK_POINT		= STORM_TASKID_BASE+7	--�����ܻ���
STORM_TASKID_WEEK_LASTPOINT	= STORM_TASKID_BASE+8	--�����ܻ���
STORM_TASKID_WEEK_AWARD		= STORM_TASKID_BASE+9	--�Ƿ�����ȡÿ�ܽ�����1���ǣ�0����

STORM_TASKID_MONTH			= STORM_TASKID_BASE+11	--��һ�δ�����ϵͳ��������2005��1��1����ĵڼ��£�
STORM_TASKID_MONTH_POINT	= STORM_TASKID_BASE+12	--�����ܻ���
STORM_TASKID_MONTH_LASTPOINT= STORM_TASKID_BASE+13	--�����ܻ���
STORM_TASKID_MONTH_AWARD	= STORM_TASKID_BASE+14	--�Ƿ�����ȡÿ�½�����1���ǣ�0����

STORM_TASKID_GAMEID_SS		= STORM_TASKID_BASE+16	--��ǰɱ��������GameID�������ж��ǲ���ͬһ������
STORM_TASKID_GAMES			= STORM_TASKID_BASE+17	--����μӹ��Ļ������ͬһ�����βμ�ֻ��һ��
STORM_TASKID_DATE			= STORM_TASKID_BASE+18	--���һ�δ�����ϵͳ�����ڣ��������������ʾ
STORM_TASKID_LETTER			= STORM_TASKID_BASE+19	--�Ƿ���ȡ����
STORM_TASKID_TIPS			= STORM_TASKID_BASE+20	--LogInʱ��ʾ���Ĵ���

--ÿ�����TaskValue��TaskID����ĽǱ꣩
STORM_TASKIDX_START		= 1	--���ʼ��ʱ�䣨���Σ�
STORM_TASKIDX_TRYCOUNT	= 2	--����й��Ĵ���
STORM_TASKIDX_POINTCUR	= 3	--��ĵ�ǰ�籩����
STORM_TASKIDX_POINTEX	= 4	--��ĵ�ǰ�籩���ֽ����֣�ʱ�佱��/���뽱����
STORM_TASKIDX_POINTMAX	= 5	--��ĵ�����߷籩���ּ�¼
STORM_TASKIDX_EXTRA		= 6	--��������õ��Ķ����������ǰԭʼ��/���ʼ�֣�
STORM_TASKIDX_MODE		= 7	--���μӵĻ����ϸģʽ/����

--====ʱ�����====--
--��2005�����ÿ������������ʼֵ
TB_STORM_DAYS = {}
TB_STORM_DAYS[2005]	= 0
TB_STORM_DAYS[2006]	= 365
TB_STORM_DAYS[2007]	= 730
TB_STORM_DAYS[2008]	= 1095
TB_STORM_DAYS[2009]	= 1461
TB_STORM_DAYS[2010]	= 1826

--��2005�����ÿ������������ʼֵ���൱�ڼ���ÿ���ж��ٸ�����һ��
TB_STORM_WEEKS = {}
TB_STORM_WEEKS[2005]	= 0
TB_STORM_WEEKS[2006]	= 52
TB_STORM_WEEKS[2007]	= 104
TB_STORM_WEEKS[2008]	= 157
TB_STORM_WEEKS[2009]	= 209
TB_STORM_WEEKS[2010]	= 261

STORM_LADDER_WEEK		= 36	--�ӵڼ��ܿ�ʼ������
STORM_LADDERID_WEEK1	= 10182	--��һ������
STORM_LADDERID_WEEK2	= 10183	--�ڶ�������
STORM_LADDERID_WEEK3	= 10184	--����������
STORM_LADDERID_WEEK4	= 10185	--����������
STORM_LADDERID_MONTH	= 10186	--�������У��ݶ�ȫ������

STORM_TIMERID_YS	= 44	--Ұ�����񵹼�ʱ
STORM_TIMER_YS		= 5		--Ұ�����񵹼�ʱƵ�ʣ�5����

STORM_END_DAY	= 275	--���ַ籩����ʱ��

IL("RELAYLADDER");
IL("TIMER");

--����ʱ�õ��������ʱ
function debug_out(str)
	--print(GetName()..":::"..str)
	--Msg2Player("<color=white>DEBUG:"..str.."<color>")
end

--��ͬ����SetTask
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

--������ڣ��������һ�췵��1�����򷵻�nil
--������ͬʱ������ա����ܡ����º���ܻ��ּ��㡢����ǿ�н�����
function storm_anotherday()
	local ndate = tonumber(GetLocalDate("%j%Y"))
	local nowyear = mod(ndate,10000)
	local nowday = floor(ndate/10000) + TB_STORM_DAYS[nowyear]

	--====���մ���====--
	local lastday = GetTask(STORM_TASKID_DAY)
	if (nowday <= lastday) then	--û�п��գ�������ʱ�䵹�ˣ���ֱ�ӷ���
		return nil
	else
		if (lastday>0) then	--����¼
			local loghead = "[STORM]"..lastday.."\t"..GetName().."\t"
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local gamemode = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_MODE])
					local extra = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_EXTRA])
					local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
					WriteLog(loghead..TB_STORM_DESCRIBE[i].."["..gamemode.."]\t"..extra.."\t"..point)
				end
			end
		end
		--�������
		for i = 1, STORM_GAMEID_MAX do
			if (TB_STORM_TASKID[i] ~= nil) then
				for j = 1, getn(TB_STORM_TASKID[i]) do
					SetTask(TB_STORM_TASKID[i][j],0)
				end
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			end
		end
		SetTask(STORM_TASKID_GAMES, 0)
		
		if (lastday + 1 == nowday) then	--ֻ��һ�죬��¼���ջ���
			nt_settask(STORM_TASKID_DAY_LASTPOINT, GetTask(STORM_TASKID_DAY_POINT))
			SetTask(STORM_TASKID_DAY_LASTAWARD, GetTask(STORM_TASKID_DAY_AWARD))
			debug_out("T�ch l�y h�m qua c�a b�n l�:"..GetTask(STORM_TASKID_DAY_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_DAY_LASTPOINT, 0)
			SetTask(STORM_TASKID_DAY_LASTAWARD, 1)	--����û�в���籩���û���֣��͵���������ˣ�
		end
		nt_settask(STORM_TASKID_DAY, nowday)
		nt_settask(STORM_TASKID_DAY_POINT, 0)
		SetTask(STORM_TASKID_DAY_AWARD, 0)
		SetTask(STORM_TASKID_GAMES, 0)
		SetTask(STORM_TASKID_TIPS, 0)
		nt_settask(STORM_TASKID_DATE, tonumber(GetLocalDate("%Y%m%d")))	--��¼���ڣ��������������ʾ
	end
	
	--====���ܡ����´���====--
	ndate = tonumber(GetLocalDate("%W%m"))
	local nowweek = floor(ndate/100) + TB_STORM_WEEKS[nowyear]
	local nowmonth = mod(ndate,100) + (nowyear-2005)*12
	if (tonumber(GetLocalDate("%d")) <= 2) then	--��ʱ��2��Ϊ�ֽ���
		nowmonth = nowmonth - 1
	end
	--�Ƿ����
	local lastweek = GetTask(STORM_TASKID_WEEK)
	if (nowweek ~= lastweek) then	--�п���
		if (lastweek + 1 == nowweek) then	--ֻ��һ�ܣ���¼���ܻ���
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, GetTask(STORM_TASKID_WEEK_POINT))
			debug_out("T�ch l�y tu�n tr��c c�a b�n l�:"..GetTask(STORM_TASKID_WEEK_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_WEEK, nowweek)
		nt_settask(STORM_TASKID_WEEK_POINT, 0)
		SetTask(STORM_TASKID_WEEK_AWARD, 0)
	end
	--�Ƿ����
	local lastmonth = GetTask(STORM_TASKID_MONTH)
	if (nowmonth ~= lastmonth) then	--�п���
		if (lastmonth + 1 == nowmonth) then	--ֻ��һ�£���¼���»���
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, GetTask(STORM_TASKID_MONTH_POINT))
			debug_out("T�ch l�y th�ng tr��c c�a b�n l�:"..GetTask(STORM_TASKID_MONTH_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_MONTH, nowmonth)
		nt_settask(STORM_TASKID_MONTH_POINT, 0)
		SetTask(STORM_TASKID_MONTH_AWARD, 0)
	end
	
	return 1
end

--���ָ���Ļ�Ʒ��Ƿ���Ȼ��Ч
--����1��Ч��nil��Ч����ʱ����գ�
function storm_valid_game(gameid)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local starttime = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START])
	if (starttime == 0) then	--�û�ļƷ���δ��ʼ�������Ѿ�������
		return nil
	end

	if (storm_anotherday()) then	--����һ�죬���Ч
		return nil
	end
	
	if (not storm_gametime(gameid, starttime, storm_gettime(gameid))) then	--���ʱ
		--storm_end(gameid, 1)
		return nil
	end
	
	return 1	
end

--����ĳһ��ļƷ֣����Ǳ���ģ����������ʹ��һЩ��صĺ�����Ӧ���죩
--gameid��	1~10	���ID
function storm_end(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end

	if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START]) == 0) then
		return nil
	end

	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], 0)

	if (not silent) then
		Say(storm_gamename(gameid, "red").."Khi�u chi�n Phong Ba �� k�t th�c. �i�m t�ch l�y Phong Ba hi�n c� l�:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), 0)
	else
		debug_out(storm_gamename(gameid).."Khi�u chi�n Phong Ba �� k�t th�c. �i�m t�ch l�y Phong Ba hi�n c� l�:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)))
	end
	
	return 1
end

--������תΪָ�����ȡ�����ɫ���ַ���
--len��	ָ�����ȣ�nilΪ���޶���0ΪĬ��ֵ
function storm_point2str(point, len)
	local str = tostring(point)
	if (len ~= nil) then
		if (len == 0) then
			len = 5
		end
		
		while (strlen(str) < len) do
			str = " "..str
		end
	end
	
	return "<color=yellow>"..str.."<color>"
end

--��������ɫ�Ļ����
function storm_gamename(gameid,color)
	if (color == nil) then
		color = "white"
	end
	return "[<color="..color..">"..TB_STORM_DESCRIBE[gameid].."<color>]"
end

function OnCancel()
end

Include("\\script\\event\\storm\\custom.lua")

