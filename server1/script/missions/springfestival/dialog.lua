if (not _H_DIALOG_FESTIVAL2006_H_) then
	_H_DIALOG_FESTIVAL2006_H_ = 1;
Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\springfestival\award.lua]]);
Include([[\script\missions\springfestival\signin.lua]]);

--	�Ի����������
function sf06_mainentrance()
	local tab_Content = {
	"Kh�ng th�nh v�n ��!/signin_temp",
	"Ta �� �u�i '�ng Ba M��i' �i r�i!/sf07_getaward",
	"Li�n quan ��n ho�t ��ng �u�i '�ng Ba M��i'/sf07_detail",
	"D�o n�y ta b�n qu�, t�m ng��i kh�c �i!/no"
	}
	Describe("C� m�i �� xu�n v� l� <color=yellow>�ng Ba M��i<color> ��u ��n g�y h�i d�n l�ng. �� gi�p d�n l�ng gi�i quy�t tai h�a n�y, V� L�m Minh Ch� �� t�p h�p c�c v� v� l�m nh�n s� gi�p d�n l�ng �u�i <color=yellow>�ng Ba M��i<color>, gi�p h� c� m�t n�m m�i y�n b�nh. �� ��p t� ngh�a c� cao qu� c�a Minh ch�, quan ph� �� d�n c�o th� treo th��ng cho nhi�m v� �u�i <color=yellow>�ng Ba M��i<color>. � nhi�m v� n�y, ng��i ch�i s� ph�i s� d�ng ��o c� Ph�o hoa T�t �� ��nh �u�i �ng ba m��i, �ng ba m��i c�ng c� th� s� d�ng ��o c� �� t�n c�ng l�i ng��i ch�i. C�c nh�n s� c� th� ��n ��y �� b�o danh nhi�m v� <color=yellow>�u�i �ng ba m��i<color>. Ng��i c� mu�n tham gia kh�ng?", getn(tab_Content), tab_Content);
end;

function signin_temp()
	Say("�u�i �ng ba m��i c�u gi�p d�n l�ng l� m�t ngh�a c� cao qu�, l�i v�a th� hi�n tinh th�n y�u qu� ��ng v�t.", 2, "Ha ha, mau ��a ta ��n n�i c� '�ng Ba M��i'./signin", "��i m�t l�t! Ta ph�i chu�n b�./no");
end;

--	���ܺ���
function sf07_detail()
	Describe("M�i ��t ho�t ��ng '�u�i �ng ba m��i' s� di�n ra trong v�ng <color=yellow>15 ph�t<color>, trong �� c� <color=yellow>5 ph�t<color> �� chu�n b�. Sau khi b�o danh, b�n s� ���c ��a ��n khu v�c chu�n b�, khi ho�t ��ng b�t ��u th� b�n s� ���c ��a ��n khu v�c ho�t ��ng. <color=yellow>15 gi�y<color> sau khi ho�t ��ng b�t ��u, trong s� nh�ng ng��i tham gia s� c� 1 ��n 2 ng��i ch�i h�a th�n th�nh '�ng ba m��i'. Ng��i ch�i bi�n th�nh '�ng ba m��i' s� ph�i b�t <color=yellow>Heo r�ng<color> xu�t hi�n trong khu v�c. Nh�ng ng��i ch�i c�n l�i s� ph�i d�ng <color=yellow>ph�o vi�n<color> �� '�u�i' �ng ba m��i, ng�n kh�ng cho '�ng ba m��i' b�t heo r�ng. Sau khi ho�t ��ng k�t th�c, <color=yellow>Nha m�n sai d�ch<color> s� c�n c� v�o s� l�n d�ng <color=yellow>ph�o<color> n�m tr�ng '�ng ba m��i' c�a ng��i ch�i �� t�ng th��ng.", 1, "Ta bi�t r�i./sf06_mainentrance");
end;

--	���轱��������
function sf07_getaward()
	local nCount = GetTask(TK_CO_COUNT_ONETIME);
	local nRank = GetTask(TK_CO_RANK);
	
	if (nCount == 0 or nRank == 0) then
		Say("H�nh nh� ng��i ch�a �i '�u�i �ng ba m��i'. Mu�n nh�n th��ng h�y mau ch�ng g�p s�c."..CO_ANIMALNAME.."Ch�y �i.", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 2) then
		Say("Kh�ng �� ch� ch�a, h�y mau s�p x�p l�i h�nh trang.", 0);
		return
	end;
	SetTask(TK_CO_COUNT_ONETIME, 0);
	SetTask(TK_CO_RANK, 0);
	nRank1 = festival_award_rank(nRank);
    festival_expaward(nRank1);
	festival_goodsaward(nRank1);
	if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
		Say("Haha, l�m t�t l�m! V�a r�i ng��i �� t�m th�y <color=yellow>"..nCount.."c�i<color>"..CO_MOUSENAME..", x�p h�ng th� <color=yellow>"..nRank.."<color>,��y l� ph�n th��ng c�a ng��i, h�y nh�n l�y!", 0)
	else
		Say("Ha ha, l�m t�t l�m! Ng��i ��nh tr�ng t�ng c�ng <color=yellow>"..nCount.." l�n<color>"..CO_ANIMALNAME..", x�p h�ng th� <color=yellow>"..nRank.."<color>,��y l� ph�n th��ng c�a ng��i, h�y nh�n l�y!", 0)
	end;
end;

end;	--	end of _H_DIALOG_FESTIVAL2006_H_