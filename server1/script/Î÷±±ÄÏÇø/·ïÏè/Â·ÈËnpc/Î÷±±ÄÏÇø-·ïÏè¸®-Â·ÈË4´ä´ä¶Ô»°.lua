--�������� ���踮 ·��4���Ի�
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08��Ů�ڻ��08.4.1���ɾ��
function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08��Ů�ڻ��08.4.1���ɾ��
	else
		Say("Tay c�a ch� T� X�o th�t kh�o l�o, bi�t c�t nh�ng c�i hoa gi�y ��p nh� v�y. Sau n�y l�n l�n em c�ng h�c c�t gi�y.", 0)
	end
end;