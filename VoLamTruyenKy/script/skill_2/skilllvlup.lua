SOSkillLevelUp={}
MESSAGES={
	"�����㡺%s���Ļ�����Ϊ̫�ͣ������ˡ�%s����������",
	"�����㡺%s������Ϊ̫�ͣ������ˡ�%s����������",
	"�㡺%s������Ϊ�Ѿ��ﵽ�����ˣ��޷��ٵõ����ߵ�������"
}

--�����ն�������������
function SOSkillLevelUp.Pudu_zhongsheng()
	local perSkills={{93,"�Ⱥ��ն�"},{89,"�ε�"},{86,"��ˮ"},{92,"���Ĵ���"},{282,"������"}}
	local mainSkill = {332,"�ն�����"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�����һ�����������
function SOSkillLevelUp.Luanhuan_ji()
	local perSkills={{347,"�����"},{303,"���̹�"},{343,"���Ĵ�"},{345,"������"},{349,"�׻���"}}
	local mainSkill = {351,"�һ���"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�嶾�Ͻ����������
function SOSkillLevelUp.Duanjin_fugu()
	local perSkills={{67,"�������"},{70,"����ʴ��"},{64,"��������"},{356,"�����Ƽ�"},{72,"���Ķ���"}}
	local mainSkill = {390,"�Ͻ��"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�������������������
function SOSkillLevelUp.Shehun_luanxin()
	local perSkills={{136,"�������"},{137,"��Ӱ�ɺ�"},{140,"�ɺ��޼�"},{364,"�������"},{143,"��ħ���"}}
	local mainSkill = {391,"�������"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--�������ɴ����������
function SOSkillLevelUp.Zuixian_cuogu()
	local perSkills={{392,"������"},{174,"��"},{393,"��ڤ����"},{175,"�ۺ���ѩ"},{90,"���ٻ�Ӱ"}}
	local mainSkill = {394,"���ɴ��"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end
