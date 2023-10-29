Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\signin.lua]]);

SZFILE = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];

function signin_add()
	--���м���
	if (GetTask(TK_CO_PLAYTIMES) >= CO_MAXPLAYTIMES) then
		Say(CO_SIGNNPCNAME.."H�m nay ng��i �� tham gia <color=yellow>"..CO_MAXPLAYTIMES.." l�n<color> r�i, c� l� ng��i c�ng m�t r�i, n�n �i ngh� �i!", 0);
		return 0;
	end;

	if (GetTask(TK_CO_TOTAL) >= 50) then
		Say(CO_SIGNNPCNAME.."Ng��i �� tham gia ho�t ��ng T�t <color=yellow>50 l�n<color> r�i, xem ra c�ng �� m�t, c�n ph�i ngh� ng�i!", 0);
		return 0;
	end;
	
	if (GetLevel() < CO_LEVELLIMIT) then
		Say(CO_SIGNNPCNAME.."��ng c�p c�a ng��i qu� th�p, ta kh�ng mu�n ng��i m�o hi�m, khi n�o ��t ��n c�p <color=yellow>"..CO_LEVELLIMIT.."<color> h�y ��n t�m ta.", 0);
		return 0;
	end;
	
	if (IsCharged() == 0) then
		Say(CO_SIGNNPCNAME.."Ch� c� ng��i ch�i n�p th� m�i c� th� tham gia c�c ho�t ��ng T�t.", 0);
		return 0;
	end;
		
	if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
		local nNowTime = tonumber(GetLocalDate("%H"));
		local bOn = 0;
		if ((nNowTime >= 12 and nNowTime < 14) or 
          (nNowTime >= 19 and nNowTime < 23) or 
          (nNowTime >= 1 and nNowTime < 3)) then
			    bOn = 1;
		end;
		if (bOn == 0) then
			Talk(1, "", CO_SIGNNPCNAME.."Ho�t ��ng �ng ba m��i s� di�n ra m�i ng�y, trong kho�ng th�i gian <color=yellow>12: 00 ��n 14: 00 tr�a, 19: 00 ��n 23: 00 t�i v� 1: 00 ��n 3: 00 s�ng<color>. M�i ng��i h�y mau ch�ng tham gia.");
			return 0;
		else
			Talk(1, "", CO_SIGNNPCNAME.."Ng��i c�ng mu�n tham gia ho�t ��ng '�u�i �ng ba m��i' sao? Ch� ti�c hi�n t�i ng��i d�n ���ng �� �i m�t. H�n s� quay v� v�o th�i �i�m ph�t th� 0, ph�t th� 15, ph�t th� 30 v� ph�t th� 45 m�i gi�.");
			return 0;
		end;
	end;
	return 1;
end;

--	����뿪�ĸ�������
function playerleave_add()
	SetCurCamp(GetCamp());
	tab_Itemlist = {981, 984, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1047, 1048, 978, 979, 980, 981, 982, 983, 984, 985, 986, 987, 988, 989, 990, 991, 992, 993, 994};
	
	for i = 1, getn(tab_Itemlist) do
        ConsumeItem( -1, 1000, 6, 1, tab_Itemlist[i], 1 );
    end;
end;

-- 	��ҽ���׼�����ĸ�������
function playergetinprepare_add()
end;

--	��ҽ�����Ϸ���ĸ�������
function playergetingame_add()
	SetTask(TK_CO_PLAYTIMES, GetTask(TK_CO_PLAYTIMES) + 1);
	SetTask(TK_CO_TOTAL, GetTask(TK_CO_TOTAL) + 1);
	SetCurCamp(1);	--������ʱ��Ӫ
end;