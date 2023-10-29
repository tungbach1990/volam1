-------------------------------------------------------------------------
-- FileName		:	sworldking_peolle.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-04 16:17:15
-- Desc			:  	���ʳ�����ĵ���
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����
Include("\\script\\task\\partner\\partner_problem.lua") --���� nt_getTask ͬ���������ͻ��˵���
IncludeLib("PARTNER")
IncludeLib("RELAYLADDER");	--���а�

function partner_finishanswer(nChange)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	if (partnerindex <= 0) then
		Msg2Player("�㵱ǰ��û��ͬ�飬��ѡ������Ҫ��ͬ�顣")
		partner_givetodo()
	elseif (partnerstate ~= 1) then
		Msg2Player("�뽫ͬ���ٻ��������Ҳ��ܹ����㽱����")
	elseif ( PARTNER_GetLevel(partnerindex) < 10) then
		if ( nChange == 1 ) then
			PARTNER_AddExp(partnerindex ,100) --�ش��������ͬ��ȼ�<10��ʱ����100���顣
			Msg2Player("��ϲ���ͬ������100�㾭�顣")
		else
			Msg2Player("�Բ������ش���ȷ����������û�дﵽ�ҵ�Ҫ��������һ�Ρ�")
		end
	else
		Msg2Player("���齱��ֻ��ͬ��ȼ�С��10��ʱ�Ÿ�Ŷ��")
	end
end

function partner_jianhuangdz_fajiang1(nChange)
	if ( nChange == 1 ) then
		Msg2Player("���ٴ��뽣�ʵ��ӶԻ���ȡ������")
	end
end

partner_keeponproblem = {
[1] = partner_finishanswer,
[2] = partner_jianhuangdz_fajiang1,
}

