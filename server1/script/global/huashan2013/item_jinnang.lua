--Edit by Youtube PGaming--


Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\battles\\seizegrain\\head.lua")
IncludeLib("ITEM")


function main()
if (GetTask(169) == 62)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3953,0,0,0}, nBindState=-2}, "test", 1);
AddNote("Nh�n ���c l�i nh�n #th� nh�t.") 
Msg2Player("Nh�n ���c l�i nh�n #th� nh�t.") 
AddNote("�i h� tr� �n Ki�m Thu tu s�a th�n ki�m c�a b�n ph�i.") 
Msg2Player("�i h� tr� �n Ki�m Thu tu s�a th�n ki�m c�a b�n ph�i.") 
SetTask(169,63)
elseif (GetTask(169) > 62) and (GetTask(169) < 66)then
Msg2Player("Th�i c� ch�a ��n kh�ng th� m� ra xem tr��c") 
return 1
--------------------------------xem lai nv nay--------------------------------------------
elseif (GetTask(169) == 66)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3954,0,0,0}, nBindState=-2}, "test", 1);
AddNote("Nh�n ���c l�i nh�n #th� 2.") 
Msg2Player("Nh�n ���c l�i nh�n #th� 2.") 
AddNote("H�y ��n thung l�ng (184/177) �� t�nh t�m.") 
Msg2Player("H�y ��n thung l�ng (184/177) �� t�nh t�m.") 
SetTask(169,67)
elseif (GetTask(169) > 66) and (GetTask(169) < 68)then
Msg2Player("Th�i c� ch�a ��n kh�ng th� m� ra xem tr��c") 
return 1
------------------------------------------------------------------------------------------------------
elseif (GetTask(169) == 68)  then
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3955,0,0,0}, nBindState=-2}, "test", 1);
AddNote("Nh�n ���c l�i nh�n #th� 3.") 
Msg2Player("Nh�n ���c l�i nh�n #th� 3.") 
AddNote("��n Ki�m C�c T�y Nam (430/227) ti�u di�t Kh�c V� H�nh.") 
Msg2Player("��n Ki�m C�c T�y Nam (430/227) ti�u di�t Kh�c V� H�nh.") 
SetTask(169,69)
elseif (GetTask(169) > 68) and (GetTask(169) < 70)then
Msg2Player("V�t ph�m n�y �� th�t b�i.")
DelCommonItem(6,1,3952)
elseif (GetTask(169) == 70)  then
Msg2Player("V�t ph�m n�y �� th�t b�i.")
DelCommonItem(6,1,3952)
end
if P == 3952 then 
	end
	return 1
end
