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

SKILLS = {
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

--========�ඨ��====================================--
--������EPlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	ȫ��ȫ���������弶��ľ��幦��
--��Ա������
--��Ա������
--.GiveTask()
--.PlayerLevelUp()
--==================================================--
EPlayerLevelUp = {
--========��������==================================--
--����ԭ�Σ�.GiveTask()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	����ҷ�����弶����
--==================================================--
	GiveTask = function()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			Talk(1,"","Xin l�i! Th�i gian ho�t ��ng �� h�t r�i!")
			return
		end
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if (flag == TKVAL_PLAYERLEVELUP_OPEN) then
			Talk(1,"","C� ph�i ng��i �� b�o danh tham gia 'Ho�t ��ng luy�n c�p' kh�ng? Sao l�i c�n ��n ��y?")
			return
		end
		local level = GetLevel()
		if(	level > 49 and level < 71 ) then
			SetTask(TKID_PLAYERLEVELUP,TKVAL_PLAYERLEVELUP_OPEN)
			Talk(1,"","Ng��i �� b�o danh tham gia ho�t ��ng luy�n c�p. C� g�ng th�ng c�p ��n c�p 80 �i!")
			Msg2Player("B�n �� ti�p nh�n nhi�m v� luy�n c�p, h�y mau �i luy�n c�ng!")
			return
		end
		Talk(1,"","Xin l�i! ��ng c�p c�a b�n kh�ng ph� h�p tham gia 'Ho�t ��ng luy�n c�p'!")
		return
	end,
--========��������==================================--
--����ԭ�Σ�EPlayerLevelUp.OnLevelUp()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	�μӻ����ң�ÿ��һ�����õ�2Сʱ���鷭��
--==================================================--
	OnLevelUp = function ()
		if not validateDate(DATESPLAYERLEVELUP,DATEEPLAYERLEVELUP) then
			return
		end
		local level = GetLevel()
		local flag = GetTask(TKID_PLAYERLEVELUP)
		if(flag == TKVAL_PLAYERLEVELUP_OPEN) then
			if(level < 80 and level > 49 ) then
				EPlayerLevelUp.payDoubleExp()
				return	
			elseif(level == 80) then
				EPlayerLevelUp.payAdvSkills()
			end
		end
	end,
	
	payDoubleExp = function()
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461,1, 1,2*60*60*18)
		Msg2Player("Ch�c m�ng b�n trong ch��ng tr�nh 'Ho�t ��ng luy�n c�p' �� ���c th�ng c�p, ph�n th��ng h� th�ng t�ng cho b�n l� t�ng ��i �i�m kinh nghi�m trong 2 gi�.")
	end,
	
	payAdvSkills = function()
		local faction = GetLastFactionNumber()
		if(faction ~= -1) then
			for i=1,getn(SKILLS[faction+1]) do
				AddMagic(SKILLS[faction+1][i][1],SKILLS[faction+1][i][2])
			end
			Msg2Player("Ch�c m�ng b�n l�n n�y t�i 'Ho�t ��ng luy�n c�p' th�nh c�ng ho�n th�nh nhi�m v�, ��ng th�i h�c ���c k� n�ng c�p 90")
			AddGlobalNews("M�i ng��i c�ng nhau ch�c m�ng"..GetName().."Trong ch��ng tr�nh 'Ho�t ��ng luy�n c�p' �� th�nh c�ng ho�n th�nh nhi�m v�, ��ng th�i l�nh ng� ���c k� n�ng c�p 90")
			return
		end
		Msg2Player("Ch�c m�ng b�n trong ch��ng tr�nh 'Ho�t ��ng luy�n c�p' th�nh c�ng ho�n th�nh nhi�m v�.")
	end,
}

--========��������==================================--
--����ԭ�Σ�PlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	��ٿ�����ĶԻ�
--������
--����ֵ��
--������
--==================================================--
function BTNPlayerLevelUp()
	local msg = "Hoan ngh�nh tham gia 'Ho�t ��ng luy�n c�p'. Ng��i ch�i c�p 50 ��n c�p 70 ��u c� th� b�o danh tham gia, ch� c�n trong th�i gian ho�t ��ng ��ng c�p t�ng ��n c�p 80, th� l�p t�c h�c ���c c�c k� n�ng c�p 90"
	local btns = {
		"Ta mu�n b�o danh tham gia/JoinPlayerLevelUp",
		"Ta mu�n t�m hi�u r� h�n/AboutPlayerLevelUp"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

--========��������==================================--
--����ԭ�Σ�JoinPlayerLevelUp
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	�����μӻ
--==================================================--
function JoinPlayerLevelUp()
	EPlayerLevelUp.GiveTask()
end

--========��������==================================--
--����ԭ�Σ�AboutPlayerLevelUp()
--���ߣ�yfeng
--�������ڣ�2005-3-21
--����޸����ڣ�
--����������
--	���ڳ����Ľ���
--==================================================--
function AboutPlayerLevelUp()
	local msg = ": ��ng c�p t� 50 ��n 70 (Bao g�m c� c�p 50 v� 70) c� th� ��n L� Quan b�o danh tham gia 'Ho�t ��ng luy�n c�p'. L� Quan s� h��ng d�n m�c ti�u c�c nhi�m v� 80. Trong th�i gian b�o danh tham gia ��ng c�p ng��i ch�i m�i khi l�n m�t c�p, c� th� nh�n t�ng ��i �i�m kinh nghi�m trong 2 gi� (Sau khi ch�t, s� m�t �i hi�u qu� nh�n ��i) , ��n khi ��t ��ng c�p 80, sau khi �� ��t ���c m�c ti�u luy�n c�p, ng��i ch�i s� h�c ���c k� n�ng c�p 90 (Tr� t�n m�u tr�ng ra) ."
	local btns ={
		"Tr� l�i/BTNPlayerLevelUp",
		"��ng/Quit",
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end

