Include("\\script\\event\\beidoulingpai\\itemlist.lua")
Include("\\script\\event\\beidoulingpai\\lang.lua")
tbBDTaskList = 
{
	[1] = {nTaskType = 1, szShow = "��n ���ng M�n t�m ���ng Khuy�t",szNpcName="���ng Khuy�t ", },
	[2] = {nTaskType = 1, szShow = "��n ���ng M�n t�m Qu�n Gia",szNpcName="Qu�n Gia", },
	[3] = {nTaskType = 1, szShow = "��n L�m An t�m T�u B�o",szNpcName="T�u B�o ", },
	[4] = {nTaskType = 1, szShow = "��n Ng� ��c Gi�o t�m B�ch Doanh Doanh",szNpcName="B�ch Doanh Doanh", },
	[5] = {nTaskType = 1, szShow = "��n Th�y Y�n M�n t�m [H�i ���ng S� Gi�] L� Thu Th�y",szNpcName="H�i ���ng s� gi� L� Thu Thu� ", },
	[6] = {nTaskType = 1, szShow = "��n ph�i C�n Lu�n t�m ��ng T�ch Nhan",szNpcName="��ng T�ch Nhan", },
	[7] = {nTaskType = 1, szShow = "��n ph�i V� �ang t�m Chu V�n Tuy�n",szNpcName="Chu V�n Tuy�n", },
	[8] = {nTaskType = 1, szShow = "��n C� D��ng ��ng t�m Th��ng Bu�n",szNpcName="Th��ng Bu�n", },
	[9] = {nTaskType = 1, szShow = "��n T��ng D��ng t�m ��o ��o",szNpcName="��o ��o", },
	[10] = {nTaskType = 1, szShow = "��n T��ng D��ng t�m Ti�u ��u",szNpcName="Ti�u ��u", },
	[11] = {nTaskType = 1, szShow = "��n Th�nh �� t�m H� Lan Chi",szNpcName="H� Lan Chi", },
	[12] = {nTaskType = 1, szShow = "��n Th�nh �� t�m T� T�u",szNpcName="T� T�u", },
	[13] = {nTaskType = 1, szShow = "��n ��i L� t�m �ao Li�n Anh",szNpcName="�ao Li�n Anh ", },
	[14] = {nTaskType = 1, szShow = "��n Ph��ng T��ng t�m ��u ��u",szNpcName="��u ��u ", },
	[15] = {nTaskType = 1, szShow = "��n Ph��ng T��ng t�m �ng ch� ti�m tr�",szNpcName="Ch� ti�m tr� ", },
	[16] = {nTaskType = 1, szShow = "��n Bi�n Kinh t�m Ph��ng L�o Th�i",szNpcName="Ph��ng L�o Th�i ", },
	[17] = {nTaskType = 1, szShow = "��n Bi�n Kinh t�m ��u T� L� ",szNpcName="��u T� L� ", },
	[18] = {nTaskType = 1, szShow = "��n L�m An t�m Th� Sinh",szNpcName="Th� sinh", },
	[19] = {nTaskType = 1, szShow = "��n D��ng Ch�u t�m Tr� B�c S�",szNpcName="Tr� b�c s� ", },
	[20] = {nTaskType = 1, szShow = "��n D��ng Ch�u t�m Li�u ��i Gia",szNpcName="Li�u ��i gia", },
	[21] = {nTaskType = 1, szShow = "��n D��ng Ch�u t�m Nh�m Thi�n Nhai",szNpcName="Nhi�m Thi�n Nhai", },
	[22] = {nTaskType = 1, szShow = "��n Giang T�n th�n t�m Thi�n Thi�n",szNpcName="Thi�n Thi�n ", },
	[23] = {nTaskType = 1, szShow = "��n Th�ch C� tr�n t�m A Nguy�n",szNpcName="A Nguy�n ", },
	[24] = {nTaskType = 1, szShow = "��n V�nh L�c tr�n t�m C�c N�u",szNpcName="C�c N�u ", },
	[25] = {nTaskType = 1, szShow = "��n Long M�n tr�n t�m Mai H��ng",szNpcName="Mai H��ng ", },
	[26] = {nTaskType = 1, szShow = "��n Ba L�ng huy�n t�m Du C�u Ch�u",szNpcName="Du C�u Ch�u", },
	[27] = {nTaskType = 1, szShow = "��n Nam Nh�c tr�n t�m A Ph�c",szNpcName="A Ph�c ", },
	[28] = {nTaskType = 1, szShow = "��n Chu Ti�n tr�n t�m L�o M�",szNpcName="L�o M� ", },
	[29] = {nTaskType = 1, szShow = "��n Long Tuy�n th�n t�m B�nh Ph�ng",szNpcName="B�nh Ph�ng", },
	[30] = {nTaskType = 1, szShow = "��n ��o H��ng th�n t�m V��ng H�",szNpcName="V��ng H� ", },
	[31] = {nTaskType = 1, szShow = "��n Thi�n V��ng Bang t�m H�u S� D��ng H�",szNpcName="H�u S� D��ng H� ", },
	[32] = {nTaskType = 1, szShow = "��n C�i Bang t�m L� T�",szNpcName="L� T� ", },
}

for i=1, getn(tbBD_ItemList) do
	local taskOpt = {}
	if i>= 129 then 
		taskOpt.nTaskType = 2 
	else
		taskOpt.nTaskType = 0
	end
	taskOpt.szShow = format(MSG_TASK_SHOW, tbBD_ItemList[i].nCount, tbBD_ItemList[i].szName )
	taskOpt.nItemListIndex = i
	tinsert(tbBDTaskList, taskOpt)
end
