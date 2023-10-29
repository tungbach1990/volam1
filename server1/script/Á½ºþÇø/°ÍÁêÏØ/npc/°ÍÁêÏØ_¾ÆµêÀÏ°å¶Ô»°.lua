--description: ������ ������ �Ƶ��ϰ�Ի� ������������
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\timerhead.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 20) then 							--��������������
		Talk(4,"","Ch� qu�n! 뮩y lo�i r��u n�o l� ngon nh�t?","R��u ngon nh�t � ��y l� <color=Red>B�ng Lai Xu�n<color>, n�u lo�i r��u n�y t�n r�t nhi�u c�ng s�c, h�n n�a nguy�n li�u r�t kh� t�m, v� th� gi� c� s� kh�ng r�. ","Ch� c�n r��u ngon l� ���c, ta mu�n mua m�t h�, h�t bao nhi�u ti�n?","C� bao nhi�u ti�n c�ng kh�ng ��, b�i v� qu�n ch�ng ta t� l�u r�i kh�ng c�n b�n lo�i r��u n�y n�a, v� thi�u c�c lo�i nguy�n li�u <color=Red>Linh Chi<color>, <color=Red>Huy�n S�m<color> v� <color=Red>H� Th� �<color>. N�u kh�ch quan c� th� gi�p ta t�m ba m�n nguy�n li�u n�y, ta s� l�m gi�p m�t h� ")
		SetTask(38,SetByte(GetTask(38),1,40))
		AddNote("��i tho�i v�i ch� qu�n r��u Ba L�ng huy�n, bi�t ���c c�n t�m ba lo�i nguy�n li�u �� n�u r��u: Linh Chi, Huy�n S�m, H� Th� �. ")
		Msg2Player("Bi�t ���c c�n t�m ba lo�i nguy�n li�u �� n�u r��u: Linh Chi, Huy�n S�m, H� Th� �. ")
	elseif (Uworld38 == 40) then
		if (HaveItem(116) == 1) and (HaveItem(135) == 1) and (HaveItem(144) == 1) then
			if (GetTimerId() > 0) then		-- ���м�ʱ����������
				Talk(1,"","Ng��i �ang mang nhi�m v� c�p b�ch nh� th�, m� c�n ch�y lung tung �?")
				return
			end
			Talk(2,"","Ch� qu�n! Ta �� t�m �� ba lo�i nguy�n li�u r�i, �ng gi�p ta n�u r��u B�ng Lai Xu�n �i!","���c! Nh�ng ph�i ch� m�t gi� ��ng h� m�i xong. ")
			DelItem(116)
			DelItem(135)
			DelItem(144)
			SetTask(38,SetByte(GetTask(38),1,60))
			SetTimer(1 * CTime * FramePerSec, 1)									--������ʱ��
			AddNote("Quay l�i qu�n r��u Ba L�ng huy�n, ��a nguy�n li�u, bi�t ���c c�n ph�i ��i m�t gi�. ")
			Msg2Player("��a nguy�n li�u, bi�t ���c c�n ph�i ��i m�t gi�. ")
		else
			Talk(1,"","Nghe n�i ba lo�i c�y thu�c n�y sinh tr��ng t�i <color=Red>ph�a ��ng B�c V� L�ng s�n<color>, nh�ng � �� c� r�t nhi�u qu�i th� �n th�t ng��i, v� th� kh�ng ai c� can ��m ��n ��. ")
		end
	elseif (Uworld38 == 60) then			-- Ϊ��ʱ���ݴ�����ֶ���ʱ����
		i = GetRestSec(1)
		if (i > 0) then
			Talk(1,"","Ch�a ��n l�c ��u, r��u n�u ch�a xong, ng��i c�n ph�i ��i: "..i.."Gi�y, ")
		else
			StopTimer()						--������ʱ
			SetTask(38,SetByte(GetTask(38),1,80))
			TWenroll_getitem()
		end
	elseif (Uworld38 == 80) and (HaveItem(90) == 0) then
		TWenroll_getitem()
	elseif (Uworld38 >= 80) then		-- ��ɴ������
		Talk(1,"","Th� n�o?B�ng Lai Xu�n c�a b�n ti�m kh�ng ph�i l� h� danh ch�?")
	else
		Talk(1,"","N�i ��y ch�ng ta c� �� th�c �n, h�i s�n phong ph�. Kh�ch quan mu�n �n g�? Mu�n u�ng r��u g�?")
	end
end;

function TWenroll_getitem()
	AddEventItem(90)
	Msg2Player("L�y ���c m�t h� r��u B�ng Lai Xu�n. ")
--	SetTask(3, 8)
	AddNote("M�t gi� sau, quay l�i qu�n r��u l�y ���c B�ng Lai Xu�n. ")
end
