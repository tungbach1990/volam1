-- ������ �ٰ� ս��_Ī����.lua ������ɻ�������
-- By: Dan_Deng(2004-05-28)

Include("\\script\\global\\repute_head.lua")

function OnDeath(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 100) then
		Msg2Player("V� ngh� c�a b�n trong tr�n ��u v�i M�c Kh�ng Nguy�t �� c� ti�n tri�n kh� h�n. S�c m�nh, th�n ph�p m�i th� t�ng 1 �i�m.")
		Talk(4,"U43_prise", 10869, 10870, 10871, 10872)
	end
end;

function U43_prise()
	SetTask(43,255)
	AddProp(2)
	AddStrg(1)
	AddDex(1)
	Task88_1 = GetByte(GetTask(88),1) + 1
	Task88_2 = GetByte(GetTask(88),2) + 1
	if (Task88_1 > 255) then Task88_1 = 255 end
	if (Task88_2 > 255) then Task88_2 = 255 end
	Task88 = GetTask(88)
	Task88 = SetByte(Task88,1,Task88_1)
	Task88 = SetByte(Task88,2,Task88_2)
	SetTask(88,Task88)			-- ��¼������⹦������
	i = ReturnRepute(30,80,5)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)		-- ������
	Msg2Player("Nhi�m v� ti�u di�t ��o t�c h�i hoa: Gi�t ch�t M�c Kh�ng Nguy�t, nhi�m v� ho�n th�nh. �i�m danh v�ng ���c t�ng l�n"..i.."�i�m.")
	AddNote("Nhi�m v� ti�u di�t ��o t�c h�i hoa: Gi�t ch�t M�c Kh�ng Nguy�t, nhi�m v� ho�n th�nh.")
end
