------------------------------------------------------------------------
-- FileName		:	partner_educationpeople.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-06 14:34:15
-- Desc			:  	��ͬ���������npc�Ի�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_problem.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����
IncludeLib("PARTNER")

partner_birthday={"��","ţ","��","��","��","��","��","��","��","��","��","��"}
partner_caimei  ={"ʯͷ","����","��"}

function partner_keepjiguan1(nChange)
	if ( nChange == 0 ) then
		Msg2Player("��û�ϸ񣬸��ҹԹԻش�ͬ������ɡ�")
		partner_edu(3,1,29,3,1228,2,1,1)
	elseif ( nChange == 1 ) then
		jiguan1_giveprize()
	end
end

function partner_keepjiguan2(nChange)
	if ( nChange == 0 ) then
		Msg2Player("��û�ϸ񣬸��ҹԹԻش�ͬ������ɡ�")
		partner_edu(3,1,29,3,1228,4,1,2)
	elseif ( nChange == 1 ) then
		jiguan2_giveprize()
	end
end

function partner_keepjiguan3(nChange)
	if ( nChange == 0 ) then
		Msg2Player("��û�ϸ񣬸��ҹԹԻش�ͬ������ɡ�")
		partner_edu(3,1,29,3,1228,6,1,3)
	elseif ( nChange == 1 ) then
		jiguan3_giveprize()
	end
end

function partner_keepjiguan4(nChange)
	if ( nChange == 0 ) then
		Msg2Player("��û�ϸ񣬸��ҹԹԻش�ͬ������ɡ�")
		partner_edu(3,1,29,3,1228,8,1,4)
	elseif ( nChange == 1 ) then
		jiguan4_giveprize()
	end
end

function partner_keepzhuofeifan(nChange)
	if ( nChange == 0 ) then
		Msg2Player("��û�ϸ񣬸��ҹԹԻش�ͬ������ɡ�")
		partner_edu(3,1,29,3,1228,10,1,5)
	elseif ( nChange == 1 ) then
		zhuofeifan_giveprize()
	end
end

function partner_keepheishadizi(nChange)
	if ( nChange == 0 ) then
		Msg2Player("�Բ�����û�лش���ȷ���Ҳ��ܸ�����ʲô��")
	elseif ( nChange == 1 ) then
		local Uworld1235 = nt_getTask(1235)
			  nt_setTask(1235,Uworld1235-1)
			  if ( Uworld1235 - 1 <= 0 ) then
			  		nt_setTask(1230,12)
					Describe(DescLink_HeiShaDizi.."��û�����ѣ���Ҫ���ؼ������ҵ����ϣ������̽��ؼ��͵���ʦ��������Ի�ȥ�Һ�ɷ��ʦѧϰ���λ��ˡ�����",1,"�����Ի�/heishadizi_chenggong")
			  else
					Describe(DescLink_HeiShaDizi.."���Բ������ѣ��ؼ�����������㻹���ұ��˰ɡ���������������Ĵ��⣬����Ӧ�ø���Щ����Ŷ��",2,"��ȡ����/heishadizi_giveprize","�����Ի�/heishadizi_geiyujiangli")
			  end
	end
end

function partner_moxiaofeng_fajiang1(nChange)
	if ( nChange == 1 ) then
		moxiaofeng_giveprize()
	end	
end

function partner_xiaoding_fajiang1(nChange)
	if ( nChange == 1 ) then
		xiaoding_giveprize()
	end	
end

function partner_quwan_fajiang1(nChange)
	if ( nChange == 1 ) then
		quwan_getprize()
	end	
end

function partner_xieqinger_fajiang1(nChange)
	if ( nChange == 1 ) then
		xieqinger_getprize()
	end	
end

partner_keeponproblem = {
[1] = partner_keepjiguan1,
[2] = partner_keepjiguan2,
[3] = partner_keepjiguan3,
[4] = partner_keepjiguan4,
[5] = partner_keepzhuofeifan,
[6] = partner_keepheishadizi,
[7] = partner_moxiaofeng_fajiang1,
[8] = partner_xiaoding_fajiang1,
[9] = partner_quwan_fajiang1,
[10] = partner_xieqinger_fajiang1,
}



----------------------------------------------------------¬��Ի�---------------------------------------------------
function pe_luqing()   
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	local Uworld1228 = nt_getTask(1228)                        --ͬ�����������Ӱ�������
	local Uworld1229 = nt_getTask(1229)                        --ͬ����������ɷ�������
	local Uworld1230 = nt_getTask(1230)                        --ͬ����������ɷ�������
	local Uworld1231 = nt_getTask(1231)                        --ͬ�������������ˮ�������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_LuQing.."�����Ǽ����˵Ľ����������ˡ������ڿ���ȥ�ҽ���ͽ���ˡ�",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 0 ) then  	  
	--¬�ദ����û�д�������������û�а��������������
		Describe(DescLink_LuQing.."��Ŷ������������������İ����ҵİ��Գ�Ӱ�����ˣ���������������ʿ�ǰ�æ�Ҳ�ҩ�ء��������<color=red>�����ɽ��ɽ����<color>�ҵ�<color=red>����һŮ<color>�ĸ���ʿ���ǰ�һﱿ�ÿ��ԣ�������ܰ��Ұ����Ƴ�Ӱ�Ĳ�ҩ<color=red>������<color>���Ҿͻ����һ����ʿ��ܴ�����ܴ�ĺô�Ŷ��<enter>"
		.."<color=green>��������ͬ�鼼��'��ղ���'��'��������'<color>",2,"��ʼ����/luqing_findmedicin","�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then  
	--���������
		Describe(DescLink_LuQing.."����ҩ�㶼�õ��ˣ�̫���ˣ��ҵ�����о��ˡ����ˣ����ٸ�����һЩ���Űɣ�<enter>"
		.."<color=yellow>ͬ�����һ������㹲ͬ����������NPC��ͬ����԰���������������ͱ���PKʱ����һ��֮��������ż������Щ������������һЩ���������Ȼ�����į��ʱ��Ҳ�������Ÿ�ͬ��˵˵����˵�����������Ȥ�����顣�������ָ����NpC���ӵ�����ͬ�������񣬵����������Щ����Ϳ��Ի�����ͬ���ˡ���ֻҪ��ͬ��Ŀ�������ҵ���ͬ��Ļ������ԡ���ťȻ������������Ϳ����ˡ�����ӵ�ж��ͬ���ʱ����ֻҪ��ͬ�����������Ϸ���ѡ����Ҫ�鿴��ͬ��ı�ǩ�Ϳ����ˡ�<color><enter>"
		.."���ˣ������������Ѿ�ѧ��������Ķ�����ȥ�������˰ɡ����أ������Ҷ���ʦ�ֵ�ʱ��������ʺ�����",2,"��ȡ����/luqing_getprize","�Ժ�����/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) then  
	--�սӵ�¬�ദ����	
		Describe(DescLink_LuQing.."�����Ǹ����������������<color=red>�����ɽ��ɽ����<color>�ҵ�<color=red>����һŮ<color>�ĸ���ʿ���ǰ�һﱿ�ÿ��ԣ�������ܰ��Ұ����Ƴ�Ӱ�Ĳ�ҩ<color=red>������<color>���Ҿͻ����һ����ʿ��ܴ�����ܴ�ĺô���",1,
		"�����Ի�/no")	
	else
		Describe(DescLink_LuQing.."�������ǰ����ʦ��վ�ڽ�����ߵ�����ɽ���ϣ��Ҽǵ������ӵ�������γ����߽����������Ч��������һ���񻰰ɡ�ȥ���������յ�һ�������ţ���˵�����ɽ��ѩ������ÿ��ܲ����ˡ������Ҹ��˺Ⱦƣ�ȴ����û��˭�ɿ���������˵��һֱ������̳���ɾƵ��ҡ��Ǻǣ��ǰ���������¯����ʢ�˼�ʮ�꣬ɽ�±ߵĶž�Ҳ��л�˼�ʮ�꣬����������Щ��Ľ��˼��Ҳ�������紵��ʦ�ֵ��������˰ɡ������Ҫȥ�����ˣ�Ҳ��֪·���Ƿ�ƽ�������·��ҵ�̫���ˡ�<enter>",1,"�����Ի�/no")
	end
		
end

function luqing_findmedicin()
	if ( partner_checkdo() == 10 ) then
		nt_setTask(1227,10)
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,100 ,1)                   			--����ǰͬ�����Ӿ��飬+100
		Msg2Player("¬������ȥ�����ɽ��·�ϣ�����������һŮ��λ��ʿ��")
	end
end

function luqing_getprize()                                          --�����¬�ദ���ܽ���
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()   --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddSkill(partnerindex,0,549,1)                      --����ͬ�鿹�Լ��ܡ���ղ��ơ�    
		Msg2Player("��ϲ������ͬ�鼼�ܡ���ղ��ơ�")
		nt_setTask(1227,20)											--¬�ദ�����������ѽ���
		Msg2Player("���Ѿ������¬�ദ��ѧϰ������ȥ�ڰ�˫ɷ����Ӱ������ˮ���������ơ�")
	end
end

----------------------------------------------------------����ĪЦ��Ի�-----------------------------------------

function pe_moxiaofeng()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) ~= 1 ) then
		Describe(DescLink_MoXiaoFeng.."��<color=green>������ţ��Ϊ�֣�����һ�����ٱ���᯷��ӣ��������������ƣ���Īͣ�������һ�������Ϊ�Ҳ�������ӹ�������󣬵�Ը�������ѡ�����ʥ�ͽԼ�į��Ω��������������<color><enter>"
		.."�����Ƴ���ʫ����׵Ľ������������������Ұʷ����ô����Ⱑ����ĪЦ�����ܳɾ�һ��������Ҳ��û������������һ�⡣ʲô������¬������ͷ����Ҫ��ҩ�ģ��ߺߣ���Ҫ��ҩ��û��ô�򵥡������������⣬����㶼�ܴ�ԣ��Ͱ����ϵĲ�ҩ���㡣�𲻶ԵĻ����Ŷ�û�С�",2,
		"ʲô���⣿�㾡����/moxiaofeng_taskproblem",
		"�Ժ����������/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 ) then
		Describe(DescLink_MoXiaoFeng.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/moxiaofeng_giveprize","�Ժ�����/no")   --��ȡ����������������������
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_MoXiaoFeng.."�����Ѿ�����������ĸ�������������ˣ�ҩ���úû�ȥ��¬����ͷ�ɡ�",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) then
		Describe(DescLink_MoXiaoFeng.."����������һ�����Ѿ�ͨ���ˣ�ȥ���������ʿ�ɡ����ǿ�û�������ý����ˣ��Լ�С�ġ�",1,"�����Ի�/no")
	else
		Describe(DescLink_MoXiaoFeng.."��ĪЦ��ĪЦ�磬ʮ��ϰ��ʮ���ɡ�����������뽣�Խ����ˣ�����һ�����ѣ��ǻ�����ȥ���죬�����貽�𣿹���������������",1,"�����Ի�/no")
	end
end

function moxiaofeng_taskproblem()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ3������Ϊ����1~����29���������ʴ��ֵΪ20�Σ���ɻش��1232�ű����ֽ�1��1
	partner_edu(3,1,29,3,1232,1,1,7)
end

function moxiaofeng_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,430,1 )                   			--����ǰͬ�����Ӿ��飬+430
		nt_setTask(1232,SetBit(GetTask(1232),2,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

----------------------------------------------------------����ţ�����Ի�-----------------------------------------
function pe_niumanman()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������ţ�����������
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) ~= 1 ) then
		Describe(DescLink_NiuManMan.."������һ��ɱ�֣���Ǯ����������Ҫɱ���أ�����Ҫɱ�ˣ�<enter>"
		.."��������Ҫҩ�ģ����Σ����߲����ģ�������Ȼ��ˣ��������������һ����Ϸ���治���ҵĻ���Ҫ�ش����⣬<color=red>���۴�öԴ������ٺ�����<color>��ֱ��<color=red>Ӯ<color>���Ҳſ��Գ��ء�ʲôʲô���ҰԵ����ͰԵ��ˣ���˵զ���ɡ�",3,
		"�ð�����ʼ��/niumanman_startcaimei",
		"��ţ����������Ϸ����/niumanman_guize",
		"�Ժ����������/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),3) == 1 ) and ( GetBit(GetTask(1232),4) == 0 ) then
		Describe(DescLink_NiuManMan.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/niumanman_giveprize","�Ժ�����/no")   --��ȡ����������������������
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_NiuManMan.."�����Ѿ�����������ĸ�������������ˣ�ҩ���úû�ȥ��¬����ͷ�ɡ�",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),4) == 1 ) then
		Describe(DescLink_NiuManMan.."����������һ�����Ѿ�ͨ���ˣ�ȥ���������ʿ�ɡ����ǵĵ���Ҳ���٣���ҪС��Ŷ���ٺ١�",1,"�����Ի�/no")
	else
		Describe(DescLink_NiuManMan.."��ɱ��һ����ɱ��Ҳ��һ�����������������˺�����ʲô��������ɱ������ɱЩ��������ˡ���˵�԰ɣ������������������Ϸ��Σ�",2,
		"�ð��������/niumanman_startcaimei",
		"û��û��/no")
	end