function main()
	local PlayerName = GetName()
	local Uworld1226 = nt_getTask(1226) --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227) --ͬ��������񳤸������������
	local Uworld1228 = nt_getTask(1228) --ͬ��������񳤸������������
	local Uworld1229 = nt_getTask(1228) --ͬ��������񳤸������������
	local Uworld1230 = nt_getTask(1230) --ͬ��������񳤸������������
	local Uworld1231 = nt_getTask(1231) --ͬ��������񳤸������������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_JianHuangDiZi.."���������Ȼ�������������񡣺ðɣ���ȡ��Ľ����������ҶԻ���",2,
		"��ȡ����/jianhuangdizi_prize1",
		"ȡ������/partner_killedu")
	elseif ( Uworld1226 == 20 ) and ( GetBit(GetTask(1232),20) == 0 ) then
		Describe(DescLink_JianHuangDiZi.."���ðɣ�����������һЩ�߽׵Ĳ������ɣ���ϸ���ţ������һ����㼸�����⡣��<enter>"
		.."<color=yellow><color=red>���ܻ�ö���λͬ�飬ÿ��ͬ�����ѧ���ٸ����Ӽ��ܣ�<color> һ������ܻ�����ͬ�飬��һ��ֻ���ٻ���һ����ͬ����ѧ���Ӽ��ܵĸ������������ĵȼ����Ӷ����ӣ��ܹ�16����<enter>"
		.."<color=red>���ͬ����л���<color> ������Ҫ����ͬ������Խ�����Ϸ���ѡ�����л�����ͬ��ı�ǩ��Ȼ���ٵ�ѡ�����·��ġ�ѡ��ͬ�顱��ť�Ϳ����ˡ���Ȼ��Ҳ����ֱ����ͬ��Ŀ�������ҵ���ͬ��ѡ�񡱰�ť����������������ӵ��ͬ������֣���ֻҪ�������Ҫ�л�����ͬ������־Ϳ����ˡ�ע�⣺�л�ͬ����������������У����β���֮�����ټ������ӡ�<enter>"
		.."<color=red>�滻���Ӽ��ܣ�<color>Ҫ���滻���Ӽ���ʱ��ֻҪ��ͬ�鼼�ܽ��棬��������ť��ѡ��ϣ��ɾ���ļ��ܣ���ʱϵͳ������ȷ���Ƿ����Ҫ�����ü��ܣ���ȷ����ɰѸü�����������֮������ѧϰ�¼����ˡ�<enter>"
		.."<color=red>ͬ��ظ�������<color>���������ͬ��������ظ��������ٻؾͿ����ˣ����ڷ��ٻ���״̬��ͬ���ǿ����Զ��ظ������ġ�<enter><color>"
		.."������׼���������ش������������ɡ�",3,
		"��ʼ�ش��/jianhuangdizi_problem",
		"��������׼��������/no",
		"ȡ������/partner_killedu")  
	elseif ( Uworld1226 == 20  and  GetBit(GetTask(1232),20) == 1 ) then
		local NpcCount = PARTNER_Count()
		if ( NpcCount >= 5 ) then
			Describe(DescLink_JianHuangDiZi.."������������ɵ�ʱ�䣬�ҽ��������һ�����ʸ��õ�ͬ�顣���������ڵ�ͬ�������Ѿ����ˡ�����㲻��Ҫͬ��Ļ��ҽ����㷢�Ž������������ٸ�����ͬ�顣�������Ҫһλ�µ�ͬ�飬��ô����'�Ժ�����'ѡ��Ƚ�ɢһλͬ�顣",2,"�Ҳ���Ҫ��ͬ���ˣ����Ž�����/partner_goontofinishtask","�Ժ�����/no")
		else
			Describe(DescLink_JianHuangDiZi.."������������ɵ�ʱ�䣬�ҽ��������һ�����ʸ��õ�ͬ�顣����㲻��Ҫͬ��Ļ��ҽ����㷢�Ž������������ٸ�����ͬ�顣�������Ҫһλ�µ�ͬ�飬��ô����'����Ҫ��ͬ��'ѡ��ҽ�������һλ��ͬ�顣",4,
			"�Ҳ���Ҫ��ͬ���ˣ����Ž�����/partner_goontofinishtask",
			"����Ҫ��ͬ��/partner_goontogivepartner",
			"�Ժ�����/no",
			"ȡ������/partner_killedu")
		end
	elseif ( Uworld1226 == 0 ) then 
		Describe(DescLink_JianHuangDiZi.."����ӭ����������������ʦ�������ڴ�ѵ������������ʿ������Ϊ���������ڴ�������ʱ��һλֵ��������ͬ�顣��ô�ðɣ�����������������Ҫʲô������",5,
		"�ǵģ�����Ҫ��Ϊ���ṩһλͬ�顣/partner_givetodo",
		"�Ҵ��˸�ͬ�飬������(��)����������/partner_havetodo",
		"�����ȿ������������漰������/partner_question",         --�ۺ�������npc�����ʵ����⣿����������
		"��Ҫ�뿪������/partner_goback",
		"����������ʤ�գ�������������תת/no")
	else
		Describe(DescLink_JianHuangDiZi.."��ʦ���翴͸�����ķ��꣬�ܾ������ˡ���Ҳ��֪�������˼�����������������������������������������벻�����ջ�ɡ����ˣ�˵�����İɣ��������м�λ���ӵ���������������ѵ�����ͬ�飬��ȥ�����ǰ�æ����Щ�˷ֱ���<color=red>¬�ࡢ�ڰ�˫ɷ����Ӱ������ˮ<color>���ǵ�������ѵ���е�ͬ����˭����ô����<color=red>���<color>������������֮ǰ���������ͬ����<color=red>����<color>��ʼѵ���ġ�����ֻ��ר��һ�£�����������á����������<color=red>��Ը<color>������λͬ����ѵ�Ļ��������ѡ��<color=red>ȡ��<color>ͬ�����������ô��λͬ����Ҳ<color=red>����<color>���ܵ����������ѵ���ˡ�ͬʱ�����<color=red>����<color>��ʼ�ý�������ѵ��<color=red>��һλͬ��<color>��<enter>"
		.."<color=red>����������õ�ͬ�飬���ֻ����ʦ�����ʳ��������ѵ�������ɡ������������������ǧ������״����<color>",4,
		"�ǵģ���Ҫȡ����ǰͬ��Ľ�������/partner_killedu",
		"�����ȿ������������漰������/partner_question",
		"��Ҫ�뿪������/partner_goback",
		"�����Ի�/no")
	end
end

function partner_goontofinishtask()
	local PlayerName = GetName()
	nt_setTask(1249,1)  --��Ϊ1��ʾ������Ҫͬ��
	Describe(DescLink_JianHuangDiZi.."��"..PlayerName.."�����Ѿ�����������������е�ѧϰ�����Գ�ʦ�ˣ���ȡ�꽱��֮����뿪���аɣ���Ҫ��������������ǣ��пճ��������߰ɡ����ˣ����ȥ���ص�Զ���������ҵ�ʦ�������һЩ<color=red>ͬ�����<color>�ľ����������������⽻�������ϵĵ���̫���ˡ�������������һ��<color=red>��������<color>�������ж������������ֲ���ĸо���ϣ������������ڼ����ɣ�һ�����أ�",2,
	"��ȡ����/jianhuangdizi_prize2",
	"�Ժ�����/no")
