-- ��������.lua ������ֵ����������
-- By Dan_Deng(2003-11-11)

sexhead = {"Thi�u hi�p","N� hi�p"}

Include("\\script\\global\\repute_head.lua")

function main()
	if (GetSex() == 0) then			-- ��Ů�ò�ͬ�ĶԻ�
		Say("V� thi�u hi�p n�y kh� ph�ch b�t ph�m!  C� mu�n bi�t t��ng lai s�ng l�n c�a m�nh kh�ng? Ch� c�n 5000 l��ng! ",2,"���c! �� ta xem th� /view_repute_yes","Kh�ng c�n ��u/no")
	else
		Say("V� n� hi�p n�y kh� ph�ch b�t ph�m!  C� mu�n bi�t t��ng lai s�ng l�n c�a m�nh kh�ng? Ch� c�n 5000 l��ng! ",2,"���c! �� ta xem th� /view_repute_yes","Kh�ng c�n ��u/no")
	end
end

function view_repute_yes()
	if (GetCash() < 500) then
		Talk(1,"","l�i m�t ng��i kh�ng c� ti�n n�a, l�m ph� m�t n�a ng�y tr�i")		
		return 0
	end
	Pay(500)
	repute_exp = GetRepute()
	repute_lvl = GetReputeLevel(repute_exp)
	if (repute_lvl == -1) then			-- ����ʱ
		Talk(1,"","T� c� anh t�i �a kh� �i!  Gian nan l� �i�u kh� tr�nh kh�i!  Nh� th��ng xuy�n v�i thi�n th�n c�u ph�c nh�! ")
	elseif (repute_lvl == 0) then
		Talk(2,"","X�a nay anh h�ng th��ng kh� �i, hi�n gi� ng��i �ang g�p kh�n kh�, th�m ch� danh v�ng giang h� c�a ng��i c�ng �ang c� v�n ��. Xin h�y �i g�p Thi�n Th�n c�u ph�c �i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> B� T�nh B�nh D�n <color> ")
	elseif (repute_lvl == 1) then
		Talk(2,"","Th�n Long gi� l�m ng��i tr�n gian. Ng��i m�c d� hi�n gi� �ang long �ong, nh�ng s� ph�t tri�n r�t nhanh, ng��i tinh � s� ph�t hi�n ra ng��i l� thi�n t�i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> ng��i m�i T�i Xu�t giang h� <color> ")
	elseif (repute_lvl == 2) then
		Talk(2,"","X�a nay Anh h�ng th��ng kh� �i, hi�n gi� ng��i �ang g�p kh�n kh�, th�m ch� danh v�ng giang h� c�ng �ang c� v�n ��. Xin h�y �i g�p th�nh th�n c�u ph�c �i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> V� Danh Ti�u T�t <color> ")
	elseif (repute_lvl == 3) then
		Talk(2,"","X�a nay Anh h�ng th��ng kh� �i, hi�n gi� ng��i �ang g�p kh�n kh�, th�m ch� danh v�ng giang h� c�ng �ang c� v�n ��. Xin h�y �i g�p th�nh th�n c�u ph�c �i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> M�c M�c V� V�n <color> ")
	elseif (repute_lvl == 4) then
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n d�n th� hi�n, c�c Anh h�ng hi�p ngh�a trong giang h� �� d�n d�n ch� � ��n Ng��i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> S� Hi�n Phong Mang <color> ")
	elseif (repute_lvl == 5) then
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n d�n th� hi�n, c�c Anh h�ng hi�p ngh�a trong giang h� �� d�n d�n ch� � ��n Ng��i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Ti�u H�u Danh Kh� <color> ")
	elseif (repute_lvl == 6) then
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n d�n th� hi�n, c�c Anh h�ng hi�p ngh�a trong giang h� �� d�n d�n ch� � ��n Ng��i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Danh ��u H��ng L��ng <color> ")
	elseif (repute_lvl == 7) then
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n th� hi�n, c�c anh h�ng hi�p ngh�a trong giang h� �� d�n d�n ch� � ��n ng��i. ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Uy Tr�n Nh�t ph��ng <color> ")
	elseif (repute_lvl == 8) then
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n th� hi�n, c�c anh h�ng hi�p ngh�a trong giang h� �� d�n d�n ch� � ��n ng��i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Ng�o Th� Qu�n H�ng <color> ")
	elseif (repute_lvl == 9) then
		Talk(2,"","Danh v�ng giang h� �� t�ng l�n t�t ��nh, giang h� t�n ng��i l�: Nh�t ��i T�ng s�, V� L�m ��i Hi�p ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Nh�t ��i T�ng S� <color> ")
	else
		Talk(2,"","Ng��i �� c� nhi�u kinh nghi�m giang h�. B�n l�nh �� d�n d�n th� hi�n, c�c anh h�ng hi�p ngh�a �� d�n d�n ch� � ��n ng��i ","Danh v�ng giang h� c�a ng��i hi�n gi� l� "..repute_exp.."giang h� xem ng��i hi�n gi� l� <color=red> Ti�u Ng�o giang h� <color> ")
	end
end

function no()
end
