Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal5Col = {}

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
	local nResult, szErrorMessage = tbNSKT_Crystal5Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

--su dung item, gia tri tra ve:
function tbNSKT_Crystal5Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "��i hi�p ��  ��t t�i �a s� d�ng v�t ph�m n�y!"
	end
	if (tbNSKT_Crystal:checkBag(6) == 0)then
		return 0, "�� b�o v� t�i s�n, xin vui l�ng ch�a 6 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!" --hanh trang khong du khoang trong, kh�ng x�a v�t ph�m
	end
			
	--Tao bang phan thuong kinh nghiem
	local tbExp = {
							{n_Exp =25e6, n_Rate = 40},
							{n_Exp =30e6, n_Rate = 45},
							{n_Exp =40e6, n_Rate = 12},
							{n_Exp =50e6, n_Rate = 2},
							{n_Exp =100e6, n_Rate = 1}	
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
		tbAward[i] = 
			{
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
		{szName="Huy�n Vi�n L�nh",tbProp={6,1,2351,1,0,0},nRate=2,nCount=1},
		{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nRate=6,nCount=1},
		{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nRate=8,nCount=1},
		{szName="H�n Nguy�n Linh L�",tbProp={6,1,2312,1,0,0},nRate=3,nCount=5},
		{szName="Ph� Qu� C�m H�p",tbProp={6,1,2402,1,0,0},nRate=5,nCount=5},
		{szName="V�n Ni�n Huy Ho�ng qu�",tbProp={6,1,2271,1,0,0},nRate=9.3,nCount=2},
		{szName="Ng�n l��ng",nJxb=5000000,nRate=10,nCount=1},
		{szName="Ng�n l��ng",nJxb=10000000,nRate=2,nCount=1},
		{szName="Ng�n l��ng",nJxb=20000000,nRate=1,nCount=1},
		{szName="Ng�n l��ng",nJxb=50000000,nRate=0.2,nCount=1},
		{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nRate=2,nCount=3},
		{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nRate=2,nCount=3},
		{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nRate=1.5,nCount=1,nExpiredTime=14400},
		{szName="C�m nang thay ��i tr�i ��t",tbProp={6,1,1781,1,0,0},nRate=5,nCount=5,tbParam={60}},
		{szName="L�nh B�i Tri�u H�i",tbProp={6,1,30074,1,0,0},nRate=16,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
		{szName="Thi�n Long L�nh",tbProp={6,1,2256,1,0,0},nRate=2,nCount=5},
		{szName="T� H�i Ti�u Di�u ��n L� H�p",tbProp={6,1,2398,1,0,0},nRate=1,nCount=1},
		{szName="Ng� Ch�u L�ng Kh�ng ��n L� H�p",tbProp={6,1,2399,1,0,0},nRate=1,nCount=1},
		{szName="C�u Thi�n V�n Du ��n L� H�p",tbProp={6,1,2400,1,0,0},nRate=1,nCount=1},
		{szName="B�ch ni�n th�t tinh th�o",tbProp={6,1,1674,1,0,0},nRate=0.5,nCount=1},
		{szName="Thi�n ni�n th�t tinh th�o",tbProp={6,1,1675,1,0,0},nRate=0.3,nCount=1},
		{szName="V�n Ni�n Ng� Th�i Hoa",tbProp={6,1,2265,1,0,0},nRate=0.2,nCount=1},
		{szName="M�t n� Nguy�n so�i",tbProp={0,11,447,1,0,0},nRate=4,nCount=1},
		{szName="Thi�n S�n Tuy�t Li�n",tbProp={6,1,1431,1,0,0},nRate=1,nCount=1},
		{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nRate=4,nCount=2},
		{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nRate=5,nCount=5},
		{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nRate=5,nCount=5},
		{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nRate=2,nCount=1,nExpiredTime=10080},
	}
	--ket thuc tao bang phan thuong vat pham	
	
	--vat pham thuong ngoi sao may man	
	local tbStarAward =
		{
			[1] = {szName="Ng�i Sao May M�n",tbProp={6,1,30078,1,0,0},nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			nRate = 100
		}
		
	--tang thuong
	if (tbAward)then
		tbNSKT_Crystal:giveAward(tbAward, "Ph�n th��ng EXP k�t tinh ng� s�c");	
	end
	if(tbStarAward)then
		tbNSKT_Crystal:giveAward(tbStarAward, "Ph�n th��ng ng�i sao may m�n k�t tinh ng� s�c");
	end		
	if (tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "Ph�n th��ng k�t tinh ng� s�c");
	end
	return 1;		
end