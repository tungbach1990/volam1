-- ������ �һ��� ·��_�һ���ʿ.lua
-- by: Dan_deng(2004-05-15)
-- ���һ�ҩ����ѯʱ�䣬Ϊϴ�����Ϸ��Լ��

Include("\\script\\global\\timerhead.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main()
	--Uworld137 = GetTask(137)
	--if (Uworld137 == 0) then						-- ��һ�ζԻ�����Ҫ��⼼�ܸ���
	--	if (check_faction() < 20) then			-- ��Ҫ�����似��
	--		Talk(1,"","�һ���ʿ�����������Ե����Ȼ�����һ�������ȥ�����㱾�ŵĳ����ɡ�˵��������һ����ָ�������о����������˹���")
	--	else												-- ������£�ֱ������
	--		Talk(1,"","�һ���ʿ����ӭһ�������һ��������������������������Ϊ��С���ѡ�")
	--	end
	-- elseif (Uworld137 < 20) then					-- û��ȥ���¼��ܵģ���������һ�ҩ
	--	Talk(1,"","�һ���ʿ����ȥ�ݼ���ı��ų����ɣ���ϲ������ò�ĺú��ӡ�")
	--elseif (GetLevel() >= 50) then		-- ��һ�����ҲҪ���Ϸ���
		-- Say("�һ���ʿ���һ����������������������ı��ء�����<color=red>������<color>���������ɹ����Զ�������һ���ά�ֹ�ЧһСʱ��",3,"�ã��Һ�/buy_yes","����һ�������๦Ч���ж���ʱ��/check_time","�´���˵��/OnCancel")
	--end
	
	strNeedLevel = "��o Hoa ��o v� c�ch tuy�t v�i th� gi�i b�n ngo�i, ���ng �i nguy hi�m, kh�ng ��n<color=red> "..AEXP_NEEDLEVEL.."c�p<color> m� mu�n v�o ��y? V� luy�n c�ng th�m �i!";
	-- ���˫����
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- ���˫��������
		nLevel = GetLevel();	
		if (nLevel < AEXP_NEEDLEVEL) then
			Say(strNeedLevel, 0);
		else
			Say("Hi�n nay ��o Hoa ��o linh kh� r�t m�nh, l�c n�y luy�n c�ng kh�ng c�n ph�i d�ng ��n ch�o L�p B�t. Nh�ng b�t ch�o �� u�ng c�ng s� kh�ng b� tr� th�i gian. H�m nay qu� l� m�t ng�y ��p tr�i. L�o phu ��y c�ng c�m th�y tinh th�n ph�n ch�n. ���c r�i! ��i hi�p kh�ng c�n t�n ng�n l��ng! C� h�i hi�m c�, h�y tranh th� luy�n c�ng �i nh�!", 0);
		end
		
		return 1;		
	end
	
	nLevel = GetLevel();	
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(strNeedLevel, 0);
	else
		Say("��o Hoa ��o linh kh� sung m�n. U�ng th�m b�t <color=red>ch�o L�p B�t<color> sc�ng l�c s� t�ng l�n r�t nhi�u. M�i b�t c� c�ng hi�u trong 1 gi�!",
			4,
			"���c! ta u�ng! /buy_yes",
			"Xin h�i: Th� ch�o n�y, u�ng v�o bao l�u sau m�i c� c�ng hi�u? /check_time",
			--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
			"L�n sau s� n�i ti�p /OnCancel");
	end
end

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function check_faction()
	if (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- ����������ɳ�ʦ
		SetTask(137,3)
		return 3
	elseif (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- ���ֻ�����ɳ�ʦ
		SetTask(137,7)
		return 7
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- ���Ż�����ɳ�ʦ
		SetTask(137,2)
		return 2
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- �嶾������ɳ�ʦ
		SetTask(137,10)
		return 10
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- ���һ�����ɳ�ʦ
		SetTask(137,1)
		return 1
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- ���̻�����ɳ�ʦ
		SetTask(137,6)
		return 6
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- ���̻�����ɳ�ʦ
		SetTask(137,4)
		return 4
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- ؤ�������ɳ�ʦ
		SetTask(137,8)
		return 8
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- �䵱������ɳ�ʦ
		SetTask(137,5)
		return 5
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- ���ػ�����ɳ�ʦ
		SetTask(137,9)
		return 9
	else																					-- �����ģ�����Ҫ����
		SetTask(137,20)
		return 20
	end
end;

function check_time()

	-- ���˫����
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- ���˫��������
		Say("Hi�n nay ��o Hoa ��o linh kh� r�t m�nh, l�c n�y luy�n c�ng kh�ng c�n ph�i d�ng ��n ch�o L�p B�t. Nh�ng b�t ch�o �� u�ng c�ng s� kh�ng b� tr� th�i gian. C� h�i hi�m c�. ��i hi�p h�y tranh th� luy�n c�ng �i nh�!", 0);
		return 1;
	end
	
	nCurValue = GetTask(AEXP_TASKID);
	
	if (nCurValue == 0) then	-- ���ܴ�δ�ȹ�������
		Say("H�nh nh� <color=red>ch�o L�p B�t<color> c�a ng��i kh�ng c� t�c d�ng! H�y mua th�m b�t n�a xem sao!", 0);
		return 0;
	end

	nTemp = mod(nCurValue, AEXP_TIME_ONE);
	nHours = (nCurValue - nTemp) / AEXP_TIME_ONE; -- �Ѻȵ�����(Сʱ��)
	nMinutes = nTemp * 60 / AEXP_TIME_ONE;

	if (nHours == 0) and (nMinutes < AEXP_FREQ) then	-- �һ�ʱ�䲻��
		Say("C�ng hi�u c�a ch�o l�p b�t �� h�t! Ng��i c�n ph�i mua th�m m�t �t n�a m�i c� th� ti�p t�c ph�t huy!", 0);
	elseif (nHours > 0) then				-- ����1Сʱ����
		Say("C�ng hi�u c�a Ch�o L�p B�t c�n c� th� duy tr�<color=red> "..nHours.."<color>gi�<color=red>"..nMinutes.."<color> ph�t", 0);
	else
		Say("C�ng hi�u c�a Ch�o L�p B�t c�n c� th� duy tr�<color=red> "..nMinutes.."<color> ph�t", 0);
	end
end;

g_arBuyNumber = {1, 2, 4, 8}; -- ��λ��Сʱ
function buy_yes()
	nLevel = GetLevel();
	arBuyStr = {};
	nCount = getn(g_arBuyNumber);

	for i = 1, nCount do
		nNumber = g_arBuyNumber[i];
		nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
		if (nMoney > 0) then
			arBuyStr[i] = ""..nNumber.."B�t [ "..nMoney.." l��ng]".."/buy_deal";
		end
	end

	arBuyStr[nCount + 1] = "Ta ch�a mu�n d�ng ��n!/OnCancel"
	Say("Ng��i mu�n u�ng m�y b�t?", nCount+1, arBuyStr);
end;

function buy_deal(nSel)
	nNumber = g_arBuyNumber[nSel+1]; -- ��λ��Сʱ
	
	--������� - start
	nCurValue = GetTask(AEXP_TASKID);
	temp = (AEXP_TIME_MAX - nCurValue) / AEXP_TIME_ONE; -- Ŀǰ�ɺȵ�����(Сʱ��)
	nRemainNumber = floor(temp);
	if (nRemainNumber <= 0) then
		Msg2Player("B�n �� u�ng"..AEXP_HOUR_MAX.."B�t ch�o L�p B�t, c�m gi�c t� m�nh c�ng kh�ng �n th�m ���c t� n�o. C� l� sau 1 th�i gian ti�u h�a m�i c� th� �n m�y b�t. ")
		return 0;
	end

	if (nNumber > nRemainNumber) then
		Msg2Player("b�n c�m th�y m�nh c� th� u�ng t�i �a"..AEXP_HOUR_MAX.."B�t ch�o L�p B�t, b�y gi� �� �n r�i "..(AEXP_HOUR_MAX - nRemainNumber).."B�t. ")
		nNumber = nRemainNumber;
	end
	--������� - end

	nLevel = GetLevel();
	nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
	if (GetCash() >= nMoney) then
		Pay(nMoney);
		nValueTotal = nCurValue + (AEXP_TIME_ONE * nNumber);
		SetTask(AEXP_TASKID,  nValueTotal);

		-- ������ʱ����ʾ - start
		nTemp = mod(nValueTotal, AEXP_TIME_ONE);
		nHours = (nValueTotal - nTemp) / AEXP_TIME_ONE; -- �Ѻȵ�����(Сʱ��)
		nMinutes = nTemp * 60 / AEXP_TIME_ONE;
		Msg2Player("B�n �� u�ng"..nNumber.."b�nh ch�o L�p B�t. C� th� t� ��ng luy�n c�ng"..nHours.."gi� "..nMinutes.."ph�t");
		-- ������ʱ����ʾ - end
				
		if (nCurValue == 0) then -- �����ǵ�һ�κ�
			Talk(1,"","Ch�o L�p B�t ch� c� c�ng hi�u tr�n ��o Hoa ��o! N�u u�ng r�i m� r�i kh�i ��y s� m�t t�c d�ng")
		end
	else
		Talk(1,"","Ch�o L�p B�t l� m�t d��c ph�m th�n k�, kh�ng th� t�ng! ��i hi�p h�y mang "..nMoney.." l��ng ��n �� mua!")
	end
end;

function OnCancel()
end;
