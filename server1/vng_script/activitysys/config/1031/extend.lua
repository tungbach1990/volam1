Include("\\vng_script\\activitysys\\config\\1031\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1031\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1031\\hoadang.lua")

Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

function pActivity:OnServerStart()
	local npcidx=AddNpcEx(1596,0,1,SubWorldID2Idx(37),1724*32,3091*32,1," ",0)
	SetNpcScript(npcidx, "\\vng_script\\activitysys\\vng_npcdailog.lua")			
end

function pActivity:ThuThapLongDen()	

	if (PlayerFunLib:CheckFreeBagCell(1,"Ph�i c� �t nh�t 1 � tr�ng m�i c� th� tr� l�i c�u h�i.")) ~= 1 then
		return
	end
	if GetCash() < MONEY_1Van then
		return Talk(1,"",format("C�n c� <color=yellow>1 v�n l��ng<color> m�i c� th� tham gia tr� l�i c�u h�i nh�n th��ng."))
	end
	local szMsg = format("<npc>Ki�n th�c l� v� bi�n, c�c h� tr� l�i ��ng c�u h�i c�a ta s� c� th��ng. \n\n\n\n")
	local tbOpt = {}
	local nIdQuest = random(1,18)
	local tbQuest = TB_QUEST[nIdQuest]
	if not tbQuest then 
		return
	end
	szMsg = szMsg..format("<color=yellow>%s<color>",tbQuest[1])
	for i=2,getn(tbQuest) do
		tinsert(tbOpt, {format("%s",tbQuest[i]), self.Answer, {self,nIdQuest,i-1}})
	end		
	--tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

function pActivity:Answer(nIdQuest,nIDAnswer)	
	if GetCash() < MONEY_1Van then
		return Talk(1,"",format("C�n c� 1 v�n l��ng m�i c� th� tham gia tr� l�i c�u h�i nh�n th��ng."))
	end
	Pay(MONEY_1Van)
	if %TB_ANSWER[nIdQuest] ~= nIDAnswer then
		return Talk(1,"","Sai r�i, kh�ng sao c�! ai ch�ng c� l�c sai s�t.")		
	end
	local nCount = 1
	local nRandom = random(1,100)
	if nRandom < 51 then
		nCount = 1
	elseif nRandom < 81 then
		nCount = 2
	elseif nRandom < 96 then
		nCount = 3
	else
		nCount = 4
	end		
	tbAwardTemplet:Give(tbAward_Question,nCount,{EVENT_LOG_TITLE,"Traloidung_Nhanthuong"})	
	self:ThuThapLongDen()
end
