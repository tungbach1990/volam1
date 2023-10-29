-------------------------------------------------------------------------
-- FileName		:	messenger_timeer.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-06-28 10:45:05
-- Desc			:	���������ʱ���ű�
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")

function messenger_givetime()                   --��վ��Ա������ʹ����ʱ�ļ�ʱ��
    local Uworld1221 = nt_getTask(1221)             --��õ�ǰ��������
    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --�����������	  	  

    if ( Uworld1221 == 0 ) then               --��һ����������ʱΪ��ʹ�����ʱ�������������� 
      nt_setTask(1221,messenger_date)
      nt_setTask(1222,7200)
    end
--      
    local Uworld1222 = nt_getTask(1222) 		  --��õ��������ʹ�ؿ�ʣӵʱ��
--    
    if ( Uworld1222 == 0 ) and ( Uworld1221 == messenger_date ) then     --������ʹ�ؿ�ʣӵʱ��Ϊ0
     return 10                                                        --����ֵΪ10ʱ�����ٽ�����
    elseif ( Uworld1222 >= 0 ) and ( Uworld1221 ~= messenger_date ) then --��ʹ�ؿ���ʱ���Ѿ�������һ�죬������Т��ʼ�ؿ�����
      nt_setTask(1223,0)     --���õ��ջ�û���Ϊ0
      nt_setTask(1273,0)     --���õ����ܻ�þ���Ϊ0
      nt_setTask(1274,0)     --���õ����ܻ�û���Ϊ0
      nt_setTask(1224,0)     --���õ����콱����Ϊ0
      nt_setTask(1222,7200)
      nt_setTask(1221,messenger_date)
    end
end 

function messenger_middletime(nMapId)                                 --��������е��õļ�ʱ��
	local Uworld1211, Uworld1222, Uworld1221, messenger_date, lasttime = 0,0,0,0,0;
	local nTeamSize = GetTeamSize();
	local boldPlayer;
	local tbPlayer = {};
--	
	if (nTeamSize <= 1) then
		return messenger_middletime_do();
	else
		local oldPlayer = PlayerIndex;
--		
		for i = 1, nTeamSize do		--�ȱ����Ա
			tbPlayer[i] = GetTeamMember(i);
		end;
--		
		for i = 1, getn(tbPlayer) do	--��ÿ����Ա������
			PlayerIndex = tbPlayer[i];
--			
			if ( nt_getTask(1201) == 20 or  nt_getTask(1202) == 20 or  nt_getTask(1203) == 20 ) then
				local bp = messenger_middletime_do();
				if (oldPlayer == PlayerIndex) then	--�����ɱ�˵��ˣ��ȱ�������return
					boldPlayer = bp;
				else
					if (bp == 10) then
						Msg2Player("Th�t xin l�i ,"..GetName().."��i nh�n, ng�i �� v��t qua nhi�m v� t�n qu� th�i gian, nhi�m v� th�t b�i.")
						losemessengertask();
					end;
				end;

			end
		end;
		
		PlayerIndex = oldPlayer;
		return boldPlayer;
	end;
end

function messenger_middletime_do()
	local Uworld1211 = nt_getTask(1211)  --����ʼʱ�䣨һֱ�ڱ仯��
	local Uworld1222 = nt_getTask(1222)
	local Uworld1221 = nt_getTask(1221)             --��õ�ǰ��������
	local messenger_date = tonumber(GetLocalDate("%y%m%d")) --�����������	  	 
	local lasttime   = GetGameTime()
  
	if ( Uworld1221 ~= messenger_date  ) then
		Msg2Player("Th�t xin l�i, ng��i kh�ng c� � nhi�m v� quy ��nh nh�t k� b�n trong ho�n th�nh nhi�m v� .")
		return 10                                              
	elseif ( lasttime - Uworld1211 > Uworld1222  ) then
		nt_setTask(1222,0)
		return 10                                               --����ֵΪ10ʱ��ʾʱ���ѳ�����ǰ�ؿ�����ʱ�� 
	else
		Uworld1222 = Uworld1222 - ( lasttime - Uworld1211 )
		nt_setTask(1222,Uworld1222)
		nt_setTask(1211,lasttime)
	end
end

function messenger_gettime()  --��վ��Ա������ʹ����ʱ�ļ�ʱ��
    local Uworld1222 = nt_getTask(1222)
    local Uworld1221 = nt_getTask(1221)             --��õ�ǰ��������
    local messenger_date = tonumber(GetLocalDate("%y%m%d")) --�����������
--		
   if ( messenger_date ~= Uworld1221 ) then
     nt_setTask(1223,0)     --���õ��ջ�û���Ϊ0
     nt_setTask(1273,0)     --���õ����ܻ�þ���Ϊ0
     nt_setTask(1274,0)     --���õ����ܻ�û���Ϊ0
     nt_setTask(1224,0)     --���õ����콱����Ϊ0
      return 10              --����ʧ��
    end
end



