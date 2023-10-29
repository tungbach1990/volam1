--ִ��֮�ֿ�

--by yfeng
Include ("\\script\\event\\chinesenewyear\\eventhead.lua")

NUMPERMIN = 0  --������ʰȡ�Ŀ�����
LASTTIME = 0 --��һ��ʰȡʱ��ʱ��

TID_VALIDATION = 501
TID_CARDNUMBER = 502
GETBYTE = 2

function ComputeTime()
	 return tonumber((((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M"))
end

function main(idx)
	return 1
end

function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end

function PickUp( nItemIndex, nPlayerIndex )
	if(not CHINESENEWYEAR) then
		return 0
	end
	local oldPlyIdx = PlayerIndex
	PlayerIndex = nPlayerIndex
	local size = GetTeamSize()
	local myName = GetName()
	local mySex = GetSex()
	local myCode = GetTask(TID_VALIDATION)
	local myNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	local myLevel = GetLevel()
	if(size < 2) then --
		Msg2Player("B�n ���c 1 Uy�n ��ng M�t, nh�ng k� c� ��n nh� b�n kh�ng th� m� c�ng n�ng c�a th� n�y!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(size > 2) then
		Msg2Player("B�n ���c 1 Uy�n ��ng M�t, nh�ng nhi�u ng��i th�, b�n kh�ng bi�t c�ng ai �� m� c�ng n�ng c�a th� n�y!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	local otherIndex = GetTeamMember(1)
	if( otherIndex == nPlayerIndex) then
		otherIndex = GetTeamMember(2)
	end
	PlayerIndex = otherIndex
	otherName = GetName()
	otherSex = GetSex()
	otherCode = GetTask(TID_VALIDATION)
	otherNum = GetByte(GetTask(TID_CARDNUMBER),GETBYTE)
	otherLevel = GetLevel()
	PlayerIndex = nPlayerIndex
	if(otherSex == mySex) then
		Msg2Player("B�n ���c Uy�n ��ng M�t, nh�ng kh�ng th� m� c�ng n�ng c�a th� cho hai b�n c�ng gi�i!")
		PlayerIndex = oldPlyIdx
		return 0
	end
	if(myCode == otherCode and myCode ~=0) then  --��֤����ͬ
		if(myNum == otherNum) then --�����ˣ���������һ����
			myNum = myNum + 1  --��Ƭ�����ۼ�
			otherNum = myNum
			Msg2Player("B�n ���c Uy�n ��ng M�t, gi�p cho duy�n ph�n c�a b�n v�     "..otherName.."th�m g�n nhau h�n. Hi�n nay, b�n �� t�ch l�y"..myNum.."Uy�n ��ng M�t.")
			AddOwnExp(myLevel * (20+0.1*myLevel)-10)
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			PlayerIndex = otherIndex
			Msg2Player(myName.."���c 1 Uy�n ��ng M�t, gi�p cho duy�n ph�n c�a c�c b�n th�m g�n nhau h�n. Hi�n nay, b�n �� t�ch l�y"..otherNum.."Uy�n ��ng M�t.")
			AddOwnExp(otherLevel * (10+0.07*otherLevel))
			SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			if(myNum > 98) then --�ﵽ99��������������
				myNum = 0
				PlayerIndex = nPlayerIndex
				AddSkillState(530,15,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B�n �� t�ch l�y ���c 99 Uy�n ��ng M�t! B�n v� "..otherName.."c�ng m� c�ng n�ng c�a thi�p n�y. B�n nh�n ���c t�ng th�m 30 �i�m may m�n trong 2 gi�.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
				PlayerIndex = otherIndex
				AddSkillState(530,15,1,2*60*60*18)
				AddSkillState(533,1,1,2*60*60*18)
				Msg2Player("B�n �� t�ch l�y ���c 99 Uy�n ��ng M�t! B�n v� "..myName.."c�ng m� c�ng n�ng c�a thi�p n�y. B�n nh�n ���c t�ng th�m 30 �i�m may m�n trong 2 gi�.")
				SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
			end
			PlayerIndex = oldPlyIdx
			return 0
		end
		--���������һ��
		if(myNum > otherNum) then --�ұ�������
			myNum = myNum - 1
			if(myNum ~= otherNum) then --��ʧ�ˣ������ȣ�ûԵ�ݰ�
				otherNum = otherNum + 1  --���ǵ�Ե���ٽ�һ�㡣 :)
			end
		else  --�����ҿ���
			myNum = myNum + 1  --��һ��
			if(myNum ~=otherNum) then
				otherNum = otherNum - 1
			end
		end
		PlayerIndex = nPlayerIndex
		Msg2Player("B�n ���c 1 Uy�n ��ng M�t, c�ng"..otherName.."duy�n ph�n th�m g�n nhau h�n. B�n hi�n �� t�ch l�y ���c"..myNum.."Uy�n ��ng M�t.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,myNum)) --��д��Ϣ
		PlayerIndex = otherIndex
		Msg2Player(myName.."���c 1 Uy�n ��ng M�t, duy�n ph�n c�a b�n th�m g�n nhau h�n. Hi�n nay, b�n t�ch l�y ���c"..otherNum.."Uy�n ��ng M�t.")
		SetTask(TID_CARDNUMBER,SetByte(GetTask(TID_CARDNUMBER),GETBYTE,otherNum)) --��д��Ϣ
		PlayerIndex = oldPlyIdx
		return 0
	end
	--��֤�벻ͬ�����߶���0
	local code = GetValidateCode(nPlayerIndex)
	Msg2Player("B�n ���c 1 Uy�n ��ng M�t, ��ng th�i c�ng"..otherName.."b�t ��u b�t ��u cu�c t�nh duy�n. ")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = otherIndex
	Msg2Player(myName.."��c 1 Uy�n ��ng M�t, ��ng th�i c�ng b�n b�t ��u cu�c t�nh duy�n.")
	SetTask(TID_VALIDATION,code)
	PlayerIndex = oldPlyIdx
	return 0
end

function GetValidateCode(plyIdx)
	local oPID = PlayerIndex
	PlayerIndex = plyIdx
	local mid = GetWorldPos()
	PlayerIndex = oPID
	local time = ComputeTime() --(((date("%m")-1)*30+date("%d")-1)*24+date("%H"))*60+date("%M")
	
	if(time == LASTTIME) then
		NUMPERMIN = NUMPERMIN + 1
	---+----------------+---------+-------+
	---|   LASTTIME     |  MAPID  |NUM/MIN|
	---+----------------+---------+-------+
	---|    16 BIT      |  9 BIT  |  7BIT |
	---+----------------+---------+-------+
	---|     65535      |   511   |  127  |
	---+----------------+---------+-------+
		return LASTTIME * 65536 + mid*128 + NUMPERMIN
	end
	LASTTIME = time
	NUMPERMIN = 0
	return LASTTIME * 65536 + mid*128 + NUMPERMIN
end
