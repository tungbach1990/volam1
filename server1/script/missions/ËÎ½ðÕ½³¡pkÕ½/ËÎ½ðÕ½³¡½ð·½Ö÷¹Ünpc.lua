--�������Npc
--���������ҵȼ��������40����
--���η�����ұ���Ҫ����ɽ���½���������
--���𷽵���ұ���Ҫ���꾩���ſڽ���佫��������
--������ʱ��Ҫ����һ���Ľ�Ǯ��
-- Update by Dan_Deng(2003-10-23) ͨ���Ի��л���ս����ģ���Ҫ����ս��״̬Ϊ1

Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");


function main()


local State = GetMissionV(1) 

--δ��ʼ
if (State == 0 ) then 
	Say("��i qu�n c�a ta v�n ch�a xu�t ph�t! H�y t�m th�i ngh� ng�i ��i tin nh�!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--�쳣���ֱ���˳�
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--�����������Ѿ��������ģ��������������ģ����ӽ�ȥ
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--�˾仰�ǵз������Է��ı���Npc�ĶԻ�
	--���� ������Щ�ι��Ĳ���!���Ǵ�����ʿ�Ǹ�����ս����,�����ݺ�......�ȣ��е�����ɫ��
	Say("Kim qu�c ch�ng ta, ai c�ng l� d�ng s� thi�n chi�n, tri�u ��nh th�i n�t T�ng qu�c c�c ng��i sao x�ng l� ��i th�!",0)
end

--����ʱ��
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--�˾仰�Ǳ����ѱ���������뱨��Npc�ĶԻ�
    		Say("Th� ch�t c�ng trung th�nh v�i ��i Kim! �i n�o! H�i c�c d�ng s� Kim qu�c!",0)
  		else
    		Say("Kim qu�c ch�ng ta, ai c�ng l� d�ng s� thi�n chi�n, tri�u ��nh th�i n�t T�ng qu�c c�c ng��i sao x�ng l� ��i th�!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t T�ng qu�n. Tr�ng s� xin ��i tr�n sau nh�!", 0)
	return
	end;
	
	--����,Ŀǰ�ι����������ι���������Ϳ̿�����Ǵ�����������
	Say("T�ng tri�u �� ��n l�c b�i vong! C�c ng��i c� mu�n c�ng ch�ng ta h��ng vinh hoa ph� qu� kh�ng? Ch� c�n ��ng c�p tr�n 40, �ng h� 3000 l��ng l� c� th� x�ng pha gi�t ��ch!",2, "Ta tham gia. /Yes", "�� ta suy ngh� l�i!/No");
end;

--��սʱ��
if (State == 2) then 
	--��Ϊ��ս����ʽ����֮������δ��������뱨��Npc�ĶԻ�
	Say("Ti�n ph��ng �ang di�n ra chi�n tranh, c�c v� h��ng th�n xin t�m n�i kh�c l�nh n�n ",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Hoan ngh�nh b�n gia nh�p! C�c d�ng s� Kim qu�c! H�y ti�n v�o chi�n tr��ng! ");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B�n ch�a �� 40 c�p ho�c kh�ng mang �� ti�n",0);
end;

function No()
Say("Mau v� suy ngh� �i! Th�i gian c�n l�i kh�ng nhi�u ��u!",0);
end;

