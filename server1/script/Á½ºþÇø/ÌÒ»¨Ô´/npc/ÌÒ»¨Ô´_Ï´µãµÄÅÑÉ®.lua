--ϴ���ܵ����ɮ
-- By: Dan_Deng(2003-08-29)
-- Update: Dan_Deng(2004-02-04) ϴ���޸�Ϊ����ϴ255��
-- Update: Dan_Deng(2004-05-27) С��ʧ������ (Uworld42 = GetTask(42))
-- ��ʱ�����趨: ���μ���(1),����ˮ��(257),���ˮ��(10),���(1024)
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")


function main()
--	Uworld137 = GetTask(137)
--	UTask_world13 = GetTask(13)
	Uworld42 = GetTask(42)
	tbTrainSkill150:ResetDailyTask()
--	SetTaskTemp(1,0)		-- ��λ�������κθ���
	if (Uworld42 == 40) then					-- С��ʧ������
		Talk(12,"","V� danh ��i s�! Ta ��n t�m ��a b� m�t t�ch � ��i L�, B� ��o Nh�n gi�i thi�u ta ��n! ","A di �� ph�t! L�o T�p Mao n�y l� ng��i trong s�ch. Kh�ng bi�t! Kh�ng bi�t. ","Mong ��i s� t� bi b� qua, n�i cho t�i h� bi�t!","N�m x�a l�o n�p b� tr�c xu�t kh�i s� m�n,Ph��ng Tr��ng H� t�ng c� t� bi kh�ng","Kh�ng bi�t ��i s� b� tr�c xu�t v� l� do g�? ","Th�t k� l�! Ng��i h�i nhi�u l�m gi?Ha! Ha! L�o n�p kh�ng nh�ng n�i cho ng��i bi�t l� do tr�c xu�t, m� c�n s� ti�t l� v� chuy�n m�t t�ch c�a ��a b� ","Ha! Ha! Th� ra h�a th��ng �� ph�m gi�i","N�i nh� th�i! A di �� ph�t! Thi�n tai thi�n tai!","R��u th�t �� n�m qua, t�m kh�ng h��ng Ph�t t� n�a. Tham m�t ch�t kh�ng ph�i l� c�i sai qu� l�n. ","Ha! Ha! T�t! Ng��i h�p v�i ta ��y! Ta n�i cho ng��i bi�t! K� th�c ��a b� �n c�p �� kh�ng ph�i l� ng��i x�u g�, ch�ng qua n� mu�n l�m m�t vi�c r�t quan tr�ng, ch� m��n m�t ch�t sau �� s� tr�!","��i s�! M��i m�ng ng��i kh�ng ph�i l� �� v�t, n�i m��n l� sao?","���c! Ng��i �i t�m m�t ng��i t�n l� Long Truy V�. N�m x�a h�n, ta, Ph� T�p Mao, th�ng b� �n c�p h�p l�i th�nh 'V� L�m T� K�'. Ch� c� h�n m�i bi�t ng��i kia hi�n th�i � ��u")
		SetTask(42,50)
		AddNote("Nhi�m v� ��a b� m�t t�ch: �i t�m Long Truy v� h�i tin t�c v� ��a b� m�t t�ch. ")
		Msg2Player("Nhi�m v� ��a b� m�t t�ch: �i t�m Long Truy v� h�i tin t�c v� ��a b� m�t t�ch. ")
