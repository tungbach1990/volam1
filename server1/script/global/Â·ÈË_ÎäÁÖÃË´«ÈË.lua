--�ṩ��Ե��ȡ��NPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\event\\storm\\award_npc.lua")	--Storm
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
Include("\\script\\event\\tongwar\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include([[\script\missions\chrismas\ch_head.lua]]);--
--	2007�괺�ڻ
Include([[\script\event\springfestival07\head.lua]]);
--������
Include( "\\script\\event\\wulinling\\wulinling.lua" )
Include( "\\script\\event\\nanfangjiefangri\\event.lua" )
Include("\\script\\event\\tongwar\\head.lua");
--dinhhq_20110124:Vip acc 2011
Include("\\script\\vng_event\\vip_account_2011\\npc\\volamtruyennhan.lua")

function main()
	
	-- �����漰����������˴��˶Ի��Բ��뵽������ -- ����˹ 2006/03/20
	local aryTalk  = {};
	local ndate = tonumber(GetLocalDate("%Y%m%d%H"));
	local Uworld1000 = nt_getTask(1000);
	
	tinsert(aryTalk, "<dec><npc>Th�i th� lo�n l�c, ch� v� n�n gi� ��o ch�nh ph�i, t�o ph�c ch�ng sinh. C� th� m�i hi v�ng tr� th�nh m�t ��i hi�p ���c m�i ng��i ng��ng m�.");
	--dinhhq_20110124:Vip acc 2011
	tbVNG_VipAcc2011_VLTN:addDialog(aryTalk)
	
	if ndate >= 2007042800 and ndate <= 2007051324 then
	tinsert(aryTalk,"Ho�t ��ng 30-4 v� Qu�c t� lao ��ng/nanfangjiefangri_main");
	end
	if (not FALSE(tongwar_checkinphase())) then
		tinsert(aryTalk, "V� L�m �� Nh�t Bang/tongWar_Start");
	end;
	
	--tinsert(aryTalk, "�i danh nh�n ���ng/honor_hall_enter");
	
	--tinsert(aryTalk, "�i Minh Nguy�t tr�n/autumn_enter");
	
	tinsert(aryTalk, "Nh�n �i�m ph�c duy�n c�a  b�n/OnGain_Self");

	if( GetTeamSize() > 1 ) then
		tinsert(aryTalk, "Nh�n �i�m ph�c duy�n c�a t�t c� th�nh vi�n trong nh�m/OnGain_Team");
	end;
	
	tinsert(aryTalk, "Nh�n �i�m danh v�ng (ch�i nhi�u gi�) /W33_prise");
	
	tinsert(aryTalk, "Th�i gian t�ch l�y ��i �i�m ph�c duy�n/OnQueryTime");
	
	tinsert(aryTalk, "Li�n quan ��n ph�c duy�n/OnAbout");
	
	tinsert(aryTalk, "H�y b� /OnCancel");
	
	if ( Uworld1000 ==340 ) or ( Uworld1000 == 350 ) then
		education_wulinmengchuanren();
		return
	end;
	
	CreateTaskSay(aryTalk);
	
	
end

--��ȡ��ұ��˵ĸ�Ե����
function OnGain_Self()
	if( IsCharged() ~= 1 ) then
		Say( "Ng��i ch�a n�p th�, n�p xong  h�y ��n t�m ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B�n �� b��c v�o giai �o�n m�t m�i! kh�ng th� nh�n �i�m ph�c duy�n. Xin h�y ngh� ng�i, gi� g�n s�c kh�e!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C�c h� m�i ra giang h�, ta c� ch�t l� v�t, xin nh�n l�y!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nResult = FuYuan_Gain();
	if( nResult == 0 ) then
		Say( "Ng��i phi�u b�t giang h� c�n ch�a ��, h�c h�i nhi�u th�m r�i ��n t�m ta!", 0 );
	elseif( nResult == 1 ) then
		Say( "Ng��i phi�u b�t giang h� �� l�u, c�ng lao �� nhi�u, ��y l� ph�n th��ng ng��i ��ng ���c nh�n! ��ng b� l�!", 0 );
	end
end

--��ȡ��Ҷ������г�Ա�ĸ�Ե����
function OnGain_Team()
	if( IsCharged() ~= 1 ) then
		Say( "Ng��i ch�a n�p th�, n�p xong  h�y ��n t�m ta!", 0 );
		return
	end
	if (GetTiredDegree() == 2) then
		Say( "B�n �� b��c v�o giai �o�n m�t m�i! kh�ng th� nh�n �i�m ph�c duy�n. Xin h�y ngh� ng�i, gi� g�n s�c kh�e!", 0 );
		return
	end;
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C�c h� m�i ra giang h�, ta c� ch�t l� v�t, xin nh�n l�y!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	local bAllUnavailable = 1;
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		if( FuYuan_Gain() == 1 ) then
			bAllUnavailable = 0;
		end		
	end
	PlayerIndex = nPreservedPlayerIndex;
	if( bAllUnavailable == 0 ) then
		Say( "Ng��i phi�u b�t giang h� �� l�u, c�ng lao �� nhi�u, ��y l� ph�n th��ng ng��i ��ng ���c nh�n! ��ng b� l�!", 0 );
	else
		Say( "Ng��i phi�u b�t giang h� c�n ch�a ��, h�c h�i nhi�u th�m r�i ��n t�m ta!", 0 );
	end
end

--��ѯ��ǰ�ɻ�ȡ��Ե���ۻ�����ʱ��
function OnQueryTime()
	if( IsCharged() ~= 1 ) then
		Say( "Ng��i ch�a n�p th�, n�p xong  h�y ��n t�m ta!", 0 );
		return
	end
	if( GetTask( TASKID_FY_START_ONLINE_TIME ) == 0 ) then
		Say( "C�c h� m�i ra giang h�, ta c� ch�t l� v�t, xin nh�n l�y!", 0 );
		FuYuan_Start();
		FuYuan_Add( 2 );
		return
	end
	local nFYTotalTime, FYValidTime = FuYuan_GetDepositTime();
	Say( "<#> T� �i�m ph�c duy�n l�n tr��c nh�n ���c, t�ng c�ng b�n t�ch l�y ���c <color=yellow>"..timeToString( nFYTotalTime ).."<#> <color> th�i gian Online", 0 );
end

--���ڸ�Ե
function OnAbout()
	Talk( 3, "", "S� �i�m ph�c duy�n: Th�ng qua t�ch l�y th�i gian Online s� ��i l�y m�t s� �i�m �o, c� th� d�ng �� ��i c�c lo�i v�t ph�m ��c bi�t  � Th�n b� Th��ng Nh�n Li�u �t(T��ng D��ng) .", "��i ph�c duy�n: Sau khi online > 2 gi�, ��n V� L�m Truy�n Nh�n � c�c ��i th�nh th� �� ��i. N�u 1 ng�y ��i ph�c duy�n th�nh c�ng 2 l�n, s� nh�n ���c ph�n th��ng. N�u Online < 4 gi�, m�i gi� ��i ���c 1 �i�m. Sau ��, m�i 2 gi� ��i ���c 1 �i�m. Th�nh vi�n trong ��i c� th� nh�n �i�m gi�p cho c� ��i.", "H�n ch�: khi ng�i t� v� luy�n c�ng tr�n ��o hoa ��o s� kh�ng t�nh v�o th�i gian t�ch l�y ��i �i�m ph�c duy�n. � gian �o�n m�t m�i kh�ng th� nh�n �i�m ph�c duy�n." );
end


function W33_prise()				-- ����ʱ������������

Uworld33 = GetTask(33)

if (GetGameTime() - Uworld33 >= 43200) then

	SetTask(33,GetGameTime())
	Talk(1,"","V� l�m truy�n nh�n: N� l�c c�a ng��i ta ��u nh�n th�y! Ti�n �� s�ng l�n kh�ng xa! Ti�p t�c c� g�ng nh�!")
	i = random(0,99)
	if (i < 19) then			-- 19%
		AddRepute(1)
		Msg2Player("B�n ���c t�ng 1 �i�m danh v�ng.")
	elseif (i < 36) then		-- 17%
		AddRepute(2)
		Msg2Player("B�n ���c t�ng 2 �i�m danh v�ng.")
	elseif (i < 51) then		-- 15%
		AddRepute(3)
		Msg2Player("B�n ���c t�ng 3 �i�m danh v�ng.")
	elseif (i < 64) then		-- 13%
		AddRepute(4)
		Msg2Player("B�n ���c t�ng 4 �i�m danh v�ng.")
	elseif (i < 75) then		-- 11%
		AddRepute(5)
		Msg2Player("B�n ���c t�ng 5 �i�m danh v�ng.")
	elseif (i < 84) then		-- 9%
		AddRepute(6)
		Msg2Player("B�n ���c t�ng 6 �i�m danh v�ng.")
	elseif (i < 91) then		-- 7%
		AddRepute(7)
		Msg2Player("B�n ���c t�ng 7 �i�m danh v�ng.")
	elseif (i < 96) then		-- 5%
		AddRepute(8)
		Msg2Player("B�n ���c t�ng 8 �i�m danh v�ng.")
	elseif (i < 99) then		-- 3%
		AddRepute(9)
		Msg2Player("B�n ���c t�ng 9 �i�m danh v�ng.")
	else							-- 1% (i = 99)
		AddRepute(10)
		Msg2Player("B�n ���c t�ng 10 �i�m danh v�ng.")
	end

else

	Say("V� l�m truy�n nh�n: �i�u ki�n c�a ng��i hi�n nay kh�ng �� �� nh�n �i�m danh v�ng. V� l� t��ng c�a m�nh, h�y c� l�n!",0)

end

end



--ȡ��
function OnCancel()
end

function timeToString( time )
	local nHour = floor( time / 3600 );
	local nMinute = mod( floor( time / 60 ), 60 );
	local nSecond = mod( time, 60 );
	return nHour.."<#> gi� "..nMinute.."<#> ph�t "..nSecond.."<#> gi�y ";	
end

function honor_hall_enter()
    NewWorld(897, 1553, 3329);
end