WLLS_TB	= 1715
WLLS_TASKID_WIN		= WLLS_TB+5	--����ʤ������
WLLS_TASKID_TIE		= WLLS_TB+6	--����ƽ�ִ���
WLLS_TASKID_TOTAL	= WLLS_TB+7	--���˲�������
WLLS_TASKID_POINT	= 2500		--�����ۼƻ���
WLLS_TASKID_HONOUR	= 2501		--�������������������Ļ��֣�

--WLLS_TASKID_POINT	= 2500		--�����ۼƻ��֣�Խ�ϣ�
WLLS_TASKID_HONOUR	= 2501		--�������������������Ļ��֣�

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--ս������
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--ս�ӻ���
WLLS_TASKID_LGRANK	= WLLS_TB+13	--ս������
WLLS_TASKID_LGWIN	= WLLS_TB+14	--ս��ʤ������
WLLS_TASKID_LGTIE	= WLLS_TB+15	--ս��ƽ�ִ���
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--ս�Ӳ�������
WLLS_TASKID_LGTIME	= WLLS_TB+17	--ս��ս��ʱ��

--��������
function showbwtaskdesc(nTaskIdx, nTaskGenre)
	--����ս��
	NewTask_TaskTextOut(nTaskGenre, "Th�nh t�ch c� nh�n V� l�m ��i h�i")
	local n_total = GetTask(WLLS_TASKID_TOTAL)
	local n_win = GetTask(WLLS_TASKID_WIN)
	local n_point = GetTask(WLLS_TASKID_POINT)
	local n_honour = GetTask(WLLS_TASKID_HONOUR)
	NewTask_DetailTextOut(nTaskGenre, "   tham gia t�ng c�ng "..n_total.."tr�n thi ��u, ��t ���c"..n_win.." l�n chi�n th�ng, �i�m t�ch l�y ��t ���c "..n_point.." . Hi�n c� th� ti�u hao �i�m vinh d� "..n_honour.." <enter>")
	--ս����Ϣ
	NewTask_TaskTextOut(nTaskGenre, "\n========== <color=red>Tin t�c chi�n ��i V� l�m ��i h�i<color> ==========")
	local n_lgtype = GetTask(WLLS_TASKID_LGTYPE)
	tb_desc = {"V� l�m li�n ��u", "V� l�m li�n ��u"}
	if (n_lgtype > 0) then
		NewTask_DetailTextOut(nTaskGenre, "   B�n �� gia nh�p <color=red>"..tb_desc[n_lgtype].."<color>chi�n ��i<enter>")
		n_win = GetTask(WLLS_TASKID_LGWIN)
		n_total = GetTask(WLLS_TASKID_LGTOTAL)
		local n_tie = GetTask(WLLS_TASKID_LGTIE)
		local n_lose = n_total - n_tie - n_win
		n_point = GetTask(WLLS_TASKID_LGPOINT)
		local n_time = ceil(GetTask(WLLS_TASKID_LGTIME)/18)
		local f_rate = 0
		if (n_total > 0) then
			f_rate = n_win/n_total*100
		end
		local n_rank = GetTask(WLLS_TASKID_LGRANK)
		local str_rank
		if (n_rank > 1000) then
			str_rank = " Th� h�ng sau <color=yellow>1000<color>"
		elseif (n_rank > 0) then
			str_rank = "  "..point2str(n_rank, 2).."  "
		else
			str_rank = " v�n ch�a x�p h�ng "
		end
		NewTask_DetailTextOut(nTaskGenre, "   �� tham gia ��u <color=yellow>"..n_total.."<color> tr�n: ")
		NewTask_DetailTextOut(nTaskGenre, "     th�ng <color=yellow>"..n_win.."<color>tr�n, h�a <color=yellow>"..n_tie.."<color>tr�n, thua<color=yellow>"..n_lose.."<color>tr�n<enter>")
		NewTask_DetailTextOut(nTaskGenre, "     t� l� th�ng <color=yellow>"..strsub(f_rate,1,4).."<color>%<enter>")
		NewTask_DetailTextOut(nTaskGenre, "   �i�m t�ch l�y chi�n ��i: <color=yellow>"..n_point.."<color>   th�i gian thi ��u t�ch l�y: <color=yellow>"..n_time.."<color>gi�y<enter>")
		NewTask_DetailTextOut(nTaskGenre, "<color=hblue>           << "..str_rank.." >>           <color>")
	else
		NewTask_DetailTextOut(nTaskGenre, "   B�n v�n ch�a nh�p chi�n ��i, ��n g�p Quan vi�n li�n ��u ki�t xu�t b�o danh.<enter>")
	end
end

