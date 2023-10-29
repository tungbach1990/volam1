--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--����
	hufeng_fa={ --���編
		physicsenhance_p={{{1,5},{20,75}}},
		seriesdamage_p={{{1,1},{20,10}}},
		lightingdamage_v={
			[1]={{1,15},{20,180}},
			[3]={{1,15},{20,180}}
		},
		addskilldamage1={
			[1]={{1,372},{2,372}},
			[3]={{1,1},{20,100}}
		},
		addskilldamage2={
			[1]={{1,176},{2,176}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,15},{20,15}}}
	},
	kunlun_daofa={ --���ص���
		addphysicsdamage_p={{{1,35},{20,215}},{{1,-1},{2,-1}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,6},{20,50,Conic}},{{1,-1},{2,-1}}}
	},
	kunlun_jianfa={ --���ؽ���
		addlightingmagic_v={{{1,19},{20,215}},{{1,-1},{2,-1}}}
	},
	qingfeng_fu={ --����
		fastwalkrun_p={{{1,22},{20,60}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,40},{20,40}}}
	},
	jiban_fu={ --��
		fastwalkrun_p={{{1,-22},{20,-52}},{{1,18*20},{20,18*90}}},
		skill_cost_v={{{1,60},{20,60}}}
	},
	baichuan_nahai={ --�ٴ��ɺ�
		coldres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		physicsres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,12},{20,50}}}
	},
	yiqi_sanqing={ --һ������
		addphysicsdamage_p={{{1,35},{20,215}},{{1,18*120},{20,18*120}},{{1,1},{2,1}}},
		deadlystrikeenhance_p={{{1,16},{20,35,Conic}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,80},{20,80}}}
	},
	kuanglei_zhendi={ --�������
		lightingdamage_v={
			[1]={{1,27},{20,315}},
			[3]={{1,27},{20,315}}
		},
		seriesdamage_p={{{1,1},{20,10}}},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,182},{2,182}},
			[3]={{1,1},{20,35}}
		},
		skill_attackradius={{{1,320},{20,352}}},
		skill_cost_v={{{1,15},{20,15}}}
	},
	tianqing_dizhuo={ --�������
		lightingres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		fireres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		coldres_p={{{1,13},{20,32}},{{1,18*120},{20,18*120}}},
		physicsres_p={{{1,9},{20,28}},{{1,18*120},{20,18*120}}},
		skill_cost_v={{{1,12},{20,90}}}
	},
	qixin_fu={ --���ķ�
		stun_p={{{1,16},{20,35}},{{1,1},{20,36}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	tianji_xunlei={ --���Ѹ��
		lightingdamage_v={
			[1]={{1,25},{20,550}},
			[3]={{1,25},{20,550}}
		},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,65}}
		},
		seriesdamage_p={{{1,1},{20,30}}},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,15},{20,35}}}
	},
	kuangfeng_zhoudian={ --������
		seriesdamage_p={{{1,10},{20,50}}},
		physicsenhance_p={{{1,55},{20,386}}},
		lightingdamage_v={
			[1]={{1,45},{20,532}},
			[3]={{1,45},{20,532}}
		},
		stun_p={{{1,5},{20,15}},{{1,1},{20,20}}},
		addskilldamage1={
			[1]={{1,373},{2,373}},
			[3]={{1,1},{20,126}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	wulei_zhengfa={ --��������
		seriesdamage_p={{{1,10},{20,50}}},
		lightingdamage_v={
			[1]={{1,25},{20,937}},
			[3]={{1,25},{20,937}}
		},
		addskilldamage1={
			[1]={{1,375},{2,375}},
			[3]={{1,1},{20,70}}
		},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,50},{20,90}}}
	},
	shuangao_kunlun={ --˪������
		deadlystrikeenhance_p={{{1,6},{30,15,Conic}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,25},{30,65}},{{1,-1},{30,-1}}},
		attackspeed_v={{{1,25},{20,65}},{{1,-1},{30,-1}}},
		addlightingmagic_v={{{1,30},{30,315,Conic}},{{1,-1},{2,-1}}},
		addlightingdamage_v={{{1,45},{30,315,Conic}},{{1,-1},{2,-1}}}
	},
	shufu_zhou={ --������
		rangedamagereturn_p={{{1,-5},{20,-35}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	beiming_daohai={ --��ڤ����
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*45},{20,18*120}}},
		manareplenish_v={{{1,-1},{20,-20}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	qihan_aoxue={ --�ۺ���ѩ
		castspeed_v={{{1,-6},{20,-39},{30,-50},{31,-50}},{{1,18*45},{2,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	mizhong_huanying={ --���ٻ�Ӱ
		freezetimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{2,18*120}}},
		stuntimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{2,18*120}}},
		skill_cost_v={{{1,30},{20,40}}}
	},
	zuixian_cuogu={ --���ɴ��
		fastwalkrun_p={{{1,-12},{20,-52}},{{1,18*45},{20,18*120}}},
		freezetimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		stuntimereduce_p={{{1,-5},{20,-50}},{{1,18*45},{20,18*120}}},
		lifereplenish_v={{{1,-1},{20,-15}},{{1,18*45},{20,18*120}}},
		manareplenish_v={{{1,-1},{20,-20}},{{1,18*45},{20,18*120}}},
		rangedamagereturn_p={{{1,-5},{20,-35}},{{1,18*45},{20,18*120}}},
		skill_cost_v={{{1,100},{20,160}}}
	},
	wusuo_kunlun={ --��������
		seriesdamage_p={{{1,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,10},{20,256}},
			[3]={{1,10},{20,256}}
		},
		skill_attackradius={{{1,448},{20,480}}},
		skill_cost_v={{{1,60},{20,85}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,375},{20,375}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,10}},{{1,0},{2,0}}},
		skill_skillexp_v={{{1,20000},{20,84567890,Conic}}},
	},
	leidong_jiutian={ --�׶�����
		seriesdamage_p={{{1,20},{15,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,80},{15,260},{20,470}},
			[3]={{1,80},{15,260},{20,470}}
		},
		skill_cost_v={{{1,40},{15,60},{20,95}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,387},{20,387}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5330,1.15,1,8,1)},
							{2,SkillExpFunc(5330,1.15,2,8,1)},
							{3,SkillExpFunc(5330,1.16,3,8,1)},
							{4,SkillExpFunc(5330,1.17,4,8,1)},
							{5,SkillExpFunc(5330,1.18,5,8,1)},
							{6,SkillExpFunc(5330,1.19,6,8,1)},
							{7,SkillExpFunc(5330,1.20,7,8,1)},
							{8,SkillExpFunc(5330,1.21,8,8,1)},
							{9,SkillExpFunc(5330,1.22,9,8,1)},
							{10,SkillExpFunc(5330,1.23,10,8,1)},
							{11,SkillExpFunc(5330,1.24,11,8,1)},
							{12,SkillExpFunc(5330,1.23,12,8,1)},
							{13,SkillExpFunc(5330,1.22,13,8,1)},
							{14,SkillExpFunc(5330,1.21,14,8,1)},
							{15,SkillExpFunc(5330,1.20,15,8,1)},
							{16,SkillExpFunc(5330,1.19,16,8,1)},
							{17,SkillExpFunc(5330,1.18,17,8,1)},
							{18,SkillExpFunc(5330,1.17,18,8,1)},
							{19,SkillExpFunc(5330,1.16,19,8,1)},
							{20,SkillExpFunc(5330,1.15,20,8,1)},
						}},
	},
	pingdi_hanlei={ --ƽ�غ���
		seriesdamage_p={{{1,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,25},{20,250}},
			[3]={{1,25},{20,250}}
		},
	},
	aoxue_xiaofeng={ --��ѩХ��
		physicsenhance_p={{{1,5},{15,100},{20,280}}},
		seriesdamage_p={{{1,20},{15,20},{20,60}}},
		lightingdamage_v={
			[1]={{1,39},{15,200},{20,673}},
			[3]={{1,39},{15,200},{20,673}}
		},
		stun_p={{{1,5},{20,25}},{{1,1},{20,20}}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,25},{20,45}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
--		skill_startevent={
--			[1]={{1,0},{10,0},{10,1},{20,1}},
--			[3]={{1,386},{20,386}}
--		},
		skill_collideevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,373},{20,373}}
		},
		skill_showevent={{{1,0},{10,0},{10,4},{20,4}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6860,1.15,1,5,1)},
							{2,SkillExpFunc(6860,1.15,2,5,1)},
							{3,SkillExpFunc(6860,1.16,3,5,1)},
							{4,SkillExpFunc(6860,1.17,4,5,1)},
							{5,SkillExpFunc(6860,1.18,5,5,1)},
							{6,SkillExpFunc(6860,1.19,6,5,1)},
							{7,SkillExpFunc(6860,1.20,7,5,1)},
							{8,SkillExpFunc(6860,1.21,8,5,1)},
							{9,SkillExpFunc(6860,1.22,9,5,1)},
							{10,SkillExpFunc(6860,1.23,10,5,1)},
							{11,SkillExpFunc(6860,1.24,11,5,1)},
							{12,SkillExpFunc(6860,1.23,12,5,1)},
							{13,SkillExpFunc(6860,1.22,13,5,1)},
							{14,SkillExpFunc(6860,1.21,14,5,1)},
							{15,SkillExpFunc(6860,1.20,15,5,1)},
							{16,SkillExpFunc(6860,1.19,16,5,1)},
							{17,SkillExpFunc(6860,1.18,17,5,1)},
							{18,SkillExpFunc(6860,1.17,18,5,1)},
							{19,SkillExpFunc(6860,1.16,19,5,1)},
							{20,SkillExpFunc(6860,1.15,20,5,1)},
							}},
	},
	yufeng_shu={ --Ԧ����
		seriesdamage_p={{{1,20},{20,60}}},
		physicsenhance_p={{{1,28},{20,282}}},
	},
	xiaofeng_sanlianji={ --Х��������
		seriesdamage_p={{{1,20},{20,60}}},
		missle_lifetime_v={{{1,6},{20,24}}},
		lightingdamage_v={
			[1]={{1,85},{20,330}},
			[3]={{1,115},{20,550}}
		},
	}
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--����2���㣬�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--�����趨��ʽ���£�
--SKILLS={
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		ħ������=	{
--			[1]={{����,��ֵ������}��{������ֵ������}����������}��
--			[2]={{����,��ֵ������}��{������ֵ������}����������}��
--			[3]={{����,��ֵ������}��{������ֵ������}����������}��	
--		}��
--		����������
--	}��
--	����������
--}
--�磺
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--ħ������physicsenhance_p����1��1��ʱΪ35��20��ʱΪ335�����߲��Ĭ������
--			[2]={{1,0},{20,0}},
--		},--û��[3]����ʾħ������physicsenhance_p����2��Ĭ��Ϊ�κ�ʱ����0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--�����������ܡ��������¡���ħ�����Ժ���ֵ
-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata�����ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{20,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{20,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
