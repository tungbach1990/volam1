-------------------------------------------------------------------------
-- FileName		:	messenger_templerukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ɽ�������
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B�t ��u nhi�m v� /temple_starttask", 
                "R�i �i khu v�c /temple_movecity", 
                "Sau n�y tr� l�i /no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 3, "Nhi�m v� b�n �� S�n Th�n Mi�u /birthday0905_temple");
	end
	 Describe(DescLink_YiGuan..": �� m� m�i t�nh to�n x�ng quan th�i gian, c� g�ng l�n nha ! B�y gi� ng��i ngh� l�m c�i g�?",getn(tbDialog), unpack(tbDialog))
end

function temple_starttask()
	if ( nt_getTask(1202) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
		nt_setTask(1202,20)
		DisabledUseTownP(1)--���ûسǷ�				--1������	--0������
		SetFightState(1);--��ս��״̬				--1����	--0���ر�
		SetLogoutRV(1);--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
		SetPunish(0);--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
		SetCreateTeam(1);--�������				--1���������		--0�����������
		ForbidChangePK(1);   --���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
		SetPKFlag(0);        --����Ϊ����ģʽ        
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1340,3148);
		Msg2Player("�� m� m�i t�nh to�n th�i gian l�m nhi�m v�")
	elseif ( nt_getTask(1202) == 20 ) then
		Describe(DescLink_YiGuan.."Ng��i �� ho�n th�nh nhi�m v�, kh�ng c�n ti�p t�c nh�n!",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v�, th� n�o c�n mu�n ti�p t�c ti�p nh�n ? nhanh l�n m�t ch�t r�i kh�i c�i n�y �i!",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1202) == 0 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v� t�n s�, xin nhanh l�n m�t ch�t r�i �i �i!",1,"K�t th�c ��i tho�i/no")
	end
end

function temple_movecity()
	local name = GetName()
	if ( nt_getTask(1202) == 25 or nt_getTask(1202) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Mi�u s�n th�n d�ch tr�m cung ti�n "..name.." ��i nh�n ��n "..citygo[i][4].." d�ch tr�m !")
			end
		end	
	elseif ( nt_getTask(1202) == 10 ) or ( nt_getTask(1202) == 0 ) then
		SetLogoutRV(0);
		NewWorld(1,1561,3114)
	end	  	
end

function birthday0905_temple()
	tbBirthday0905.tbTask:reset_task();
	Say("D�ch quan : t� 19/06/2009 ��n 19/07/2009 24 l�c , th�ng qua ph�a d��i nhi�m v� c� th� ��t ���c m�a h� cung, ��i hi�p mu�n tham gia sao ?", 6, 
              "Nh�n ti�u di�t 2 c� �ao y�u nhi�m v�./#birthday0905_settask_message(7)", 
              "Nh�n ti�u di�t 100 c� mi�u s�n th�n ng��i c�m �ao nhi�m v�./#birthday0905_settask_message(8)", 
              "Ta �� ho�n th�nh ti�u di�t 2 c� �ao y�u nhi�m v�./#birthday0905_gettask_message(7)", 
              "Ta �� ho�n th�nh ti�u di�t 100 c� mi�u s�n th�n ng��i c�m �ao nhi�m v�./#birthday0905_gettask_message(8)", 
              "Ta mu�n bu�ng tha cho b�y gi� nhi�m v� /birthday0905_cancel_message", 
              "Ta c� vi�c g�p , ch� m�t ch�t tr� l�i./no");
end

function no()
end