--	elseif (GetLevel() >= 50) then				-- and (GetCamp() == 4) then		-- ����ϴ�㣨�������ƺ���ϴ�㣩
--		if (Uworld137 > 20) and (Uworld137 <= 30) then			-- 2004-06-11���ܸ��¸�һ�����ϴ�㣨������������
--			Say("������������Ҳ���Ͻ����ķ��ϣ�û��ˮ����Ҳ�������輼��1�Σ�Ҫ��Ҫ����������᣿",2,"�ã���Ҫ���輼��/rollback_0611","�һ��ǳٵ�������/no")
--		elseif (UTask_world13 == 0) then				-- δϴ���㣨�����ü��ܻ�ʯϴ��
--			Talk(1,"rollback_get","����������<color=red>�׽�ϴ��<color>����ĸ��ǻ����һ�������ˣ�����Ȼ��Ҫ������ϴ�裿")
--		elseif (UTask_world13 == 511) then		-- ϴ���Ѵ����ޣ����������κ�ϴ�����
--			Talk(1,"","��������ϴ��Ĵ���ʵ��̫�࣬���������ˡ������Ҫǿ����ϴ��Ļ������»ᾭ�����ϣ���Ϊ���ˣ�")
--		elseif (UTask_world13 == 255) then	-- ϴ���Ѵ����ޣ�����δ�ñ�ʯ���ؼ��ܵ�
--			Say("��������ϴ��Ĵ���ʵ��̫�࣬���������ˡ�������������ҵ����ž��������֮Ԫ��ˮ���Ļ��������������޲�һ�����ڵ�һ��ϴ��ʱ����ľ�����",2,"���Ѿ���������ˮ������/found_jewel_yes","�Ǿ�����/no")
--		elseif (UTask_world13 >= 257) and (UTask_world13 < 511) then		-- ���ϴ�㣨�ޱ�ʯ���ؼ��ܹ��ܣ�
--			Say("����������ϴ��Ļ�������ʮ�������ӻ�����Ҫ��ˮ����ס��������������������������˵ľ���ʵ��̫�����ա�",2,"���������׼���׵�/NEWpay_yes","�Ǿ�����/rollback_no")
--		elseif (UTask_world13 >= 1) and (UTask_world13 < 256) then		-- ���ϴ�㣨���ҿ��ñ�ʯ���ؼ��ܵ㣩
--			Say("����������ϴ��Ļ�������ʮ�������ӻ�����Ҫ��ˮ����ס��������������������������˵ľ���ʵ��̫�����ա����⣬�������������ˮ������û����Ȱ�һ��ϴ��ʱ���������µ������ȸ��޲��ˣ���������",3,"������޲��ϴ�����ľ���/found_jewel_yes","��������ϴһ����/NEWpay_yes","�Ǿ�����/rollback_no")
--		else
--			Talk(1,"","�����ߣ�ϴ��״̬�����˴���������Ϸ����Ա(GM)��ϵ��")
--		end
	else		
		-- ȱʡ�Ի�������ϴ��ı䣩
		local szTitle = "B�y gi� ng��i ch� c�n t�m m�t ng��i Xa phu n�o ��, ��u c� th� ��a ng��i �i 'T�y T�y ��o', b�n t�ng gi�p ng��i t�y t�y!"
		szTitle = szTitle .. "C� �i�u ta c� th� ��a c�c ng��i �i <color=yellow> Vo Danh M�t C�nh <color>, t�i �� c� th� s� d�ng kinh nghi�m �� ��i l�y �� tu luy�n c�a k� n�ng."
		
		local tbOpt = {}
		--- Th�m N�p v�t ph�m t�ng �� tu luy�n skill 150 -- Modified By NgaVN - 20121207
		tinsert(tbOpt, {"N�p v�t ph�m Tu ch�n y�u quy�t", tbTrainSkill150.LoadItem, {tbTrainSkill150}})
		-- ��ȥ֮ǰ��Ҫ�ж� �Ƿ����150�����ܣ�������
		
		-- M� t�nh n�ng ��a ta �i V� Danh M�t C�nh - - Modified By NgaVN - 20121207
		tinsert(tbOpt, {"��a ta �i V� Danh M�t C�nh", toWumingmijin})	
		tinsert(tbOpt, {"�� ta suy ngh� l�i", no})
		
		CreateNewSayEx(szTitle, tbOpt)
		
				
--		i = random(0,2)
--		if (i == 0) then
--			Talk(1,"","�������Դ����˸��õ�ϴ��ȥ�������������̾ͱ���ſ���ȸ�ˡ�")
----			Talk(1,"","�������׽�ϴ��Ĺ�������׽���������������Ź����������ȴ����ɢ��ȫ��������ȫ��Ϊ�����ޡ��ɺ���Ϊ���ֶ���ϰ���Ź��򣬵�ͷ��ȴ��������֣�")
----		elseif (i == 1) then
----			Talk(1,"","������̰�������ʲô�����ˣ��ѵ������˾ͱ���ͷ���¶���𣿾�ȻΪ����Ͱ���������֡�����Ҳ�ã�������������������ң���ڣ�")
--		else
--			Talk(2,"","����������������ϴ�����ƶɮ����Ȼƶ�ƣ�����Ҳ����ƭ�㡣","������������ֻҪ������ĸ����еĳ��򣬶���������ȥ��ϴ�赺������ƶɮϴ����ӷ��㡣")
----			Talk(1,"","�������׽�ϴ����Ȼ�������ϴ��֮�˸���ȴ��Ȼ��һ�����ˣ������Ҫϴ��Ļ�һ��Ҫ���������")
--		end
	end
end;

function toWumingmijin()
	local tbSkill_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}
	local bResult = 0
	for i=1, getn(tbSkill_150) do
		if HaveMagic(tbSkill_150[i]) ~= -1 then
			bResult = 1
			break
		end
	end

	if bResult == 1 then
		NewWorld(967,1634, 3231)
	else
		Talk(1,"","��i sau khi h�c ���c k� n�ng 150 r�i h�y �i V� Danh M�t C�nh!")
	end
end

