-------------------------------------------------------------------------
-- FileName		:	messenger_turerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ǧ�������
-------------------------------------------------------------------------

Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���

Include("\\script\\lib\\common.lua");

Include("\\script\\activitysys\\functionlib.lua")--����lib:DoFunByPlayer

function main()
	local tbDialog =
	{
		--"��������/ture_gettask",
		"B�t ��u nhi�m v� /ture_try_starttask",
		"Ti�p t�c nhi�m v�/ture_continuetask",
	  	"R�i kh�i khu v�c/ture_movecity",
	  	"L�t n�a quay l�i /no",
	}
--	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "��ǧ�����ͼ������/birthday0905_ture");
--	end
	 Describe(DescLink_YiGuan..": T� ch� c�a ta ��y b�t ��u ph�n c�ng nhi�m v� c� th� cho ng��i, c� l�n nh�. T� ��i do ��i tr��ng b�t ��u nhi�m v� th� c�ng d� ho�n th�nh nhi�m v� h�n. B�y gi� ng��i mu�n l�m g� ��y ?",getn(tbDialog), unpack(tbDialog))
end

--function ture_gettask()
--	local Uworld1204 = nt_getTask(1204)  --��¼��ҵ����������ÿ���������ʱ���
--	local Uworld1028 = nt_getTask(1028)  --�������������
--
--	if ( GetLevel() < 120 ) then
--		Describe(DescLink_YiGuan.."���Բ�������ǰ�ȼ�û�дﵽ��С��120��Ҫ����ﵽ�ȼ��������Ұɡ�",1,"�����Ի�/no")	
--	elseif ( Uworld1204 ~= 0 )  then
--		Describe(DescLink_YiGuan.."���Բ�������ǰ����ʹ����δ��ɣ����ܽ�ͬ��������������ɸ�����лл��",1,"�����Ի�/no")
--	elseif (  messenger_givetime() == 10 ) then  --�鿴�����Ƿ��йؿ�ʱ��
--		Describe(DescLink_YiGuan.."���Բ�������������ʹ�����е�ʱ���Ѻľ�������������,лл��",1,"�����Ի�/no")
--	else
--		nt_setTask( 1204,1 )
--		nt_setTask( 1203,10) --������ʹ����Ĳ���
--	end
--end

--function ture_starttask()
--	if ( nt_getTask(1203) == 10 ) then
--		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
--		nt_setTask(1203,20)
--		DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
--		SetFightState(1);			--��ս��״̬				--1����	--0���ر�
--		SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
--		SetPunish(0);				--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
--		SetCreateTeam(1);			--�������					--1���������		--0�����������
--		ForbidChangePK(1);   		--���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
--		SetPKFlag(0);               --����Ϊ����ģʽ            
--		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
--		SetPos(1414,3191);
--		Msg2Player("����ʼ��ʱ��")
--	elseif ( nt_getTask(1203) == 20 ) then
--		Describe(DescLink_YiGuan.."�����Ѿ���ʼ�����������ٿ�ʼ�ա�",1,"�����Ի�/no")
--	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
--		Describe(DescLink_YiGuan.."�����Ѿ������������ô��Ҫ��ʼ�����أ������뿪�ɡ�",1,"�����Ի�/no")
--	elseif ( nt_getTask(1203) == 0 ) then
--		Describe(DescLink_YiGuan.."�������ʹ�����Ѿ�ʧ�ܣ��������뿪��",1,"�����Ի�/no")
--	end
--end

function ture_try_starttask()
	if ( nt_getTask(1203) == 10 ) then
		--�Լ���ʼ����
		local nTeamSize = GetTeamSize();
		if nTeamSize > 1 and IsCaptain() ~= 1 then
			Describe(DescLink_YiGuan..": Ng��i kh�ng ph�i ��i tr��ng, kh�ng th� b�t ��u nhi�m v�.",1,"K�t th�c ��i tho�i/no")
			return
		end
		
		local nTaskCode,_ = %get_task_order()
		ture_real_starttask_one(nTaskCode);
		
    	if (nTeamSize > 1) then
    		--���ж�Ա��ʼ����
    		for i=1,nTeamSize do
    			local nMemberIndex = GetTeamMember(i)
    			print(format("nMemberIndex:%d", nMemberIndex))
    			if nMemberIndex >= 0 then
    			
