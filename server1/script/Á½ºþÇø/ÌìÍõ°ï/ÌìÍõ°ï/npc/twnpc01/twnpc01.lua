--description: ����������졡������������
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tw = GetTask(3)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 0) and (GetFaction() ~= "tianwang") and (GetLevel() >= 10) then			-- ����������������
		Say("Mu�n tr� th�nh �� t� ch�nh th�c c�a b�n bang ph�i c�ng nhau ra s�c kh�ng T�ng ch�ng Kim, b�n ta ���ng nhi�n l� hoan ngh�nh v� �i�u ki�n, ch� c�n ng��i�em m�t v� r��u v� cho m�i ng��i c�ng u�ng, c�ng ch�c m�ng, coi nh� ng��i�� ���c nh�p m�n", 2, "Ti�p nh�n nhi�m v� /Uworld38_get_yes", "V�y th�i �i/no")
	elseif (Uworld38 == 80) and (HaveItem(90) == 1) then					-- �����������������
		Uworld38_prise()
--	elseif (UTask_tw == 5*256+80) then		-- Ϊ�����������������ı��ݴ�
--		if (GetSeries() == 0) and (GetFaction() == "tianwang") then	-- ������������ˣ�����Ϊ������������
--			SetTask(3,10*256)
--		else
--			SetTask(3,0)
--		end
	elseif (Uworld38 >= 20) and (Uworld38 < 127) then		-- �������������
		Talk(1,"","M�i l�n ngh� ��n r��u 'B�ng lai xu�n' l� con s�u r��u trong ng��i ta l�i b�t ��u c�u x� ")
	elseif (GetFaction() == "tianwang") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","H�o huynh ��! C� r�nh ch�ng ta c�ng u�ng v�i ly!")
	elseif (UTask_tw ==70*256) then 					--���ų�ʦ����������״̬
		Talk(2,"","Kh�ng sao c�, m�i ng��i c�ng u�ng n�o ","Anh ta,,, r�t cu�c �� say hay l� l�n tr��c c�n ch�a t�nh ch�? ")
	else
		Talk(1,"","Nghe n�i qu�n r��c � <color=Red>Ba L�ng huy�n<color> c� b�n m�t lo�i r��u g�i l� <color=Red>B�ng Lai Xu�n<color>,��y qu� l� lo�i r��u ti�n ph�m, ch� ngh� ��n l� mu�n u�ng ngay!")
	end
end

function Uworld38_get_yes()
	Talk(1,"","Nghe n�i qu�n r��c � <color=Red>Ba L�ng huy�n<color> c� b�n m�t lo�i r��u g�i l� <color=Red>B�ng Lai Xu�n<color>,��y qu� l� lo�i r��u ti�n ph�m, ch� ngh� ��n l� mu�n u�ng ngay!")
	Uworld38 = SetByte(GetTask(38),1,20)
	SetTask(38,Uworld38)
	AddNote("T�i c�a v�o Thu� tr�i � ph�a Nam g�p T�n ��o L�nh, nh�n<color=red>nhi�m v� K� danh �� t�<color>, ��n huy�n Ba L�ng mua r��u'Li�n Lai Xu�n'. ")
	Msg2Player("T�i c�a v�o Thu� tr�i � ph�a Nam g�p T�n ��o L�nh, nh�n nhi�m v� K� danh �� t�, ��n huy�n Ba L�ng mua r��u'Li�n Lai Xu�n'. ")
end;

function Uworld38_prise()
	Talk(1,"","B�ng Lai Xu�n! Qu� th�t l� h�o t�u! V�a m� n�p ra �� ng�i th�y m�i th�m ng�o ng�t! Xem ra ng��ic�ng l� m�t ng��i c� kh� ph�ch, m�i ng��i c�ng nhau l�u l�c giang h� n�o!")
	DelItem(90)
	Uworld38 = SetByte(GetTask(38),1,127)
	SetTask(38,Uworld38)
	i = ReturnRepute(15,19,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	AddNote("V� ��n Thi�n V��ng ��o, �em Li�n Lai Xu�n giao cho T�n ��o L�nh, ho�n th�nh nhi�m v� K� danh �� t�. ")
	Msg2Player("V� ��n Thi�n V��ng ��o, �em Li�n Lai Xu�n giao cho T�n ��o L�nh, ho�n th�nh nhi�m v� K� danh �� t�, Danh v�ng c�a b�n t�ng th�m. "..i.."�i�m.")
end;

function no()
end;
