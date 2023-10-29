Include("\\script\\tong\\tong_header.lua");

Include("\\script\\global\\repute_head.lua")

function CheckLeaveTongPower()
	str, result = GetTong()		--�ж��Ƿ��ڰ����
	if (result == 1) and (str ~= "") then
		-- LLG_ALLINONE_TODO_20070802
--		need_money = {10000,100000,500000}
		need_money = {500000,100000,10000,10000,10000}
		figure = GetTongFigure()		--�жϽ�ɫ�ڰ���е����
		if (figure == TONG_MASTER) then
			Msg2Player("Bang ch� kh�ng cho ph�p ph�n b�i bang h�i ")
			return 0
		else
			if (GetCash() >= need_money[figure]) then
				SetTaskTemp(11,need_money[figure])
				Nrepute = check_repute(figure)		-- ͨ������е�ְλ�ж�Ӧ����������
				SetTaskTemp(12,Nrepute)
				Msg2Player("C�nh c�o: r�i kh�i bang h�i s� b� tr� ti�n"..need_money[figure].."Ph�t ti�n g�p ��i v� �i�m danh v�ng c�ng h� t��ng �ng"..Nrepute.."�i�m!")
				return need_money[figure]		--��������ж��Ƿ�Ǯ
			else
				Msg2Player("C�nh c�o: r�i kh�i bang h�i s� b� tr� ti�n"..need_money[figure].."Ph�t ti�n g�p ��i, nh�ng b�y gi� b�n ch�a �� ti�n")
				return 0
			end
		end
	else
		Msg2Player("B�n hi�n gi� kh�ng thu�c bang h�i n�o!")
		return 0
	end
end;

function check_repute(Tong_title)		-- ͨ���ڰ���е�ְλ�ж�Ӧ����������
	Rep = GetRepute()
	Repute_Level = GetReputeLevel(Rep)
	if (Tong_title == TONG_ELDER) then			-- ����
		reduce_repute = GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)			-- Ӧ�ý��͵�����
	elseif (Tong_title == TONG_MANAGER) then		-- �ӳ�
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.5)
	else								-- ���ڡ���ʿ
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.25)
	end
	if (Rep <= reduce_repute) then	-- ��������������Ϊ0
		reduce_repute = Rep 
	end
	return reduce_repute
end
