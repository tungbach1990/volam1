--	�������ֵ�д������ű�����
if (not _H_SIGNIN_) then
	_H_SIGNIN_ = 1;

--��������
function signin()
	local nNowTime = tonumber(date("%Y%m%d"));
	if (GetTask(TK_CO_DAYKEY) ~= nNowTime) then
		SetTask(TK_CO_DAYKEY, nNowTime);
		SetTask(TK_CO_PLAYTIMES, 0);
	end;
	
	if (signin_add() == 0) then
		return 0;
	end;

	local ww, xx, yy = GetWorldPos();
	SetTask(TK_CO_LEAVERMAPID, ww);
	SetTask(TK_CO_LEAVERPOSX, xx);
	SetTask(TK_CO_LEAVERPOSY, yy);
	local nPosX, nPosY;
	nPosX, nPosY = getadatatow(SZFILE, 2, 15);
	NewWorld(CO_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
end;


function playergetinprepare()	--��ҽ���׼����ʱ�����״̬����
	ForbitSkill(FESTIVAL_OK);
	SetMoveSpeed(FESTIVAL_ENTERSPEED);
	SetTaskTemp(200, 1);		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetFightState(FESTIVAL_NO);	--����ս��״̬
	SetLogoutRV(FESTIVAL_OK);	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetPunish(FESTIVAL_NO);		--�������ͷ�
	SetCreateTeam(FESTIVAL_NO);	--�ر���ӹ���
	ForbitAura(FESTIVAL_OK)		--��ֹ�⻷
	ForbidEnmity(FESTIVAL_OK)	--���ó�ɱ
	SetPKFlag(FESTIVAL_NO)		--��PK���� 
	DisabledStall(FESTIVAL_OK);	--��ֹ����;
	ForbitTrade(FESTIVAL_NO);
	ForbidChangePK(FESTIVAL_OK);
	DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	playergetinprepare_add();
end;

function playerleave()	--����뿪��Ϸʱ�����״̬����
	ForbitSkill(FESTIVAL_NO);
	SetMoveSpeed(FESTIVAL_LEAVERSPEED);
	
	RestoreOwnFeature();    --�������˱��ԭ������
	ForbitAura(FESTIVAL_NO)
	SetTaskTemp(200,0);
	SetFightState(FESTIVAL_NO);
	SetPunish(FESTIVAL_OK);
	SetCreateTeam(FESTIVAL_NO);
	ForbidEnmity( FESTIVAL_NO )
	SetPKFlag(FESTIVAL_NO)
	DisabledStall(FESTIVAL_NO);
	ForbitTrade(FESTIVAL_NO);
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	ForbidChangePK(FESTIVAL_NO);
	DisabledUseTownP(FESTIVAL_NO);	--��ֹʹ�ûس̣�
	playerleave_add();
end;

function playergetingame()	--��ҽ�����Ϸ��ʱ�����״̬����
	ForbitSkill(FESTIVAL_OK);
	SetMoveSpeed(FESTIVAL_ENTERSPEED);
	SetTaskTemp(200, 1);		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetLogoutRV(FESTIVAL_OK);	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetPunish(FESTIVAL_NO);		--�������ͷ�
	SetCreateTeam(FESTIVAL_NO);	--�ر���ӹ���
	ForbitAura(FESTIVAL_OK)		--��ֹ�⻷
	ForbidEnmity(FESTIVAL_OK)	--���ó�ɱ
	DisabledStall(FESTIVAL_OK);	--��ֹ����;
	ForbitTrade(FESTIVAL_NO);
	ForbidChangePK(FESTIVAL_OK);
	DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	SetFightState(FESTIVAL_OK);
	SetPKFlag(FESTIVAL_OK)
	playergetingame_add();
end;

end;	--	end of _H_SIGNIN_