--����͸�
--wushenbless.lua
--ʹ�ú�ɻ��2Сʱ(ϵͳʱ��)���ν���ʹ�����ء�������Ұ�š��Ի�֮ҹ�й��׶�˫��״̬
--Task2509

function main(nItemIdx)
	local nItemTime = GetItemParam(nItemIdx,1);
	local nCurTime = GetCurServerTime();	--��
	if (nItemTime < nCurTime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n s� d�ng.");
		return 0;
	end;
	local nEndTime = nCurTime + 2*60*60;
	SetTask(2509, nEndTime);
	Msg2Player("Trong v�ng 2 gi� b�n s� ���c nh�n ��i ph�n th��ng khi tham gia T�ng Kim, nhi�m v� t�n s�, th�ch th�c th�i gian, v� l�m li�n ��u, nhi�m v� D� T�u, ��m huy ho�ng")
end;

function GetDesc(nItemIdx)

	local nYear = GetItemParam(nItemIdx, 2) + 2000;
	local nMonth = GetItemParam(nItemIdx, 3);
	local nDate = GetItemParam(nItemIdx, 4);

	return "Th�i h�n s� d�ng: <color=blue>"..nYear.."n�m"..nMonth.."nguy�t "..nDate.."nh�t "
end