end

function niumanman_startcaimei()
	Describe(DescLink_NiuManMan.."���ðɣ���ô������ѡ��һ����Ф��ʼ���ұ����ɣ��ߺߡ������㣡",3,
	"��ѡ����ţ������������/niumanman_bisai1",
	"��ѡ������Ｆ��������/niumanman_bisai2",
	"�һ���������һ�£�����������/no")
end

function niumanman_guize()
	Describe(DescLink_NiuManMan.."����������<color=red>���󣬳�ţ��������î�ã����������ߣ�����δ�����ϼ����繷������<color>ʮ����Ф���������ȴ�С����������ǣ����ǰ�ʮ����Ф��Ϊ���飬ǰ������ţ��������Ϊһ�顣����������Ｆ����Ϊһ�顣��������ѡһ�������ұȴ�С��������ѡ������ţ����������һ�飬��ô����ҳ�������������ã���ô����Ҵ�����ҳ�������������ߣ��������Ҳ���ǰ���˳��Խ�ź����Խ�󡣲��������һ���Ǳȵ�һ��С�ģ�Ҳ���������ߴ�������һ�˳�һ����Ф����˭�Ĵ�����м������������Ф���ǿ���һ�����������ҳ�������������ߣ���ô����Ӯ����Ӯ�����Ҫ�ش���һ�����⣬���۴�öԴ�������Ӯ����Ϸ���ܴ���������ء�����û��",2,"����,���һ���һ��˵�/pe_niumanman","̫��,������/no")
end

function niumanman_bisai1()
	SetTaskTemp(190,0)
	local i = random (1,6)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan.."��������������ʼѡ��ʼѡ����������������㡣���ʲô��",6,
	"��/niumanman_num1",
	"ţ/niumanman_num2",
	"��/niumanman_num3",
	"��/niumanman_num4",
	"��/niumanman_num5",
	"��/niumanman_num6")
end

function niumanman_bisai2()
	SetTaskTemp(190,0)
	local i = random (7,12)
	SetTaskTemp(190,i)
	Describe(DescLink_NiuManMan.."��������������ʼѡ��ʼѡ����������������㡣���ʲô��",6,
	"��/niumanman_num7",
	"��/niumanman_num8",
	"��/niumanman_num9",
	"��/niumanman_num10",
	"��/niumanman_num11",
	"��/niumanman_num12")
end

function niumanman_bisaijieguo(partner_personnum)
	local partner_systnum = GetTaskTemp(190)
	if ( partner_personnum == 1 or partner_personnum == 7 ) then
		if ( partner_systnum == 6 or partner_systnum == 12 )  then
			Describe(DescLink_NiuManMan.."���ҳ�"..partner_birthday[partner_systnum]..",�����㾹�����������ı������ˡ��ðɣ������������ˡ�",1,"�����Ի�/niumanman_taskfinish")
		else 
			Describe(DescLink_NiuManMan.."���ҳ�"..partner_birthday[partner_systnum]..",�ٺ٣����������ش�����ɡ�",1,"�ðɣ��һش�/niumanman_shule")
		end
	else
		if (  partner_personnum == partner_systnum + 1 ) then
			Describe(DescLink_NiuManMan.."���ҳ�"..partner_birthday[partner_systnum]..",�����㾹�����������ı������ˡ��ðɣ������������ˡ�",1,"�����Ի�/niumanman_taskfinish")
		else
			Describe(DescLink_NiuManMan.."���ҳ�"..partner_birthday[partner_systnum]..",�ٺ٣����������ش�����ɡ�",1,"�ðɣ��һش�/niumanman_shule")
		end
	end
end

function niumanman_taskfinish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),3) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),3,1))  --ţ������������ɣ���δ��ȡ����
		niumanman_giveprize()
	end
end

function niumanman_shule()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ1������Ϊ����1~����20���������ʴ��ֵΪ100�Σ�����������ֽ�
	if ( partner_edu(1,1,29,1,0) == 10 ) then
		Describe(DescLink_NiuManMan.."����Ȼ�������ˣ��ã���������Ϸ������Ӯ�Ҿ͹��ء��ߺߡ�",1,"������/niumanman_startcaimei")
	else
		Msg2Player("����˾�������")
	end
end

