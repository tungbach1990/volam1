if(not MEM_HEAD) then
	Include ("\\script\\lib\\mem.lua")
end

if(not KBONUS_HEAD) then
	Include ("\\script\\class\\kbonus.lua")
end

Include ("\\script\\shitu\\shitu_head.lua")

LilianMasterExpBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����һ������",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={100000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����10���书������5������",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������20����������",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������20����������",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��20����������",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"����10���书������15������",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���30���书",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�����ɹ����10������Ұ������",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������30����������",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������30����������",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={300000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��30����������",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���40���书",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������40����������",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������40����������",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��40����������",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���50���书",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������50����������",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������50����������",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={800000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��50����������",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"ϰ�ñ���60���书",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������60����������",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�������60����������",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1200000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���а��60����������",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���1000�������ν����",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���200�����ϵ�����",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���500�����ϵ�ɽ�����ͼ��Ƭ",
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"���뵽һ������",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"60���书3������"
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1500000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������65������",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������70������",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������75������",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������76������",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������77������",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������78������",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������79������",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.EXP,[CONST_ITEM_PARAMS]={1000000},[CONST_ITEM_NAME]="kinh nghi�m <name> �i�m"},--"�ȼ�������80������",
})

LilianMasterItemBonus = inherit(KBonus,{
	[CONST_LLITEM_JOINPARTY] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"����һ������",
	[CONST_LLITEM_SKILL10UP5] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"����10���书������5������",
	[CONST_LLITEM_ZHENGPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"�������20����������",
	[CONST_LLITEM_ZHONGLI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"�������20����������",
	[CONST_LLITEM_XIEPAI20] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"���а��20����������",
	[CONST_LLITEM_SKILL10UP15] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,2},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 2"},--"����10���书������15������",
	[CONST_LLITEM_GETSKILL30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"ϰ�ñ���30���书",
	[CONST_LLITEM_YESOUTASK] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�����ɹ����10������Ұ������",
	[CONST_LLITEM_ZHENGPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������30����������",
	[CONST_LLITEM_ZHONGLI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������30����������",
	[CONST_LLITEM_XIEPAI30] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"���а��30����������",
	[CONST_LLITEM_GETSKILL40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"ϰ�ñ���40���书",
	[CONST_LLITEM_ZHENGPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������40����������",
	[CONST_LLITEM_ZHONGLI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������40����������",
	[CONST_LLITEM_XIEPAI40] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"���а��40����������",
	[CONST_LLITEM_GETSKILL50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"ϰ�ñ���50���书",
	[CONST_LLITEM_ZHENGPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������50����������",
	[CONST_LLITEM_ZHONGLI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"�������50����������",
	[CONST_LLITEM_XIEPAI50] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,3},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 3"},--"���а��50����������",
	[CONST_LLITEM_GETSKILL60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"ϰ�ñ���60���书",
	[CONST_LLITEM_ZHENGPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"�������60����������",
	[CONST_LLITEM_ZHONGLI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"�������60����������",
	[CONST_LLITEM_XIEPAI60] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"���а��60����������",
	[CONST_LLITEM_SONGJIN] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"���1000�������ν����",
	[CONST_LLITEM_SHENGWANG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"���200�����ϵ�����",
	[CONST_LLITEM_SHANHESHEJI] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"���500�����ϵ�ɽ�����ͼ��Ƭ",
	[CONST_LLITEM_JOINTONG] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"���뵽һ������",
	[CONST_LLITEM_SKILL60UP3] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,4},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 4"},--"60���书3������"
	[CONST_LLITEM_LEVEL65] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������65������",
	[CONST_LLITEM_LEVEL70] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������70������",
	[CONST_LLITEM_LEVEL75] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������75������",
	[CONST_LLITEM_LEVEL76] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������76������",
	[CONST_LLITEM_LEVEL77] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������77������",
	[CONST_LLITEM_LEVEL78] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������78������",
	[CONST_LLITEM_LEVEL79] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,5},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 5"},--"�ȼ�������79������",
	[CONST_LLITEM_LEVEL80] = {[CONST_ITEM_PROBAB]=0,[CONST_ITEM_TYPE]=KBonus.ITEM,[CONST_ITEM_PARAMS]={6,1,147,6},[CONST_ITEM_NAME]="1 Huy�n Tinh Kho�ng Th�ch c�p 6"},--"�ȼ�������80������",
})

function PayMasterBonus(appIdx, masterIdx,bonusIdx)
	LilianMasterExpBonus:payBonus(masterIdx,bonusIdx)
	
	-- Խ�ϰ��޸�ȥ����Ʒ���� by Peres 2006/04/25
	-- LilianMasterItemBonus:payBonus(masterIdx,bonusIdx)
	
	-- �ƽ�ͽ�ܵ�ʦ�����ٻ�ö���Ľ���(20%)
	if (callPlayerFunction(appIdx, GetTask, TKID_GOLD_APPRENTICE) > 0) then
		callPlayerFunction(masterIdx, Msg2Player, "B�n �� s� d�ng Ho�ng Kim S� �� thi�p, nh�n ���c 20% ph�n th��ng kinh nghi�m")
		LilianMasterExpBonus:payBonusEx(masterIdx,bonusIdx, 0.2)
	end	
end
