-------------------------------------------------------------------------
-- FileName		:	partner_mastertask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-25 10:50:15
-- Desc			:  	ͬ�����������Ի�����ű�
--------------------------------------------------------------------------

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����
IncludeLib("PARTNER")


--------------------------------------------------------------------��ͬ�������ص�����ű�------------------------------------------------------------------------
function master_longwu()
	local PlayerName = GetName()
	if ( GetLevel() <= 10 ) then
		Describe(DescLink_LongWu.."<#>��"..PlayerName.."������Ҫ��ȡһλͬ������㴳��������",2,
		"��Ը��/partner_longwu_getpartner",
		"������£��ٿ��ǿ��ǰ�/no")
	elseif ( nt_getTask(1000) == 1000 or nt_getTask(1001) == 1000 or nt_getTask(1002) == 1000 or nt_getTask(1003) == 1000 ) then
		Describe(DescLink_LongWu.."<#>��"..PlayerName.."���þò����������ҳ�����Զ�ţ���һ�пɺã�����е��ֵܽ����Ƕ��ܹ����㣬�����Ҽ����㶨Ҫת�棬�������´����ϣ�����Ϊ�أ�Ҫ������ϧ�Լ��������ˣ��л���̸������������ң�����ʲô���飿",2,
		"������������ʲô��ͬ����صľ�������/partner_longwu_mastertalk",
		"ûʲô�������������Ѷ���/no")
	else
		Describe(DescLink_LongWu.."<#>��"..PlayerName.."����������Ʈҡ��ɽ����𢲻��������ĳ���м���������ܸ��˼�����Ը��Ϊ���ҳ�һ������Ҳ̫��Ҫ��İ����ˡ�",2,
		"������������ʲô��ͬ����صľ�������/partner_longwu_mastertalk",
		"ûʲô�������������Ѷ���/no")
	end
end

function partner_longwu_mastertalk()
	taskProcess_000:doTaskEntity();
	return 1;
end

function partner_longwu_cancelmastertask()
	Describe(DescLink_LongWu.."<#>��ȡ�����ܵ��������һ�����롣",1,"�����Ի�/no")
end



----------------------------------------------------------------------����֮������--------------------------------------------------------------------------
function  partner_longwu_70()	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex,3) ~= 1000 ) then
		Describe(DescLink_LongWu.."<#>�����������µ��Ӹ�������һ����ֵ����顣����ǰ��������������һ�����д��࣬�����ϻ�����그�ˣ�����Ŀ�����壬����ȥ������ò�Ƿ����������ǰ�����������ջ�еĸ��ֶ��������չˡ���һ�����꽻�ӵ�ҹ����˺�Ȼ��ɫ���ֵ��ҵ����Ǹ����ӣ�˵����һ�����ڲر�ͼ��Ƭ��Ī�����ܡ�ԭ����λ���˾�Ȼ�ǵ����������ɣ�����������������������Ͻ����ߡ�����ֵ��ǣ��ڶ����糿���ɴ��˺�Ȼ�޼����У���ϵ��������ϴ��ŵ����ֿ�ջ�ڽ����㷢Ӣ������Լ�������ټ�����Ӣ�۽⿪�����������صĲر�ͼ֮������£��Ҿ��ñ���Ҳ���и�Ī�����ı��һ��СС�Ľ������㣬���˽���Ӣ�۸�������֮���ı��������������������ģ��ƺ�ֻ��ʮ���������������е�ʮ�ţ�����ʮ��Ӣ����ȴ��֪���١����������ɵ�����֮�йأ��������ҳ�����������������ԭ���ֵ�һ���ƽ٣�[������ÿλ����������ͬ�鶼���������]<enter>"
		.."<color=green>������<color>",3,
		"��Ը���������/longwu_70_gettask",
		"�������������/longwu_70_finishtask",
		"��������һ���/no")
	else
		Describe(DescLink_LongWu.."<#>������֮�������ƺ�����һЩ���û�н⿪����Ը��ȥ�������������𣿲������ǰ����ͬ�ģ����ܲ��ܲ��Щ��ͬ�ĵط�����<enter>"
		.."<color=green>������<color>",4,
		"��Ը���������/longwu_70_gettask",
		"�������������/longwu_70_finishtask",
		"����ȡ��������/longwu_70_canceltask",
		"��������һ���/no")
	end
end

