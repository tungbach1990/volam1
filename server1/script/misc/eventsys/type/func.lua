Include("\\script\\misc\\eventsys\\eventsys.lua")
local tbEvent = 
{
	["YanDiBaoZang"] = 
	{
		"OnEnter",
		"OnPass",
		"OnLastBigBossDeath",
	},
	["ChuanGuan"] = 
	{
		"OnEnter",
		"OnPass"
	},
	["SongJin"] = 
	{
		"OnFinish",
		"BattlePointRank",		--������������
		"OnKillPlayer",			--ɱ�� 	--nDeathPlayerIndex, nKillCount, nSeriesKill
		"ProtectMarshal",		--������Ԫ˧
	},
	["FengLingDu"] = 
	{
		"OnBoard",
		"OnLanding",
		"OnFinishShuiZeiTask",	--���ˮ������
		"OnShuiZeiDeath",	--ˮ������
	},
	["Messenger"] = 
	{
		"OnFinish"
	},
	["KillerBoss"] = 
	{
		"OnFinish",		--ɱ��booss���Ǹ��������
		"OnKillBoss",	--���һ��ɱ��boss���Ǹ���
	},
	["LeagueMatch"] = 
	{
		"MatchResult",	--��������һ��, nType, nLevel, nResult
	},
	
	["SwordBurialMaze"] = 
	{
		"OnSingleFinish",	--(����)ͨ��
		"OnSinglePass",		--(����)���һ������, nPassRoomCount, nTaskId
		"OnTeamFinish",		--(����)ͨ��
		"OnTeamPass",		--(����)���һ������, nPassRoomCount, nTaskId
	},
	
	["LongMenExpress"] = 
	{
		"OnFinish",
	},
	["SevenCity"] = 
	{
		"OnFinish",
		"OnKillPlayer",		--nDeathPlayerIndex, nKillCount
	},
	["TongCastle"] = 
	{
		"OnFinish",
		"OnKillPlayer",		--nDeathPlayerIndex, nKillCount
	},
	["Fuli"] = 
	{
		"OnFinish",			--���� nResult(0��, 1ʤ, 3ƽ), nPoint(����)
		"OnKillPlayer",		--ɱ�� 	--nDeathPlayerIndex, nKillCount, nSeriesKill
	},
	["SiGuoYa"] = 
	{
		"OnPickFragment",	--ʰȡ��Ƭ  nPickCount, nTodayCount
	},
	["BloodyBattle"] = 
	{
		"OnFinish",
		"OnFastFinish",
		"OnCampPointFinish",
		"OnConKillTop",
		"PersonPointRank",
		"ConKillRank",
		"OnGetPrize",
	},
	
	["WuLinMengZhu"] = 
	{
		"OnFinishTask",
	},
	
	["WorldBoss"] = 
	{
		"OnLiBaiBossDeath", --���BOSS
		"OnBossDeath", --ʮ��ƽ�BOSS����
	},
	
	["TongGuTaAward"] = 
	{
		"OnOpenGoldBox",
	},
	
	["OpenFuncAwardBox"] = 
	{
		"OpenAwardBoxEvent",
	},
}

for key, value in tbEvent do
	EventSys:NewType(key)
end