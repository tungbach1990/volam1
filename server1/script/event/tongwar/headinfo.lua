IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");
IL("BATTLE")


TONGWAR_LGTYPE = 10

--ս�ӳ�ԱTask
TONGWAR_LGMTASK_JOB = 1		--�ӳ�Ϊ1����ԱΪ0

--ս�ӹ���Task
TONGWAR_LGTASK_TONGCNT = 1	--��������
TONGWAR_LGTASK_WIN = 2			--ʤ������
TONGWAR_LGTASK_LOSE = 3			--ʧ�ܴ���
TONGWAR_LGTASK_TIE = 4			--ƽ�ִ���
TONGWAR_LGTASK_RESULT = 5		--�����ܻ���
TONGWAR_LGTASK_POINT = 6		--ÿ���������ۼ�
TONGWAR_LGTASK_CITYID = 7		--�ó���id
TONGWAR_LGTASK_CAMP = 8			--�ó�������Ӫ
TONGWAR_LGTASK_MAP = 9			--�óǱ���������ͼ
TONGWAR_LGTASK_RANK = 10		--������������
--11	�ƽ�֮��
--12	�Ի�֮�����
--13	���غ�����
--14	�����ؼ�
TONGWAR_LGTASK_TITLE = 15		--��������Ƿ���ȡ�˹⻷
TONGWAR_LGTASK_TONGID = 16		--�������ID
TONGWAR_LGTASK_SEASON = 17		--����
TONGWAR_LGTASK_ELDER = 18		--���Ͻ�������7��
TONGWAR_LGTASK_MASTER = 19		--������������1��
TONGWAR_LGTASK_MSTITLE = 20		--�����ƺ�
--21	ϴ�辭

--��ɫTask
TONGWAR_RLTASK_POINT = 2369
TONGWAR_RLTASK_NDEATH = 2370
TONGWAR_RLTASK_KILLPLAYER = 2371
TONGWAR_RLTASK_LASTDTIME = 2372
TONGWAR_RLTASK_CURRANK = 2373
TONGWAR_RLTASK_SERIESKILL = 2374
TONGWAR_RLTASK_MAXSERIESKILL = 2375
TONGWAR_RLTASK_MAXDEATH = 2376
TONGWAR_RLTASK_KEYNUMBER = 2377
TONGWAR_RLTASK_TOTALPOINT = 2378
TONGWAR_RLTASK_AWARD = 1737;	--BYTE1=season ��ȡ����ͨ����
								--BYTE2=��ʼ��Ϊ������������
								--BYTE3=�����ͳ��Ͻ���
								--BYTE4=��ʼ��Ϊseason

--ս�ӱ����������� �ƽ�֮��	�Ի�֮��	���ش���	�����ؼ�	ϴ�辭
LG_TASK_AWORD = {11, 12, 13, 14, 21};
PL_TEMPTASK_SECURITY = 193;

TV_LASTDEATHTIME = 2306	
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308
TV_SERIESKILL_REALY = 2305  --��ҵ�ǰ��ʵ����նֵ���߼�ɱ�Ƚϵͼ�����ң�����ն����������ʵ��ն��
--
-- TONG_MASTER = 3;

	
--BATTLE TASK---------------------
		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--�������ս�ֵ������ն��
		PL_SERIESKILL = 14			--��ҵ�ǰ����ն��
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 ��ʾ��ҵ�ǰ�Ĺ�ְ��Ŀǰʹ�õ�6�Ų���
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --��¼�����һ�βμ�ս�۵�ս����ˮ��
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--��¼��ұ�ս�۵��ܻ��֣��ܻ�����������μӵĸ���ս�ֵĻ����ܺ�, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48

		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14

--�����˴���	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V� L�m Truy�n Nh�n\n   <link>"
--����
TONGWAR_CITY = {"Ph��ng T��ng","Th�nh ��","��i L�","Bi�n Kinh","T��ng D��ng","D��ng Ch�u","L�m An",}
TONGWAR_CITYID = {['Ph��ng T��ng']=1,['Th�nh ��']=2,['��i L�']=3,['Bi�n Kinh']=4,['T��ng D��ng']=5,['D��ng Ch�u']=6,['L�m An']=7}
--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TONGWAR_CALENDAR = {
			format("<color=red>%s<color><color=yellow>|<color>L�m An vs T��ng D��ng<color=yellow>|<color>Bi�n Kinh vs D��ng Ch�u<color=yellow>|<color>\nTh�nh �� vs ��i L�<color=yellow>|<color>Ph��ng T��ng kh�ng thi ��u.", "06/04"),
			format("<color=red>%s<color><color=yellow>|<color>Ph��ng T��ng vs Bi�n Kinh<color=yellow>|<color>T��ng D��ng vs D��ng \nCh�u<color=yellow>|<color>L�m An vs ��i L�<color=yellow>|<color>Th�nh �� kh�ng thi ��u.", "07/04"),
			format("<color=red>%s<color><color=yellow>|<color>Th�nh �� vs L�m An<color=yellow>|<color>Ph��ng T��ng vs T��ng D��ng<color=yellow>|<color>\nD��ng Ch�u vs ��i L�<color=yellow>|<color>Bi�n Kinh kh�ng thi ��u.", "08/04"),
			format("<color=red>%s<color><color=yellow>|<color>Bi�n Kinh vs T��ng D��ng<color=yellow>|<color>Th�nh �� vs D��ng Ch�u<color=yellow>|<color>Ph��ng T��ng vs ��i L�<color=yellow>|<color>L�m An kh�ng thi ��u.", "09/04"),
			format("<color=red>%s<color><color=yellow>|<color>Ph��ng T��ng vs Th�nh ��<color=yellow>|<color>L�m An vs D��ng Ch�u<color=yellow>|<color>\nBi�n Kinh vs ��i L�<color=yellow>|<color>T��ng D��ng kh�ng thi ��u.", "10/04"),
			format("<color=red>%s<color><color=yellow>|<color>Th�nh �� vs Bi�n Kinh<color=yellow>|<color>Ph��ng T��ng vs L�m An <color=yellow>|<color>\nT��ng D��ng vs ��i L�<color=yellow>|<color>D��ng Ch�u kh�ng thi ��u.", "11/04"),
			format("<color=red>%s<color><color=yellow>|<color>Bi�n Kinh vs L�m An<color=yellow>|<color>Th�nh �� vs T��ng D��ng<color=yellow>|<color>\nPh��ng T��ng vs D��ng Ch�u<color=yellow>|<color>��i L� kh�ng thi ��u.", "13/04"),
			}
			
