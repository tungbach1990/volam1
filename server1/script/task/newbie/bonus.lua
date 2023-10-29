

TKID_NEWBIE_BONUS = 610		--�Ƿ񷢽���־
TKID_NEWBIE_CANCLE = 604		--������������ڴ������ȡ�����������

Bonus = {
	SetBonusFlag = function(tasklvl) --���ý�����ʶ�������ؽ�����ʶ
		local flag = 1 --0x0001 ��ʾ��Ҫ����ͨ����
		if(GetTask(TKID_NEWBIE_SUCCED)>19) then
			flag = flag + 256 --0x0100 ��ʾ��Ҫ��һ�ֵĽ���
		end
		SetTask(TKID_NEWBIE_BONUS,flag)
		return flag
	end,
	PayExp = function(self,tasklvl) --��������ֵ���������ͨ�����ľ���
		local lspan,rspan = self[tasklvl]["Exp"][1],self[tasklvl]["Exp"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		AddOwnExp(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayGold = function(self,tasklvl) --������Ǯ
		local lspan,rspan = self[tasklvl]["Gold"][1],self[tasklvl]["Gold"][2]
		local flag = GetTask(TKID_NEWBIE_BONUS)
		Earn(random(lspan,rspan))
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayChance = function(self,tasklvl) --����ȡ������Ļ���
		local flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_NEWBIE_CANCLE,GetTask(TKID_NEWBIE_CANCLE)+1)
		flag = floor(flag/256) * 256
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PayCircle = function(self,tasklvl) --���1������Ľ���
		flag = GetTask(TKID_NEWBIE_BONUS)
		SetTask(TKID_FUYUAN,GetTask(TKID_FUYUAN)+10) --����10�㸣Ե
		flag = mod(flag,256)
		SetTask(TKID_NEWBIE_BONUS,flag)
		return 1
	end,
	PaySpecial = function(self,tasklvl) --���⽱��
		local succed = NewbieTask.GetSucced()
		local additiveRate = 10 + succed
		local targetRate = random(1,10000000)
		local special = self.Special[tasklvl]
		local span = 0
		for i=1,getn(special) do
			span = span + special[i][3] + floor(special[i][3]*additiveRate/10000000)
			if(targetRate <= span) then --�д�
				local bonuFlag = special[i][1]
				if(bonuFlag==BONUSFLAG_ITEM) then -- ����Ʒ
					AddItem(special[i][4],special[i][5],special[i][6],1,0,0,0,0)
					WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", ��t ���c:"..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_EXP) then --������
					AddOwnExp(special[i][4])
					WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", ��t ���c:"..special[i][2])
					return special[i]
				elseif(bonuFlag == BONUSFLAG_GOLDEN) then --�ƽ�װ��
					AddGoldItem(0,special[i][4])
					WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", ��t ���c:"..special[i][2])
					return special[i]
				else
					print(" ph�n th��ng")
					WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", kh�ng r� nguy�n nh�n, kh�ng th� nh�n ���c ph�n th��ng.")
					return nil
				end
			end
		end
		return nil
	end,
}

