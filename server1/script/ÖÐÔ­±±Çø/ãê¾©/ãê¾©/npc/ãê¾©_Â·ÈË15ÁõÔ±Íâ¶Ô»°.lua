--��ԭ���� �꾩�� ·��15��Ա��Ի�
--by xiaoyang  (2004\4\12)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld127 = GetTask(127)
	Uworld30 = GetByte(GetTask(30),1)
	if (Uworld127 < 10) and (GetLevel() >= 90) and (Uworld30 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="tianren" ) then   --������������
		Talk (14,"Uworld127_step1","�y!. ","L�o vi�n ngo�i! Ng��i l�m sao v�y? ","M�t l�i kh� n�i h�t! Ng��i h�y mau ch�ng r�i kh�i ��y, n�u kh�ng c�ng s� b� li�n l�y ","R�t cu�c �� x�y ra chuy�n g�? C� n�i ra xem ta c� th� gi�p g� ���c kh�ng? T�i h� b�t t�i, ch� c� ch�t s�c l�c th�i ","C�c h� l� ng��i trong giang h�? ","M�u �� trong giang h�, ��u c� ph�n c�a ta ","V�y th� qu� t�t r�i! Kh�ng bi�t l� ng��i �� t�ng nghe qua t�n Th�t c�ng ch�a Ho�n Nhan Tuy�t Y c�a ��i Kim ch�a? ","Ho�n Nhan c�ng ch�a lanh l�i th�ng minh, dung nhan tuy�t th�, l� con g�i m� Ho�ng Th��ng y�u nh�t ","Kh�ng sai! Con trai c�a l�o phu hi�n �ang l�m c�ng sai trong ph� c�a c�ng ch�a ","Nh� v�y th� qu� t�t r�i? �ng c�n g� ph�i lo bu�n? ","��ng lo l� c� c�ng ch�a n�y v�n ���c c�ng chi�u qu� ��ng. G�n ��y nghe n�i c�ng ch�a mu�n b�t con ��i �i�u �� h�ng tr�m tu�i � L�u m�n quan s�n, d� n� �� c�n tr�ng th��ng nhi�u ng��i, ��n Khuy�n t� c�ng v�y. ","B� tr�ng th��ng? V�y vi�c �i�u tr� th� n�o r�i? ","L�o phu ch� c� m�t �t gia s�n, Khuy�n T� l�i b� tr�ng th��ng nh� v�y. Nh�ng trong v�ng 1 th�ng kh�ng b�t ���c con linh �i�u �� th� c� nh� s� b� ch�m ��u ","A! nghi�m tr�ng v�y sao " )
	elseif (Uworld127 == 10) and (HaveItem(374) == 0) then
		AddEventItem(374)
		Msg2Player("L�i nh�n ���c l�nh b�i � ph� c�ng ch�a ")
		Talk(1,"","Th�y ng��i c�ng t�m t�m, l�nh b�i ��y l�y �i!")
	elseif (Uworld127 == 100) or (Uworld127 == 110) then                                                             --�������
		Talk(4,"U127_finish","Cu�i c�ng ng��i c�ng quay l�i!"," L�u ti�n sinh! Chuy�n c�a L�nh lang kh�ng c� g� ph�i lo l�ng ","M�c d� ta �� r�t tin t��ng ng��i, nh�ng th�t s� c�ng kh�ng tin l� ng��i c� th� b�t ���c Linh �i�u! N�u nh� b�t ���c, th� ��i �n c�a ng��i ��i v�i L�u gia, ta d� cho ��n ch�t c�ng kh�ng th� qu�n!"," ��ng qu� kh�ch s�o! T�i h� xin c�o t�.")
	elseif (Uworld127 > 10)and (Uworld127 < 100) then                                            --���������
		Talk(1,"","Sinh m�ng c�a c� gia ��nh ta n�m trong tay ng��i, ng��i nh�t ��nh ph�i th�nh c�ng!")
	elseif (Uworld127 >= 245) then                                                                 --������ɺ�
		Talk(1,"","M�i �n nh�n v�o nh� ng�i, tr�n giang h� s�ng ch�t kh� l��ng! Xin h�y b�o tr�ng th�n th�!")
	else    
		Talk(1,"","Ai s�ng tr�n ��i ��u nh� nhau, ch� c�n vui v� s�ng qua ng�y l� ���c.")
	end
end;

function Uworld127_step1()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","�y! N�i ra c�ng ch� l�m tr� c��i cho thi�u hi�p m� th�i")
	else
		Say("Th�i h�n �� h�t r�i! B�y gi� bi�t ph�i l�m sao ��y!",2,"H�m! M�i ng��i kh�ng c�n lo l�ng! Ta �ang ��i th� xem c� c�ng ch�a h� ��n n�y l�i h�i th� n�o?! /U127_get","Th� l�c c�a c�ng ch�a r�t m�nh, t�i h� s� kh�ng ���ng n�i /no")  --��������
	end
end

function U127_get()
	Talk(3,"","C�ng ch�a l� ng��i ��c �c h�o th�ng! T�t nh�t ng��i kh�ng n�n d�nh v�o","�ng y�n t�m! Ta nh�t ��nh s� b�nh an tr� v�!","T�t l�m! ��y l� l�nh b�i nh�p cung, ta � ��y ch� tin vui c�a ng��i.")
	AddEventItem(374)
	SetTask(127,10)
	Msg2Player("Ti�p nh�n nhi�m v�: �i t�m Ho�ng Nhan Tuy�t Y, �� l�y l�i s� c�ng b�ng cho L�u vi�n ngo�i ")
	AddNote("Ti�p nh�n nhi�m v�: �i t�m Ho�ng Nhan Tuy�t Y, �� l�y l�i s� c�ng b�ng cho L�u vi�n ngo�i ")
end

function no()
end

function U127_finish()
	if(GetTask(127) == 110) then
      SetTask(127,255)
   else
      SetTask(127,245)				  --������������ñ���245
	end
	   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	   AddRepute(add_repute)
	   Msg2Player("Ho�n th�nh nhi�m v�, tr� v� L�u gia, danh v�ng t�ng l�n "..add_repute.."�i�m.")
	   AddNote("Quay l�i ch� L�u vi�n ngo�i, ho�n th�nh nhi�m v�. ")
end
