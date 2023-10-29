-- ·��_��� ������ ��������(80����)��NPC�ű�
-- By Dan_Deng(2003-11-10)

Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	do return end
	UWorld97 = GetTask(97)
	str, result = GetTong()	
--	if (UWorld97 >= 10) then		-- �Ѿ����
--		Talk(1,"","��ԣ���һ��Ҫ�úöԴ������ÿ��Ҫ����ϴ�裬��������Ҫ���Ͼ���......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- �ǰ�����û�����ܹ��Ż�����
		SetTaskTemp(17,1000)
	else								-- ��ͨ����
		SetTaskTemp(17,1500)
--		Talk(1,"","��ԣ�ǧ�����У������ֲ����С�ͽ�����κΣ�")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>T�i h� nu�i ng�a r�t nhi�u n�m, ch� c�n xem qua l� bi�t t�t hay kh�ng!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("L�c n�y ng��i g�i ta?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color","V� anh h�ng n�y xin d�ng b��c ��. ","Huynh ��i, c� chuy�n g� c�n ch� gi�o? ","T�i h� l� Th�m C�u, hi�n c� m�t con ng�a qu�, c� th� phi ���c ng�n d�m. V� anh h�ng ��y phong th�i b�t ph�m, nh�t ��nh l� 1 cao th�. Ng�a qu� c�a t�i h� kh�ng bao gi� ch�u khu�t ph�c k� th�t phu. ","�� ta xem th� ng�a qu� c�a huynh,,, ")
end

function sele_color()
	Say("Anh h�ng h�y xem! ",6,"��y kh�ng ph�i l� � V�n ��p Tuy�t sao! /buy_black","��y kh�ng ph�i l� X�ch Th� B�o M� sao! /buy_red","��y kh�ng ph�i l� Tuy�t �nh sao! /buy_cyan","��y kh�ng ph�i l� ��ch L� sao! /buy_yellow","��y ch�ng ph�i l� Chi�u D� Ng�c S� T� sao! /buy_white","��y l� ng�a g� v�y? T�i h� hi�u bi�t c�n k�m /buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","Nh�t bang chi ch�, l� m�t nh�n v�t b�c th�y l�m sao kh�ng bi�t ��y r�t cu�c l� ng�a g� ch�? Th� l�i, xem ra t�i h� �� nh�n l�m ng��i!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	if (x == 1000) then
		Say("Kh�ng sai! Ng��i qu� th�t l� anh h�ng. T�i h� v�n ch�ng mu�n b�n con ng�a n�y ��u, nh�ng v� �ang c�n g�p 1000 l��ng b�c, v� l�i nh�n th�y anh h�ng c�ng th�t s� th�ch n� n�n n�n l�ng m� b�n n� cho anh h�ng, mong r�ng anh h�ng h�y th��ng y�u nu�i d��ng n� ",2,"kh�ng sao ��u, ta nh�t ��nh s� ��i x� t�t v�i n� m� /buy_yes","Nh�t th�i l�m sao t�m ra ���c s� ti�n n�y /buy_no")
	else
		Say("Kh�ng sai! Ng��i qu� th�t l� anh h�ng. T�i h� v�n ch�ng mu�n b�n con ng�a n�y ��u, nh�ng v� �ang c�n g�p 1500 l��ng b�c, v� l�i nh�n th�y anh h�ng c�ng th�t s� th�ch n� n�n n�n l�ng m� b�n n� cho anh h�ng, mong r�ng anh h�ng h�y th��ng y�u nu�i d��ng n� ",2,"kh�ng sao ��u, ta nh�t ��nh s� ��i x� t�t v�i n� m� /buy_yes","Nh�t th�i l�m sao t�m ra ���c s� ti�n n�y /buy_no")
	end
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- ���Żݼ���ģ�Ϊ������ֵ�����Ҽ�ס�����ʲô��ɫ��
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"","Ng�a �i ng�a! T� ��y v� sau ng��i h�y �i theo v� anh h�ng n�y nh�, nh�t ��nh ph�i ngoan ngo�n ��!")
	else
		Talk(1,"","Ta hi�n gi� trong ng��i kh�ng mang theo �� ng�n l��ng, huynh t�m th�i c�m �� s� ti�n n�y v�y!")
	end
end

function buy_no()
	Talk(1,"","Kh�ng l� s� ti�n n�y l�i l�m kh� anh h�ng sao")
end
