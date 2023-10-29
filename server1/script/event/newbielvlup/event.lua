if not EVENTHEAD_LUA then
	Include ("\\script\\event\\eventhead.lua")
end	

TKID_NEWBIELEVELUP = 1080	--���λ��Ҫ�õ�������������
TKVAL_NEWBIELEVELUP_OPEN = 1 --�������Ժ�1080�����������Ϊ1

ENewbieLevelUp = {
	To20Level = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			return
		end
		local level = GetLevel()
		if(level ==1) then
			for i=1,19 do
				AddOwnExp(100000)
			end
			SetTask(TKID_NEWBIELEVELUP,TKVAL_NEWBIELEVELUP_OPEN)
		end
	end,
	PayDoubleExp = function()
		if not validateDate(DATESNEWBIELEVELUP,DATEENEWBIELEVELUP) then
			Talk(1,"","Xin l�i! Th�i gian di�n ra ho�t ��ng �� ch�m d�t r�i!")
			return
		end
		local ret = ENewbieLevelUp.validate()
		if(ret ==1) then
			Talk(1,"","Xin l�i! ��ng c�p c�a b�n �� v��t qu� c�p 60 kh�ng th� nh�n ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 2 gi�.")
			return
		end
		if(ret == 2) then
			Talk(1,"","Xin l�i! B�n kh�ng ph�i nh�n v�t m�i t�o n�n kh�ng th� nh�n ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 2 gi�.")
			return
		end
		AddSkillState(531,10,1,2*60*60*18)
		AddSkillState(461, 1, 1,2*60*60*18)
		Talk(1,"","Hoan ngh�nh b�n tham gia 'Ho�t ��ng t�n th� luy�n c�p', ��y l� ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 2 gi�.")
		Msg2Player("B�n nh�n ���c ph�n th��ng t�ng ��i �i�m kinh nghi�m trong 2 gi� ")
		return
	end,
	validate = function()
		local level = GetLevel()
		if (level > 60) then
			return 1
		end
		local flag = GetTask(TKID_NEWBIELEVELUP)
		if (flag ~= TKVAL_NEWBIELEVELUP_OPEN) then
			return 2
		end
		return 0
	end
}

function BTNNewbieLevelUp()
	local msg = "Hoan ngh�nh tham gia 'Ho�t ��ng t�n th� luy�n c�p'."
	local btns = {
		"Ta ��n nh�n t�ng ��i �i�m kinh nghi�m trong 2 gi� /PayDoubleExp",
		"T�m hi�u ho�t ��ng l�n n�y/AboutNewbieLevelUp",
	}
	Say(msg,getn(btns),btns)
end

function PayDoubleExp()
	ENewbieLevelUp.PayDoubleExp() 
end

function AboutNewbieLevelUp()
	local msg = ": Trong th�i gian ho�t ��ng, ch� c�n nh�n v�t m�i t�o l�n ��n c�p 20 v� d��i c�p 60 c� th� ��n L� Quan nh�n t�ng ��i �i�m kinh nghi�m trong 2 gi�."
	local btns = {
		"Tr� l�i/BTNNewbieLevelUp",
		"Tho�t ra/Quit"
	}
	Describe(LIGUAN_TAG(msg),getn(btns),btns)
end
