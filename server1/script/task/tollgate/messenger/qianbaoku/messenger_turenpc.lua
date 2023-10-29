-------------------------------------------------------------------------
-- FileName		:	messenger_turenpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 10:46:14
-- Desc			:   ǧ����ؿ��ĳ��ڴ��Ի�npc������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");   --����ͬ�����������ɵĿ����ж�
Include("\\script\\activitysys\\g_activity.lua")			--�������
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")		--�������

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>V� n�y anh h�ng, t�m ta c� chuy�n g� kh�ng?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)

	tbDailog:AddOptEntry("Ta mu�n �i ra ngo�i",messenger_main);
	
	--�����Ի���
	tbDailog:Show()
end

function messenger_main()
--	local Uworld1206 = nt_getTask(1206)
	local name = GetName()

	if ( messenger_middletime() == 10 ) then
		Msg2Player("Th�t xin l�i ! "..name.."! th�i gian nhi�m v� t�n s� �� h�t, nhi�m v� th�t b�i !.")
		losemessengertask()
	else
		Describe(DescLink_XiaoZhen..":"..name..",c� ph�i hay kh�ng ng��i �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m ? c�n r�i �i quan t�p sao?"
			,3
		,"Ta mu�n r�i �i /messenger_comeback" 
                ,"Ta c�n kh�ng ho�n th�nh kh�o nghi�m, ta mu�n �i ra ngo�i m�t h�i /messenger_icantdo" 
                ,"Ta c�n mu�n ti�p t�c th� m�t ch�t/no")	
		
		if ( Uworld1206 == 0 ) then 
                          Describe(DescLink_XiaoZhen..":"..name.." ,Ng��i c� ph�i hay kh�ng �� th�ng qua thi�n b�o kho kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y, ta ph�i ra kh�i quan/messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c/no") 
                elseif ( Uworld1206 == 1 ) then 
                          Describe(DescLink_XiaoZhen..": M�c b�i t�n s� "..name..", ng�i l� kh�ng ph�i l� �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y, ta ph�i ra kh�i quan /messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c /no") 
                elseif ( Uworld1206 == 2 ) then 
                          Describe(DescLink_XiaoZhen..": ��ng b�i t�n s� "..name.." ��i nh�n ! ng�i l� kh�ng ph�i l� �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y, ta ph�i ra kh�i quan /messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c /no") 
                elseif ( Uworld1206 == 3 ) then 
                          Describe(DescLink_XiaoZhen..": Ng�n b�i t�n s� "..name.." ��i nh�n ! kh� c�c ng�i k�o ! ng��i c� ph�i hay kh�ng �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y , Ta ph�i ra kh�i quan /messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c /no") 
                elseif ( Uworld1206 == 4 ) then 
                          Describe(DescLink_XiaoZhen..": Kim b�i t�n s� "..name.." ��i nh�n ! l�n nh� v�y th�t xa ��ch ch�y t�i th�t l� lao ng�i ph� t�m, ng�i b�y gi� l� kh�ng ph�i l� �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y, ta ph�i ra kh�i quan /messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c /no") 
                elseif ( Uworld1206 == 5 ) then 
                         Describe(DescLink_XiaoZhen..": Ng� t� kim b�i t�n s� "..name.." ��i nh�n ! ta c�n cho t�i b�y gi� ch�a t�ng th�y ng� t� kim b�i ��y, h�m nay coi l� m� r�ng t�m m�t li�u ! ng�i th�t l� l�i h�i. Ng�i l� kh�ng ph�i l� �� th�ng qua thi�n b�o kho ��ch kh�o nghi�m, c�n xu�t quan ? ",3,"��ng v�y, ta ph�i ra kh�i quan /messenger_comeback","Ta kh�ng xong th�nh kh�o nghi�m, b�t qu� ta kh�ng mu�n ti�p t�c l�m /messenger_icantdo","Kh�ng ph�i l�, ta c�n mu�n n�a ng� ng�c /no") 
                end
	end
