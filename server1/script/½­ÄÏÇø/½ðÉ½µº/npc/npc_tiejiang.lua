-- ��ɽ�� ְ�� ����
-- By: li_xin(2005-01-27)
--update:zhaowenyi(2005-02-20)������ɫ���ƽ�װ������

Include("\\script\\global\\��ɫ���ƽ�װ������.lua")
function main(sel)
	--Say("Mu�n s�ng ���c tr�n T�y S�n T� �h, kh�ng c� binh kh� l�i h�i c�a ta e r�ng ng��i ch�u nhi�u thi�t th�i ��. Ng��i c� mu�n mua g� kh�ng? C�n mu�n ch� t�o Trang b� Huy�n Tinh ho�c trang b� Ho�ng Kim th� c� ��n t�m ta gi� c� ph�i ch�ng th�i!", 3, "Giao d�ch/yes", "ch� t�o/onFoundry", "Nh�n ti�n gh� qua th�i/no")
	Say("Mu�n s�ng ���c tr�n T�y S�n T� �h, kh�ng c� binh kh� l�i h�i c�a ta e r�ng ng��i ch�u nhi�u thi�t th�i ��. Ng��i c� mu�n mua g� kh�ng? C�n mu�n ch� t�o Trang b� Huy�n Tinh ho�c trang b� Ho�ng Kim th� c� ��n t�m ta gi� c� ph�i ch�ng th�i!", 
			2, "Giao d�ch/yes", 			
			"Nh�n ti�n gh� qua th�i/no")
end;

function yes()
	Sale(13);  				
end;

function no()
end;
