--description: ���Ž������Ԫ ������Ի�
--author: yuanlan	
--date: 2003/3/12


function tmnpc13_Default()

UTask_tm = GetTask(2);

if (UTask_tm == 56) then  
	Say("Tam s� huynh c� th� �i <color=Red>H��ng Th�y ��ng<color>, nghe n�i c� v�i ng��i b�n c�a huynh � ��.", 0)
else
	Say("Cha m� ta m�t s�m, nh� ng��i c�u nu�i n�ng n�n ng��i, c�u l� ng��i th�n thu�c nh�t c�a ta.", 0)
end

end;


