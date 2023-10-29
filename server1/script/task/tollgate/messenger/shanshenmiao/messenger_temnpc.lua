-------------------------------------------------------------------------
-- FileName		:	messenger_temnpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:29:14
-- Desc			:   ɽ����ؿ��ĳ��ڴ��Ի�npc���������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--��༭��
Include("\\script\\activitysys\\playerfunlib.lua")		--��༭��

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		if ( Uworld1206 == 0 ) then
			Describe(DescLink_NaLanQingCheng..":"..name..", c� ph�i �� qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")	
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_NaLanQingCheng..": T�n S� L�nh - M�c"..name..", c� ph�i �� qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_NaLanQingCheng..": T�n s� l�nh - ��ng"..name.."C� ph�i ng��i �� tr�i qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_NaLanQingCheng..": T�n s� l�nh - B�c"..name.."v�t v� cho ng��i qu�! C� ph�i �� tr�i qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_NaLanQingCheng..": T�n s� l�nh - V�ng"..name.."Ng��i t� xa t�i v�t v� nh�, c� ph�i �� tr�i qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_NaLanQingCheng..": Ng� T� l�nh b�i - V�ng"..name.."Tr��c gi� ta ch�a th�y qua Ng� T� Kim B�i bao gi�, h�m nay xem nh� ���c m� t�m nh�n! Ng��i ��ng l� l�i h�i. C� ph�i ng��i �� tr�i qua kh�o nghi�m Mi�u S�n Th�n kh�ng, mu�n r�i kh�i �h?",3,"��ng! Ta mu�n r�i kh�i/messenger_comeback","Ta ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng mu�n ti�p t�c l�m n�a/messenger_icantdo","Kh�ng ph�i! Ta c�n mu�n th� ti�p/no")
		end
	end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 2 ) then
		nt_setTask(1202,30)  --ɽ��������������������Ϊ�������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		taskProcess_002_07:doTaskEntity()
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 2, n_level);
		
		SetPos(1337,3154);
	else
		Describe(DescLink_NaLanQingCheng..": Xin l�i!   b�n ch�a ho�n th�nh c�a �i ph�a tr��c, t�i b�n �� Mi�u S�n Th�n b�n ph�i h� �t nh�t <color=red>hai t�n �ao Y�u<color> m�i t�nh qua �i.",1,"K�t th�c ��i tho�i/no")
	end
end

function messenger_icantdo()
	Describe(DescLink_NaLanQingCheng..": C� ph�i b�n mu�n r�i kh�i, n�u ch�a ho�n th�nh nhi�m v� m� r�i kh�i, b�n c�ng c� th� ��n D�ch Quan giao tr� nhi�m v� v� nh�n ph�n th��ng nh�ng ph�n th��ng s� gi�m xu�ng r�t nhi�u.",2,"��ng! Ta mu�n r�i kh�i/s_fallmessengertask","�� ta ngh� l�i xem sao/no")

end

function s_fallmessengertask()
		nt_setTask(1202,25)  --ɽ��������������������Ϊ�����״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1337,3154);
end

function no()
end