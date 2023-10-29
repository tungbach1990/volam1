-------------------------------------------------------------------------
-- FileName		:	changge_people.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-04 14:17:15
-- Desc			:  	������г���������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\partner\\partner_head.lua") --������ͼ�����
Include("\\script\\task\\partner\\reward\\partner_reward.lua") --�����˽���������Ľű�
Include("\\script\\task\\partner\\reward\\partner_reward2.lua") 
Include("\\script\\task\\partner\\reward\\partner_reward3.lua") 
Include("\\script\\global\\titlefuncs.lua")  --�������ĳƺŵĽű�
Include("\\script\\task\\partner\\train\\partner_changgejindi.lua")

function main()

	Describe(DescLink_ChangGeMen.."������ʮ��紵�ᣬ��Ц��������𡣵������������ɢ�ƣ��������º��ܣ��ҳ������Ǻεȵ�ʢ�¡������������������к�����������Ҳ����һ�շ������²���Ϊ���ε���������񳤸����𣬾���Ҫ��������һ��������",7,
		"��ȡͬ��Ľ�������/Getpartner_education",
		"ͬ����������/Getpartner_allpractice",
		"ͬ����������/Getpartner_especial",
		"ͬ���Ӷ/Getpartner_paymoney",
		"������ҳƺ�/change_title",
		"ǰ�������Ž���/Goto_jindichangge",
		"����ȥ���й����Щ��/Goto_townyunzhong",
		"ûʲô����ֻ��������������/no")
end

function Getpartner_allpractice()
	Describe(DescLink_ChangGeMen.."����Ҫ��ʲô��ͬ��������ص����飿",5,
		"���빺��ͬ�����������/Getpartner_practice",
		"���뽻ͬ����������/Getpartner_goonpractice",
		"������ȡ��ͬ�����������/Getpartner_finishpractice",
		"�����һ���˽���������/Getpartner_knowpractice",
		"ûʲô����ֻ��������������/no")	
end

function Getpartner_goonpractice()
	if ( nt_getTask(1245) >=0 and nt_getTask(1245) <= 3 ) then
		reward_givetask()
	elseif ( nt_getTask(1245) == 4 ) then
		reward_givetask2()
	elseif ( nt_getTask(1245) == 5 ) then
		reward_givetask3()
	end
end

function Getpartner_knowpractice()
	Describe(DescLink_ChangGeMen.."��<color=yellow>ͬ�����������ǳ�����Ϊ�������ֲ���Σ����������һϵ�����񡣵��㹺�������������Ϳ��Դ���ȥ��Ӧ�ط�ɱ�ֵ�����ɱ�־���Ŀǰ��Ϊ<color=red>50ֻ��100ֻ����150ֻ<color>���֡���ʼ��ʱ����ֻ�ܹ���ɱ<color=red>50<color>ֻ�ֵľ��ᣬ����ÿ��������<color=red>5<color>�Ρ�����Ժ��������ͬ�齫��õ�<color=red>���Ļر�<color>��ͬʱ����������������<color=red>����<color>Խ�࣬�����Ž��������<color=red>��������ʿ������������ɷ��<color>�ĳƺš�������Щ�ʸ���������㽫���Թ���ɱ���������ľ��ᣬͬʱÿ�����ɴ���Ҳ�����ࡣ��Ӧ�ģ��õ��Ļر�Ҳ��Խ��Խ��Ŷ��<color>",2,"����һ��/Getpartner_allpractice","�뿪����/no")
end

function Getpartner_education()    --��������ȡͬ��Ľ�������
	Describe(DescLink_ChangGeMen.."���õģ�����������Ļ�����ô���������Ժ��ҽ��ʵ�ͽ�ܶԻ����������ָ���ġ�",2,
		"�õģ����Ѿ�����ˡ�����ȥ������ɡ�/Goto_townyunzhong",
		"����������/no")
end


function Getpartner_paymoney()
	Describe(DescLink_ChangGeMen.."���Բ��𣬴����������ʿ����ѵ���У�Ŀǰû�п��Թ����Ӷ��ͬ�飬���Ժ�������лл��",1,"�����Ի�/no")
end

function Getpartner_especial()
	Describe(DescLink_ChangGeMen.."���ٺ٣���Щ����ͨ���ͬ��ɲ������׾Ϳɻ�á�����Ҫ��������������Щ�����ɡ�",1,"�����Ի�/no")
end

function Goto_townyunzhong()
	local i = random(8);
	local pos = {{1682,3290},{1694,3306},{1669,3320},{1655,3332},{1650,3340}};
	local j = random(5);
	if (random(2) == 1) then
		i = -i;
	end
	NewWorld(512,pos[j][1] + i,pos[j][2])   --ȥ�����򣿣���
	--blackScreen();
