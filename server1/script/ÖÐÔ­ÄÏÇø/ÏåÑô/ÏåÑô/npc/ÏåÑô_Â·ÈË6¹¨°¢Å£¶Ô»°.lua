--��ԭ���� ������ ·��6����ţ�Ի�


Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)

i = random(0,2)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_taokan()
	else
		if (i == 0) then
			Say("Ra kh�i th�nh, �i v� h��ng B�c kh�ng xa ch�nh l� V� �ang s�n.",0)
		return
		end;
		
		if (i == 1) then
			Say("Nghe n�i Ch��ng m�n V� �ang Ph�i l� 1 ch�n nh�n ��c ��o. Kh�ng bi�t c� ph�i sau khi ��c ��o s� ���c tr��ng sinh b�t l�o?",0)
		return
		end;
		
		if (i == 2) then
			Say("N�u kh�ng ph�i v� ta c�n m� gi� �� 80 tu�i, ta �� s�m l�n V� �ang s�n b�i s� h�c v� t� l�u!",0)
		end;
	end
end;

