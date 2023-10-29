
--Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\tanthu\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

tbGiveSkill60 ={}
TakIsGetSkill = 2685
TakIsGetItem = 2686
TakIsGetItemKimPhong = 2687
TakIsGetSkill90 = 2688
TakIsGetBK90 = 4932

function tbGiveSkill60:MainDialog()
	local tbOpt = {}
	tinsert(tbOpt, {"Nh�n V�t Th�n H�nh Ph�, Th� ��a Ph� 7 ng�y", tbGiveSkill60.GetItem, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n K� N�ng sau Khi Gia Nh�p M�n Ph�i", tbGiveSkill60.GetSkill, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n v�ng h� tr� t�n th�", tbGiveSkill60.GetSkillSupport, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n trang b� Kim Phong", tbGiveSkill60.GetKimPhong, {tbGiveSkill60}})
	tinsert(tbOpt, {"Nh�n B� k�p 90 t� ch�n theo ph�i", tbGiveSkill60.GetBK90, {tbGiveSkill60}})
	--tinsert(tbOpt, {"Nh�n K� N�ng C�p 90", tbGiveSkill60.GetSkill90, {tbGiveSkill60}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx("M�i ��i hi�p ch�n", tbOpt)
end

function tbGiveSkill60:GetSkill90( )
		if(GetLevel() < 90 )then
		Talk(1,"","C�p 90 tr� l�n m�i ���c nh�n!")
		return
	end
	if(GetTask(TakIsGetSkill90) > 0)then
		Talk(1,"","��i hi�p kh�ng ph�i �� nh�n r�i hay sao ?")
		return
	end

	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch�a gia nh�p m�n ph�i, ch�a th� nh�n ph�n th��ng n�y!")
  		return
  	end

  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk(1, "", "Th�t b�i, xin li�n h� GM!")
  		return
  	end
  	
  	for key, val in tbSkill do
	  		for i = 1, getn(val) do
	  			if type(val[i]) == "table" then
		  			if key == 90 then
		  				print("Add skill 90")
		  				AddMagic(val[i][1], 1)
		  			end
	  			end

	  		end
	  	--end	 	
  	end
  	
  	SetTask(TakIsGetSkill90, 1)
  	Talk(1, "", "Nh�n k� n�ng th�nh c�ng, xin ki�m tra l�i! ")
  	Msg2Player("Nh�n skill m�n ph�i th�nh c�ng")
	-- body
end

function tbGiveSkill60:GetKimPhong( )
	if(GetLevel() < 60 )then
		Talk(1,"","C�p 60 tr� l�n m�i ���c nh�n!")
		return
	end
	if(GetTask(TakIsGetItemKimPhong) > 0)then
		Talk(1,"","��i hi�p kh�ng ph�i �� nh�n r�i hay sao ?")
		return
	end
	--add item
	for i=177, 185 do
		local ndx= AddGoldItem(0,i)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
	end
	SetTask(TakIsGetItemKimPhong, 1)
	Msg2Player("��i hi�p v�a nh�n ���c b� trang b� Kim Phong")
end

function tbGiveSkill60:GetSkill()

	if (GetTask(TakIsGetSkill) > 0) then
		return Talk(1, "", "��i hi�p kh�ng ph�i �� nh�n k� n�ng r�i hay sao!")
	end

	-- if(GetLevel() > 60)then
	-- 	return Talk(1, "", "H� tr� n�y ch� d�nh cho t�n th� d��i c�p 60")
	-- end
	if(GetLevel() < 10)then
		return Talk(1, "", "H� tr� n�y ch� d�nh cho t�n th� c�p 10 tr� l�n!")
	end

	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch�a gia nh�p m�n ph�i, ch�a th� nh�n ph�n th��ng n�y!")
  		return
  	end

  	local tbSkill = TB_DAIYITOUSHI_FACTS[nFaction + 1].tbSkillID
  	if not tbSkill then
  		Talk(1, "", "Th�t b�i, xin li�n h� GM!")
  		return
  	end
  	
  	for key, val in tbSkill do
	  	--if key ~= 150 and key ~= "150" then	
	  		--print("==key "..key)
	  		for i = 1, getn(val) do
	  			--if type(val[i]) == "table" then
	  				if (key ~= 90) then
	  					AddMagic(val[i], 0)
	  				end
	  			--end 			
	  		end
	  	--end	 	
  	end
  	
  	SetTask(TakIsGetSkill, 1)
  	Talk(1, "", "Nh�n k� n�ng th�nh c�ng, xin ki�m tra l�i! ")
  	Msg2Player("Nh�n skill m�n ph�i th�nh c�ng")
  	
end

function tbGiveSkill60:GetSkillSupport()
	-- body
	if (GetSkillState(1594) > 0) then
		return Talk(1, "", "Tr�n ng��i ��i hi�p kh�ng ph�i �� c� k� n�ng n�y r�i hay sao?")
	end
	if(GetLevel() > 60)then
		return Talk(1, "", "H� tr� n�y ch� d�nh cho t�n th� d��i c�p 60")
	end
	--AddSkillState(1594, 1, 1, 1555200 *1095 , 1) 
	AddSkillState(1594, 1, 1, 64800*8 , 1) --8 gi�
	--(60*18)*--> 1phut ==> (60*18)*60=1h

	Msg2Player("B�n nh�n ph�n th��ng th�nh c�ng")
end

function tbGiveSkill60:GetItem()
	-- body
	if(GetLevel() > 60)then
		return Talk(1, "", "H� tr� n�y ch� d�nh cho t�n th� d��i c�p 60")
	end
	if (GetTask(TakIsGetItem) > 0) then
		return Talk(1, "", "��i hi�p kh�ng ph�i �� nh�n r�i hay sao!")
	end
	  	--add item
  	tbAwardTemplet:Give(tbAwardItem, 1, {"NhanHoTroTanThu", "NhanHoTroTanThu"})
	SetTask(TakIsGetItem, 1)
	Msg2Player("B�n nh�n ph�n th��ng th�nh c�ng")
end
--===================nhan BK 90=====================--
function tbGiveSkill60:GetBK90( )
	if (GetLevel() < 90 ) then
		Talk(1, "", "Ch� h� tr� cho c�c nh�n s� t� c�p 90 tr� l�n.")
		return
	end
	
	local nFaction = GetLastFactionNumber()
  	if nFaction < 0 then
  		Talk(1, "", "Ch�a gia nh�p m�n ph�i, cha th� nh�n ph�n th�ng n�y!")
  		return
  	end
	
	mp = GetFaction()
	if GetTask(TakIsGetBK90) == 0 then
		local tbSay = {}
		if GetLastFactionNumber() == 0 then
			tinsert(tbSay,"Thi�u l�m quy�n./#ChonBiKipOK(56)")
			tinsert(tbSay,"Thi�u l�m c�n./#ChonBiKipOK(57)")
			tinsert(tbSay,"Thi�u l�m �ao./#ChonBiKipOK(58)")
		elseif GetLastFactionNumber() == 1 then
			tinsert(tbSay,"Thi�n v�ong chu�./#ChonBiKipOK(37)")
			tinsert(tbSay,"Thi�n v�ong th��ng./#ChonBiKipOK(38)")
			tinsert(tbSay,"Thi�n v�ong �ao./#ChonBiKipOK(39)")
		elseif GetLastFactionNumber() == 2 then
			tinsert(tbSay,"�u�ng m�n phi �ao./#ChonBiKipOK(45)")
			tinsert(tbSay,"�u�ng m�n n�./#ChonBiKipOK(27)")
			tinsert(tbSay,"�u�ng m�n phi ti�u./#ChonBiKipOK(46)")
			--tinsert(tbSay,"�u�ng m�n b�y./#ChonBiKipOK(28)")
		elseif GetLastFactionNumber() == 3 then
			tinsert(tbSay,"Ng� ��c chu�ng./#ChonBiKipOK(47)")
			tinsert(tbSay,"Ng� ��c �ao./#ChonBiKipOK(48)")
			tinsert(tbSay,"Ng� ��c b�a./#ChonBiKipOK(49)")
		elseif GetLastFactionNumber() == 4 then
			tinsert(tbSay,"Nga my ki�m./#ChonBiKipOK(42)")
			tinsert(tbSay,"Nga mi chu�ng./#ChonBiKipOK(43)")
			tinsert(tbSay,"Nga mi buff./#ChonBiKipOK(59)")
		elseif GetLastFactionNumber() == 5 then
			tinsert(tbSay,"Thu� y�n �ao./#ChonBiKipOK(40)")
			tinsert(tbSay,"Thu� y�n song �ao./#ChonBiKipOK(41)")
		elseif GetLastFactionNumber() == 6 then
			tinsert(tbSay,"C�i bang r�ng./#ChonBiKipOK(54)")
			tinsert(tbSay,"C�i bang b�ng./#ChonBiKipOK(55)")
		elseif GetLastFactionNumber() == 7 then
			--tinsert(tbSay,"Thi�n nh�n k�ch./#ChonBiKipOK(35)")
			--tinsert(tbSay,"Thi�n nh�n b�a./#ChonBiKipOK(53)")
			tinsert(tbSay,"Thi�n nh�n �ao./#ChonBiKipOK(36)")
		elseif GetLastFactionNumber() == 8 then
			tinsert(tbSay,"V� �ang kh�./#ChonBiKipOK(33)")
			tinsert(tbSay,"V� �ang ki�m./#ChonBiKipOK(34)")
		elseif GetLastFactionNumber() == 9 then
			tinsert(tbSay,"C�n l�n �ao./#ChonBiKipOK(50)")
			tinsert(tbSay,"C�n l�n ki�m./#ChonBiKipOK(51)")
			tinsert(tbSay,"C�n l�n b�a./#ChonBiKipOK(52)")
		end
			tinsert(tbSay,"�� sau �i./no")
			Say("B�y gi� ��i hi�p ch�n theo � m�nh", getn(tbSay), tbSay)
	else
			Talk(1, "", "M�i ng��i ch� ���c nh�n 1 l�n duy nh�t.")
	end	
end
function ChonBiKipOK(nId)
	if CalcFreeItemCellCount() < 1 then
		Say("H�y c�t b�t v�t ph�m �� ��m b�o c� 1 � tr�ng r�i h�y nh�n.",0);
		return
	end	
	local idbk = AddItem(6,1,nId,1,0,0) --bi kip 90
	SetItemBindState(idbk,-2)
	Msg2Player("B�n nh�n ���c 01 B� k�p 90.")
	SetTask(TakIsGetBK90,1)
end

--==================================================--