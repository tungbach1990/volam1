--�������� ���踮 ·��7��۶Ի�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_cenxiong()
	else
		Say("Ch�ng ta sinh � Ph��ng T��ng, l�n l�n c�ng � Ph��ng T��ng, kh�ng bi�t ��n th� gi�i b�n ngo�i ra sao, c� d�p s� �i ra ngo�i th� xem!",0)
	end
end;