-- Į����ԭ ְ�� ����
-- By: li_xin(2005-01-18)
--update:zhaowenyi(2005-02-20)������ɫ���ƽ�װ������

Include("\\script\\global\\��ɫ���ƽ�װ������.lua")
function main(sel)
	--Say("� tr�m d�m g�n ��y ai kh�ng bi�t ��n ��i danh ta, t� �ao, ki�m, c�n, th��ng, k�ch, m��i t�m m�n v� kh� ta ��u c� ��, kh�ch quan mu�n mua m�n n�o? C�n mu�n ch� t�o Trang b� Huy�n Tinh hay trang b� Ho�ng Kim ��u ph�i ��n t�m ta, nh�t ��nh gi� c� ph�i ch�ng!", 3, "Giao d�ch/yes", "ch� t�o/onFoundry", "Nh�n ti�n gh� qua th�i/no")
	Say("� tr�m d�m g�n ��y ai kh�ng bi�t ��n ��i danh ta, t� �ao, ki�m, c�n, th��ng, k�ch, m��i t�m m�n v� kh� ta ��u c� ��, kh�ch quan mu�n mua m�n n�o? C�n mu�n ch� t�o Trang b� Huy�n Tinh hay trang b� Ho�ng Kim ��u ph�i ��n t�m ta, nh�t ��nh gi� c� ph�i ch�ng!", 
			2, 
			"Giao d�ch/yes", 
--			"ch� t�o/onFoundry", 
			"Nh�n ti�n gh� qua th�i/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
