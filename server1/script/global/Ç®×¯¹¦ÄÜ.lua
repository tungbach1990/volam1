-- Ǯׯ����.lua		������ı�׼�ļ�
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) ����Ʊ�����Ƴ����ٰ�Ǯׯ����

function main_proc()
	if (GetSex() == 0) then
		Say("��ng r�i! Thi�u hi�p c�n g�?",2,"� ��y c� bao l� x� kh�ng? /buy_sele","Nh�n ti�n gh� qua th�i/no")
	else
		Say("��ng r�i! N� hi�p c�n g�?",2,"� ��y c� bao l� x� kh�ng? /buy_sele","Nh�n ti�n gh� qua th�i/no")
	end
end
------------ ���� ---------------------
function buy_sele()
	--Say("Ǯׯ�ϰ壺������ĺ������ӷ�٣���������أ�����������Ʒ��С���10000��������100000�����Լ�<color=green>�������ͺ�������\n������<color>���ɿ������Լ�����������Ǯ�ĺ����\n<color=green>������<color>�ǿ��԰�<color=yellow>ͭǮ<color>�ĺ������Ȼ�����ͭǮ����������������",5,"Ҫ��С�����/buy1","��������/buy2","Ҫ������/ruyi_hongbao","Ҫ������/hesui_hongbao","��Ҫ��/no")
	Say("Ti�u H�ng bao 10000 l��ng, ��i H�ng Bao 100000 l��ng. Kh�ch quan mu�n lo�i n�o?",3,"Mu�n 1 bao l� x� nh�. /buy1","Mu�n 1 bao l� x� l�n. /buy2","Kh�ng c�n ��u. /no")
end

function buy1()
	if (GetCash() >= 10000) then
		Pay(10000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","Ti�u H�ng Bao 1 c�i!  Xin nh�n l�y! ")
	else
		Talk(1,"","Kh�ch quan h�nh nh� ch�a �� ti�n.")
	end
end

function buy2()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","��i H�ng Bao 1 c�i!  Xin nh�n l�y! ")
	else
		Talk(1,"","Kh�ch quan h�nh nh� ch�a �� ti�n.")
	end
end

function no()
end

function hesui_hongbao()	--�Զ���ͭǮ
	AskClientForNumber("Package_Hesui", 1, 100, "Xin nh�p v�o s� l��ng Ti�n ��ng:");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","Kh�ch quan kh�ng �� "..nMoney.." ti�n ��ng")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","M�i kh�ch quan nh�n1 bao m�ng th�!")
	end
end


function ruyi_hongbao()		--�Զ����Ǯ
	AskClientForNumber("Package_Ruyi", 1, 10000000, "Xin nh�p s� ti�n v�o bao l� x�:");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","Kh�ch quan b�n h�nh nh� kh�ng ��"..nMoney.." l��ng.")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000) / 1000)
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","M�i nh�n bao l� x� Nh� �!")
	end
end