function niumanman_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,430,1)                   			--����ǰͬ�����Ӿ��飬+430
		PARTNER_AddSkill(partnerindex,0,553,1)                          --����ͬ�鿹�Լ��ܡ��������ס�
		Msg2Player("��ϲ������ͬ�鼼�ܡ��������ס�")
		nt_setTask(1232,SetBit(GetTask(1232),4,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

----------------------------------------------------------�ɻ�����С���Ի�----------------------------------------------
function pe_xiaoding()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) ~= 1 ) then
		Describe(DescLink_XiaoDing.."�����ǲɻ����ӣ������Ѳ����ӡ��ҵ�ͬ���ǿ϶��������˺ܶ�����ɣ��������ﲻ��Ҫ�ˡ����Ļش��������Ŀ�ͰѲ�ҩ���㡣",2,
		"ʲô���⣿�㾡����/xiaoding_taskproblem",
		"�Ժ����������/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),5) == 1 ) and ( GetBit(GetTask(1232),6) == 0 ) then
		Describe(DescLink_XiaoDing.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/xiaoding_giveprize","�Ժ�����/no")   --��ȡ����������������������
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_XiaoDing.."�����Ѿ�����������ĸ�������������ˣ�ҩ���úû�ȥ��¬����ͷ�ɡ�",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),6) == 1 ) then
		Describe(DescLink_XiaoDing.."����������һ�����Ѿ�ͨ���ˣ�ȥ���������ʿ�ɡ����ǿ�û�������ý����ˣ��Լ�С�ġ�",1,"�����Ի�/no")
	else
		if ( GetSex() == 0 ) then
			Describe(DescLink_XiaoDing.."������������������������ԩ�ģ��ųƲɻ����ӣ�ȴһ�仨��û�ɹ������ڽ���������ͷ���ͱ�������Ӳ������������Ű������գ�����ϰ������ӡ�������˧�磬��һ��Ҫ���ҳ�ȥ����",1,"�����Ի�/no")
		else
			Describe(DescLink_XiaoDing.."������������������������ԩ�ģ��ųƲɻ����ӣ�ȴһ�仨��û�ɹ������ڽ���������ͷ���ͱ�������Ӳ������������Ű������գ�����ϰ������ӡ���Ů����㣬��һ��Ҫ���ҳ�ȥ����",1,"�����Ի�/no")
		end
	end
	
end

function xiaoding_taskproblem()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ3������Ϊ����1~����20���������ʴ��ֵΪ20�Σ���ɻش��1232�ű����ֽ�5��1
	partner_edu(3,1,29,3,1232,5,1,8)
end

function xiaoding_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,430,1 )                   			--����ǰͬ�����Ӿ��飬+430
		nt_setTask(1232,SetBit(GetTask(1232),6,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end
----------------------------------------------------------�ɰ�Ů����ȸ���Ի�---------------------------------------------
function pe_yunqueer()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	
	if ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) ~= 1 ) then
		Describe(DescLink_YunQueEr.."�������������ɱ����Ǹ���ͷ��˵����û�����ǲ����������Ф�Ĵ�С�����û������ġ���С�����׾���������徭����������������ȡ���������߼��Ĳ�ö��Ϸ��ʯͷ���Ӳ����ߺ�......������һ����Ҫ�ش�С��������⣬��ô����",3,
		"��ʼ��/yunqueer_wenti",
		"���ҽ���һ�¹���/yunqueer_guize",
		"�Ժ����������/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),7) == 1 ) and ( GetBit(GetTask(1232),8) == 0 ) then
		Describe(DescLink_YunQueEr.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/yunqueer_giveprize","�Ժ�����/no")   --��ȡ����������������������
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),2) == 1 ) and ( GetBit(GetTask(1232),4) == 1 ) and ( GetBit(GetTask(1232),6) == 1 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_YunQueEr.."�����Ѿ�����������ĸ�������������ˣ�ҩ���úû�ȥ��¬����ͷ�ɡ�",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1227 == 10 ) and ( GetBit(GetTask(1232),8) == 1 ) then
		Describe(DescLink_YunQueEr.."����������һ�����Ѿ�ͨ���ˣ�ȥ���������ʿ�ɡ����ǿ�û�������ý����ˣ��Լ�С�ġ�",1,"�����Ի�/no")
	else
		if ( GetSex() == 0 ) then
			Describe(DescLink_YunQueEr.."�����������ں����ϵ����˵���ء�������������˵ʲô������˵�������������ɽ����ϼ�����б���ϼ��Ư������ȸ���ء������ҳ�ȥ����ò��ã�",1,"�����Ի�/no")
		else
			Describe(DescLink_YunQueEr.."�����������ں����ϵ����˵���ء�������������˵ʲô������˵�������������ɽ����ϼ�����б���ϼ��Ư������ȸ���ء������ҳ�ȥ����ò��ã�",1,"�����Ի�/no")
		end
	end
end

function yunqueer_guize()
	Describe(DescLink_YunQueEr.."�������������Σ�ʯͷ���Ӳ��أ�ʯͷӮ���ӣ�����Ӯ������Ӯʯͷ������û����Ӯ���Ҿ͹��أ�ûӮ�һ��ߴ��ƽ�֣��������������Ҳ�����ӣ���Ҳ����Ӯ���ߺߡ�������Ӯ��Ҳ��Ϊ���㣬�����������Ŀ�ͺ��",1,"��Ҫ������һ��˵�/pe_yunqueer")
end

function yunqueer_wenti()
	Describe(DescLink_YunQueEr.."�� ����������ʼ��ȭ�������ʲô��",3,
	"ʯͷ/yunqueer_shitou",
	"����/yunqueer_jianzi",
	"��/yunqueer_bu")
end

function yunqueer_shitou()
	local i = random(1,3)
	if ( i ~= 2 ) then
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ����Ӯ�����������ش������",1,"����ش�������/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ������Ӯ�����ðɡ����������",1,"������������/yunqueer_finish")
	end
end

function yunqueer_jianzi()
	local i = random(1,3)
	if ( i ~= 3 ) then
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ����Ӯ�����������ش������",1,"����ش�������/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ������Ӯ�����ðɡ����������",1,"������������/yunqueer_finish")
	end
end

function yunqueer_bu()
	local i = random(1,3)
	if ( i ~= 1 ) then
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ����Ӯ�����������ش������",1,"����ش�������/yunqueer_problem")
	else
		Describe(DescLink_YunQueEr.."���ҳ�"..partner_caimei[i]..",��ѽ������Ӯ�����ðɡ����������",1,"������������/yunqueer_finish")
	end
end

function yunqueer_problem()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ3������Ϊ����1~����20���������ʴ��ֵΪ100�Σ�����������ֽ�
	if  ( partner_edu(3,1,29,3,0) == 10 ) then
		Msg2Player("�ã��ٽ���������ö�ɡ�������")
	else
		Msg2Player("����Ҳ��Ҫ���٣��������������")
	end
end

function yunqueer_finish()
	if ( nt_getTask(1226) == 10 ) and ( nt_getTask(1227) == 10 ) and ( GetBit(GetTask(1232),7) == 0 ) then
		nt_setTask(1232,SetBit(GetTask(1232),7,1))  --��ȸ����������ɣ���δ��ȡ����
		yunqueer_giveprize()
	end
end