PHB_WULIN = 10227 --����ʮ������
PHB_CHENGSHI = {['Th�nh ��'] = 10228 ,--�ɶ�ʮ������
				['Ph��ng T��ng'] = 10229 ,--����ʮ������
				['Bi�n Kinh'] = 10230 ,--�꾩ʮ������
				['L�m An'] = 10231 ,--�ٰ�ʮ������
				['��i L�'] = 10232 ,--����ʮ������
				['T��ng D��ng'] = 10233 ,--����ʮ������
				['D��ng Ch�u'] = 10234 --����ʮ������
			}

TAB_AWORD_GOOD = 
		{
			{{tbProp={6,1,907 ,1},szName="Qu� Ho�ng Kim",nExpiredTime=10080}, {30, 15, 10, 10, 5, 5, 5}},	--�ƽ�֮�ֵĽ����б�
			--{{tbProp={6,1,1075,1},szName="L� h�p qu� huy ho�ng"}, {150, 100, 80, 60, 50, 30, 10}},	--�Ի�֮�ֵĽ����б�
			{{tbProp={6,1,2263,1},szName="T� Kim Ch�n ��n",tbParam={0,20}}, {8, 4, 2, 1, 0, 0, 0}},	--�Ͻ��浤��20�ڣ��Ľ����б�
			{{tbProp={6,1,2271,1},szName="V�n Ni�n Huy Ho�ng qu�"}, {80, 60, 50, 40, 30, 20, 10}},	--ǧ��Ի�֮���Ľ����б�
			--VLDNB 11 - Modified By DinhHQ - 20120507
			{{tbProp={6,1,30301,1},szName="H�n nguy�n ch�n ��n"}, {30, 20, 10, 5, 0, 0, 0}},			
			{{szName="Phi Phong C�p Ph� Quang (h�a gi�i s�t th��ng)",tbProp={0,3477},nQuality = 1,nExpiredTime=86400,}, {1, 0, 0, 0, 0, 0, 0}},	--��Գ��Ľ����б�
			
			
--		{{6, 1, 1074, TONGTASK_AWORD_SMDHB, "���ش������"}, {80, 50, 30, 20, 15, 10, 5}},	--���ش����Ľ����б�
--		{{6, 1, 26, TONGTASK_AWORD_CBT, "�����ؼ�"}, {15, 10, 8, 6, 5, 3, 1}},	--�����ؼ��Ľ����б�
--		{{6, 1, 22, TONGTASK_AWORD_CBT, "ϴ�辭"}, {15, 10, 8, 6, 5, 3, 1}},	--ϴ�辭�Ľ����б�
		}

function tongwar_contribute(szPlayerName, szCityName, nRecord)--�������а�
	--addrecord totalrecord
	--ladder_(ncity, record)   taskvalue
	--ladder_(record)
	--1.�����˻��ּӵ��������а���������а���ȥ��
	if (not szCityName or not szPlayerName) then
		return
	end;
	local taskid_record;
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
--	nPlayerRecord = nPlayerRecord + nRecord;
--	SetTask(TONGWAR_RLTASK_TOTALPOINT, nPlayerRecord);
	if (tongwar_citynamecheck(szCityName)) then
		Ladder_NewLadder(PHB_CHENGSHI[szCityName], szPlayerName, nPlayerRecord, 0);
		Ladder_NewLadder(PHB_WULIN, szPlayerName, nPlayerRecord, 0);
	end;
	
end;

function tongwar_citynamecheck(szCityName)
	local bIsCity = 0;
	local i;
	for i = 1, getn(TONGWAR_CITY) do
		if (szCityName == TONGWAR_CITY[i]) then
			bIsCity = 1;
			break;
		end;
	end;
	return bIsCity;
end;