end

function partner_goontogivepartner()
	local PlayerName = GetName()
	local partnercount = PARTNER_Count()                   --��ȡ��ǰͬ������
	nt_setTask(1249,2)  --��Ϊ2��ʾ��Ҫͬ��
	if ( partnercount >= 5 ) then
		Describe(DescLink_JianHuangDiZi.."��������ͬ���������������Ƚ�ɢһλͬ�������ҶԻ���",1,"�����Ի�/no")
	else
		Describe(DescLink_JianHuangDiZi.."��"..PlayerName.."�����Ѿ�����������������е�ѧϰ�����Գ�ʦ�ˣ���ȡ�꽱��֮����뿪���аɣ���Ҫ��������������ǣ��пճ��������߰ɡ����ˣ����ȥ���ص�Զ���������ҵ�ʦ�������һЩ<color=red>ͬ�����<color>�ľ����������������⽻�������ϵĵ���̫���ˡ�������������һ��<color=red>��������<color>�������ж������������ֲ���ĸо���ϣ������������ڼ����ɣ�һ�����أ��˴���ɽ������ȥ������������壬������ʦ���к����ԨԴ��Ҳ�����õ�����ĵط���",2,
		"��ȡ����/jianhuangdizi_prize2",
		"�Ժ�����/no")
	end
end

function jianhuangdizi_prize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,2000,1)                   			--����ǰͬ�����Ӿ��飬+2100
		nt_setTask(1226,20)
	end
end

function jianhuangdizi_problem()
	 partner_edu(3,1,100,3,1232,20,2)
end

