-------------------------------------------------------------------------
-- FileName		:	toll_mupaixinshi.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-16 15:28:15
-- Desc			:  	��ʹ����ľ���Ҽ������ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(itemindex)
	local paramvalue = GetItemParam(itemindex, 1)
	if ( paramvalue >= 5 ) then
		Msg2Player("Xin l�i! T�n s� l�nh - M�c c�a b�n s� d�ng qu� 5 l�n �� b� h�y ho�i.")
	elseif ( nt_getTask(1206) < 1 ) then
		Msg2Player("Xin l�i! B�n ch�a nh�n ���c danh hi�u T�n s� l�nh - M�cn�n kh�ng th� s� d�ng ���c. H�y ��n ch� D�ch Quan nh�n danh hi�u n�y, c�m �n!")
		return 1
	else
		if ( SetSpecItemParam(itemindex, 1, paramvalue+1) == 1 ) then
			SyncItem(itemindex)
			local Realvalue = 5 - GetItemParam(itemindex, 1)
			Msg2Player("T�n s� l�nh - M�c c�a b�n sau khi s� d�ng ph�c h�i 10 �i�m �m trong 1 gi�. Hi�n t�i c�n s� d�ng ���c"..Realvalue.." l�n.")
		end
		
		if ( GetSeries() == 0 ) then --��ϵ���ﱻ��� ��631-635����ľˮ����
			AddSkillState( 542, 1, 1, 64800)
			AddSkillState( 634, 1, 1, 64800)
		elseif ( GetSeries() == 1 ) then --ľϵ���ﱻ���
			AddSkillState( 542, 1, 1, 64800)
			AddSkillState( 631, 1, 1, 64800)
		elseif ( GetSeries() == 2 ) then --ˮϵ���ﱻ����
			AddSkillState( 542, 1, 1, 64800)
			AddSkillState( 635, 1, 1, 64800)
		elseif ( GetSeries() == 3 ) then --��ϵ���ﱻˮ��
			AddSkillState( 542, 1, 1, 64800)
			AddSkillState( 633, 1, 1, 64800)
		elseif ( GetSeries() == 4 ) then --��ϵ���ﱻľ��
			AddSkillState( 542, 1, 1, 64800)	
			AddSkillState( 632, 1, 1, 64800)				
		end
		
		return 1
	end
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local  nPayMonth1
	local nPayMonth1 = GetItemParam( nItem, 1 )
	local Realvalue = 5 - nPayMonth1
	
	szDesc = ""
	szDesc = szDesc..format( "T�n s� l�nh - M�c c�a b�n sau khi s� d�ng ph�c h�i 10 �i�m �m trong 1 gi�. Hi�n t�i c�n s� d�ng ���c"..Realvalue.." l�n." );
	return szDesc;
end
