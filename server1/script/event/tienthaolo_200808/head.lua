-- Event Nh�n ti�n th�o l� ��c bi�t Vinagame
--Th�ng 8 n�m 2008
-- Created by TuanNA5

TTL_DATE_START = 0808150000
TTL_DATE_END = 0809152400

TTL_GOT_TIME = 1980

MAX_TTL = 8

function get_thaolo()
	local nUsedTime = 0;
	local nTimes = 0;
	
	if check_thaolo_date() == 0 then
		Say("Ho�t ��ng l�n n�y �� k�t th�c.",0)
		return 0
	end	
	
	nUsedTime = GetTask(TTL_GOT_TIME)
	nTimes = MAX_TTL - nUsedTime
	
	if nTimes < 0 then
		nTimes = 0
	end
	
	strTalk = "Trong th�i gian 10/08/2008 - 10/09/2008 b�ng h�u s� ���c t�ng 8 Ti�n Th�o L� ��c bi�t. Ti�n Th�o L� s� ph�t huy t�c d�ng trong v�ng 2 gi� ngay sau khi b�ng h�u nh�n ���c. B�ng h�u c�n "..nTimes.." l�n. N�u h�t th�i h�n kh�ng nh�n h�t Ti�n Th�o L� b�ng h�u s� kh�ng nh�n ���c n�a."
	
	Say(strTalk,2,"Ta mu�n nh�n/say_yes","Ch�a c�n/say_no")
	
end

function say_yes()
	if check_thaolo_date() == 1 then
		local nUsedTime = GetTask(TTL_GOT_TIME)
		if nUsedTime >= 0 and nUsedTime < 8 then
			AddSkillState(440, 1, 1, 64800 * 2);
			SetTask(TTL_GOT_TIME, GetTask(TTL_GOT_TIME) +1)
			Say("Ti�n Th�o L� b�t ��u ph�t huy t�c d�ng",0)
			Msg2Player("B�n nh�n ���c t�c d�ng Ti�n Th�o L� trong 2 gi�.")
			WriteLog("[Ho�t ��ng Ti�n Th�o L�]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." Nh�n ���c Ti�n Th�o L�")
		else
			Say("Ng��i �� nh�n �� Ti�n Th�o L�!",0)
			Msg2Player("B�n nh�n �� nh�n �� 8 Ti�n Th�o L�.")
			return 0
		end	
	end
end

function check_thaolo_date()
	local nDate = tonumber(GetLocalDate("%y%m%d%H%M"));
	if nDate >=  TTL_DATE_START and nDate <= TTL_DATE_END then
		return 1
	end
	return 0
end

function say_no()
end