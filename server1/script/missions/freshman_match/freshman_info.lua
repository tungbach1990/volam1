CP_MAXROUND = 40

CP_HELP_FRESHMAN = {
					"Thi ��u <color=yellow>V� L�m ki�t xu�t<color> m�c ��ch l� v� s� ti�n b� c�a c�c T�n Th� trong giang h�, t�o c� h�i trao ��i v� ngh� v�i ng��i ch�i kh�c c�ng m�n ph�i, n�ng cao k� n�ng v� c�ng c�a T�n Th�, t�o s� giao l�u gi�a c�c huynh �� ��ng m�n, gi�p T�n Th� quen d�n v�i cu�c s�ng giang h�.",
					"<color=yellow>�i�u ki�n b�o danh<color>: ��ng c�p t� 50 ��n 90, ��n g�p S� gi� ki�t xu�t �� b�o danh."..CP_MAXROUND.."tr�n.",
					"<color=yellow>Th�i gian thi ��u<color>: Thi ��u V� l�m ki�t xu�t b�t ��u t� t� ng�y 1 th�ng 6 n�m 2005 ��n ng�y 10 th�ng 6 n�m 2005 k�t th�c. <color=yellow>20:00<color> b�t ��u ��n <color=yellow>23:00<color> k�t th�c. M�i <color=yellow>3<color> gi� c� t�ng c�ng <color=yellow>9<color> tr�n. Th�i gian b�o danh thi ��u c�a m�i v�ng l� 5 ph�t, th�i gian th� ��u l� 15 ph�t.",
					"Thi ��u V� l�m ki�t xu�t c�n c� v�o �i�m �� ch�n ra 5 h�ng. "..CP_MAXROUND.."Trong tr��ng ��u, th�ng 1 tr�n ���c 3 �i�m, h�a ���c 1 �i�m, thua kh�ng c� �i�m. ��n khi k�t th�c, s� do h� th�ng t� x�c ��nh ch�n ra 5 ng��i ch�i cao �i�m nh�t c�a 5 m�n ph�i, phong t�ng danh hi�u ki�t xu�t M�n ph�i.",
					"M�i ng��i ch�i tham gia b�o danh trong qu� tr�nh tham gia nh�n ���c gi�i th��ng nh�t ��nh. M�i l�n tham gia 1 v�ng s� �o�t ���c gi�i th��ng nh�t ��nh, ngo�i ra ng��i ch�i c�n nh�n ���c nh�ng v�t ph�m nh�: Ph�o hoa, Huy�n Tinh Kho�ng Th�ch, Ph�c Duy�n l�, Ti�n Th�o L�, Th�y Tinh) "
				}

function help_freshmanmatch()
	Talk( 2, "help_freshmanmatch2", CP_HELP_FRESHMAN[ 1 ], CP_HELP_FRESHMAN[ 2 ])
end

function help_freshmanmatch2()
	Talk( 2, "help_freshmanmatch3", CP_HELP_FRESHMAN[ 3 ], CP_HELP_FRESHMAN[ 4 ])
end

function help_freshmanmatch3()
	Talk( 1, "", CP_HELP_FRESHMAN[ 5 ])
end