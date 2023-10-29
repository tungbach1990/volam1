-------------------------------------------------------------------------
-- FileName		:	enemy_flynpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-07 10:23:14
-- Desc			:   ��֮��ؿ��ĳ��ڴ��Ի�npc����֮�ｫ����
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--�������
Include("\\script\\activitysys\\playerfunlib.lua")		--�������

function main()
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	
	if ( messenger_middletime() == 10 ) then 
               Msg2Player("Th�t xin l�i ! "..name.."! ng��i �� kh�ng c�n th�i gian nhi�m v� t�n s�, nhi�m v� th�t b�i !.") 
               losemessengertask() 
       else 
            if ( Uworld1206 == 0 ) then 
                Describe(DescLink_BaiYi..":"..name..", Ng��i kh�ng ph�i l� �� xuy�n qua phong k� khi�u chi�n sao ? Ngh� ra quan a ?",3,"Ta mu�n r�i �i/messenger_comeback","Ta v�n ch�a ho�n th�nh kh�o nghi�m, nh�ng kh�ng th� ti�p t�c l�m/messenger_icantdo","Kh�ng ph�i, ta c�n mu�n ti�p t�c l�m/no") 
            elseif ( Uworld1206 == 1 ) then 
                Describe(DescLink_BaiYi..": T�n s� l�nh - m�c "..name..", ng��i kh�ng ph�i l� �� xuy�n qua phong k� khi�u chi�n sao ? Ngh� ra quan a ?",3,"Ta mu�n r�i �i /messenger_comeback","Ta kh�ng ho�n th�nh kh�o nghi�m, nh�ng l� kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n ti�p t�c/no") 
            elseif ( Uworld1206 == 2 ) then 
                Describe(DescLink_BaiYi..": T�n s� l�nh - ��ng "..name.." ��i nh�n, c� ph�i hay kh�ng ng��i �� qua li�u phong k� ��ch khi�u chi�n ? Ngh� ra quan ph�i kh�ng ?",3,"Ta mu�n r�i �i /messenger_comeback","Ta kh�ng ho�n th�nh kh�o nghi�m, nh�ng l� kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l� , ta c�n mu�n ti�p t�c /no") 
            elseif ( Uworld1206 == 3 ) then 
                Describe(DescLink_BaiYi..": T�n s� l�nh - ng�n "..name.." ��i nh�n, c� ph�i hay kh�ng ng��i �� qua li�u phong k� ��ch khi�u chi�n ? Ngh� ra quan ph�i kh�ng ?",3,"Ta mu�n r�i �i /messenger_comeback","Ta kh�ng ho�n th�nh kh�o nghi�m, nh�ng l� kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l� , ta c�n mu�n ti�p t�c /no") 
            elseif ( Uworld1206 == 4 ) then 
                Describe(DescLink_BaiYi..": T�n s� l�nh - kim "..name.." ��i nh�n, c� ph�i hay kh�ng ng��i �� qua li�u phong k� ��ch khi�u chi�n ? Ngh� ra quan ph�i kh�ng ?",3,"Ta mu�n r�i �i /messenger_comeback","Ta kh�ng ho�n th�nh kh�o nghi�m, nh�ng l� kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l� , ta c�n mu�n ti�p t�c /no") 
            elseif ( Uworld1206 == 5 ) then 
                Describe(DescLink_BaiYi..": Ng� t� kim b�i - kim "..name.." ��i nh�n, ta ch�a th�y qua ng� t� kim b�i, h�m nay coi nh� l� m� r�ng ra nh�n gi�i. Ng��i th�t l� l�i h�i. Ng��i �� qua li�u phong k� ��ch khi�u chi�n, ngh� ra quan ph�i kh�ng ?",3,"Ta mu�n r�i �i /messenger_comeback","Ta kh�ng ho�n th�nh kh�o nghi�m, nh�ng l� kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Ta c�n mu�n ti�p t�c /no") 
            end 
       end
end

function messenger_comeback()
	if ( nt_getTask(1207) >= 5 ) then
		nt_setTask(1201,30)  --��֮������������������Ϊ�������״̬
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
		taskProcess_002_06:doTaskEntity()  --ͬ���������
		SetDeathScript("");
		
		local n_level = GetLevel();
		G_ACTIVITY:OnMessage("FinishMail", 1, n_level);
		
		SetPos(1563,3118);
	else
		Describe(DescLink_BaiYi..": Th�t xin l�i, ng��i kh�ng v��t qua ki�m tra, � phong k� tr�n b�n �� �t nh�t ng��i mu�n x�c ��nh <color=red>5 c�i t�a ��<color> m�i c� th� v��t qua ki�m tra.",1,"K�t th�c ��i tho�i /no")
	end
end

function messenger_icantdo()
	    Describe(DescLink_BaiYi..": Ng��i ngh� r�i �i ph�i kh�ng ? N�u nh� kh�ng ho�n th�nh nhi�m v� li�n r�i �i, ng��i c�ng c� th� ��n d�ch quan n�i �� ��ng nhi�m v� c�ng nh�n th��ng, nh�ng l�, ph�n th��ng s� �t �i r�t nhi�u. ",2,"Ta mu�n r�i �i /f_fallmessengertask","�� cho ta mu�n /no")
end

function f_fallmessengertask()	
		nt_setTask(1201,25)  --��֮������������������Ϊ���������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1214,0)  --�����ֿ���
		nt_setTask(1215,0)  --bossˢ�ֿ���
		nt_setTask(1211,0)
		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1563,3118);
end


function no()
end
