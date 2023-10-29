Include ("\\script\\shitu\\shitu_head.lua")

if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

LilianAppExpBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={10000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����һ������",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�����ɹ����10������Ұ������",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������20����������",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������20����������",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��20����������",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������30����������",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������30����������",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={50000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��30����������",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������40����������",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������40����������",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��40����������",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������50����������",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������50����������",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��50����������",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������60����������",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������60����������",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��60����������",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���1000�������ν����",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���60���书",
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������65������",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������70������",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������75������",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1600000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������76������",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1700000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������77������",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������78������",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1900000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������79������",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={2000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������80������",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={10000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����10���书������5������",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={20000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����10���书������15������",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={30000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���30���书",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���40���书",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���50���书",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"60���书3������"
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���뵽һ������",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���200�����ϵ�����",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"}--"���500�����ϵ�ɽ�����ͼ��Ƭ",
})

function PayApprenticeBonus(appIdx,bonusIdx)
	LilianAppExpBonus:payBonus(appIdx,bonusIdx)
	-- �ƽ�ͽ�ܣ��ٻ�ö���Ľ���(50%)
	if (callPlayerFunction(appIdx, GetTask, TKID_GOLD_APPRENTICE) > 0) then
		callPlayerFunction(appIdx, Msg2Player, "B�n �� s� d�ng Ho�ng Kim S� �� thi�p, nh�n ���c 50% ph�n th��ng. kinh nghi�m")
		LilianAppExpBonus:payBonusEx(appIdx,bonusIdx, 0.5)
	end
end