function yunqueer_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,430,1 )                   			--����ǰͬ�����Ӿ��飬+430
		nt_setTask(1232,SetBit(GetTask(1232),8,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end



-----------------------------------------------------------------��Ӱ�Ի�-----------------------------------------------------

function pe_tangying()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	local Uworld1228 = nt_getTask(1228)                        --ͬ�����������Ӱ�������
	local Uworld1229 = nt_getTask(1229)                        --ͬ����������ɷ�������
	local Uworld1230 = nt_getTask(1230)                        --ͬ����������ɷ�������
	local Uworld1231 = nt_getTask(1231)                        --ͬ�������������ˮ�������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_TangYing.."�����Ǽ����˵Ľ����������ˡ������ڿ���ȥ�ҽ���ͽ���ˡ�",1,"�����Ի�/no")	
	elseif ( partner_getpartnerlevel(4) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 0 ) then  	   --��Ӱ������û�д�������������û�а��������������
		Describe(DescLink_TangYing.."�����������ô���أ������⺢��̫�������ˡ�<enter>"
		.."Ŷ�����ǽ���ͽ�ܽ������ġ��Ǻðɣ��ҵĶ��������±�������һ������°���ˣ���������æ�Ų���һ������ҩ�ģ�ϣ���������Ұ����¾ȳ���,���лر����Ǹ����˾����ұ���������������һ��������·�Ŀ���ջ��������Ҫ�ҵ�����·�����Ҿȳ��ҵĶ��ӡ�����·���ڵ����±��ϻ���һ����ֵ�����·����������ʯɽ��ÿ��ɽ�϶�Ҫ����һ�����أ������˻�����Щ���⡣��֮�ǳ������ף���ҪС�İ���<enter>"
		.."<color=green>��������ͬ�鼼��'�ٶ�����'��'�����'<color>",2,
		"�ҽ�����ս/tangying_findchildren",
		"�һ�û����׼����/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1228 == 8191 ) then
		Describe(DescLink_TangYing.."�����µ��¾ͻ�����̫���ˣ�лл�㡣���ˣ����ٸ�����һЩ���Űɣ�<enter>"
		.."<color=yellow>���㴦����������״̬�ҵ�����ͬ����ж���Χ��ʱ������������͡���å�͡�ų���͵�ͬ�飬����Զ�������������ͬ��Ĳ�ͬ�Ը������ж���Χ��������ʽҲ�᲻һ�������㲻�������ͬ��ȥ�������˵�ʱ����ֻҪ��ͬ��Ŀ�������ҵ��������桱��ťȻ������������Ϳ����ˡ�������������ͬ���ٴι������˵Ļ����������Ҫ��ͬ��Ŀ�������ҵ���������������ť�������������Ҫ���ͬ��ʱ����Ҫ��ν�ɢ���أ�������Ҫ��ͬ�����Խ����ҵ���ɢͬ�鰴ť����������ϵͳ������ȷ���Ƿ����Ҫ��ɢͬ�飬��ʱ���ѡ���ǡ��Ļ��Ϳ��԰ѵ�ǰͬ���ɢ�ˡ�<color><enter>"
		.."���ˣ������������Ѿ�ѧ��������Ķ�����ȥ�������˰ɡ�����ˮ���ҵ����ţ��������ʱС�ĵ㣬ǧ�����������Ӷ���������Ȼ�����һᱻ�����ſڵġ����а��С�",2,"��ȡ����/tangying_getprize","�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1228),1) == 1  ) then  --�սӵ���Ӱ������
		Describe(DescLink_TangYing.."��ȥ<color=red>�ұ�����<color>�����ҵ�һ��<color=red>С·<color>��ͨ���������󣬰��Һ��Ӵ��Ǹ�������׿�Ƿ�����ȳ�����",1,
		"�����Ի�/no")	
	else
		Describe(DescLink_TangYing.."����˵���������������Ƴ��⺢��������խ�������ޣ���ô���ð����һ�ҵ����أ�����ǰ�������ǿ���������������ѡ����˼��ȡ֮���ؼҰɡ�˵���������������Ϲ�������ȫ���������Ӱ�����ǿݹ�һ�ߡ���Щ���㲻�ܲ�����ȴ�����޿������ɼ���������һ�����վ����Ÿ����ҡ���ϣ���������Ƽұ��ȹ���Щ���̰ɡ�<enter>",1,"�����Ի�/no")
	end
	
end

function tangying_findchildren()
	nt_setTask(1228,SetBit(GetTask(1228),1,1))  --��������
	Msg2Player("��Ӱ����ȥ�ұ�һ�����ص�ͨ����ȳ����Ķ��������¡�")
end

function tangying_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddSkill(partnerindex,0,550,1)                          --����ͬ�鿹�Լ��ܡ��ٶ����֡�
		Msg2Player("��ϲ������ͬ�鼼�ܡ��ٶ����֡�")
		nt_setTask(1228,20)
		Msg2Player("���Ѿ��������Ӱ����ѧϰ������ȥ�ڰ�˫ɷ������ˮ��¬���������ơ�")
	end
end

----------------------------------------------------------------�����˶Ի�--------------------------------------------------

function pe_jiguan1()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),2) == 0 ) then 
		Describe(DescLink_JiGuanRen.."����ɽ�ǰ������ϴ�<enter>"
		.."            �����ǰ������ϴ���<enter>"
		.."            Ҫ��򰳻����ϴ����<enter>"
		.."            �͵ø��������ϴ�������<enter>"
		.."            Ҫ��զ��̫���ˡ��ش𰳻����ϴ󼸵�Ū�����ķ�����Ŀ����������Ҫ�ͷ��㣡",2,
		"�򵥰��������ش�/jiguanren_problem1",
		"��ʲô���Ȳ�������/no")
	elseif ( GetBit(GetTask(1228),2) == 1 ) and ( GetBit(GetTask(1228),3) == 0 ) then 
		Describe(DescLink_JiGuanRen.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/jiguan1_giveprize","�Ժ�����/no")   --��ȡ����������������������
	else
		Describe(DescLink_JiGuanRen.."������һ�������ˣ���ѽ��ѽŶ��",1,"����ɶ�����˰������Ǹ�����/no")
	end
end

function pe_jiguan2()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),4) == 0 ) then 
		Describe(DescLink_JiGuanRen.."����ɽΪ�һ����ϣ����ϣ������϶���<enter>"
		.."            ����Ϊ�һ����ϰ����ϰ����϶���<enter>"
		.."            Ҫ����һ����϶����<enter>"
		.."            �͵ø��һ����϶�����������Ū����<enter>"
		.."            Ҫ��զ��̫���ˡ��ش��һ����϶�����Ū�����ķ�����Ŀ����������Ҫ�ͷ��㣡",2,
		"�򵥰��������ش�/jiguanren_problem2",
		"��ʲô���Ȳ�������/no")
	elseif ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 ) then 
		Describe(DescLink_JiGuanRen.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/jiguan2_giveprize","�Ժ�����/no")   --��ȡ����������������������
	else
		Describe(DescLink_JiGuanRen.."������һ�������ˣ���ѽ��ѽŶ��",1,"����ɶ�����˰������Ǹ�����/no")
	end
end

function pe_jiguan3()
	if ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),6) == 0 ) then 
		Describe(DescLink_JiGuanRen.."����ɽ�ǻ���������<enter>"
		.."            �����ǻ��������ֵ�<enter>"
		.."            Ҫ��򰳻����������<enter>"
		.."            �͵ø��һ�������������<enter>"
		.."            Ҫ��զ��̫���ˡ��ش������������Ū�����ķ�����Ŀ����������Ҫ�ͷ��㣡",2,
		"�򵥰��������ش�/jiguanren_problem3",
		"��ʲô���Ȳ�������/no")
	elseif ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 ) then 
		Describe(DescLink_JiGuanRen.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/jiguan3_giveprize","�Ժ�����/no")   --��ȡ����������������������
	else
		Describe(DescLink_JiGuanRen.."������һ�������ˣ���ѽ��ѽŶ��",1,"����ɶ�����˰������Ǹ�����/no")
	end
end

function pe_jiguan4()
	if  ( GetBit(GetTask(1228),1) == 1 ) and  ( GetBit(GetTask(1228),8) == 0 ) then 
		Describe(DescLink_JiGuanRen.."����ɽ�ǰ��������Ŀ�<enter>"
		.."            �����ǰ�����������<enter>"
		.."            Ҫ��򰳻����������<enter>"
		.."            �͵ø�����������������<enter>"
		.."            Ҫ��զ��̫���ˡ��ش𰳻����ϴ󼸵�Ū�����ķ�����Ŀ����������Ҫ�ͷ��㣡",2,
		"�򵥰��������ش�/jiguanren_problem4",
		"��ʲô���Ȳ�������/no")
	elseif ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 ) then 
		Describe(DescLink_JiGuanRen.."���ðɣ��Ұ�������Ľ������㡣",2,"��ȡ����/jiguan4_giveprize","�Ժ�����/no")   --��ȡ����������������������
	else
		Describe(DescLink_JiGuanRen.."������һ�������ˣ���ѽ��ѽŶ��",1,"����ɶ�����˰������Ǹ�����/no")
	end
end

function jiguanren_problem1()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ2������Ϊ����101~����118���������ʴ��ֵΪ2�Σ��ش���ȷ��1228��2λ��1������ش���ȷ������partner_keeponproblem[1]
	partner_edu(2,101,118,2,1228,2,1,1) 
end

function jiguanren_problem2()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ2������Ϊ����101~����118���������ʴ��ֵΪ2�Σ��ش���ȷ��1228��4λ��1������ش���ȷ������partner_keeponproblem[2]
	partner_edu(2,101,118,2,1228,4,1,2)
end

function jiguanren_problem3()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ2������Ϊ����101~����118���������ʴ��ֵΪ2�Σ��ش���ȷ��1228��6λ��1������ش���ȷ������partner_keeponproblem[3]
	partner_edu(2,101,118,2,1228,6,1,3) 
end

function jiguanren_problem4()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ2������Ϊ����101~����118���������ʴ��ֵΪ2�Σ��ش���ȷ��1228��8λ��1������ش���ȷ������partner_keeponproblem[4]
	partner_edu(2,101,118,2,1228,8,1,4) 
end

