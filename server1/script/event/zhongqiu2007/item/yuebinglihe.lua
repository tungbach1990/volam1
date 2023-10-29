--�����2007 �±����
--by С�˶��
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function mainzhongqiu2007_entry()
	Describe("L� Quan: V�n Du v� Ti�n V� l� hai b�c danh h�a v�n ���c c�t gi� t�i ho�ng cung, do chi�n tranh li�n mi�n n�n b� v� th�nh nhi�u m�nh v� th�t l�c kh�p n�i. Nghe n�i <color=yellow>Hoa vi�n ngo�i t�i L�m An (169/194)<color> v� <color=yellow>Qu�ch vi�n ngo�i th�nh T��ng D��ng (198/208) <color>�ang c�t c�ng t�m ki�m 2 b�c tranh n�y, ai c� th� gi�p h� t�m ���c hai b�c tranh n�y s� nh�n ���c ph�n th��ng x�ng ��ng. Trung Thu s�p ��n r�i, trong ho�ng cung c�ng c�n l�m nhi�u b�nh Trung Thu. T� <color=red>22-09-2007<color> ��n <color=red>24h00 ng�y 31-10-2007<color>, m�i h�p b�nh ��u c� x�c su�t nh�n ���c <color=red>m�nh tranh V�n Du<color> ho�c <color=red>m�nh tranh Ti�n V�<color>, ��i hi�p mu�n ��i g�?",2,"��y l� h�p b�nh Trung Thu, xin h�y nh�n l�y./zhongqiu2007_getlihe","Ta s� quay l�i sau!/NoChoice")
end

function zhongqiu2007_getlihe()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	if CalcEquiproomItemCount(6,1,1514,-1) < 1 then
		Say("L� Quan: ��i hi�p kh�ng mang theo h�p b�nh Trung Thu, c� ph�i �� �� qu�n trong r��ng r�i kh�ng?",0)
		return 1
	end
	if CalcFreeItemCellCount() < 4 then
		Say("L� Quan: H�nh trang kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2007_LIHE)
	local nexp = 8000000
	if ncurexp >= NZHONGQIU2007_MAX then
		Msg2Player("�i�m kinh nghi�m nh�n ���c �� v��t gi�i h�n.")
		return 1
	else
		if(ncurexp + nexp) >= NZHONGQIU2007_LIHE_MAX then
			nexp = NZHONGQIU2007_LIHE_MAX - ncurexp
		end
		SetTask(TSK_ZHONGQIU2007_LIHE,(ncurexp+nexp))
		AddOwnExp(nexp)
		Msg2Player(format("Nh�n ���c <color=yellow>%s<color> �i�m kinh nghi�m",nexp))
		WriteLog(format("[zhongqiu2007_lihe]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
	end
	ConsumeEquiproomItem(1,6,1,1514,-1)
	local nrate = random(1,tb_Mareial_LIHE[1]);
	local nsum = 0
	for nkey,nitem in tb_Mareial_LIHE[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_LIHE[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				Msg2Player(format("B�n nh�n ���c 1 <color=yellow>%s<color>",GetItemName(nidx)))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
				return 0
			end
	end
end
