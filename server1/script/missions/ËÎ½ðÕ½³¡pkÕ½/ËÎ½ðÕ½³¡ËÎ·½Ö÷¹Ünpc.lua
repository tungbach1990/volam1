--�������Npc
--���������ҵȼ��������40����
--���η�����ұ���Ҫ����ɽ���½���������
--���𷽵���ұ���Ҫ���꾩���ſڽ���佫��������
--������ʱ��Ҫ����һ���Ľ�Ǯ��

Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");

function main()

local State = GetMissionV(1) 

--δ��ʼ
if (State == 0 ) then 
	Say("��i qu�n c�a ta v�n ch�a xu�t ph�t! H�y t�m th�i ngh� ng�i ��i tin nh�!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--�쳣���ֱ���˳�
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--�����������Ѿ��������ģ��������������ģ����ӽ�ȥ
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--�˾仰�ǵз������Է��ı���Npc�ĶԻ�
	Say("Ng��i Kim b�n ng��i, x�m l��c giang s�n, gi�t h�i ��ng b�o ta! Ta th� quy�t c�ng b�n ng��i m�t m�t m�t c�n!",0)
end


--����ʱ��
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("Qu�c gia h�ng vong, h�t phu h�u tr�ch! B�y gi� l� l�c ta v� c�c ng��i b�o �n ��t n��c!",0)
  		else
    		Say("Ng��i Kim b�n ng��i, x�m l��c giang s�n, gi�t h�i ��ng b�o ta! Ta th� quy�t c�ng b�n ng��i m�t m�t m�t c�n!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t Kim qu�n. Tr�ng s� xin ��i tr�n sau nh�!", 0)
	return
	end;
	
	Say("Qu�c gia h�ng vong, h�t phu h�u tr�ch! B�y gi� l� l�c ta v� c�c ng��i b�o �n ��t n��c! Ch� c�n ��ng c�p tr�n 40, �ng h� 3000 l��ng l� c� th� x�ng pha gi�t ��ch!",2,"Ta tham gia. /Yes", "�� ta suy ngh� l�i!/No");
end;

--��սʱ��
if (State == 2) then 
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
  Msg2Player("Hoan ngh�nh ng��i gia nh�p. c�c Anh h�ng ��i T�ng, h�y nhanh ch�ng ti�n ra chi�n tr��ng. ");
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B�n ch�a �� 40 c�p ho�c kh�ng mang �� ti�n! ",0);

end;

function No()
Say("Mau v� suy ngh� �i! Th�i gian c�n l�i kh�ng nhi�u ��u!",0);
end;
