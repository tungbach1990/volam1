-------------------------------------------------------------------------
-- FileName		:	partner_master_lib.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-26 17:25:25
-- Desc			:	ͬ�������������ڷ�����
-------------------------------------------------------------------------
--master_taskid��		���������ı���
--master_value��		���������Ӧ�ôﵽ�ı���ֵ
--partner_uworld��		��¼�����Ʒ�����ı���
--partner_master_exp��	��ҿɻ�õľ���
--partner_taskid��		��ֵ��������ҽ��������ĸ��������Ʒ
--BMapId��				���Ӧ�����ڵĵ�ͼ
--partner_valuebit��    Ҫ�ı�����������λ��

Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����
IncludeLib("PARTNER")

----------------------------------------------------------С�ֹҵ�����õĸ�����������ҼӾ���͵��������Ľű�---------------------------------------------------
function lib_master_shanzei(master_taskid,master_value,partner_uworld,partner_master_exp,partner_taskid,BMapId)  
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local yaocai = random(1,2)
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( yaocai == 1 ) and ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_uworld,nt_getTask(partner_uworld)+1)
			if ( partner_taskid == 1 ) then
				Msg2Player("�������һ��ػƲݡ�")
			elseif 	( partner_taskid == 2 ) then
				Msg2Player("�������һ���Ҷ��")
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
			if ( BMapId == prize_mapid ) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
				AddOwnExp(partner_master_exp)
				if ( yaocai == 1 ) and ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_uworld,nt_getTask(partner_uworld)+1)
					if ( partner_taskid == 1 ) then
						Msg2Player("�������һ��ػƲݡ�")
					elseif 	( partner_taskid == 2 ) then
						Msg2Player("�������һ���Ҷ��")
					end
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end;

---------------------------------------------------------boss�ҵ��������������������Ӿ����ɱ���󿪹صĹ���ű�----------------------------------

function lib_master_zhaizhu(master_taskid,master_value,partner_master_exp,partner_taskid,partner_valuebit,BMapId) 
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_taskid,SetBit(GetTask(partner_taskid),partner_valuebit,1))
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
			if ( BMapId == prize_mapid ) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
				AddOwnExp(partner_master_exp)
				if ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_taskid,SetBit(GetTask(partner_taskid),partner_valuebit,1))
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end

---------------------------------------------------------boss�ҵ��������������������Ӿ���͸ı�����Ĺ���ű�----------------------------------
function lib_master_shenzeiwang(master_taskid,master_value,partner_master_exp,partner_taskid,partner_value,BMapId) 
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	if (nMemCount == 0 ) then
		AddOwnExp(partner_master_exp)
		if ( nt_getTask(master_taskid) == master_value ) then
			nt_setTask(partner_taskid,partner_value)
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
			if ( BMapId == prize_mapid ) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
				AddOwnExp(partner_master_exp)
				if ( nt_getTask(master_taskid) == master_value ) then
					nt_setTask(partner_taskid,partner_value)
				end
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
		return
	end
end