--    			if(CallPlayerFunction(nMemberIndex, IsCaptain)~=1)then
--    				CallPlayerFunction(nMemberIndex, ture_real_starttask_member, nTaskCode)
--    			end
        			if(lib:DoFunByPlayer(nMemberIndex, IsCaptain)~=1)then
    					lib:DoFunByPlayer(nMemberIndex, ture_real_starttask_member, nTaskCode);
    				end
    			else
    				print(format("nMemberIndex:%d error", nMemberIndex))
				end
    		end
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] b�t ��u nhi�m v� T�n S�, nh�n s� t� ��i l� [%d]",
			GetAccount(),
			GetName(),
			nTeamSize
			)
		);
	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
		Describe(DescLink_YiGuan..": Ng��i �� b�t ��u nhi�m v�, kh�ng c�n ph�i l�i b�t ��u n�a.",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� c�a ng��i �� ho�n th�nh, sao l�i ph�i b�t ��u n�a ? Nhanh ch�n r�i kh�i ��y �i.",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v� T�n s� r�i! Nhanh ch�n r�i kh�i ��y �i!",1,"K�t th�c ��i tho�i/no")
	end
end

function ture_real_starttask_one(nTaskCode)
	nt_setTask(1202,0)--��յ�ǰ�������
	ture_real_starttask(nTaskCode)
	
	local szMsg,nCount = get_task_string(nTaskCode)
	szMsg = format("Ng��i b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, h�y n�m b�t th�i gian �i m� 5 B�o R��ng ho�n th�nh nhi�m v� �i, h�y ch� � m� ��ng th� t�: <color=yellow>%s<color>", szMsg)
	Msg2Player(szMsg)
end

function ture_real_starttask_member(nTaskCode)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId == 395 then
    	if ( nt_getTask(1203) == 10 ) then
    		nt_setTask(1202,0)--��յ�ǰ�������
    		ture_real_starttask(nTaskCode)
    		
    		local szMsg,nCount = get_task_string(nTaskCode)
    		szMsg = format("��i tr��ng c�a ng��i �� b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, h�y n�m b�t th�i gian ��n b�n �� <color=yellow> Thi�n B�o Kh�<color> m� B�o R��ng ho�n th�nh nhi�m v� �I, h�y ch� � m� r��ng ��ng th� t�: <color=yellow>%s<color>", szMsg)
    		Msg2Player(szMsg)
    		return
    	elseif ( nt_getTask(1203) == 20 or nt_getTask(1203) == 21 ) then
    		Msg2Player("��i tr��ng c�a ng��i �� b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, nhi�m v� c�a ng��i kh�ng gi�ng v�i ��i ng�, h�y t� m�nh ho�n th�nh nh�")
    	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
    		Msg2Player("��i tr��ng c�a ng��i �� b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, nhi�m v� c�a ng��I �� ho�n th�nh, kh�ng gi�ng v�i ��i ng�, h�y r�i ��i �i giao nhi�m v� �i")
    	elseif ( nt_getTask(1203) == 0 ) then
    		Msg2Player("��i tr��ng c�a ng��i �� b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, ng��I v�n ch�a ti�p nh�n nhi�m v� n�y, h�y r�i kh�i ��i ng� �i")
    	end
    else
    	Msg2Player("��i tr��ng c�a ng��i �� b�t ��u nhi�m v� Thi�n B�o Kh� ��a Tin, ng��i kh�ng � b�n ��<color=yellow>Thi�n B�o Kh�<color>, xin h�y t� m�nh ho�n th�nh")
	end
	
	Msg2Team(format("<color=yellow>%s<color>Ti�n �� nhi�m v� kh�ng gi�ng v�i ��i ng�", GetName()))
end