function rollback_0611()		-- Ϊ(2004-06-11)��Ƶ����ϴ��
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1024)		-- �˴�ϴ������Ϊ1024
		rollback_prise()
	else
		Talk(1,"","Ng��i h�nh t�u giang h� l�u nh� v�y, ch� 100000 ng�n l��ng c�ng kh�ng c� sao?")
	end
end

function rollback_1212()		-- Ϊ(2003-12-12)��Ƶ����ϴ�㣨��ȡ����
	if (GetCash() >= 100000) then
		SetTaskTemp(1,1)		-- �˴�ϴ������Ϊ1
		rollback_prise()
	else
		Talk(1,"","T� ti�n �� c�ng kh�ng c�, l�m sao b�n ba giang h�!")
	end
end

function found_jewel_yes()		-- �ҵ���ʯ�����ؼ��ܵ�
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			Pay(100000)
			SetTask(13,GetTask(13) + 256)	-- �ѱ����ĳ��ù���ʯ��״̬
			for i = 1,j238 do DelItemEx(238) end
			for i = 1,j239 do DelItemEx(239) end
			for i = 1,j240 do DelItemEx(240) end
			AddMagicPoint(3)		-- ����ϴ��۳���3�㡣
			Talk(1,"KickOutSelf","Xong r�i! Tr��c m�t ng��i n�n ng�i t�nh d��ng m�t ch�t l�y l�i s�c!")
		elseif (j238+j239+j240 > 3) then
			Say("Ng��i h�y ��a ta 3 vi�n Th�y tinh tr��c, ta m�i c� th� gi�p ng��i ���c!",1,"V�y �� ta �i c�t b�t ��, r�i quay l�i g�p ��i s�. /rollback_no")
		else
			Talk(1,"","Ng��i r� r�ng kh�ng c� �� 3 vi�n Th�y tinh")
		end
	else
		Talk(1,"","Xong r�i! Tr��c m�t ng��i n�n ng�i t�nh d��ng m�t ch�t l�y l�i s�c!")
	end
end

function rollback_get()
	Say("Xong r�i! Ta m�t qu�! Ng��i ��m l�ng cho ta ch�t �i!",2,"��y l� 10 v�n l��ng, xin ��i s� nh�n cho. /pay_yes","V�y th�i �i/rollback_no")
end;

function rollback_no()
	Talk(1,"","�ang mong ch� ��i gi� quang l�m, th� ���c 10 v�n l��ng, Ha! Ha! Ha!. ")
end;

function pay_yes()					-- ����ϴ�㣬���õı�ʯ�����ۼ��ܣ�
	if (GetCash() >= 100000) then
		if (GetByte(GetTask(13),2) == 0) then		-- ���ù�ˮ���Ͳ���������ˮ��ϴ��
			Say("Ng��i h�y ��a ta 3 vi�n Th�y tinh tr��c, ta m�i c� th� gi�p ng��i ���c!",3,"Ta c� ba h�t /pay_jewel","Ta kh�ng vi�n �� qu� ��, kinh m�ch b� th��ng c�ng kh�ng ch�u n�i n�a r�i. /jewel_none","V�y th� ta s� thay g�n ��i c�t mu�n m�t ch�t /rollback_no")
		else
			jewel_none()
		end
	else
		Talk(1,"","��y l� th�nh � c�a ng��i sao?Nh� th� th� ng��i quay v� �i! ")
	end
end

function pay_jewel()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	if (j238+j239+j240 == 3) then
		SetTaskTemp(1,257)		-- ��ס���ñ�ʯϴ�ĵ㣨ϴ�����ֵΪ257����1��
		Talk(2,"rollback_prise","Xong r�i! Tr��c m�t ng��i n�n ng�i t�nh d��ng m�t ch�t l�y l�i s�c!","B�y gi� h�y ng�i tr��c m�t ta")
	elseif (j238 + j239 + j240 > 3) then
		Say("Ng��i h�y ��a ta 3 vi�n Th�y tinh tr��c, ta m�i c� th� gi�p ng��i ���c!",1,"V�y �� ta �i c�t b�t ��, r�i quay l�i g�p ��i s�. /rollback_no")
	else
		Talk(1,"","Ng��i r� r�ng kh�ng c� �� 3 vi�n Th�y tinh")
	end
end

