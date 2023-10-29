--description: �䵱����������䵱30������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\timerhead.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	Uworld50 = GetTask(50)
--	Uworld31 = GetByte(GetTask(31),1)
	if (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 30*256) and (GetLevel() >= 30) then
			for i = 1,GetItemCount(133) do DelItem(133) end
			Talk(2, "L30_get", "Ng��i � V� �ang h�c v� c�ng ���c nhi�u ng�y r�i, ta mu�n th� v� c�ng c�a ng��i, xem ng��i c� ti�n b� ch�a.", "Ph��ng ph�p c� th� l� ta mu�n ng��i trong m�t th�i gian nh�t ��nh, h�y ��n Ph�c Ng�u s�n l�y 5 c�y H�a Mi th�o, n�u qu� th�i gian quy ��nh ho�c s� l��ng kh�ng �� th� coi nh� ng��i th�t b�i.")
--		Ϊ��ʱ������򲹶�������ֵΪ35��ѧ���˴����ķ�(156)���䵱����(151)��Ҳ���Խ�30��������ȡ����
--		elseif  (UTask_wd == 35) and (HaveMagic(156) >= 0) and (HaveMagic(151) >= 0) and (GetLevel() >= 30) then
--			for i = 1,GetItemCount(133) do DelItem(133) end
--			Talk(2, "L30_get", "������������ٶȳ��Ի�ü�ݵĿ��飬�ܺá�", "�ڹ涨ʱ�������ţɽ�ϲɻ����껭ü�ݣ���������涨ʱ����߲ɵ���Ŀ����������ʧ�ܡ�")
		elseif (UTask_wd == 30*256+20) then
			Say("Ng��i �� l�y 5 c�y H�a Mi th�o ch�a?",2,"�� h�i �� hoa/L30_finish_yes","V�n ch�a ��/L30_finish_no")
		elseif (UTask_wd == 30*256+50) then 						--��ʱ�ѵ�
			L30_fail()
		elseif (UTask_wd > 30*256) and (UTask_wd < 40*256) then					--�Ѿ��ӵ�30��������δ���
			L30_finish_no()
--			Talk(1,"","���������Ҫ��<color=Red>��ʮ�ĸ�ʱ��<color>��ȥ<color=Red>��ţɽ<color>�ɻ�<color=Red>���껭ü��<color>���Ѿ�ֻʣ"..GetRestCTime(2).."�ˣ���Ҫץ������")
		else					--�Ѿ����30��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","V� c�ng b�n ph�i r�t ch� tr�ng vi�c tu luy�n n�i c�ng, di chuy�n linh ho�t, nh�ng kh�ng xem th�p n�i c�ng thu�n khi�t, c�ng ph�t huy trong �� kh�ng �t uy l�c ch�n ch�nh.")
		end
--	elseif (Uworld50 < 10) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 4) then		-- ��������ԭ��������
		--		Talk(3,"Uworld50_get","���������ԭ������Ϊ�������ɼ����ǰ�ӨӨ������Ы�����ն�����������ż��","����ԭ��������û�к�ӨӨ�����棬��ƾ�������Ծ��������˼Ҹ������ˣ���ʵӨӨ������ǳ��������Ⱦ�ĺù���������ǿ�����˵��������","��ң���ǰ�������ұ��ļ���������������ȰȰ�ɡ�")
	elseif (Uworld50 == 30) then
		Talk(2,"","Y�u n� B�ch Doanh Doanh d�ng l�i ���ng m�t �� l�a g�t ng��i r�i ��!"," B�y gi� ta c�ng ch� b�n t�n b�n nghi, kh�ng ho�n to�n tin t��ng c� ta. N�u c� �y ��ng l� ch�n th�t, ch�ng ta n�n cho c� ta c� h�i m�i ���c")
	elseif (Uworld50 == 50) then		-- ����2���������
		Talk(1,"U50_Prise2","H�! Ta �� s�m n�i t�n y�u n� n�y kh�ng ph�i ng��i t�t qu� nhi�n nh� v�y!Kh�ng bi�t c�m �n ng��i th� n�o. ���c! �� ta ch� ng��i 2 chi�u tuy�t ki�m nh�!")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","B�o ki�m phong t�ng ma l� xu�t mai hoa h��ng t� kh� h�n lai mu�n tr� th�nh cao th� �� m� h�i h�n ng��� kh�c th�t nhi�u.")
	else
		Talk(1,"","��o h�c v�, c� t� ch�t t�t nh�ng kh�ng c�n c� luy�n t�p c�ng kh�ng th� tr� th�nh cao th�.")
	end
end;

function L30_get()
	Say("Ng��i c� t� tin nh�n nhi�m v� l�n n�y kh�ng?", 2, "Kh�ng th�nh v�n ��!/L30_get_yes", "�� t� n�ng l�c k�m c�i, e kh� ho�n th�nh nhi�m v� n�y/L30_get_no")
end;

