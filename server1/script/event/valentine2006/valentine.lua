IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE2006 = 1552
function valentine_gift2006()
if (gb_GetModule("���˽����") == 1) then
	if (tonumber(GetLocalDate("%y%m%d")) >= 60214 and tonumber(GetLocalDate("%y%m%d")) <= 60221) then
		if (GetLevel() >= 50) then
			if (GetTask(TSK_VALENTINE2006) == 0) then
				if (IsCharged() == 1) then
					AddItem(6,1,1058,1,1,1,1)	--���˽����
					SetTask(TSK_VALENTINE2006, 1)
					Say("<#>��٣�����<color=yellow>���˽����<color>�������������������������˽��ʻ������۵�ף���ɣ�", 0)
					Msg2Player("<#>���յ�һ��<color=yellow>���˽����")
				else
					Say("<#>��٣����ܳ�ֵ�û�������ȡ���˽����Ŷ��", 0)
				end
			else
				Say("<#>��٣����Ѿ���ȡ�����˽ڵ������ˣ��Ͳ�Ҫ̫̰��Ŷ��", 0)
			end
		else
			Say("<#>��٣����ĵȼ�����50��������ȡ���˽�����Ŷ��", 0)
		end
	else
		Say("<#>��٣�������̫���������˽��Ѿ�����ඡ�", 0)
	end
end
end

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;