function NEWpay_yes()		-- �ڶ��Σ����Ժ�ϴ��ʱ���ã�ֱ�Ӽ��Ǯ�ͱ�ʯ�����ټ�¼�Ƿ�ʯϴ
	if (GetCash() >= 100000) then
		j238 = GetItemCountEx(238)
		j239 = GetItemCountEx(239)
		j240 = GetItemCountEx(240)
		if (j238+j239+j240 == 3) then
			SetTaskTemp(1,10)		-- �Ѿ���ʼϴ������
			Talk(2,"rollback_prise","Xong r�i! Tr��c m�t ng��i n�n ng�i t�nh d��ng m�t ch�t l�y l�i s�c!","B�y gi� h�y ng�i tr��c m�t ta")
		elseif (j238 + j239 + j240 > 3) then
			Say("Ng��i h�y ��a ta 3 vi�n Th�y tinh tr��c, ta m�i c� th� gi�p ng��i ���c!",1,"V�y �� ta �i c�t b�t ��, r�i quay l�i g�p ��i s�. /rollback_no")
		else
			Talk(1,"","Ng��i r� r�ng kh�ng c� �� 3 vi�n Th�y tinh")
		end
	else
		Talk(1,"","Ch� 100000 ng�n l��ng c�ng kh�ng c�, l�m sao ta gi�p ng��i ���c?")
	end
end

function jewel_none()
--	SetTask(13,GetTask(13) + 1)
	SetTaskTemp(1,1)		-- ��ס���ü��ܵ���ϴ�ĵ㣨ϴ�����ֵΪ1����257��
	Talk(2,"rollback_prise","Xong r�i! Tr��c m�t ng��i n�n ng�i t�nh d��ng m�t ch�t l�y l�i s�c!","B�y gi� h�y ng�i tr��c m�t ta")
end

function rollback_cancel()		-- �ѷ��������ú���
	i = GetTaskTemp(1)
	if (i > 0) then		-- ����Ѿ���ʼ���̣�����10W������
		Talk(1,"","Ta tr� l�i ti�n cho ng��i ��y!")
		Msg2Player("Th�ch Minh tr� l�i 10 v�n l��ng cho b�n. ")
	end
end

function rollback_prise()
--- �ȿ�Ǯ�ͱ�ʯ���ñ���
	UTask13 = GetTask(13)
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	addon = GetTaskTemp(1)
	if (addon == 1024) then			-- ���������ϴ��
		Uworld137 = GetTask(137) + 40
		SetTask(137,Uworld137)
		AddMagicPoint(3)
	elseif (addon == 257) then		-- �ǳ���ϴ�㣬�������ñ�ʯϴ��
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)		-- ��3�㼼�ܣ�����ϴ��۳���3�����ö��ϡ�
		SetTask(13,UTask13 + 257)	-- ϴ������ĸı�Ϊԭ��ֵ���ϴ˴�����ֵ���������ϴ���+0��
	elseif (addon == 10) then		-- ���ǳ���ϴ�㣬���б�ʯ��Ҳ��3�㼼��
		for i = 1,j238 do DelItem(238) end
		for i = 1,j239 do DelItem(239) end
		for i = 1,j240 do DelItem(240) end
		AddMagicPoint(3)
		SetTask(13,UTask13 + 1)	-- ϴ������ĸı�Ϊԭ��ֵ���ϴ˴�����ֵ
	elseif (addon == 1) then		-- ����ϴ�㣬�õ��Ǽ���
		SetTask(13,1)	-- ϴ������ĸı�Ϊԭ��ֵ���ϴ˴�����ֵ
	else
		Talk(1,"","T�nh tr�ng T�y t�y c� ch�t sai s�t! Xin l�p t�c li�n h� v�i GM �� ���c x� l�!")
		return 0
	end
	Pay(100000)
--- Ȼ��ʼϴ��
	i = HaveMagic(210)		-- �Ṧ�������
	j = HaveMagic(400)		-- ���ٸ���ƶ���������
	n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
	x = 0
	if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	rollback_point = n - x - 3			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
	if (rollback_point + GetMagicPoint() < 0) then		-- ���ϴ���˸���������0��Ϊ�Ժ���ϴ�㱣����
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
--	AddMagic(53,1)				-- ���صĻ������ܣ��������̱���Զ�̣����ش���
--	AddMagic(1,1)
--	AddMagic(2,1)
	if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
	if (UTask13 == 254) or (UTask_13 == 510) then		-- �Ѿ�û��ϴ������ˣ�����һ�����
		Msg2Player("D�ng 3 vi�n Th�y Tinh ti�n h�nh t�y �i�m k� n�ng. B�n n�n v� nh� ngh� m�t l�t!")
		Say("Ng��i �� T�y t�y qu� nhi�u l�n, kinh m�ch lo�n h�t. B�y gi� <color=red>kh�ng th� t�y t�y<color> ���c n�a!",1,"Ta bi�t r�i!, ta s� ch� �. /KickOutSelf")
	else
		Msg2Player("�� t�y xong �i�m k� n�ng! B�n c� th� ti�n h�nh ph�n ph�i l�i!")
		Say("�� t�y xong �i�m k� n�ng! B�n c� th� ti�n h�nh ph�n ph�i l�i!",1,"���c. /KickOutSelf")
	end
--	KickOutSelf()
end;

function no()
end