function jiguan1_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		nt_setTask(1228,SetBit(GetTask(1228),3,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

function jiguan2_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		nt_setTask(1228,SetBit(GetTask(1228),5,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

function jiguan3_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		nt_setTask(1228,SetBit(GetTask(1228),7,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

function jiguan4_giveprize ()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		nt_setTask(1228,SetBit(GetTask(1228),9,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

-----------------------------------------------------------------׿�Ƿ��Ի�---------------------------------------------------

function pe_zhuofeifan()
	if ( nt_getTask(1228) == 511 ) then
		Describe(DescLink_ZhuoFeiFan.."��������һ����Ҷ�㣬�������ᡣ��׿�Ƿ�����Ҳ��������һ��һ�ĸ��֡�ʲô������˭���԰�������˭�����ң�����˭����ѽ������������Ҫ���Ǹ��캢��������ţħ���Ķ��ӣ��Ų��õġ��������������ˣ����������ʥ�������������������ħ��һ������������������Ȼ��һ��Ҫ����������������ȻҪ����һ�����ᣬ������������<color=red>���<color>��������",2,
		"������/zhuofeifan_problem",
		"��׿�Ƿ����ú��أ��һ����Ժ�������/no")
	elseif ( GetBit(GetTask(1228),11) == 1 )then
		Describe(DescLink_ZhuoFeiFan.."�������Ҹ��������µ�С������ʲô�°���û�������㿴��ɽ���Ǹ������ǲ�����Ҫ�ҵġ�����������",1,"�����Ի�/no")
	elseif ( GetBit(GetTask(1228),10) == 1 ) and ( GetBit(GetTask(1228),11) == 0 ) then 
		Describe(DescLink_ZhuoFeiFan.."���ߺߣ�����������ã�ֻ�������⡣������԰���ͬ��������ٺ١�<color=yellow>��֪������ʲô�ͷ���ͬ�鲻�������ǵ�ͬ�������ֵΪ0ʱ��������״̬���Զ��˳�ս����Ҫ����5���Ӻ�����ٴ��ٻ�������ͬ���������״̬������ֵ�ָ�Ϊ���ֵ��100%������֪���˰ɡ�<color>�������Ұ�������Ľ������㡣",2,"��ȡ����/zhuofeifan_giveprize","�Ժ�����/no")   --��ȡ����������������������
	else
		Describe(DescLink_ZhuoFeiFan.."�����������ʥ����������׿�Ƿ���׿�Ƿ���˭��",1,"����������Ҳ������ʲô����/no")
	end
end

function zhuofeifan_problem()
	--���ù�������⣬�ش���ȷ��Ҫ��Ϊ2������Ϊ����101~����118���������ʴ��ֵΪ2�Σ��ش���ȷ��1228��4λ��1������ش���ȷ������partner_keeponproblem[2]
	partner_edu(5,101,118,5,1228,10,1,5)
end

function zhuofeifan_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		PARTNER_AddSkill(partnerindex,0,552,1)                          --����ͬ�鿹�Լ��ܡ��������
		Msg2Player("��ϲ������ͬ�鼼�ܡ��������")
		nt_setTask(1228,SetBit(GetTask(1228),11,1))  --�������
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end


-----------------------------------------------------------------������--------------------------------------------------------

function pe_tangqiuyi()
	
	if ( ( GetBit(GetTask(1228),12) == 1 )  and ( GetBit(GetTask(1228),13) == 0 ) ) then
		Describe(DescLink_TangQiuYi.."������������Щ������ɡ�",2,"��ȡ����/tangqiuyi_giveprize","�Ժ�����/no")
	elseif  ( GetBit(GetTask(1228),11) == 1 ) and ( GetBit(GetTask(1228),12) == 0 )  then 
		if ( GetSex() == 0 ) then
			Describe(DescLink_TangQiuYi.."������׿���岻��������������......ɨ�ˡ��ðɣ����������ϻ�ȥ������Ի�ȥ�����Ҹ����ˡ�<color=red>�ٸ��ҶԻ�������һЩ����Ŷ��<color>",1,"�����Ի�/tangqiuyi_finish")
		else
			Describe(DescLink_TangQiuYi.."������׿���岻��������������......ɨ�ˡ��ðɣ����������ϻ�ȥ������Ի�ȥ�����Ҹ����ˡ�<color=red>�ٸ��ҶԻ�������һЩ����Ŷ��<color>",1,"�����Ի�/tangqiuyi_finish")		
		end
	elseif ( GetBit(GetTask(1228),13) == 1 ) then
	  	if ( GetSex() == 0 ) then
			Describe(DescLink_TangQiuYi.."������׿���岻��������������......ɨ�ˡ��ðɣ����������ϻ�ȥ������Ի�ȥ�����Ҹ����ˡ�",1,"�����Ի�/tangqiuyi_finish")
		else
			Describe(DescLink_TangQiuYi.."������׿���岻��������������......ɨ�ˡ��ðɣ����������ϻ�ȥ������Ի�ȥ�����Ҹ����ˡ�",1,"�����Ի�/tangqiuyi_finish")		
		end
	else
		Describe(DescLink_TangQiuYi.."��׿����˵����ȥ���ϼ��϶����أ��㲻Ҫ�������Ҳ�������ߵġ���Ҫ˵��׿����˵ȥ��",1,"�����Ի�/no")
	end
end

function tangqiuyi_finish()
	nt_setTask(1228,SetBit(GetTask(1228),12,1))  --�����´��������
end

function tangqiuyi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,800 ,1)                   			--����ǰͬ�����Ӿ��飬+800
		nt_setTask(1228,SetBit(GetTask(1228),13,1))  --�������
	end
end










-----------------------------------------------------------------��ɷ�Ի�------------------------------------------------------
function pe_baisha()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	local Uworld1228 = nt_getTask(1228)                        --ͬ�����������Ӱ�������
	local Uworld1229 = nt_getTask(1229)                        --ͬ����������ɷ�������
	local Uworld1230 = nt_getTask(1230)                        --ͬ����������ɷ�������
	local Uworld1231 = nt_getTask(1231)                        --ͬ�������������ˮ�������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_BaiSha.."�����Ǽ����˵Ľ����������ˡ������ڿ���ȥ�ҽ���ͽ���ˡ�",1,"�����Ի�/no")	
	elseif ( partner_getpartnerlevel(6) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1229 == 0 ) then  	   --��ɷ������û�д�������������û�а��������������
		Describe(DescLink_BaiSha.."�����������¹Ɑ<enter>"
		.."      �����������ϴ�<enter>"
		.."      ����ɳ����ĪЦ<enter>"
		.."      ������ս���˻�<enter>"
		.."�����ʱ���ܰ����Σ�ѧ������������һ�ѹ½�һ�ܶ�������ȥ��������Į�����ա���ϧ��Щ�����ķ���û�����ң���ת����Ҳ�Ͽ������������������˵��ˣ���Ȼ�ǽ��ʵ��������������չ鲻�ܽ�����ֻ�ȥ�ġ�����<color=red>��������Ϸ�<color>�������ط����ֱ���<color=red>����ʿ����л�Ѹ��Ʒ�<color>������������������ͽ�����������ӣ���ȥ�����ǣ��Ի���Щ���������㡣�����ܹ����������أ�������Ķ���Ҳ��ѧ�ò���ˡ�<enter>"
		.."<color=green>��������ͬ�鼼��'��ѩ����'<color>",2,
		"�ð������������ڿ�ʼ��/baisha_starttask",
		"�����Ի�/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  and ( nt_getTask(1229) ~= 20 )then  --���������
	
		Describe(DescLink_BaiSha.."���ðɣ����ٸ�����һЩ���ţ�<enter>"
		.."ͬ�������������ӵ�����ʵģ�<color=red>���������������У����ܣ����٣�����<color>��һ�����Ե�����Խ����ζ�Ÿ�����������ʱ������Խ�࣬���������������٣�<color=red>ͬһ����<color>����Ҳ����<color=red>����ͬ<color>������˵��������ͬ�����������ʶ���2����������������ʱ�����һ��������50������ֵ������һ��ֻ������45������ֵ����Щ������������ֵ��ͬ��<color=red>10����30����50����90��ʱ�����һЩ������<color><enter>"
		.."���ˣ������������Ѿ�ѧ��������Ķ�����ȥ�������˰ɡ����ֵܺ�ɷ�ɲ��Ǹǵã�ţ���൱�������˵��ʱ��ɤ��ǧ���̫�������ڻ��ڵ�����������������������Ϲ�С���ء�",2,"��ȡ����/baisha_getprize","�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( GetBit(GetTask(1229),1 ) == 1 ) then  --�սӵ���ɷ������
		Describe(DescLink_BaiSha.."��������������Ϸ��������ط����ֱ�������ʿ����л�Ѹ��Ʒ�������������������ͽ�����������ӣ���ȥ�����ǣ��Ի���Щ���������㡣�����ܹ����������أ�������Ķ���Ҳ��ѧ�ò����",1,
		"�����Ի�/no")	
	else
		Describe(DescLink_BaiSha.."���㻹��������ʲô������������Ѱ��ͬ�飿����֪��������ʲô�ء�����˵һ�뽭�����´ߣ��ߵĲ�ֻ����������������İ������ˣ�˵���������к��ã�Ҫ���ģ��չ���Լ����������ס���Щ�º������е�ѩһ������Ʈ�����ҵ���Ҳ�Ѿ������ˡ�<enter>",1,"�����Ի�/no")
	end
   
end

function baisha_starttask()
	nt_setTask(1229,SetBit(GetTask(1229),1,1))  
	Msg2Player("��ɷ����ȥ���������������ʿ����л�Ѹ��Ʒ���������λͽ�ܡ�")
end

function baisha_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddSkill(partnerindex,0,551,1)                          --����ͬ�鿹�Լ��ܡ���ѩ���ڡ�
		Msg2Player("��ϲ������ͬ�鼼�ܡ���ѩ���ڡ�")
		nt_setTask(1229,20)
		Msg2Player("��ɷû��ʲô���Խ�����ˣ�ȥ��ɷ����Ӱ������ˮ�򸾣���¬�����￴���ɡ�")
	end
end

---------------------------------------------------------------�е�����������-------------------------------------------------

function pe_menshenquwan()
	if ( GetBit(GetTask(1229),1) == 1  ) and ( GetBit(GetTask(1229),2) == 0 ) then
		Describe(DescLink_QuWan.."������ʦ�������˼ҽ������ġ��ðɣ������ȸ�����һЩҪ�㣺<enter>"
		.."	<color=red>��������<color>��<color=yellow>��ʾ��ͬ������У���ͬ���е�ͬ������ӵ�е��书��������ͬ��ͬʱ��һ���ݵĸ��Ӽ���Ҳ�������е����ƣ�<color><enter>"
    	.."	<color=red>����<color>��<color=yellow>����ͬ�������������ʱ�����������ٵ�ֵ��<color><enter>"
		.." <color=red>����<color>��<color=yellow>����Ǳ�ʣ��պ󿪷ţ�<color><enter>"
        .." <color=red>�Ը�<color>��<color=yellow>��ͬ����Ը񣬲�ͬ�Ը��ͬ����Ϊ��ʽҲ�᲻ͬ�����е��Ը������У�<color><enter>"
		.."	  <color=red>������<color>��<color=yellow>�ṥ����������Ķ��֣����������������ˣ�ӵ�бȽ�Զ���ж���Χ��<color><enter>"
		.."	  <color=red>������<color>��<color=yellow>��ҹ���Ŀ��򱻹���ʱ��ͬ�������Э�������������������ˣ�һ������Ҹ�����<color><enter>"
		.."	  <color=red>��å��<color>��<color=yellow>�ṥ��Ѫ�ٵĶ��֣�������Ѫ����20%ʱ���ܱߴ�<color><enter>"
		.."	  <color=red>ų����<color>��<color=yellow>������������֣��ܵ�����ʱ����ܱߴ���������20%ʱ���������㡣<color><enter>"
    	.."������Ū�����Щ�Ժ������ش���<color=red>����<color>���⣬����˲ſ��Թ�����ء�",2,"�ش�����/quwan_problem","��׼��һ�°�/no")
    elseif ( GetBit(GetTask(1229),1 ) == 1  ) and ( GetBit(GetTask(1229),2) == 1) and ( GetBit(GetTask(1229),3) ~= 1)  then
    	Describe(DescLink_QuWan.."�������������������ѧϰ�Ѿ������ˡ���ȡ��Ľ����ɡ�",2,"��ȡ����/quwan_getprize","�Ժ�����/no")
    elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  then
    	Describe(DescLink_QuWan.."������������Һ�������ﶼѧ��������Ķ����ˡ���ȥ��ʦ�������˼Ұɡ�",1,"�����Ի�/no")
    else
    	Describe(DescLink_QuWan.."����Ǳ����������Ѱ���Ϲŵı����������û��ȥ�ҹ�ʦ���ˡ�����������˼ң�������ʺá��������......��,�������ˣ����߰ɡ�",1,"�����Ի�/no")
    end
end

function quwan_problem()
	partner_edu(3,30,66,3,1229,2,1,9)
end

function quwan_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,2100,1)                   			--����ǰͬ�����Ӿ��飬+2100
		nt_setTask(1229,SetBit(GetTask(1229),3,1))  
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

--------------------------------------------------------------- Ů����л���--------------------------------------------------

function pe_xieqinger()
	if ( GetBit(GetTask(1229),1) == 1) and ( GetBit(GetTask(1229),4) == 0) then
		Describe(DescLink_XieQingEr.."�������ﰡ����Ů����������ɡ�<enter>"
		.."����ʲô�ˣ�Ŷ����ʦ�������˼��������ġ��ðɣ����һش�����������⡣<enter>",2,"�ش�����/xieqinger_problem","��׼��һ�°�/no")
    elseif ( GetBit(GetTask(1229),1 ) == 1  ) and ( GetBit(GetTask(1229),4) == 1) and ( GetBit(GetTask(1229),5) ~= 1)  then
    	Describe(DescLink_XieQingEr.."�������������ѧϰ�Ѿ������ˡ���ȡ��Ľ����ɡ�",2,"��ȡ����/xieqinger_getprize","�Ժ�����/no")
    elseif ( GetBit(GetTask(1229),3) == 1) and ( GetBit(GetTask(1229),5) == 1 )  then
    	Describe(DescLink_XieQingEr.."������Һ�ʦ�����ﶼѧ��������Ķ����ˡ���ȥ��ʦ�������˼Ұɡ�",1,"�����Ի�/no")
    else
    	Describe(DescLink_XieQingEr.."���ǵģ������Ǹ��Ѹ������ѵ�������Щ�����۸��ҵ���������Щ�����û��ʦ����ʦ�֣���Ҳ������ȥ�˵ġ�",1,"�����Ի�/no")
    end
end

function xieqinger_problem()
	partner_edu(3,30,66,3,1229,4,1,10)
end

function xieqinger_getprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,2100,1)                   			--����ǰͬ�����Ӿ��飬+2100
		nt_setTask(1229,SetBit(GetTask(1229),5,1))  
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end

-----------------------------------------------------------------��ɷ�Ի�-----------------------------------------------------
function pe_heisha()

	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	local Uworld1228 = nt_getTask(1228)                        --ͬ�����������Ӱ�������
	local Uworld1229 = nt_getTask(1229)                        --ͬ����������ɷ�������
	local Uworld1230 = nt_getTask(1230)                        --ͬ����������ɷ�������
	local Uworld1231 = nt_getTask(1231)                        --ͬ�������������ˮ�������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_HeiSha.."�����Ǽ����˵Ľ����������ˡ������ڿ���ȥ�ҽ���ͽ���ˡ�",1,"�����Ի�/no")
	elseif ( partner_getpartnerlevel(7) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 0 ) then  	   --��ɷ������û�д�������������û�а��������������
		Describe(DescLink_HeiSha.."����������������꣬�������ȥɱ��𹷱�Ч�ҹ��ˣ������ֵ��������С�������Ͽ���ֻ������Щ����ʿ��Ҳ��Ϊ���ҳ�һ��������������ʱ�򷸵Ĺ���ɡ�<enter>"
		.."����ͽ�ܣ��Ǹ���С�ӣ�����׬�Ϸ�ı��ˡ����Ȼ���ˣ��ܲ���������ֻ�ȥ�ġ������������ͬ����ѧ�Ϸ�ľ�����<color=red>��ڤ���λ�<color>��Ҫѧ���ԣ��Ϸ���·�书�����仯��ˣ�ÿһ�ж����������ֱ仯��������ͼ����Ҫѧ�Ļ�ֻ�ܽ����λ��ֲ��������Σ����̸��㡣ѧ�ǲ�ѧ��<enter>"
		.."<color=green>��������ͬ�鼼��'��ڤ���λ�'<color>",2,
		"��ȻҪѧ/heisha_starttask",
		"�����Ի�/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then  --�սӵ���ɷ������
		Describe(DescLink_HeiSha.."��ȥ���Ϸ��ͽ���ǶԻ�ѽ����զƾ�ش��أ�",1,
		"�����Ի�/no")	
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 12 )  then  --ѧϰ���λ����������
		Describe(DescLink_HeiSha.."���������ܶ��Ѿ���Ϥ�˰ɡ����������ٸ�����һЩ���ţ�ͬ��ļ��ܷ�Ϊ���м��֣�<enter>"
		.." <color=yellow>a)	�书���ܣ�ͬ�������������˵���ʽ��ͨ��������ã�<enter>"
		.."	b)	������ܣ����ձ��׻����ֿ��Խ��мӳɵļ��ܣ�ͨ�������������ã�<enter>"
		.."	c)	���Ӽ��ܣ����ּӳɺ͸����Լ�һЩ����ļ��ܣ�ͨ��������;��������ã�<enter>"
		.."	d)	������ͨ�����������ã�<enter>"
		.."���ˣ�Ҳ�������ˡ����ھͽ����������������������ͬ����ڤ���λ���<color>",2,"��ȡ����/heisha_giveprize1","�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 13 )  then  --�Ѿ�ѧ�������λ�����ʼ�¸��׶εĽ���
		Describe(DescLink_HeiSha.."����������ڤ���λ��Ѿ��̸����ˣ���ô��֪��������Ҫ���ʹ��������Ӽ����еĹ��������������������㡣<enter>"
		.."<color=yellow>���书���������·���������и�ÿһ������Ÿ�ͬ����20%�ļ��ʻ�ʹ�ø���ļ��ܣ����ڿɷ����ͬ������ʹ���������������ܡ����磺��ͬ��ĳ��и����������������A��������������B����ô��ͬ��ʹ��������A���ļ����Ǿ���60%��ʹ��������B�� �ļ����Ǿ���40%��<color><enter>"
		.."��ô��������֪���˰ɡ�����ȥ�����ɳ��������ϰһ�¹��������ɡ��Ժ��������ҡ�<color=red>��ס��������Լ�����ȥ�����ͬ���ڽ��������У�����û����ȫ���ɹ��򣬻���ɳ������Ч�ġ�<color><enter>",1,"�����Ի�/heisha_starttask3")  
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 14 )  then      
		 Describe(DescLink_HeiSha.."������ȥ�����ɳ��������ϰһ�¹��������ɡ��Ժ��������ҡ�<enter>",1,"�����Ի�/no")
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 15 )  then  --ɳ���Ѵ���꣬Ҫ���Ž���
		Describe(DescLink_HeiSha.."��Ŷ��ɳ��Ҳ���������𡣺ܺã����ڽ�������һ����ڤ���λ������������顣�õ������������ҶԻ����һ��л�����",2,"��ȡ����/heisha_giveprize2","�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 16 )  then  --�Ѿ���������λ��ļ�����
		Describe(DescLink_HeiSha.."��<color=yellow>���ڽ������һ�㶫����ͬ����书���������������������ģ��������ļ���ȫ��Ҫͨ��ʹ����Ӧ�ļ�������������������Ҫע��һ�㣬������Ӽ������书���ܣ���ô��Ҫͨ��ʹ�ü����������ȼ����������ȡ�����������������ǣ���ֻ��ѧϰ����Ҫ�����ļ��ܵ�ǰ�ȼ���1���ļ����顣���磻���м���Ϊ6������ֻ��ѧϰ7���ĸü�����Ѹü���������7��������Խ��ѧϰ��<color><enter>"
		.."�������������Ѿ�ûʲô�ɽ̸�����ˡ��ౣ�أ�ȥ�������������ưɡ�",1,"�����Ի�/heisha_finishtask")
	else
		Describe(DescLink_HeiSha.."���������裬�����˷������ڴ�Į���꣬���ӾͰᵽ������С��������ó���������ˡ���˵���ƶ������յĽ��������һ�ƴ�����ɽ�£���ʱ�޵��Ǹ������ġ��������˵��û����������ʲô�����ֿ�ջ��ͷĿ���ȣ��⺢��Ҳ��������������������Ҳ���һ��������뵱�꿸��������ʱ��Ц�ø�ֻС���Ƶģ������ٿ����µ�ѹ�尳��򿩡�<enter>",1,"�����Ի�/no")
	end
   
end

function heisha_starttask()
	Describe(DescLink_HeiSha.."���ã���ү���Ҿ���ϲ��ˬ���ˡ����������ƬУ�䳡���ж�ʮ��������ʿ�������У�����֮��<color=red>��һ����<color>�����ϴ����Ϸ�����λ��ؼ�������Ǹ���<color=red>�ҳ���<color>���õ��ؼ������ң��Ҿͽ̸����ǿ�֮��ڤ���λ����㿴�����ɵľ������Ի���̽����ʵ�������ҵ��ġ�",1,"�����Ի�/heisha_starttask2")
end

function heisha_starttask2()
	local Uworld1235 = random(10,20)
	nt_setTask(1235,Uworld1235)
	nt_setTask(1230,10)
	Msg2Player("��ү�������У�䳡�ҳ�Я�����ؼ���ͽ������")
end

function heisha_starttask3()
	Msg2Player("��ү��������У�䳡���ɳ������������һ�������ǽ����˲��ˡ�")
	nt_setTask(1230,14)  --��2�׶δ�ɳ��
end

function heisha_giveprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddSkill(partnerindex,2,621,2)                          --����ͬ�鸽�Ӽ��ܡ���ڤ���λ���
		Msg2Player("��ϲ������ͬ�鼼�ܡ���ڤ���λ���")
		nt_setTask(1230,13)   
		Msg2Player("��������ڤ���λ�������������ү�ӶԻ��ˡ�")
	end
end

function heisha_giveprize2()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		AddItem(6,1,884,3,0,0)												--����ͬ�鸽�Ӽ��ܡ���ڤ���λ���
		Msg2Player("��ϲ������ͬ�鼼�ܡ���ڤ���λ����ĵ�3��������")
		PARTNER_AddExp(partnerindex,2600,1)                   			--����ǰͬ�����Ӿ��飬+2600
		nt_setTask(1230,16)     
		Msg2Player("��������ڤ���λ���3�������顣����������ү�ӶԻ��ˡ�")
	end
end

function heisha_finishtask()
	nt_setTask(1230,20)
	Msg2Player("���Ѿ�����ں�ɷ����ѧϰ������ȥ��ɷ����Ӱ������ˮ�򸾺�¬���������ơ�")
end

-----------------------------------------------------------��ɷ����-----------------------------------------------------

function pe_heishadizi()
	local Uworld1226 = nt_getTask(1226)
	local Uworld1230 = nt_getTask(1230)
	if ( Uworld1226 == 10 ) and ( Uworld1230 == 11 ) then
		Describe(DescLink_HeiShaDizi.."���õģ�����һ��СС����˼��",1,"���Ž���/heishadizi_giveprize")
	elseif ( Uworld1226 == 10 ) and ( Uworld1230 == 10 ) then
		Describe(DescLink_HeiShaDizi.."��Ŷ����ʦ�����������ؼ����������������ǿ������ң�Ҫ����������������û�����һ���������Ȼ�������ֲ������׸����㣬�����һ������������أ�����Ҫ�ش��������<color=red>һ��<color>��Ŀ���Ҿ͸������ҵ���<color=red>��û�������ؼ���<color>",2,
		"��������ô��ô�����ð����ðɿ�ʼ�ʰ�/heishadizi_problem",
		"������㣬�Ҳ���Ҫ֪�����ǲ���/no"	)
	else
		Describe(DescLink_HeiShaDizi.."�����ѣ����߿�һЩ�������ڴ���ϰ�ϳ������������������㡣",1,"�����Ի�/no")
	end
end

function heishadizi_problem()
	partner_edu(1,76,91,1,0,0,1,6) 
end

function heishadizi_geiyujiangli()
	nt_setTask(1230,11)
	Msg2Player("���������κ�һ����ɷ���ӶԻ��������õ�һ��С������")
end

function heishadizi_giveprize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,1500,1)                   			--����ǰͬ�����Ӿ��飬+1000
		nt_setTask(1230,10)
	end
end

function heishadizi_chenggong()
	nt_setTask(1230,12)
	Msg2Player("����Ի�ȥ�Һ�ɷѧϰ��ڤ���λ��ˡ�")
end

---------------------------------------------------------У�䳡ɳ���Ի�--------------------------------------------------

function pe_wuchangshadai()
	local Uworld1230 = nt_getTask(1230)
	local Uworld1247 = nt_getTask(1247)
	if ( Uworld1230 == 14 ) then
		nt_setTask(1247,Uworld1247+1)
	end
	
	if ( Uworld1247 + 1 >= 30 ) and ( nt_getTask(1230) == 14 ) then
		Msg2Player("���Ѿ��ɹ��������˼��ܹ�����ʽ�����Ի�ȥ�Һ�ɷ��ȡ�����ˡ�")
		nt_setTask(1230,15)
	end
end


----------------------------------------------------------����ˮ�Ի�-----------------------------------------------------

function pe_qiuyishui()
	local Uworld1226 = nt_getTask(1226)                        --ͬ��������񳤸������������
	local Uworld1227 = nt_getTask(1227)                        --ͬ���������¬���������
	local Uworld1228 = nt_getTask(1228)                        --ͬ�����������Ӱ�������
	local Uworld1229 = nt_getTask(1229)                        --ͬ����������ɷ�������
	local Uworld1230 = nt_getTask(1230)                        --ͬ����������ɷ�������
	local Uworld1231 = nt_getTask(1231)                        --ͬ�������������ˮ�������
	
	if ( Uworld1226 == 10  and  Uworld1227 == 20  and  Uworld1228 == 20  and  Uworld1229 == 20  and  Uworld1230 == 20  and  Uworld1231 == 20) then
		Describe(DescLink_QiuYiShui.."�����Ǽ����˵Ľ����������ˡ������ڿ���ȥ�ҽ���ͽ���ˡ�",1,"�����Ի�/no")
	elseif ( partner_getpartnerlevel(9) ~= 10  ) then
		return
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 0 ) then  	   --����ˮ������û�д�������������û�а��������������
		Describe(DescLink_QiuYiShui.."������ɽ�������ӣ�������Ǻ�ɷ�Ǹ���С���������һ���ӵܺ���ɱ�����¶����ǵý�����ʲô��������<enter>"
		.."������ѧϰ���𣿼�Ȼ���ˣ��Ҿͽ��Լ��ı��¶����ڸ����˰ɡ���Ҫ����ͬ��<color=red>��������<color>��صġ�<enter>"
		.."ͬ�������������ͨ���ڸ������еĳ������˴�<color=red>�������<color>��á���������Ϊ����Ϸ���������ͼ��ѡ��ɱ����ֻ���ÿ������һ���������񣬵���ɺ�������һ����ÿ���������<color=red>���<color>��������û�е������ơ������ʹ������ͬһ�ص��ֵľ��ᣬҲ����ʹ�������ͬ�ص�ɱ�ֵľ��ᡣ<color=red>����Ҫ����ע��ĵط��ǣ�ÿ��ӵ���������ڵ�����ɵ��콻�����򱻿���ʧ��<color>���������͸��㽲��ô�࣬������ȥ����̨��һ�������˵����ˣ�˵��������ȥ�ġ��������������ȥ����̨��ľ׮��<color=red>���<color>������������ᣬ�Լ���һ�����������<color><enter>"
		.."<color=green>��������ͬ�鼼��'�貨΢��'<color>",2,
		"�õģ���֪����/qiuyishui_starttask1",
		"�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 18 ) then --���������
		Describe(DescLink_QiuYiShui.."�����ˣ������������Ѿ�ѧ��������Ķ���������������ʲô������ûȥ���ɡ���������ɷ���Ӱ��������ת�����������úô��ź��ӣ�������ֻͼ�Լ��ɲ���ҩ������ǹ�ġ�ū������л���ˣ�",2,"��ȡ����/qiuyishui_prize","�Ժ�����/no")
		
	elseif ( Uworld1226 == 10 ) and ( Uworld1231 == 10 ) then  --�սӵ�����ˮ������
		Describe(DescLink_QiuYiShui.."������˵������ȥ����̨��ľ׮������̨���ڵ�ͼ�����·���",1,"�����Ի�/no")	
	else
		Describe(DescLink_QiuYiShui.."�����������Ϊ�η��Ŵ����ŵĴ�ʦ�㲻�����͸�ɵ������ɽ��˹���˼�ʮ�ꡣ�Ǻǣ���Ӱ��ɵ�����и���Ŷ���������µ�Ů�����Ҳ����ǰ���ɣ��ɻع�ͷ���룬���һ�㶼����ڡ������Ϸ�ѩ����Щ���ҹ·���и������������ߣ��ο��һ�һֱϲ����������������ɵ��Ҳ���ҵĸ����ɡ���˵���ڽ��������ɼ������������������������㹻����ˡ�",1,"�����Ի�/no")
	end
end

function qiuyishui_starttask1()
	nt_setTask(1231,10)
	Msg2Player("����ˮ����ȥ����̨��һ�������˵����ˡ�")  
end

function qiuyishui_prize()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddSkill(partnerindex,2,629,1)                          --����ͬ�鸽�Ӽ��ܡ��貨΢����
		Msg2Player("��ϲ������ͬ�鼼�ܡ��貨΢����")
		nt_setTask(1231,20)
	end
end

--------------------------------------------------------���˶Ի�--------------------------------------------

function pe_longba()
	if ( nt_getTask(1231) == 10  ) and ( nt_getTask(1226) == 10 ) then
		Describe(DescLink_LongBa.."�����������������𣬺ðɡ�����������Щ���������Ҹ�����ϸ����һ�£�<enter>"
		.."<color=yellow>����Թ���ͬ�ط��Ĳ�ͬɱ������Ҳ���Թ���ͬһ�ط���ɱ��������������޹�����ᣬ��ÿ�����ֻ�����������5������������ľ��齱�����ۼӵģ�Ҳ���ǽ�������������Խ�࣬�õ��Ľ���Ҳ��Խ�ࡣ��󣬵������������Ҫ�ǵõ��콻��������Ȼ�ᱻ��������ʧ�ܡ�<color>������ô���ˣ���������ȡһ����������ȥ�����ɡ�<color=red>��ס��������Լ�����ȥ�����ͬ���ڽ��������У�����û����ȫ���ɹ��򣬻���ľ׮����Ч�ġ�<color>",3,
		"�ǵģ���Ҫ��ô�ľ׮�ľ�������/longba_starttask1",
		"�ҵľ��ᶪ�ˣ���������ȡһ��/longba_starttask1",
		"�һ����Ժ�������/no")
	elseif ( nt_getTask(1231) == 15 ) then
		Describe(DescLink_LongBa.."�����ˣ���ȷʵ�Ѿ������˾���������ȡ��Ľ����ɡ������ҶԻ���",2,"��ȡ����/longba_getprize1","�Ժ�����/no")
	elseif ( nt_getTask(1231) == 16 ) then
		Describe(DescLink_LongBa.."���콫��������˹�ˣ��������ش����������⣬�Ϳ��Ի�ȥ����ø����ˡ�",1,"�����Ի�/longba_starttask2")
	elseif ( nt_getTask(1231) == 17 ) then
		Describe(DescLink_LongBa.."�����������Ѿ������������ĶԻ������꽱���ͻ�ȥ����ðɡ�",1,"�����Ի�/longba_getprize2")
	elseif ( nt_getTask(1231) == 18 ) then
		Describe(DescLink_LongBa.."��������������Ѿ�����ˣ����ȥ����ðɡ�",1,"�����Ի�/no")
	else
		Describe(DescLink_LongBa.."�����壿�����������ǰ��һ���ֵܡ���ʱ�������ֵܾ�����־�ڽ����ϴ���һ����ҵ��˭���뵽��������������һ�������أ�",1,"�����Ի�/no")
	end
end

function longba_starttask1()
	AddItem(6,1,829,0,0,0)
	Msg2Player("������һ����ľ׮�ľ��ᡣ�뼰ʱ�򿪲��������")	
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,4000,1)                   			--����ǰͬ�����Ӿ��飬+4000
		nt_setTask(1231,16)
	end
end

function longba_starttask2()
	if ( partner_edu(5,67,91,5,0) == 10 ) then
		nt_setTask(1231,17)
	end
end

function longba_getprize1()
	if ( partner_checkdo() == 10 ) then
		local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		PARTNER_AddExp(partnerindex,4500,1)                   			--����ǰͬ�����Ӿ��飬+4500
		nt_setTask(1231,18)
		Say("���Ѿ�����������������ȥ����������ɡ�",0)
	end
end
--------------------------------------------------------��������-------------------------------------------

function pe_juanzhouqidong()
	if ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243)  == 0 ) then
		nt_setTask(1243,10) --���ᱻ����
		Msg2Player("���Ѿ������˴�ľ׮30�εľ�������")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 10 and  nt_getTask(1243) < 40 ) then
		Msg2Player("���Ѿ�������ľ׮�����ˣ���������͡�")
	elseif ( nt_getTask(1231) == 15 )then
		Msg2Player("���Ѿ�����˴�ľ׮������ȥ�����˶Ի���")
	else
		Msg2Player("�Բ���������������ĵ��ߣ�������û���κ����á�")
	end
