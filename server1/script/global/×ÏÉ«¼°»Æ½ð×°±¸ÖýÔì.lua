-- ���ܣ���ɫװ��ϵͳ - ��ɫװ�����ƽ�װ������

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
function onFoundry()
	Say( "N�u ��i hi�p mu�n c� m�t m�n �� v�a � th� �em ��y �� nguy�n li�u t�i ��y. Ta s� ��c luy�n m�t v�t ph�m ng��i th�ch nh�t!", 4, "B�t ��u ch� t�o/onFoundryItem", "Li�n quan ch� t�o/onAbout", "T�m hi�u m�nh Ho�ng Kim./onQueryPiece","�� ta suy ngh� k� l�i xem/onCancel");
end

-- ��ʼ����
function onFoundryItem()
	if( isCompoundableToday() == 1 ) then
		FoundryItem();
	else
		Say( "L�o phu h�m nay m�t r�i, mai tr�ng s� gh� ��c luy�n trang b� nha!", 1, "���c! V�y ta �i tr��c ��y!/onCancel" );
	end
end

function onQueryPiece()
	QueryPiece()
end
-- ��������
function onAbout()
	Talk( 3, "onAbout2", "S� d�ng c�c nguy�n li�u ��c bi�t nh� kho�ng th�ch c� thu�c t�nh, Huy�n Tinh Kho�ng Th�ch, Trang b� Huy�n Tinh, �� ph� Ho�ng Kim c� th� ch� t�o ���c Trang b� Huy�n Tinh ho�c trang b� Ho�ng Kim. ��c luy�n trang b� ���c ph�n ra: tinh luy�n, ch� t�o, n�ng c�p, kh�m n�m v� �� ph� 5 b� ph�n n�y. N�u c� ���c c�c th� nguy�n li�u n�y th� c� th� ��n ch� ta nh� ��c luy�n.", "<color=yellow>Huy�n Tinh Kho�ng Th�ch<color>: L� m�t lo�i kho�ng th�ch ��c bi�t, th� nguy�n li�u d�ng �� n�ng c�p, ch� t�o, kh�m n�m, �� n�ng cao ch�t l��ng thu�c t�nh trong qu� tr�nh ��c luy�n ho�c t�nh th�nh c�ng cao. C� t�t c� 10 c�p ��, ��ng c�p kho�ng c�ng cao th� hi�u qu� cho ra c�ng l�n.", "<color=yellow>Kho�ng th�ch c� thu�c t�nh<color>: Ta �em kho�ng c� thu�c t�nh n�ng c�p t��ng �ng l�n trang b� m�u xanh c� thu�c t�nh s� c� c� h�i nh�n ���c thu�c t�nh c�a kho�ng th�ch ��. N�u s� d�ng kho�ng mang thu�c t�nh �n th� ng� h�nh thu�c t�nh c�a trang b� m�u xanh ph�i gi�ng v�i thu�c t�nh �n c�a kho�ng. Kho�ng th�ch c� thu�c t�nh c� t�i 10 c�p ��, ��ng c�p c�ng cao khi kh�m n�m cho ra �i�m thu�c t�nh c�ng cao." );
end

function onAbout2()
	Talk( 2, "", "<color=yellow>Trang b� Huy�n Tinh<color>: D�ng 1 trang b� m�u xanh ho�c m�u tr�ng k�t h�p v�i Huy�n Tinh Kho�ng Th�ch ch� t�o s� c� c� h�i nh�n ���c 1 Trang b� Huy�n Tinh t� 1~5 l�n c� h�i kh�m n�m. C�c h�ng thu�c t�nh kh�c c�a trang b� s� gi�ng v�i nguy�n li�u trang b� ���c s� d�ng.", "<color=yellow>�� ph� Ho�ng Kim<color>: M�i m�t b� trang b� Ho�ng Kim ��u c� nh�ng �� ph� Ho�ng Kim t��ng �ng, theo nh�ng g� ghi l�i tr�n �� ph� Ho�ng Kim c� ���c b�n s� t�m ���c c�c m�n c�n l�i k�t h�p ch�ng th�nh b� trang b� Ho�ng Kim." );
end

-- ȡ��
function onCancel()
end