function ture_real_starttask(nTaskCode)
	nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
	nt_setTask(1203,20)
	nt_setTask(1201,nTaskCode)
	DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
	SetFightState(1);			--��ս��״̬				--1����	--0���ر�
	SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
	SetPunish(1);				--�������ͷ�					--1���������ͷ�		--0��û�������ͷ�
	--SetCreateTeam(1);			--�������					--1���������		--0�����������
	ForbidChangePK(0);   		--�������pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
	SetPKFlag(0);               --����Ϊ����ģʽ            
	SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
	SetPos(1414,3191);
	--Cho b�t t� 3 gi�y, tr�h b� �� s�t - Modifiec by DinhHQ - 20110502
	SetProtectTime(3*18)
	AddSkillState(963, 1, 0, 18*3) 	
end

function ture_movecity()
--Fix bug v�n pk �c trong th�nh n�u d�ch chuy�n b�ng npc D�ch Quan khi ho�n th�nh nhi�m v� t�n s� - Modified by DinhHQ - 20110518
	DisabledUseTownP(0)
	SetFightState(0)	
	SetPunish(1)
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	local name = GetName()
	if ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("D�ch tr�m Thi�n  B�o khu"..name.."��i nh�n ��n"..citygo[i][4].."D�ch tr�m!")
			end
		end	
	elseif ( nt_getTask(1203) == 10 ) or ( nt_getTask(1203) == 0 ) or ( nt_getTask(1203) == 20) or ( nt_getTask(1203) == 21 ) then
		SetLogoutRV(0);
		NewWorld(11,3021,5090)
	end
end

function birthday0905_ture()
	tbBirthday0905.tbTask:reset_task();
	Say("D�ch Quan: T� ng�y 19/06/2009 ��n 24h ng�y 19/07/2009 , n�u ��i hi�p c� th� v��t qua ���c m�t trong nh�ng th� th�ch sau ��y th� ��i hi�p s� nh�n ���c m�t trong b�n t�n v�t v� c�ng qu� gi� l� �Thi�n T�n �ao�. ��i hi�p c� b�ng l�ng tham gia th� th�ch kh�ng?", 8, 
		"Nh�n nhi�m v� M� 100 b�o r��ng./#birthday0905_settask_message(4)",
		"Nh�n nhi�m v� Ti�u di�t 1 ��o t�c./#birthday0905_settask_message(5)",
		"Nh�n nhi�m v� T�m 1 Thi�u n� b� th�t l�c./#birthday0905_settask_message(6)",
		"Ta �� ho�n th�nh nhi�m v� M� 100 b�o r��ng./#birthday0905_gettask_message(4)",
		"Ta �� ho�n th�nh nhi�m v� Ti�u di�t 1 ��o t�c./#birthday0905_gettask_message(5)",
		"Ta �� ho�n th�nh nhi�m v� T�m 1 Thi�u n� b� th�t l�c./#birthday0905_gettask_message(6)",
		"Ta mu�n h�y nhi�m v� hi�n t�i/birthday0905_cancel_message",
		"Ta c� chuy�n g�p, s� quay l�i sau./no");
end

function no()
end

function ture_continuetask()
	if ( nt_getTask(1203) == 10 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� c�a ng��i v�n ch�a b�t ��u, kh�ng th� ti�p t�c nhi�m v�.",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1203) == 20 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� c�a ng��i �� b�t ��u, h�y nhanh ch�ng �i m� 5 B�o R��ng �i.",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1203) == 21 ) then
		ture_real_starttask(nt_getTask(1201))
		Msg2Player("Nhi�m v� c�a ng��i c� th� ti�p t�c")
	elseif ( nt_getTask(1203) == 25 or nt_getTask(1203) == 30 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� c�a ng��i �� ho�n th�nh, kh�ng c�n ph�i ti�p t�c n�a.",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1203) == 0 ) then
		Describe(DescLink_YiGuan..": Nhi�m v� c�a ng��i �� th�t b�i, nhanh ch�ng r�i kh�i ��y.",1,"K�t th�c ��i tho�i/no")
	end
end

