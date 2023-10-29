--========�ļ�����==================================--
--�ļ�����/script/event/playerlvlup/event.lua
--���ߣ�yfeng
--�������ڣ�2005-3-31
--����޸����ڣ�
--����������
--	ȫ��ȫ������弶�ж�
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--
if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_PLAYERLEVELUP = 1081	--���������ţ���¼�弶��ĸ���״̬
TKVAL_PLAYERLEVELUP_OPEN = 1 --�μӳ弶�

SKILLS_TEMP_90 = {
	{	{318,1},{319,1},{321,1}}, --����
	{	{322,1},{323,1},{325,1}}, --����
	{	{339,1},{302,1},{342,1},{351,0}}, --����
	{	{353,1},{355,1},{390,0}}, --�嶾
	{	{328,1},{380,1},{332,0}}, --����
	{	{336,1},{337,1}}, --����
	{	{357,1},{359,1}}, --ؤ��
	{	{361,1},{362,1},{391,0}}, --����
	{	{365,1},{368,1}}, --�䵱
	{	{372,1},{375,1},{394,0}}, --����
}
function OnLevelUp_Temp()
	--��ȫ������弶�ж�������������񶼿�����ϰ��90�����ܣ������ܻ�þ��鷭��
	local flag = GetTask(TKID_PLAYERLEVELUP)
	if(flag ~= TKVAL_PLAYERLEVELUP_OPEN ) then
		return
	end
	
	local faction = GetLastFactionNumber()
	if(faction == -1) then
		return
	end
	
	local level = GetLevel()
	if ( level < 80) then
		return
	end
	
	local mark = 0
	for i=1,getn(SKILLS_TEMP_90[faction+1]) do
		if ( HaveMagic(SKILLS_TEMP_90[faction+1][i][1]) < SKILLS_TEMP_90[faction+1][i][2] ) then
			AddMagic(SKILLS_TEMP_90[faction+1][i][1],SKILLS_TEMP_90[faction+1][i][2])
			mark = mark + 1
		end
	end
	if (mark == 0) then
		return
	end
	Msg2Player("Ch�c m�ng b�n l�n n�y t�i 'Ho�t ��ng luy�n c�p' th�nh c�ng ho�n th�nh nhi�m v�, ��ng th�i h�c ���c k� n�ng c�p 90")
	return
end