end	

------------------------------------------------------����̨����ľ׮---------------------------------------

function pe_liangongmuzhuang()
	local Uworld1243 = nt_getTask(1243)
	if   ( nt_getTask(1231) == 15 ) then
		Msg2Player("���Ѿ�����˴�ľ׮������ȥ�����˶Ի���")
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( Uworld1243 >= 10 and  Uworld1243 < 40 ) then
		nt_setTask(1243,Uworld1243+1)
	elseif ( nt_getTask(1231) == 10 ) and ( nt_getTask(1226) == 10 ) and ( nt_getTask(1243) >= 40 ) then
		nt_setTask(1231,15)
		Msg2Player("���Ѿ�����˴�ľ׮������ȥ�����˶Ի���")
	else
		if ( GetSex() == 0 ) then
			Msg2Player("˧�磬������ԩ�޳����ϴ��Ҹ���")
		else
			Msg2Player("��Ů��������ԩ�޳����ϴ��Ҹ���")
		end
	end
end


------------------------------------------------------ţ�������ʴ���---------------------------------------
function niumanman_num1()
	niumanman_bisaijieguo(1)
end
function niumanman_num2()
	niumanman_bisaijieguo(2)
end
function niumanman_num3()
	niumanman_bisaijieguo(3)
end
function niumanman_num4()
	niumanman_bisaijieguo(4)