end

function blackScreen()
	if(GetGameTime() <= 1800) then
		Say("�ٷ���ʾ�� ���������е���ͼ�Ǻ�������ȥ����<enter><color=yellow>http://jx.kingsoft.com/zt1/2ye/2005/09/08/64217.shtml<color>���ص�������Ƭ�����Դ�������¡������ͬ��ϵͳ���κ�������뷨���뵽<color=yellow>bbs.jx.kingsoft.com<color>����",0);
	end
end

function Getpartner_practice()
	local Name = GetName()
	Describe(DescLink_ChangGeMen.."��"..Name.."���ˣ����빺���������������أ�",4,
	"ɱ��50ֻ/practice_kill50",
	"ɱ��100ֻ/practice_kill100",
	"ɱ��150ֻ/practice_kill150",
	"��Щ����/no")
end


function practice_kill50()
	if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
		Sale(110)
	elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
		Sale(113)
	elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
		Sale(116)
	elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
		Sale(119)
	elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
		Sale(122)
	elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
		Sale(125)
	elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
		Sale(128)
	end
end

function practice_kill100()
	if ( nt_getTask(1245) < 2 ) then
		Describe(DescLink_ChangGeMen.."���Բ�����Ŀǰ�ĳƺŻ�û�дﵽ<color=red>������ʿ<color>�ľ��磬�޷�����ɱ<color=red>100<color>ֻ�ֵľ��ᡣҪ�õ�������ʿ�ĳƺ�������������<color=red>5<color>�������ÿ�����е���������ÿ�����е������������Ϊ<color=red>5<color>�Ρ�",2,"����һ��/Getpartner_practice","�����Ի�/no")
	elseif ( nt_getTask(1245) >= 2 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(111)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(114)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(117)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(120)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(123)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(126)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(129)
		end
	end
end

function practice_kill150()
	if ( nt_getTask(1245) < 3 ) then
		Describe(DescLink_ChangGeMen.."���Բ�����Ŀǰ�ĳƺŻ�û�дﵽ<color=red>������ɷ<color>�ľ��磬�޷�����ɱ<color=red>150<color>ֻ�ֵľ��ᡣҪ�õ�������ɷ�ĳƺ�������������<color=red>20<color>�������ÿ�����е���������ÿ�����е������������Ϊ<color=red>5<color>�Ρ�",2,"����һ��/Getpartner_practice","�����Ի�/no")
	elseif ( nt_getTask(1245) >= 3 ) then
		if ( SubWorldIdx2ID( SubWorld ) == 1 ) then
			Sale(112)
		elseif ( SubWorldIdx2ID( SubWorld ) == 11 ) then
			Sale(115)
		elseif ( SubWorldIdx2ID( SubWorld ) == 37 ) then
			Sale(118)
		elseif ( SubWorldIdx2ID( SubWorld ) == 78 ) then
			Sale(121)
		elseif ( SubWorldIdx2ID( SubWorld ) == 80 ) then
			Sale(124)
		elseif ( SubWorldIdx2ID( SubWorld ) == 162 ) then
			Sale(127)
		elseif ( SubWorldIdx2ID( SubWorld ) == 176 ) then
			Sale(130)
		end
	end
end

function Getpartner_finishpractice()
	local Uworld1237 = nt_getTask(1237)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then
		Msg2Player("��û�д�ͬ�飬��ôȡ��ͬ�����񰡣�")
	end
	
	if ( Uworld1237 ~= 0 ) then
		if ( PARTNER_GetTaskValue(partnerindex, 2) ~= 0  )  then
			RemovePlayerEvent(Uworld1237) --ȡ�����¼�
			nt_setTask(1237,0)
			PARTNER_SetTaskValue(partnerindex,2,0) 
			Msg2Player("���Ѿ�ȡ���˵�ǰ����������")
		elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0  ) then
			local j = 0
			for i=1, NpcCount do
				if (PARTNER_GetTaskValue(i,2) ~= 0 ) then
					Msg2Player("�����������������ǵ�"..i.."��ͬ�顣")
					j = j+1
				end
			end
			if ( j == 0 ) then
				RemovePlayerEvent(Uworld1237) --ȡ�����¼�
				nt_setTask(1237,0)
				nt_setTask(1244,0)
				Msg2Player("���Ѿ�ȡ���˵�ǰ����������")
			end
		end
	else
		Describe(DescLink_ChangGeMen.."����û�п�ʼ����������ôȡ���أ�",1,"�����Ի�/no")
	end
end

function no()
end