function L30_get_yes()
	i = GetTimerId()
	if (i > 0) and (i ~= 2) then		-- ���м�ʱ���������У����Ҳ��Ǵ�����
		Talk(1,"","Ng��i �ang mang nhi�m v� c�p b�ch nh� th�, m� c�n ch�y lung tung �?")
		return
	end
	Talk(1,"","Hay l�m! B�y gi� b�t ��u t�nh th�i gian, n�i trong <color=Red>72 gi�<color> l�n <color=Red>Ph�c Ng�u s�n<color> h�i v� <color=Red>5 c�y H�a Mi th�o<color>, �i �i!")
	StopTimer()
	SetTimer(72 * CTime * FramePerSec, 2)										--������ʱ��:72��ʱ�� * ʱ���� * ֡��
	SetTask(5, 30*256+20)
	AddNote("G�p T� ��i Nh�c ti�p nh�n nhi�m v�, n�i trong 72 gi� ��n Ph�c Ng�u s�n ��ng h�i v� 5 c�y H�a mi th�o.")
	Msg2Player("G�p T� ��i Nh�c ti�p nh�n nhi�m v�, n�i trong 72 gi� ��n Ph�c Ng�u s�n ��ng h�i v� 5 c�y H�a mi th�o.")
end;

function L30_get_no()
	Talk(1,"","Ta s� c� g�ng h�t m�c!")
end;

function L30_finish_yes()
	if (GetItemCount(133) >= 5) then 
		L30_prise() 
	else
		Talk(1,"L30_finish_no","Ng��i v�n ch�a l�y �� 5 c�y!")
	end
end;

function L30_finish_no()
	if (GetRestSec(2) > 0) then
		Talk(1,"","Ng��i hi�n ch� c�n th�i h�n l� "..GetRestCTime(2).."th�i, mau tranh th� th�i gian �i!")
	else
		i = GetTimerId()
		if (i == 2) or (i == 0) then
			StopTimer()
		end
		L30_fail()
	end
end;

function L30_prise()
	for i = 1,GetItemCount(133) do DelItem(133) end
	if (GetTimerId() == 2) then			-- ���������ʱ��
		StopTimer()					--������ʱ
	end
	Talk(1,"","Xem ra v� c�ng c�a ng��i qua nhi�n ti�n b� r�t mau! Th�t ��ng m�ng! ")
	SetRank(10)
	SetTask(5, 40*256)
--	AddMagic(164)
--	AddMagic(158)
	add_wd(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n ���c phong l� Tu�n S�n ��o Nh�n! H�c ���c v� c�ng V� �ang ph�i l� B�t C�p Nhi Ph�c, Ki�m Phi Kinh Thi�n.")
	AddNote("Trong th�i gian quy ��nh quay v� Th�p Ph��ng �i�n, ��a 5 c�y H�a mi th�o cho T� ��i Nh�c, ho�n th�nh nhi�m v� H�a mi th�o, th�ng l�m Tu�n S�n ��o Nh�n.")
end;

function L30_fail()
	for i = 1,GetItemCount(133) do DelItem(133) end
	SetTask(5, 30*256)
	AddNote("V��t qu� th�i gian quy ��nh, nhi�m v� H�a mi th�o �� th�t b�i.")
	Msg2Player("V��t qu� th�i gian quy ��nh, nhi�m v� H�a mi th�o �� th�t b�i.")
	Talk(1,"","Th�i gian �� h�t! Ng��i khi�n ta qu� th�t v�ng! B�nh th��ng c� ph�i ng��i l��i t�p luy�n kh�ng? Nh�t ��nh ph�i si�ng n�ng luy�n t�p m�i th�nh!Khi n�o chu�n b� t�t r�i,th� c� th� ��n t�m ta.")
end;

function Uworld50_get()
	SetTask(50,10)
	Msg2Player("Ti�p nh�n nhi�m v�: Th�c t�nh T� Trung Nguy�n kh�ng n�n m� mu�i v� y�u n� B�ch Doanh Doanh.")
	AddNote("Ti�p nh�n nhi�m v�: Th�c t�nh T� Trung Nguy�n kh�ng n�n m� mu�i v� y�u n� B�ch Doanh Doanh.")
end

function U50_Prise2()
	SetTask(50,255)
	AddProp(1)
	AddEng(1)
	Task88_4 = GetByte(GetTask(88),4) + 1
	if (Task88_4 > 255) then Task88_4 = 255 end
	Task88 = SetByte(GetTask(88),4,Task88_4)
	SetTask(88,Task88)			-- ��¼������ڹ�������

	Msg2Player("Nh� s� ch� �i�m c�a T� ��i Nh�c, n�i l�c c�a b�n �� th�ng l�n 1 �i�m. Nhi�m v� th�c t�nh T� Trung Nguy�n �� ho�n th�nh.")
	AddNote("Ho�n th�nh nhi�m v� th�c t�nh T� Trung Nguy�n.")
end

function no()
end
