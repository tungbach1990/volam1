--nhan diem lanh dao, by: ThanhLD 20130612
IncludeLib("SETTING")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\award_weekly_201306\\head.lua")
tbAwardWeekly = tbAwardWeekly or {}

tbAwardWeekly.Award =
 {
	{szName = "�i�m Kinh Nghi�m", nExp=500000000},	
	{szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=10,nBindState=-2,nExpiredTime=10080},
	{szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime = 60},

}
function tbAwardWeekly:main()
	do return end
	if (IsActive() == 0 )then
		return Talk(1,"","L�u �: Th�i gian nh�n th��ng t� 24-06-2013 ��n 29-09-2013")
	end
	if (CheckCondition()==0) then
		return Talk(1,"","Ph�n th��ng ch� gi�nh cho nh�n v�t Tr�ng Sinh 4 level 191 tr� l�n.")
	end
	if (CheckTaskWeekly() ==0) then		 		
		return Talk(1,"","M�i tu�n ch� nh�n ���c 1 l�n ph�n th��ng, tu�n sau   h�y gh� l�i.")
	end
	if CalcFreeItemCellCount() <= 1 then		
		return Talk(1, "", "Xin h�y ch�a 2 � tr�ng trong h�nh trang r�i m�i nh�n th��ng")
	end
	local CurWeek = tonumber(GetLocalDate("%Y%W")) 
	SetTask(TASK_AWARD_WEEK,CurWeek)
	tbAwardTemplet:Give(self.Award, 1, {"NhanThuongHangTuan", "DaNhanPhanThuongTuan"})	
end

--EventSys:GetType("AddNpcOption"):Reg("Chi�n T�m T�n Gi�","Nh�n th��ng h�ng tu�n", tbAwardWeekly.main, {tbAwardWeekly})

	