end

function messenger_comeback()
	if check_task_state()==30 then
		nt_setTask(1203,30)  --ǧ��������������������Ϊ�������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1215,0)  --bossˢ�ֿ���
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--���ݾȳ������������Ӧ����
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*16;
				nt_setTask(3000,Uworld1214*16+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*18;
				nt_setTask(3000,Uworld1214*18+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*24;
				nt_setTask(3000,Uworld1214*24+Uworld3000)		
			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by Сɽ
		if (nBeishu > 0) then--by Сɽ
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Сɽ
		end;
		tongaward_message(nRealjifen);	--by Сɽ
		
		nt_setTask(1203,30)

		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1211,0)
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
--		taskProcess_002_08:doTaskEntity()
		SetDeathScript("");
		
--		local n_level = GetLevel();
--		G_ACTIVITY:OnMessage("FinishMail", 3, n_level);
		
		SetPos(1414,3197);
	else
		Describe(DescLink_XiaoZhen..": Th�t xin l�i, tr��c m�t ng��i c�n ch�a ho�n th�nh x�ng quan m�c ti�u, � thi�n b�o kho tr�n b�n ��, ng��i c�n d�a theo nhi�m v� tr�t t� m� ra 5 c� b�o r��ng m�i c� th� coi nh� l� qu� quan.",1,"K�t th�c ��i tho�i/no")
	end
end

function messenger_icantdo()
	if nt_getTask(1203) ==25 then
		Talk(1, "", "Nhi�m v� c�a ng��i �� ho�n th�nh, n�u kh�ng ta tr�c ti�p ��a ng��i xu�t quan �i.")
		messenger_comeback()
	else
		Describe(DescLink_XiaoZhen..": Ng��i quy�t ��nh �i ra ngo�i sao ? nhi�m v� kh�ng ho�n th�nh nh� c� c� th� tr� v� t�i, b�t c� l�c n�o ��u ���c !",2,"Ta mu�n r�i �i /q_fallmessengertask","�� cho ta/no")
	end
end

function q_fallmessengertask()
	local Uworld1207 = nt_getTask(1207)  --��ʹ����ǰɱ�ּ�����
	local Uworld1204 = nt_getTask(1204)  --�������������ص��������
	local Uworld1214 = nt_getTask(1214)  --�����Ů����
	local name = GetName()
	
		nt_setTask(1203,25)  --ǧ��������������������Ϊ���������״̬
		nt_setTask(1213,0)  --˫������ʱ��
		nt_setTask(1215,0)  --bossˢ�ֿ���
		local nRealjifen = 0;
		if ( Uworld1214 ~= 0 ) then
			--���ݾȳ������������Ӧ����
			if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
				AddOwnExp(50000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
               			nRealjifen = Uworld1214*16;
				nt_setTask(3000,Uworld1214*16+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
				AddOwnExp(100000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)
				nRealjifen = Uworld1214*18;
				nt_setTask(3000,Uworld1214*18+Uworld3000)
			elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
				AddOwnExp(150000*Uworld1214)
				local Uworld3000 = nt_getTask(3000)				
                                nRealjifen = Uworld1214*24;
				nt_setTask(3000,Uworld1214*24+Uworld3000)		

			end				 
			nt_setTask(1214,0)
		end
		local nBeishu = greatnight_huang_event(2);--by Сɽ
		if (nBeishu > 0) then--by Сɽ
			nOrgRealjifen = floor(nRealjifen / nBeishu);--by Сɽ
		end;
		tongaward_message(nRealjifen);	--by Сɽ

		nt_setTask(1203,25)  --ǧ��������������������Ϊ���������״̬

		DisabledUseTownP(0)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬
		nt_setTask(1203,21)--��ʱ�ж�����
		SetPunish(1)
		SetCreateTeam(1);
		SetPKFlag(0)
		ForbidChangePK(0);
		SetDeathScript("");
		SetPos(1414,3197);
end

function no()
end