function longwu_70_gettask()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	local longwu_70_date = tonumber(date("%y%m%d")) --�����������	
	
	if ( NpcCount == 0 ) then
		Describe(DescLink_LongWu.."<#>���㵱ǰû��ͬ�飬������ͬ����صľ������񰡡������ͨ���������еĳ������ˣ����������ҽ��ʵ�����ȡһλ��",1,"�����Ի�/no")
		return
	elseif ( partnerstate == 0 ) then
		Describe(DescLink_LongWu.."<#>���㵱ǰû���ٻ���ͬ��������ô��ͬ����������أ�",1,"�����Ի�/no")
		return
	elseif ( PARTNER_GetLevel(partnerindex) < 10  ) then
		Describe(DescLink_LongWu.."<#>���㵱ǰͬ�鲻��10�����뽫��ѵ����10�����������ɡ�",1,"�����Ի�/no")
		return
	elseif ( GetLevel() < 70 ) then
		Describe(DescLink_LongWu.."<#>���㻹û�дﵽ��������ĵȼ�����70����ʱ�������ɣ����ͣ�",1,"�����Ի�/no")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex,3) >= 10 ) and ( PARTNER_GetTaskValue(partnerindex,3) < 1000 ) then
		Describe(DescLink_LongWu.."<#>���㲻���Ѿ��ӵ��������𣬿��������ɡ�",1,"�����Ի�/no")
		return		
	else
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,3) ~= 0 and PARTNER_GetTaskValue(i,3) ~= 1000 ) or ( nt_getTask(1256) ~= 0 ) then
				Describe(DescLink_LongWu.."<#>�����Ѿ���ͬ������������֮�������ˣ�������ѽӵ�����ɡ�",1,"�����Ի�/no")
				return		
			end
		end
	end
	
	if ( PARTNER_GetTaskValue(partnerindex,3) == 0 ) then 
		PARTNER_SetTaskValue(partnerindex,3,10)  --����Ψһ�Ծ�������Ϊ��ʼ״̬
		nt_setTask(1256,10) --���þ�������ʼ
		Msg2Player("���Ѿ��ӵ�������Ӧ��ȥ���������һ�����ɵ������ˡ�")
		if ( GetBit(GetTask(1250),1) == 0 ) then
			nt_setTask(1250,SetBit(GetTask(1250),1,1)) 
			Msg2Player("���ŵ�һ����������������ؽ�����") --����������������������������������
		end
	elseif ( PARTNER_GetTaskValue(partnerindex,3) == 1000 ) then
		if ( nt_getTask(1254) == 0 ) then
			nt_setTask(1254,longwu_70_date)
		end  
		
		if ( nt_getTask(1254) == longwu_70_date ) and ( nt_getTask(1255) == 0 ) then
			nt_setTask(1256,10) --���ÿ��ظ��Ծ�������ʼ
			Msg2Player("���Ѿ��ӵ�������Ӧ��ȥ���������һ�����ɵ������ˡ�")
		elseif ( nt_getTask(1254) == longwu_70_date ) and ( nt_getTask(1255) ~= 0 ) then
			Msg2Player("�Բ���������Ѿ���ɹ����ֿ��ظ��Եľ��������ˡ�������������")
		elseif ( nt_getTask(1254) ~= longwu_70_date )  then
			nt_setTask(1254,longwu_70_date)
			nt_setTask(1256,10) --���ÿ��ظ��Ծ�������ʼ	
			Msg2Player("���Ѿ��ӵ�������Ӧ��ȥ���������һ�����ɵ������ˡ�")
		end
	else
		Describe(DescLink_LongWu.."<#>�����Ѿ��ӹ�����֮�������ˣ����ͣ�",1,"�����Ի�/no")
	end
end

function longwu_70_finishtask()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	local longwu_70_date = tonumber(date("%y%m%d")) --�����������	
	
	if ( nt_getTask(1256) ~= 40 or nt_getTask(1259) < 50 or nt_getTask(1260) < 50 ) then --û����������콱�ⲽ
		Describe(DescLink_LongWu.."<#>���㻹û�дﵽ��ȡ�����ĵز����ȵ��˺��ʵ�ʱ�������ɡ�",1,"�����Ի�/no")
		return
	elseif ( NpcCount == 0 ) then
		Describe(DescLink_LongWu.."<#>���㵱ǰû��ͬ�飬��ô��ͬ����صľ������񰡡������ͨ���������еĳ������ˣ����������ҽ��ʵ�����ȡһλ��",1,"�����Ի�/no")
		return
	elseif ( partnerstate == 0 ) then
		Describe(DescLink_LongWu.."<#>���㵱ǰû���ٻ���ͬ��������ô�콱�أ�",1,"�����Ի�/no")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex,3) ~= 10 ) then
		Describe(DescLink_LongWu.."<#>�����ٻ�������ͬ�鲢������һͬ�����������ͬ�飬���ٻ�����ȷͬ������лл��",1,"�����Ի�/no")
		return
	end
	
	if ( PARTNER_GetTaskValue(partnerindex,3) == 10 ) then  --�����ش�ʱ����ʾ���������Ѿ���ʼ
		PARTNER_SetTaskValue(partnerindex,3,1000)
		nt_setTask(1256,0)
		nt_setTask(1259,0)
		nt_setTask(1260,0)
		nt_setTask(1261,0)
		if ( GetBit(GetTask(1250),3) == 0 ) then
			nt_setTask(1250,SetBit(GetTask(1250),3,1)) 
			Msg2Player("���ŵ�������������������ؽ�����") --����������������������������������
		end
		Msg2Player("����ͬ��Ľ���") 						 --����������������������������������
	else
		nt_setTask(1254,longwu_70_date)
		nt_setTask(1255,1)
		nt_setTask(1256,0)
		nt_setTask(1259,0)
		nt_setTask(1260,0)
		nt_setTask(1261,0)
		Msg2Player("������Ϊ�ظ�������Ľ�����")			 --������������������������������
	end	
