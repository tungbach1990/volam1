-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - ս�����߶Ի�NPC
-- �ļ�������npc_zhanxin_zunzhe.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-06-01 14:27:01

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\fucmain.lua");
Include("\\script\\tagnewplayer\\head.lua");
Include("\\script\\tagnewplayer\\dispose_item.lua");
Include("\\script\\thuhoiitem\\huyenvien\\funcmain_huyenvien.lua")
 -- ��n b� PQCH -Created By - AnhHH - 20110919
Include("\\script\\vng_event\\den_bu_pqch\\den_bu_pqch.lua")
--��n b� event tr�ng c�y th�ng 6 2011 - Modified by DinhHQ - 20110713
Include("\\script\\vng_event\\den_bu_event_thang6\\main.lua")
Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--Phong v�n l�nh b�i - Modified by DinhHQ - 20110913
Include("\\script\\activitysys\\config\\1005\\activeingame.lua")
--��n b� tr�ng kh�i ho�n
Include("\\script\\vng_event\\denbutrongkhaihoan\\main.lua")
Include("\\script\\vng_event\\201203_huyenvulenh\\main.lua")
-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
Include("\\script\\vng_event\\2012_vlnb\\main.lua")

function main() 
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))          
	local nMonth =tonumber(GetLocalDate("%d"))
	local IsDailyTSK = GetTask(Task_Daily_Quest)
	if (IsDailyTSK ~= nCurDate) then
		SetTask(Task_Daily_Quest, nCurDate)
		SetTask(Task_IsQuest, 0)
		SetTask(Task_IsFinishQuest, 0)
		SetTask(Task_lag_TskID, 0)
	end                                                                                     
	local tbOpt = {};                                                                                              
	local szTitle = format("- Ch�o m�ng b�n ��n v�i <color=yellow>V� L�m Truy�n K�<color=yellow><enter>- <color=Red>C�u Ni�n T��ng Ph�ng <color><enter>- Vi�t ho� t�ng h�p By <color=Green>Nam Cung Nh�t Thi�n<color>");   
	tinsert(tbOpt, 1, szTitle)  
	tbVngToolAward:AddDialog(tbOpt, "Chi�n T�m T�n Gi�") 
	
	tbVnHuyenVu:AddDialog(tbOpt)
	--Phong v�n l�nh b�i - Modified by DinhHQ - 20110913
	tbPVLBActive:AddDialog(tbOpt)
	--��n b� tr�ng kh�i ho�n
	tbVngDenBuTKH:AddDialog(tbOpt)
	-- Vong Hao Quang Thien Ha De Nhat Bang - 201204190000 -> 202004212400
	tbVngVLNB2012:AddDialog(tbOpt)
	if (nMonth == 1) then
		tinsert(tbOpt,  "Ta mu�n h�y v�t ph�m/DisposeItem")  
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta mu�n tham gia/NWP_main",             
--	                	 "Ta mu�n h�y v�t ph�m/DisposeItem",
----	                	  "Ta tr� l�i trang b� Huy�n Vi�n/ThuHoiHuyenVien_main",                        
--	                     	 "K�t th�c/OnCancel",                                                                                   
--	                }                
--                else
--	                tbOpt =                                                                                                        
--	                {                                                                                        
----	                	 "Ta mu�n tham gia/NWP_main",    
----	                	 "Ta tr� l�i trang b� Huy�n Vi�n/ThuHoiHuyenVien_main",                                            
--	                     	 "K�t th�c/OnCancel",                                                                                   
--	                }                        
	end                                                                                              
        -- ��n b� PQCH -Created By - AnhHH - 20110919
	--  if (DenBuPQCH2011:IsActive() == 1 and DenBuPQCH2011:CheckAccount() == 1) then
			tinsert(tbOpt, "Nh�n ph�n th��ng Ph� Qu� C�m H�p/#DenBuPQCH2011:GetAward()")
	--  end
        
--        if tbVngEventThang6Reward:isActive() == 1 then
--        	tinsert(tbOpt, "Nh�n ph�n th��ng ��n b� event tr�ng c�y/#tbVngEventThang6Reward:main()")
--        end       
	tinsert(tbOpt,  "K�t th�c/OnCancel")
	CreateTaskSay(tbOpt);                                                                                                  
                                                                                                                               
        --if (tbBirthday0905:IsActDate() ~= 1) then                                                                            
                --Talk(1, "", "Ho�t ��ng �� k�t th�c.");                                                                       
                --return^                                                                                                       
        --end                                                                                                                  
                                                                                                                              
        --CreateTaskSay({"<dec><npc>".."��y l� lo�i ti�m n�ng tr�i ban nh�ng r�t �t ng��i bi�t b�c ph�t lo�i ti�m l�c n�y. Ta bi
                                        --"Ta mu�n nh�n Nh�n gi� v� ��ch quy�t/tbBirthday0905_renzhewudi",                     
                                        --"T� ta c� th� kh�i d�y s�c m�nh ti�m t�ng c�a b�n th�n./OnCancel"});                 
end    

function OnCancel()
end


function tbBirthday0905_renzhewudi()
	do return end
	if (GetLevel() <= 79 and tbBirthday0905:IsActDate() == 1) then
		AddSkillState(512,20,1,60*60*18)--40����
		AddSkillState(527,5,1,60*60*18)--500Ѫ
		AddSkillState(313,5,1,60*60*18)--20ȫ��
		AddSkillState(314,12,1,60*60*18)--7�ظ�Ѫ��5�ظ���
		AddSkillState(546,1,1,60*60*18)--���͹⻷
		CreateTaskSay({"<dec><npc>".."Ta �� kh�i d�y m�t ch�t s�c m�nh ti�m t�ng trong b�n th�n ng��i r�i, gi� ng��i c� th� �i h�nh hi�p. Khi n�o c�n ta gi�p �� th� c� ��n g�p ta?", "�a t� /OnCancel"})
		Msg2Player("Nh�n ���c tr�ng th�i Nh�n gi� v� ��ch quy�t");
	else
		CreateTaskSay({"<dec><npc>".."T� ng��i �� tr� n�n m�nh m� r�i c�n c�n ta gi�p sao?", "Th�t ng�i qu�! T�i h� ��n nh�m ch� r�i./OnCancel"});
	end
end
