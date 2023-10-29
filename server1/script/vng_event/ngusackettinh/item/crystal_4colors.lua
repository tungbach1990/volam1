Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal4Col = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return 1
	end
	-- het event, vat pham het han su dung
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	local nResult, szErrorMessage = tbNSKT_Crystal4Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

function tbNSKT_Crystal4Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "��i hi�p ��  ��t t�i �a s� d�ng v�t ph�m n�y!"
	end
	if (tbNSKT_Crystal:checkBag(1) == 0)then
		return 0, "�� b�o v� t�i s�n, xin vui l�ng ch�a 1 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!" --hanh trang khong du khoang trong, kh�ng x�a v�t ph�m
	end	
	
	--Tao bang phan thuong kinh nghiem
	local tbExp = {
							{n_Exp =5e6, n_Rate = 20},
							{n_Exp =6e6, n_Rate = 65},
							{n_Exp =8e6, n_Rate = 12},
							{n_Exp =10e6, n_Rate = 2},
							{n_Exp =20e6, n_Rate = 1}	
						};							
	local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
	local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
	--neu tbExp = nil, khong phat thuong, tra ve 1 de xoa vat pham
	if (not tbExp) then
		return 1;
	end
	-- khong cho kinh nghiem vuot qua gioi han 8 ti
	for i = 1, getn(tbExp) do
		if (nTemp < tbExp[i].n_Exp) then
			tbExp[i].n_Exp = nTemp
		end
	end		
	
	local tbAward = {}
	for i = 1, getn(tbExp) do
		tbAward[i] = {
								[1] = {nExp = tbExp[i].n_Exp},
								[2] = 
										{
											pFun = function (tbItem, nItemCount, szLogTitle)
												%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
											end
										},
								nRate = tbExp[i].n_Rate,
							}
	end
	--ket thuc tao bang phan thuong kinh nghiem

	--Tao bang pham thuong vat pham
	local tbItemAward = 
		{
			{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nRate=2,nCount=1},
			{szName="H�n Nguy�n Linh L�",tbProp={6,1,2312,1,0,0},nRate=2,nCount=1},
			{szName="M�t n� Nguy�n so�i",tbProp={0,11,447,1,0,0},nRate=2,nCount=1},
			{szName="Ph� Qu� C�m H�p",tbProp={6,1,2402,1,0,0},nRate=12,nCount=1},
			{szName="Ng�n l��ng",nJxb=1000000,nRate=10,nCount=1},
			{szName="Ng�n l��ng",nJxb=2000000,nRate=2,nCount=1},
			{szName="Ng�n l��ng",nJxb=5000000,nRate=1,nCount=1},
			{szName="Ng�n l��ng",nJxb=10000000,nRate=0.2,nCount=1},
			{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nRate=3,nCount=1},
			{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nRate=3,nCount=1},
			{szName="C�m nang thay ��i tr�i ��t",tbProp={6,1,1781,1,0,0},nRate=3,nCount=1,tbParam={60}},
			{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nRate=4.3,nCount=1},
			{szName="Ng�i Sao May M�n",tbProp={6,1,30078,1,0,0},nRate=24,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			{szName="Thi�n Long L�nh",tbProp={6,1,2256,1,0,0},nRate=4,nCount=1},
			{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nRate=1,nCount=1},
			{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nRate=1,nCount=1},
			{szName="B�ch Ni�n Tr�n L�",tbProp={6,1,2266,1,0,0},nRate=4,nCount=1},
			{szName="Thi�n Ni�n Tr�n L�",tbProp={6,1,2267,1,0,0},nRate=3,nCount=1},
			{szName="V�n Ni�n Tr�n L�",tbProp={6,1,2268,1,0,0},nRate=2,nCount=1},
			{szName="N�n B�t tr�n ph�c nguy�t",tbProp={6,1,1817,1,0,0},nRate=5,nCount=1},
			{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nRate=2,nCount=1},
			{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nRate=0.3,nCount=1,nExpiredTime=14400},
			{szName="Thi�n S�n Tuy�t Li�n",tbProp={6,1,1431,1,0,0},nRate=0.1,nCount=1},
			{szName="Huy�n Vi�n L�nh",tbProp={6,1,2351,1,0,0},nRate=0.1,nCount=1},
			{szName="Huy�n Thi�n C�m Nang",tbProp={6,1,2355,1,0,0},nRate=3,nCount=1},
			{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nRate=6,nCount=1},
		}
	--ket thuc tao bang phan thuong vat pham	
	if (tbAward) then
		tbNSKT_Crystal:giveAward(tbAward, "Ph�n th��ng EXP k�t tinh t� s�c");
	end	
	if(tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "Ph�n th��ng k�t tinh t� s�c");
	end
	return 1;	
end