end

function longwu_70_canceltask()
	Describe(DescLink_LongWu.."<#>����ȷ��Ҫȡ����ǰ��������������",2,
	"�ǵģ���ȷ��/longwu_70_yescancel",
	"����������/no")
end

function longwu_70_yescancel()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( nt_getTask(1256) ~= 0 ) then
		nt_setTask(1256,0)
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,3) ~= 0 and PARTNER_GetTaskValue(i,3) ~= 1000 ) then
				 PARTNER_GetTaskValue(i,3,0)
			end
		end
		Msg2Player("���ѳɹ�ȡ��������")
	else
		Describe(DescLink_LongWu.."<#>������ʱ�ֵ�֣���ĳ���⽻��������ô��ϷŪ�����أ�����û�нӹ����������",1,"�����Ի�/no")
		return
	end
	Msg2Player("���Ѿ�˳��ȡ��������")
end




-----------------------------------------------------------------------------����ʦ̫�ű�------------------------------------------------------------------------

function partner_master_jingyue()
	if ( nt_getTask(1256) == 10 ) then
		Describe(DescLink_JingYue.."<#>�������ӷ�"..GetName().."ʩ���������ڻ���������ƶ���������һ�ԣ�������飬�Ǽ��ס�Ҳ��������֮һ����ɽ�������һ��Ѫ��֮���ˡ�<enter>"
		.."��������һ�ַǳ���ֵ�ʪ�ȡ��������ϲ�ֻһ�˻����ز�����������ʪ������һ�ִ��ֽ���������ģ��������ڰ�ҹ��ʱ�����ľ����������͵͵��˯����ҧ�˵��Դ�����Ϊͷ���ڱΣ����Կ������ۼ�����ϧ���ǳ��ƻ���ƶ��û�а취׽���������߾������������У��һ���������ָʹ��������Ҫ�ҵ��ܽ�������Ѭ�����ĵػƲݣ���Ҷ��Ⱦ�θ�����Щ���������ڱ����ɽ����������������֣�һ�����ָ��ֽ�ȥ��������ȥ�޻أ���Ը��ȥ��",2,
		"�ǵģ���Ը��/partner_jingyue_go",
		"��������׼��׼��/no")
	else
		Describe(DescLink_JingYue.."<#>�������ӷ����ؽ����ߺ�Ȼ���֣�ϣ�����汣����ǧ����ɽ�����һ���ƽٰ���",2,
		"����ȥɽ����/partner_jingyue_trap",
		"ʦ̫����/no")
	end
end

function partner_jingyue_go()
	Describe(DescLink_JingYue.."<#>��ɽ������ǿ���Ƽ���������ɽ�����ϲ���<color=red>�ػƲ�<color>�����������ϲ���<color=red>��Ҷ<color>������Ҫ��ȡ<color=red>��ʮ��<color>��Ȼ��ȥ��<color=red>�Ϸ�<color>�ֱ�ɱ�����ҿ���Կ�׵�<color=red>ɽ��կ��<color>���õ�����Կ��Ȼ��ȥ��ͼ���������֮�ţ���<color=red>������<color>��������<color=red>ɽ����<color>���жᵽΨһ��һ֧<color=red>Ⱦ�ι�<color>���������ܳɹ����Ƴ�ҩ�ģ���������������Ļ���ƶ�����������ɽ��",2,
	"����ˣ�����ȥ��/partner_jingyue_trap2",
	"������׼��׼��/no")
end

function partner_jingyue_trap()
	SetFightState(1)
	NewWorld(514,1552,3308)

end

function partner_jingyue_trap2()
	nt_setTask(1256,20)
	SetFightState(1)	
	NewWorld(514,1552,3308)
end

------------------------------------------------------------------------------�����˶Ի�-------------------------------------------------------------------------

