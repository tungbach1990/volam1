-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   ��֮�����
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --������ͼ�����
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--��������������ݱ�����
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B�t ��u nhi�m v�/fly_starttask", 
		"R�i �i khu v�c/fly_movecity", 
		"Sau n�y tr� l�i/no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "Map Phong K� tr�n b�n �� ��ch nhi�m v�/birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": �� m� m�i t�nh to�n x�ng quan th�i gian, c� g�ng l�n nha ! B�y gi� ng��i ngh� l�m c�i g� ?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:��������ʼʱ��
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--���ûسǷ�				--1������	--0������
		SetFightState(1);			--��ս��״̬				--1����	--0���ر�
		SetLogoutRV(1);				--���ߺ�������Ϊһ��������		--1�����ߺ�����Ϊһ��������	--0�����ߺ�������Ϊһ��������
		SetPunish(0);				--�ر������ͷ�					--1���������ͷ�		--0��û�������ͷ�
		SetCreateTeam(1);			--�������					--1���������		--0�����������
		ForbidChangePK(1);   		--���ܸ���pk״̬		--1�����ܸ���pk״̬		--0:���Ը���pk״̬
		SetPKFlag(0);               --����Ϊ����ģʽ            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("�� m� m�i t�nh to�n th�i gian l�m nhi�m v�")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."Ng��i �� ho�n th�nh nhi�m v�, kh�ng c�n ti�p t�c nh�n !",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v�, c�n mu�n ti�p t�c l�m nhi�m v� sao? H�y nhanh ch�n r�i kh�i n�i n�y �i!",1,"K�t th�c ��i tho�i/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": Ng��i �� ho�n th�nh nhi�m v� t�n s�, xin nhanh l�n m�t ch�t r�i �i �i!",1,"K�t th�c ��i tho�i/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Phong k� d�ch tr�m cung ti�n "..name.." ��i nh�n ��n "..citygo[i][4].." d�ch tr�m !")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("D�ch quan : t� 19/06/2009 ��n 19/07/2009 24 l�c , n�u nh� ��i hi�p c� th� xuy�n qua ph�a d��i m�t c�i trong �� khi�u chi�n , ��i hi�p �em ��t ���c 4 c� b�o v�t trung ��ch m�t , l� b� v��ng s�ng . ��i hi�p mu�n tham gia khi�u chi�n sao ?", 8, 
         "Nh�n ti�u di�t 500 kim qu�c gi�n �i�p nhi�m v� /#birthday0905_settask_message(1)", 
         "Nh�n ti�u di�t 6 c� h� b�o k� nhi�m v� /#birthday0905_settask_message(2)", 
         "Ti�p nh�n ti�p x�c 100 c� t�a �� nhi�m v�./#birthday0905_settask_message(3)", 
         "Ta �� ho�n th�nh ti�u di�t 500 kim qu�c gi�n �i�p nhi�m v�/#birthday0905_gettask_message(1)", 
         "Ta �� ho�n th�nh ti�u di�t 6 c� h� b�o k� nhi�m v�/#birthday0905_gettask_message(2)", 
         "Ta �� ho�n th�nh ti�p x�c 100 c� t�a �� nhi�m v�./#birthday0905_gettask_message(3)", 
         "Ta mu�n bu�ng tha cho tr��c m�t nhi�m v�/birthday0905_cancel_message", 
         "Ta c� vi�c g�p , ch� m�t ch�t tr� l�i./no");
end

function no()
	
end
