-- ��ɽ�ɼ�ͷ�Ի��ű�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 ~= 0 ) then
		branch_jiantou()
	else
		Talk(1,"","Nghe n�i V� L�m Truy�n K� c� nhi�m v� Ho�ng Kim, �� t� Hoa S�n ph�i �� xu�ng n�i l�m nhi�m v�, sau n�y ng��i h�y quay l�i!");
	end
end