function jianhuangdizi_prize2()
	local Uworld1234 = GetGameTime() - nt_getTask(1234)
	if ( nt_getTask(1248) == 0 ) then
		nt_setTask(1248,Uworld1234)
	elseif ( nt_getTask(1248) > Uworld1234 ) then
		nt_setTask(1248,Uworld1234)
	end
	Msg2Player("�������ɽ�������ʹ����"..Uworld1234.."�롣")
	Ladder_NewLadder(10188, GetName(),-1 * Uworld1234,1);
	
	if ( nt_getTask(1249) == 2 ) then
		local w=random(1,4)
		local j=random(1,5)
		if  ( Uworld1234 >= 900 ) then
			if ( j == 1 ) then
				local partneridex = PARTNER_AddFightPartner(1,4,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 2 ) then
				local partneridex = PARTNER_AddFightPartner(2,2,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 3 ) then
				local partneridex = PARTNER_AddFightPartner(3,3,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 4 ) then
				local partneridex = PARTNER_AddFightPartner(4,1,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			else
				local partneridex = PARTNER_AddFightPartner(5,0,w,2)
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			end
		elseif ( Uworld1234 >= 0 ) and ( Uworld1234 < 900 ) then
			local attribute = genRandNumArray(30,6,1,7) 
			if ( j == 1 ) then
				local partneridex = PARTNER_AddFightPartner(1,4,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 2 ) then
				local partneridex = PARTNER_AddFightPartner(2,2,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 3 ) then
				local partneridex = PARTNER_AddFightPartner(3,3,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			elseif ( j == 4 ) then
				local partneridex = PARTNER_AddFightPartner(4,1,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			else
				local partneridex = PARTNER_AddFightPartner(5,0,w,attribute[1],attribute[2],attribute[3],attribute[4],attribute[5],attribute[6])
				PARTNER_CallOutCurPartner(1)
				Msg2Player("��ϲ������һ��ͬ�顣")
			end
		end
	end
		
		local partnerindex,partnerstate = PARTNER_GetCurPartner()      --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		local partner_addexp = floor(15000*(900/Uworld1234))
		PARTNER_SetTaskValue(partnerindex, 1, 2 );                            --����ǰͬ������Ϊ�������״̬
		PARTNER_AddExp(partnerindex,partner_addexp,1)                   	  --����ǰͬ�����Ӿ���
		
		nt_setTask(1226,0) --ͬ��������񽣻ʵ����������
		nt_setTask(1227,0) --ͬ���������¬�����
		nt_setTask(1228,0) --ͬ�����������Ӱ����
		nt_setTask(1229,0) --ͬ����������ɷ����
		nt_setTask(1230,0) --ͬ����������ɷ����
		nt_setTask(1231,0) --ͬ�������������ˮ����
		nt_setTask(1232,0) --ͬ���������¬��ͳһ�ֽ�λ����
		nt_setTask(1233,0) --ͬ������ʴ����������
		nt_setTask(1234,0) --ͬ����������ʱ��
		nt_setTask(1235,0) --ͬ�������ɷ�������
		nt_setTask(1243,0) --��¼��ľ׮����
		nt_setTask(1247,0) --��¼���������к�ɷ��ɳ���������
		nt_setTask(1249,0) --�Ѿ����������
		
		Msg2Player("��ϲ�������ͬ���������ǰ·���أ������ټ�����ȥ���������������ɣ����������õ�����ĵط���")
end

-------------------------------------------------------ͬ����-----------------------------------------------

function partner_givetodo()                                --�ṩһ��ͬ��
	local partnercount = PARTNER_Count()                   --��ȡ��ǰͬ������
	if ( partnercount == -1 ) then
		Msg2player("���ܳ����쳣������GM��ϵ��")
	elseif ( partnercount == 5 ) then
		Describe(DescLink_JianHuangDiZi.."�����Ѿ�ӵ�������������ͬ�飬�Ͳ�Ҫ��̰���ˡ�",1,
		"�����Ի�/no")
	else
		Describe(DescLink_JianHuangDiZi.."�������ͬ��Ŀ�������ҵ�<color=red>���ٻ�ͬ�顱<color>��ť����������ð�ť�Ϳ����ˡ�<color=red>�ٴ�<color>������ٻ�ͬ�顱��ť����<color=red>�ջ�ͬ����<color>",6,
		"��ý�ϵͬ��/partner_getgold",
		"���ľϵͬ��/partner_getwood",
		"���ˮϵͬ��/partner_getwater",
		"��û�ϵͬ��/partner_getfire",
		"�����ϵͬ��/partner_getdust",
		"�����Ի�/no")
	end
end

function partner_getgold()
	Describe(DescLink_JianHuangDiZi.."��Ҫѡ�������Ը�Ľ�ϵͬ��",5,
		"���������ͬ��/partner_getgold1",
		"���������ͬ��/partner_getgold2",
		"�����å��ͬ��/partner_getgold3",
		"���ų����ͬ��/partner_getgold4",
		"�����Ի�/no")
end

function partner_getgold1()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getgold2()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getgold3()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getgold4()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(5,0,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(5,0,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwood()
	Describe(DescLink_JianHuangDiZi.."��Ҫѡ�������Ը��ľϵͬ��",5,
		"���������ͬ��/partner_getwood1",
		"���������ͬ��/partner_getwood2",
		"�����å��ͬ��/partner_getwood3",
		"���ų����ͬ��/partner_getwood4",
		"�����Ի�/no")
end		

function partner_getwood1()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwood2()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwood3()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwood4()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(4,1,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(4,1,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλľϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwater()
	Describe(DescLink_JianHuangDiZi.."��Ҫѡ�������Ը��ˮϵͬ��",5,
		"���������ͬ��/partner_getwate1",
		"���������ͬ��/partner_getwate2",
		"�����å��ͬ��/partner_getwate3",
		"���ų����ͬ��/partner_getwate4",
		"�����Ի�/no")
end
		
function partner_getwate1()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwate2()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwate3()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getwate4()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(2,2,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(2,2,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλˮϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getfire()
	Describe(DescLink_JianHuangDiZi.."��Ҫѡ�������Ը�Ļ�ϵͬ��",5,
		"���������ͬ��/partner_getfire1",
		"���������ͬ��/partner_getfire2",
		"�����å��ͬ��/partner_getfire3",
		"���ų����ͬ��/partner_getfire4",
		"�����Ի�/no")
end

function partner_getfire1()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getfire2()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getfire3()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getfire4()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(3,3,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(3,3,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getdust()
	Describe(DescLink_JianHuangDiZi.."��Ҫѡ�������Ը����ϵͬ��",5,
		"���������ͬ��/partner_getdust1",
		"���������ͬ��/partner_getdust2",
		"�����å��ͬ��/partner_getdust3",
		"���ų����ͬ��/partner_getdust4",
		"�����Ի�/no")
end

function partner_getdust1()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,1,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getdust2()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,2,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getdust3()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,3,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end

function partner_getdust4()
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	if ( nt_getTask(1271) == 0 ) then
		local partneridex = PARTNER_AddFightPartner(1,4,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1271,1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	elseif ( nt_getTask(1272) ~= NowDate ) then
		local partneridex = PARTNER_AddFightPartner(1,4,4,5,5,5,5,5,5)
		PARTNER_CallOutCurPartner(1)
		nt_setTask(1272,NowDate)
		Msg2Player("��ϲ������һλ��ϵͬ�顣")
	else
		Msg2Player("�Բ����������Ѿ���ȡ��ͬ���ˣ�����������")
	end
end


-----------------------------------------------------ͬ���������ʼ---------------------------------------------

function partner_havetodo()                                     --�Ѿ�����һ��ͬ��
	local Uworld1226 = nt_getTask(1226)                         --ͬ��������񳤸������������
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then                                 	--��ҵ�ǰһ��ͬ�鶼û��
		Describe(DescLink_JianHuangDiZi.."�����ѣ���һ��ͬ�鶼û����ô������ѽ����ѡ����ȡһ��ͬ��ѡ��ɡ�",1,"�����Ի�/no")
	elseif ( partnerstate == 0 ) then    					 	 --ͬ��Ϊδ�ٳ�״̬
		Describe(DescLink_JianHuangDiZi.."�����ѣ��㵱ǰû���ٻ��κ�ͬ�飬��ô����������������ѽ��",1,"Ŷ����������Ū����/no")
	elseif ( partnerindex>= 1 and partnerindex <= 5 ) then
		local partner_finishtask = PARTNER_GetTaskValue(partnerindex,1) --��õ�ǰ�ٻ�������ͬ��Ľ����������״̬
		if ( partner_finishtask == 1 ) then 
			Describe(DescLink_JianHuangDiZi.."�������ͬ���Ѿ�����ͬ����������ˣ�ֱ�Ӵ�F12������忴����(��)����ʲô�����˰ɡ�",1,"�õĺõģ�������/no")
		elseif ( partner_finishtask == 2 ) then 
			Describe(DescLink_JianHuangDiZi.."�����Ѱ����ҷ������ˡ������ͬ���Ѿ�����ͬ������������",1,"�õĺõģ�������/no")
		elseif ( partner_finishtask == 0 ) then
			Describe(DescLink_JianHuangDiZi.."����������ϲ����Ի��������ĸ��ˡ����ͬ��ѵ��ʱ��������ǶԻ�������ѧϰ���ܶ�Ķ�������ȥ��λ��<color=red>¬��<color>�����˰ɡ����⣬��������ͬ�������������Щ�Źֵ�����������<color=red>����<color>�������Դ���������<color=red>�ʴ���<color>�õ��ο�Ŷ�����ˣ������������ʼ���ҽ����������һ��<color=red>����ʼʱ��<color>�������������н����������ʱ����������ɵ�ʱ�䣬�һ����һ��<color=red>����<color>����������ɴ�F12��壬�鿴<color=red>'ͬ���������ʱ����ս��'<color>�����ҽ���Ҳ�᲻ͬ��Ŷ�������ͬ�����������ٶ�Խ�죬�õ��Ļر���Խ�����<color=red>900��<color>Ϊ�磬�������ʱ���������ͬ������Ҳ������Ԩ֮��",2,"��ʼ����/swordking_paiming","�Ժ�����/no")
		end
	end	
end

function swordking_paiming()
	nt_setTask(1226,10)									   --����ͬ���������ʼ
	nt_setTask(1234,GetGameTime())
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	PARTNER_SetTaskValue(partnerindex,1,1)                 --���õ�ǰͬ���������״̬Ϊ��ʼ
	Msg2Player("���Ѿ���ʼ��ͬ��������񡣿���ȥ����������Щ��������ѧϰ�ˡ�")
end
-----------------------------------------------------ȡ��ͬ���������----------------------------------------------------

function partner_killedu()
	Describe(DescLink_JianHuangDiZi.."���㻹��һ�λ��ᣬ��ȷ��<color=red>ȡ��<color>ͬ���������Ľ������������ȡ������ô���ͬ�����<color=red>����<color>����ͬ�����������Ŷ��",2,
	"����ʲô����ȷ��Ҫȡ����/partner_killedureal",
	"�����������/no")
end

function partner_killedureal()
	local NpcName = GetName()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	
	if ( nt_getTask(1226) == 0 ) then
		Describe(DescLink_JianHuangDiZi.."��"..NpcName.."���ѣ�����Ϊ���ǽ��ʵ��Ӿ������õò��У������û��ͬ�����������ⲻ��ˣ�ң����Ƿ�Ҳ����������Ҫ�����´�Ŷ��",1,
		"�����Ի�/no")
	else
			local NpcCount = PARTNER_Count()
			if ( NpcCount ~= 0 ) then
				for i=1,NpcCount do	
					if ( PARTNER_GetTaskValue(i,1) == 1 ) then   --����ĸ�ͬ�����ڽ���������
						PARTNER_SetTaskValue(i,1,2)              --���ô�ͬ���������Ϊ���״̬
					end
				end
			end
			
				nt_setTask(1226,0) --ͬ��������񽣻ʵ����������
				nt_setTask(1227,0) --ͬ���������¬�����
				nt_setTask(1228,0) --ͬ�����������Ӱ����
				nt_setTask(1229,0) --ͬ����������ɷ����
				nt_setTask(1230,0) --ͬ����������ɷ����
				nt_setTask(1231,0) --ͬ�������������ˮ����
				nt_setTask(1232,0) --ͬ���������¬��ͳһ�ֽ�λ����
				nt_setTask(1233,0) --ͬ������ʴ����������
				nt_setTask(1234,0) --ͬ����������ʱ��
				nt_setTask(1235,0) --ͬ�������ɷ�������
				nt_setTask(1243,0) --��¼��ľ׮����
				nt_setTask(1247,0) --��ɳ���Ĵ���
				nt_setTask(1249,0) --�Ѿ����������
				
				Msg2Player("���ͬ����������Ѿ���ǿ��ȡ�����������λͬ����������������ô�����Ҳ����������ȥ�ˡ�")
	end
end

--------------------------------------------------------ͬ���ʴ�----------------------------------------------

function partner_question()
	Describe(DescLink_JianHuangDiZi.."�����ˣ�������������Բ�ѯ����������Ĵ𰸡�Ҳ�����Լ���ʼ��һЩ��Ŀ�������㴳��������������������õĹؿ����Ǵ��������Ŷ���ȼ�С��10����ͬ�飬����ش�������������󣬻�õ�һЩСС�Ľ�����",3,
	"���뿴һ���������������/partner_iwantsee",
	"������һ���ʴ���Ŀ/partner_iwantdoproblem",
	"�Ժ�������/no")
end

function partner_iwantsee()
	Describe(DescLink_JianHuangDiZi.."���ðɣ���ô����������һ����ͬ����ص���������Щ��",6,
	"ͬ����Ƶ�Ҫ��/partner_control",
	"ͬ�����������ʵ�Ҫ��/partner_property",
	"ͬ�����ܶȵ�Ҫ��/partner_familiarity",
	"ͬ�鼼�ܵ�Ҫ��/partner_skills",
	"ͬ����ײ�����Ҫ��/partner_advanced",
	"�Ժ���������/no")
end

function partner_iwantdoproblem()
	partner_edu(10,1,100,20,0,0,1,1) 
	Msg2Player("��ʼ�ʴ�����20�λ��ᣬ��Ҫ���10����Ŀ�ſ��뿪Ŷ��")
end

function partner_control()
	Describe(DescLink_JianHuangDiZi.."��<color=yellow>ͬ�����һ������㹲ͬ����������NPC��ͬ����԰���������������ͱ���PKʱ����һ��֮��������ż������Щ������������һЩ���������Ȼ�����į��ʱ��Ҳ�������Ÿ�ͬ��˵˵����˵�����������Ȥ�����顣�������ָ����NPC���ӵ�����ͬ�������񣬵����������Щ����Ϳ��Ի�����ͬ���ˡ���ֻҪ��ͬ��Ŀ�������ҵ���ͬ��Ļ������ԡ���ťȻ������������Ϳ����ˡ�����ӵ�ж��ͬ���ʱ����ֻҪ��ͬ�����������Ϸ���ѡ����Ҫ�鿴��ͬ��ı�ǩ�Ϳ����ˡ�<color>",2,
	"����һ��˵�/partner_iwantsee",
	"�Ժ�����/no")
end

function partner_property()
	Describe(DescLink_JianHuangDiZi.."��<enter>"
	.."<color=yellow>1��	ͬ�����������Щ��������ʲô�ã�<enter>"
	.."����������Ǳ�ʣ��պ󿪷ţ�<enter>"
	.."�Ը񣺸�ͬ����Ը񣬲�ͬ�Ը��ͬ����Ϊ��ʽҲ�᲻ͬ�����е��Ը������У�<enter>"
	.."    �����ͣ��ṥ����������Ķ��֣����������������ˣ�ӵ�бȽ�Զ���ж���Χ��<enter>"
	.."    �����ͣ���ҹ���Ŀ��򱻹���ʱ��ͬ�������Э�������������������ˣ�һ������Ҹ�����<enter>"
	.."    ��å�ͣ��ṥ��Ѫ�ٵĶ��֣�������Ѫ����20%ʱ���ܱߴ�<enter>"
	.."    ų���ͣ�������������֣��ܵ�����ʱ����ܱߴ���������20%ʱ���������㡣<enter>"
	.." <enter>"
	.."�������ԣ���ʾ��ͬ������У���ͬ���е�ͬ������ӵ�е��书��������ͬ��ͬʱ��һ���ݵĸ��Ӽ���Ҳ�������е����ƣ�<enter>"
	.."���ʣ�����ͬ�������������ʱ�����������ٵ�ֵ��<enter>"
	.."2��	ͬ���������ʲô��<enter>"
	.."ͬ�������������ӵ�����ʵģ����������������У����ܣ����٣����ˣ�һ�����Ե�����Խ����ζ�Ÿ�����������ʱ������Խ�࣬���������������٣�ͬһ���ʵ���Ҳ��������ͬ������˵��������ͬ�����������ʶ���2����������������ʱ�����һ��������50������ֵ������һ��ֻ������45������ֵ����Щ������������ֵ��ͬ��10����30����50����90��ʱ�����һЩ������<color>",2,
	"����һ��˵�/partner_iwantsee",
	"�Ժ�����/no")
end

function partner_familiarity()
	Describe(DescLink_JianHuangDiZi.."��<enter>"
	.."<color=yellow>1��ʲô��ͬ������ܶȣ����ܶȾ��Ƿ�ӳͬ�����ҹ�ϵ����ֵ��<enter>",2,
	"����һ��˵�/partner_iwantsee",
	"�Ժ�����/no")
end

function partner_skills()
	Describe(DescLink_JianHuangDiZi.."��<enter>"
	.."<color=yellow>1�������ȥ�鿴ͬ��ļ��ܽ��棿��ֻҪ��ͬ��Ŀ�������ҵ���ͬ����书���ܡ���ťȻ������������Ϳ����ˡ�<enter>"
	.."2��ͬ���м��ּ��ܣ�������λ�ã�ͬ��ļ��������ࣺ<enter>"
	.."    a)	�书���ܣ�ͬ�������������˵���ʽ��ͨ��������ã�<enter>"
	.."    b)	������ܣ����ձ��׻����ֿ��Խ��мӳɵļ��ܣ�ͨ�������������ã�<enter>"
	.."    c)	���Ӽ��ܣ����ּӳɺ͸����Լ�һЩ����ļ��ܣ�ͨ��������;��������ã�<enter>"
	.."    d)	������ͨ�����������ã�<enter>"
	.."3��ͬ��ļ������������ ͬ����书���������������������ģ��������ļ���ȫ��Ҫͨ��ʹ����Ӧ�ļ�����������������������������ǣ���ֻ��ѧϰ����Ҫ�����ļ��ܵ�ǰ�ȼ���1���ļ����顣���磻���м���Ϊ6������ֻ��ѧϰ7���ĸü�����Ѹü���������7��������Խ��ѧϰ��<enter>"
	.."4�������ͬ��ʹ�ü��ܣ� ���书���������·���������и�ÿһ������Ÿ�ͬ����20%�ļ��ʻ�ʹ�ø���ļ��ܣ����ڿɷ����ͬ������ʹ���������������ܡ����磺��ͬ��ĳ��и����������������A��������������B����ô��ͬ��ʹ��������A���ļ����Ǿ���60%��ʹ��������B�� �ļ����Ǿ���40%��<color>",2,
	"����һ��˵�/partner_iwantsee",
	"�Ժ�����/no")
end

function partner_advanced()
	Describe(DescLink_JianHuangDiZi.."��<enter>"
	.."<color=yellow>1�����ܻ�ö��ͬ���� �ܣ�һ������ܻ�����ͬ�飬��һ��ֻ���ٻ���һ����<enter>"
	.."2�����ܹ�����ѧ���ٸ����Ӽ��ܣ�һ��ͬ����ѧ���Ӽ��ܵĸ������������ĵȼ����Ӷ����ӣ��ܹ�16����<enter>"
	.."3������ӵ�ж��ͬ��ʱ��Ҫ���ȥ�л���ͬ��ͬ���أ�������Ҫ����ͬ������Խ�����Ϸ���ѡ�����л�����ͬ��ı�ǩ��Ȼ���ٵ�ѡ�����·��ġ�ѡ��ͬ�顱��ť�Ϳ����ˡ���Ȼ��Ҳ����ֱ����ͬ��Ŀ�������ҵ���ͬ��ѡ�񡱰�ť����������������ӵ��ͬ������֣���ֻҪ�������Ҫ�л�����ͬ������־Ϳ����ˡ�ע�⣺�л�ͬ����������������У����β���֮�����ټ������ӡ�<enter>"
	.."4�������滻���Ӽ������ܣ�Ҫ���滻���Ӽ���ʱ����ҪֻҪ��ͬ�鼼�ܽ��棬��������ť��ѡ��ϣ��ɾ���ļ�����ʱϵͳ������ȷ���Ƿ����Ҫ�����ü��ܣ���ʱ��ȷ����ɰѸü�����������֮��������ȥѧϰ����ѧ���¼����ˡ�<enter>"
	.."5�����������ͬ��������ظ��������ٻؾͿ����ˣ����ڷ��ٻ���״̬��ͬ���ǿ����Զ��ظ������ġ�<color>",2,
	"����һ��˵�/partner_iwantsee",
	"�Ժ�����/no")
end

----------------------------------------------------------------------------------------------------------------

function partner_checkdo()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("���ͬ�鲢�������������ͬ�����������Ǹ�ͬ�飬�뽫��ȷͬ���ٻ�������")  
	elseif ( NpcCount == 0 ) then
		Msg2Player("�㵱ǰû��ͬ�飬��ȡ���˽���Ŷ��")
	elseif ( partnerstate == 0 ) then
		Msg2Player("�㵱ǰû���ٻ���ͬ��������ȡ���˽���Ŷ��") 
	else
		return 10
	end
end

function partner_goback()
	local i = random(1,7)
	if ( i == 1 ) then
		 NewWorld(1,1542,3229)  -- ����
	elseif ( i == 2 ) then
		 NewWorld(11,3127,5112) -- �ɶ�
	elseif ( i == 3 ) then
		 NewWorld(37,1658,3167) -- �꾩
	elseif ( i == 4 ) then
		 NewWorld(78,1458,3240) -- ����
	elseif ( i == 5 ) then
		 NewWorld(80,1663,2999) -- ����
	elseif ( i == 6 ) then
		 NewWorld(162,1608,3204)-- ����
	elseif ( i == 7 ) then
		 NewWorld(176,1583,2949)-- �ٰ�
	end	 	 	 	
end

function genRandNumArray(nSum, nArrayLen, nMinNum, nMaxNum)
	local aryRandNumArray = {}
	if (nMinNum * nArrayLen > nSum or nMaxNum * nArrayLen < nSum) then
		print("genRandNumArray: �������Ϸ���")
		return nil
	end	
	local nRest = nSum
	--��ѭ�������������ڶ���
	for i = 1, nArrayLen -1 do
		local nRestLen = nArrayLen - i	--ʣ�����ĳ���
		local nAverage = nRest / (nRestLen + 1) --ʣ������ƽ��ֵ
		local nRand = random(0, 10000)/10000 --�����
		local nMin, nMax
		local nGen
		--���������С��Χ
		nMin = nRest - nMaxNum * nRestLen
		if (nMin < nMinNum) then nMin = nMinNum end
		nMax = nRest - nMinNum * nRestLen
		if (nMax > nMaxNum) then nMax = nMaxNum end
		--���䵱ǰ
		--������䣬������ƽ��ֵΪ���ĵ����ֵ
		if (nRand > 0.5) then 
			nGen = nAverage + (nMax - nAverage) * (nRand - 0.5) / 0.5
		else
			nGen = nAverage - ( nAverage - nMin) * (0.5 - nRand) / 0.5			
		end
		nGen = floor(nGen + 0.5) --ȡ��
		nRest = nRest - nGen
		aryRandNumArray[i]  =  nGen
	end
	aryRandNumArray[nArrayLen] = nRest --�������һ��
	return aryRandNumArray;
end


function no()
end