function partner_master_kaisuoren()
	if ( nt_getTask(1256) == 20 ) then
		if ( GetBit(GetTask(1261),1) == 1 ) and ( GetBit(GetTask(1261),2) == 1 ) then
			Describe(DescLink_KaiSuoRen.."<#>����ϲ���»���������Ŀ�������֮�ŵ�Կ�ס�",2,
			"������������/master_70_trap3",
			"���Ժ�����/no")
		else
			Describe(DescLink_KaiSuoRen.."<#>���㻹û�н�����ɽ��կ���������õ������������յĸ���ƬԿ�ף���ô��Ҳ�򲻿������š���ȥ������ǰɣ����ڵ�ͼ�Ϸ�������ɽ���ڡ�",1,"�����Ի�/no")
		end
	elseif ( nt_getTask(1256) == 30 ) then
		Describe(DescLink_KaiSuoRen.."<#>��ҪС���ģ�����ɲ�������ܹ��صģ�ɽ�����ױ��úܡ�",2,
		"������������/master_70_trap3",
		"���Ժ�����/no")
	elseif ( nt_getTask(1256) == 40 ) then
		Describe(DescLink_KaiSuoRen.."<#>�����Ѿ��ɹ������Ⱦ�ιǣ���ϲ����",2,
		"����������/master_70_trap4",
		"���Ժ�����/no")
	else
		Describe(DescLink_KaiSuoRen.."<#>������֮������һ����������ã����߿��ߡ�",1,"�����Ի�/no")
	end	
end

function master_70_trap3()
	nt_setTask(1256,30)
	nt_setTask(1261,0)
	SetFightState(1)
	NewWorld(514,1791,3197)
end

function master_70_trap4()
	SetFightState(0)
	NewWorld(514,1817,3228)
end
-----------------------------------------------------------------------------��ȡһ��ͬ��------------------------------------------------------------------------

function partner_longwu_getpartner()
	local partnercount = PARTNER_Count()                   --��ȡ��ǰͬ������
	if ( partnercount == -1 ) then
		Msg2player("���ܳ����쳣������GM��ϵ��")
	elseif ( partnercount == 0 ) then
		Describe(DescLink_LongWu.."<#>���������ͬ��Ŀ�������ҵ�<color=red>���ٻ�ͬ�顱<color>��ť����������ð�ť�Ϳ����ˡ�<color=red>�ٴ�<color>������ٻ�ͬ�顱��ť����<color=red>�ջ�ͬ����<color>",4,
		"�����ͬ��/partner_longwu_getmen",
		"���Ůͬ��/partner_longwu_getwomen",
		"������ͬ��/partner_longwu_getrandom",
		"�����Ի�/no") 
	elseif ( partnercount ~= 0 ) then
		Describe(DescLink_LongWu.."<#>�����Ѿ�ӵ����ͬ�飬�Ͳ�Ҫ��̰���ˡ�",1,
		"�����Ի�/no")
	end
end

function partner_longwu_getmen()
	local w=random(1,4)
	local j=random(1,3)
	if ( j == 1 ) then
		PARTNER_AddFightPartner(1,4,w,1,1,1,1,1,1)
	elseif ( j == 2 ) then
		PARTNER_AddFightPartner(3,3,w,1,1,1,1,1,1)
	else
		PARTNER_AddFightPartner(5,0,w,1,1,1,1,1,1)
	end
	Msg2Player("��ϲ������һ����ͬ�顣")
end

function partner_longwu_getwomen()
	local w=random(1,4)
	local j=random(1,2)
	if ( j == 1 ) then
    	PARTNER_AddFightPartner(2,2,w,1,1,1,1,1,1)
	else
		PARTNER_AddFightPartner(4,1,w,1,1,1,1,1,1)
	end
	Msg2Player("��ϲ������һ��Ůͬ�顣")
end

function partner_longwu_getrandom()
 	local j=random(1,5)
	local w=random(1,4)	
	if ( j == 1 ) then
		PARTNER_AddFightPartner(1,4,w,1,1,1,1,1,1)
		Msg2Player("��ϲ������һ��ͬ�顣")
	elseif ( j == 2 ) then
		PARTNER_AddFightPartner(2,2,w,1,1,1,1,1,1)
		Msg2Player("��ϲ������һ��ͬ�顣")
	elseif ( j == 3 ) then
		PARTNER_AddFightPartner(3,3,w,1,1,1,1,1,1)
		Msg2Player("��ϲ������һ��ͬ�顣")
	elseif ( j == 4 ) then
		PARTNER_AddFightPartner(4,1,w,1,1,1,1,1,1)
		Msg2Player("��ϲ������һ��ͬ�顣")
	else
		PARTNER_AddFightPartner(5,0,w,1,1,1,1,1,1)
		Msg2Player("��ϲ������һ��ͬ�顣")
	end
end

function no()
end