end
function niumanman_num5()
	niumanman_bisaijieguo(5)
end
function niumanman_num6()
	niumanman_bisaijieguo(6)
end
function niumanman_num7()
	niumanman_bisaijieguo(7)
end
function niumanman_num8()
	niumanman_bisaijieguo(8)
end
function niumanman_num9()
	niumanman_bisaijieguo(9)
end
function niumanman_num10()
	niumanman_bisaijieguo(10)
end
function niumanman_num11()
	niumanman_bisaijieguo(11)
end
function niumanman_num12()
	niumanman_bisaijieguo(12)
end

function partner_getpartnerlevel(partnerlevel)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( NpcCount == 0 ) then
		Msg2Player("�㵱ǰû��ͬ�飬���ܼ������������ˡ�������ȡͬ�顣")
		return
	elseif ( PARTNER_GetLevel(partnerindex) < partnerlevel ) then
		Msg2Player("���ͬ�鲻��"..partnerlevel.."�����������������������")
		return
	elseif ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("���ͬ�鲢�������������ͬ�����������Ǹ�ͬ�飬�뽫��ȷͬ���ٻ�������")  
		return
	elseif ( partnerstate == 0 ) then
		Msg2Player("�㵱ǰû���ٻ���ͬ���������ܼ������������ˡ������ٻ��������������ͬ�顣") 
		return
	else
		return 10
	end
end

function partner_checkdo()
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( PARTNER_GetTaskValue(partnerindex, 1) ~= 1 ) then
		Msg2Player("���ͬ�鲢�������������ͬ�����������Ǹ�ͬ�飬�뽫��ȷͬ���ٻ�������")  
		for i=1,NpcCount do 
			if ( PARTNER_GetTaskValue(i, 1) == 1 ) then
				Msg2Player("��������ͬ�����������ǵ�"..i.."��ͬ�顣")
			end
		end
	elseif ( NpcCount == 0 ) then
		Msg2Player("�㵱ǰû��ͬ�飬��ȡ���˽���Ŷ��")
	elseif ( partnerstate == 0 ) then
		Msg2Player("�㵱ǰû���ٻ���ͬ��������ȡ���˽���Ŷ��") 
	else
		return 10
	end
end

function no()
end