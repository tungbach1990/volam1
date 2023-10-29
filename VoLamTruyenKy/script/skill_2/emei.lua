--迭代函数，用于计算技能熟练度
--具体方法：
--根据1级熟练度，升级加速度，级数，重复伤害次数，范围，计算出相应等级熟练度
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--峨嵋
	piaoyun_chuanxue={ --飘云穿雪
		physicsdamage_v={
			[1]={{1,10},{20,120}},
			[3]={{1,10},{20,120}},
		},
		seriesdamage_p={{{1,1},{20,10}}},
		colddamage_v={
			[1]={{1,15},{20,275}},
			[3]={{1,25},{20,415}}
		},
		addskilldamage2={
			[1]={{1,380},{2,380}},
			[3]={{1,1},{20,75}}
		},
		addskilldamage1={
			[1]={{1,91},{2,91}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,10},{20,10}}}
	},
	emei_jianfa={ --峨嵋剑法
		addphysicsdamage_p={{{1,15},{20,215}},{{1,-1},{2,-1}},{{1,0},{2,0}}},
		deadlystrikeenhance_p={{{1,6},{20,36}},{{1,-1},{2,-1}}}
	},
	emei_zhangfa={ --峨嵋掌法
		addcoldmagic_v={{{1,15},{20,515}},{{1,-1},{2,-1}}}
	},
	sixiang_tonggui={ --四相同归
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,35},{20,315}},
			[3]={{1,45},{20,450}}
		},
		addskilldamage1={
			[1]={{1,331},{2,331}},
			[3]={{1,1},{20,76}}
		},
		skill_attackradius={{{1,384},{20,416}}},
		skill_cost_v={{{1,25},{20,35}}}
	},
	yiye_zhiqiu={ --一叶知秋
		seriesdamage_p={{{1,1},{20,10}}},
		physicsenhance_p={{{1,30},{20,75}}},
		colddamage_v={
			[1]={{1,10},{20,80}},
			[3]={{1,10},{20,80}}
		},
		deadlystrike_p={{{1,10},{20,20}}},
		addskilldamage1={
			[1]={{1,328},{2,328}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,88},{2,88}},
			[3]={{1,1},{20,35}}
		},
		missle_speed_v={{{1,20},{20,24}}},
		skill_attackradius={{{1,320},{20,384}}},
		skill_cost_v={{{1,25},{20,25}}}
	},
	liushui={--流水
		fastwalkrun_p={{{1,9},{20,66}},{{1,18},{2,18}}}
	},
	bumie_bujue={ --不灭不觉
		physicsenhance_p={{{1,80},{20,385}}},
		seriesdamage_p={{{1,10},{20,50}}},
		colddamage_v={
			[1]={{1,10},{20,282}},
			[3]={{1,10},{20,282}}
		},
		deadlystrike_p={{{1,15},{20,54}}},
		addskilldamage1={
			[1]={{1,328},{2,328}},
			[3]={{1,1},{20,70}}
		},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,30},{20,35}}}
	},
	mengdie={ --梦蝶
		lifereplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,10}},{{1,18},{2,18}}},
	},
	foguang_puzhao={ --佛光普照
		colddamage_v={
			[1]={{1,70},{20,787}},
			[3]={{1,80},{20,1287}}
		},
		seriesdamage_p={{{1,10},{20,50}}},
		addskilldamage2={
			[1]={{1,380},{2,380}},
			[3]={{1,1},{20,80}}
		},
		skill_cost_v={{{1,30},{20,60}}}
	},
	cihang_pudu={ --慈航普渡
		lifereplenish_v={{{1,275},{20,750}},{{1,36},{2,36}}},
		skill_cost_v={{{1,100},{20,100}}}
	},
	fofa_wubian={ --佛法无边
		addcoldmagic_v={{{1,30},{30,315}},{{1,-1},{2,-1}}},
		addcolddamage_v={{{1,70},{30,315}},{{1,-1},{2,-1}}},
		attackspeed_v={{{1,12},{30,65}},{{1,-1},{2,-1}}},
		castspeed_v={{{1,12},{30,65}},{{1,-1},{2,-1}}},
		coldenhance_p={{{1,8},{30,37}},{{1,-1},{2,-1}}}
	},
	foxin_ciyou={ --佛心慈佑
		lifemax_p={{{1,30},{20,125}},{{1,18*8},{2,18*8}}},
	},
	tuichuang_wangyue={ --推窗望月
		physicsenhance_p={{{1,40},{20,175}}},
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,10},{20,120}},
			[3]={{1,10},{20,120}}
		},
		deadlystrike_p={{{1,10},{20,30}}},
		addskilldamage1={
			[1]={{1,329},{2,329}},
			[3]={{1,1},{20,49}}
		},
		missle_speed_v={{{1,24},{20,28}}},
		skill_attackradius={{{1,384},{20,448}}},
		skill_cost_v={{{1,20},{20,20}}}
	},
	qingyin_fanchang={ --清音梵唱
		fasthitrecover_v={{{1,1},{20,20}},{{1,18},{2,18}}},
		fatallystrikeres_p={{{1,1},{20,20}},{{1,18},{2,18}}},
		freezetimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}},
		poisontimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}},
		stuntimereduce_p={{{1,1},{20,30}},{{1,18},{2,18}}}
	},
	pudu_zhongsheng={ --普渡众生
		lifereplenish_v={{{1,1},{20,15}},{{1,18},{2,18}}},
		manareplenish_v={{{1,1},{20,10}},{{1,18},{2,18}}},
		allres_p={{{1,1},{20,40}},{{1,18},{2,18}}},
	},
	sane_jixue={ --三峨霁雪
		physicsenhance_p={{{1,10},{15,100},{20,237}}},
		seriesdamage_p={{{1,20},{15,20},{20,60}}},
		colddamage_v={
			[1]={{1,10},{20,111}},
			[3]={{1,10},{20,111}}
		},
		deadlystrike_p={{{1,10},{20,54}}},
		missle_speed_v={{{1,28},{20,32}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,35},{20,35}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,329},{20,329}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(5000,1.25,1,3,1)},
							{2,SkillExpFunc(5000,1.15,2,3,1)},
							{3,SkillExpFunc(5000,1.16,3,3,1)},
							{4,SkillExpFunc(5000,1.17,4,3,1)},
							{5,SkillExpFunc(5000,1.18,5,3,1)},
							{6,SkillExpFunc(5000,1.19,6,3,1)},
							{7,SkillExpFunc(5000,1.20,7,3,1)},
							{8,SkillExpFunc(5000,1.21,8,3,1)},
							{9,SkillExpFunc(5000,1.22,9,3,1)},
							{10,SkillExpFunc(5000,1.23,10,3,1)},
							{11,SkillExpFunc(5000,1.24,11,3,1)},
							{12,SkillExpFunc(5000,1.23,12,3,1)},
							{13,SkillExpFunc(5000,1.22,13,3,1)},
							{14,SkillExpFunc(5000,1.21,14,3,1)},
							{15,SkillExpFunc(5000,1.20,15,3,1)},
							{16,SkillExpFunc(5000,1.19,16,3,1)},
							{17,SkillExpFunc(5000,1.18,17,3,1)},
							{18,SkillExpFunc(5000,1.17,18,3,1)},
							{19,SkillExpFunc(5000,1.16,19,3,1)},
							{20,SkillExpFunc(5000,1.15,20,3,1)},
							}},
	},
	yuquan_xichen={ --玉泉洗尘
		physicsenhance_p={{{1,30},{20,148}}},
		seriesdamage_p={{{1,20},{20,60}}},
		deadlystrike_p={{{1,10},{20,20}}},
	},
	qianfo_qianye={ --千佛千叶
		colddamage_v={
			[1]={{1,45},{20,100}},
			[3]={{1,45},{20,100}}
		},
		seriesdamage_p={{{1,20},{20,60}}},
		skill_attackradius={{{1,448},{20,512}}},
		skill_cost_v={{{1,30},{20,65}}},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,380},{20,380}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,10}},{{1,0},{2,0}}},
		skill_skillexp_v={{{1,20000},{20,100000000,Conic}}},
	},
	fengshuang_suiying={ --风霜碎影
		seriesdamage_p={{{1,20},{15,20},{20,60}}},
		colddamage_v={
			[1]={{1,20},{15,350},{20,770}},
			[3]={{1,30},{15,400},{20,1000}}
		},
		skill_eventskilllevel={{{1,1},{20,20}}},
		skill_cost_v={{{1,30},{20,65}}},
		skill_startevent={
			[1]={{1,0},{10,0},{10,1},{20,1}},
			[3]={{1,331},{20,331}}
		},
		skill_showevent={{{1,0},{10,0},{10,1},{20,1}}},
		addskillexp1={{{1,0},{2,0}},{{1,1},{20,1}},{{1,0},{2,0}}},
		skill_skillexp_v={{	{1,SkillExpFunc(6260,1.25,1,3,1)},
							{2,SkillExpFunc(6260,1.15,2,3,1)},
							{3,SkillExpFunc(6260,1.16,3,3,1)},
							{4,SkillExpFunc(6260,1.17,4,3,1)},
							{5,SkillExpFunc(6260,1.18,5,3,1)},
							{6,SkillExpFunc(6260,1.19,6,3,1)},
							{7,SkillExpFunc(6260,1.20,7,3,1)},
							{8,SkillExpFunc(6260,1.21,8,3,1)},
							{9,SkillExpFunc(6260,1.22,9,3,1)},
							{10,SkillExpFunc(6260,1.23,10,3,1)},
							{11,SkillExpFunc(6260,1.24,11,3,1)},
							{12,SkillExpFunc(6260,1.23,12,3,1)},
							{13,SkillExpFunc(6260,1.22,13,3,1)},
							{14,SkillExpFunc(6260,1.21,14,3,1)},
							{15,SkillExpFunc(6260,1.20,15,3,1)},
							{16,SkillExpFunc(6260,1.19,16,3,1)},
							{17,SkillExpFunc(6260,1.18,17,3,1)},
							{18,SkillExpFunc(6260,1.17,18,3,1)},
							{19,SkillExpFunc(6260,1.16,19,3,1)},
							{20,SkillExpFunc(6260,1.15,20,3,1)},
							}},
	},
	jinding_foguang={ --金顶佛光
		colddamage_v={
			[1]={{1,10},{20,420}},
			[3]={{1,10},{20,420}},
		},
		seriesdamage_p={{{1,20},{20,60}}},
		missle_speed_v={{{1,24},{20,28}}},
		skill_misslenum_v={{{1,1},{10,1},{20,3}}},
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--根据2个点，求线形函数f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--当x2=x1, 有x=c,该直线是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--根据2个点，求2次形函数f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--当x1或者x2 < 0 ,y =0
--当x2=x1, 有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--根据2个点，求-2次形函数f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--当x2或者x1<0, y=0,
--当x1=x2,有x=c,是一条垂直于x轴的直线
--这是可以取得y=任意值
--因此，如果已知两点(x1,y1),(x2,y2)可求得过此2点的
--函数为：extrac
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
--描绘连接线:Link(x,points)
--根据points提供的一系列点，用相邻的两个点描绘曲线
--return y值
--x 输入值
--points 点集合
--形如：points是形如{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}的映射
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
--技能设定格式如下：
--SKILLS={
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	技能名称=	{
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		魔法属性=	{
--			[1]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[2]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，
--			[3]={{级别,数值，曲线}，{级别，数值，曲线}，。。。。}，	
--		}，
--		。。。。。
--	}，
--	。。。。。
--}
--如：
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--魔法属性physicsenhance_p参数1，1级时为35，20级时为335，曲线不填，默认线形
--			[2]={{1,0},{20,0}},
--		},--没有[3]，表示魔法属性physicsenhance_p参数2，默认为任何时候都是0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--以上描述技能“三环套月”的魔法属性和数值
-----------------------------------------------------------
--函数GetSkillLevelData(levelname, data, level)
--levelname：魔法属性名称
--data：技能名称
--level：技能等级
--return：当技能名称为data，技能等级为level
--			时的魔法属性levelname所需求的三个参数的具体值
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

