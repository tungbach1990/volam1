Include("\\script\\event\\change_destiny\\head.lua");

function main(nItemIndex)
	return tbChangeDestiny:onUse(nItemIndex);
end


function tbChangeDestiny:onUse(nItemIndex)
	
--	if self:isCarryOn() ~= 1 then
--		Say("��������������ɢ�ˡ�����", 0 );
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		Say("Ch� c� ng��i ch�i chuy�n sinh l�n 1 c� c�p 160 ��n 179 m�i c� th� s� d�ng!", 0 );
		return 1;
	end
	
	local nHasAward	= self:getTask(self.nTask_GaiMing_HasReceive);
	local nHasUsed	= self:getTask(self.nTask_GaiMing_HasUsed);
	
	if nHasAward ~= 1 then
		Say("V�t n�y lai l�ch kh�ng r� r�ng, t�t nh�t l� ng��i ��ng n�n s� d�ng.", 0 );
		return 1;
	end
	
	if nHasUsed ~= 0 then
		Say("V�t ph�m n�y ti�m l�c r�t m�nh, d�ng nhi�u s� kh�ng t�t cho s�c kh�e.", 0 );
		return 1;
	end
	
	local nOldSkill = GetSkillMaxLevelAddons();
	local nNewSkill = nOldSkill + self.nLimit_AddSkill;
	
	SetSkillMaxLevelAddons(nNewSkill);
	self:setTask(self.nTask_GaiMing_HasUsed, 1);
	
	local szMsg = format("[ChangeDestiny]Eat GaiMingJue: %s Use GaiMingJue and add skill from %d to %d.",GetName(), nOldSkill, nNewSkill);
	WriteLog(szMsg);
	
	Say(format("��i hi�p �� s� d�ng ngh�ch thi�n c�i m�nh quy�t, �i�m k� n�ng ���c t�ng th�m t� %d ��n %d.", nOldSkill, nNewSkill), 0);
	return 0;
end

