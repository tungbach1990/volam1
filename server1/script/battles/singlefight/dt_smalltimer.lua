Include("\\script\\battles\\singlefight\\dt_head.lua")
Include("\\script\\battles\\battlehead.lua")

function OnTimer()
	t = GetMissionV(MS_TIME1_ACC) + 1
	SetMissionV(MS_TIME1_ACC , t)

	if (t == EXPRETIME) then  --������˽���ǰ10��������ʾ��Ҫ�˳�
		Msg2MSAll(GetMissionV(MS_DTMISSION), "<#> Khu v�c ��n ��u sau 10 gi�y n�a s� k�t th�c!")
	else
		RestTime = (TIMER_2 - t * TIMER_1)/FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime)
		if (RestSec == 0) then
			str = "<#> Th�i gian ��n ��u c�n l�i:"..RestMin.."ph�t"
		else
			str = "<#> Th�i gian ��n ��u c�n l�i:"..RestMin.."ph�t"..RestSec.." gi�y"
		end
		Msg2MSAll(GetMissionV(MS_DTMISSION),str)
	end
end  