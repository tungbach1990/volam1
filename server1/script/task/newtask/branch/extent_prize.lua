--Ϊ���Ժ�����һ��ͳһ�Ľӿ�
--�磺����֧���������Ҫ�ӵĽ���������ex_add_all()��
--�磺����֧����������Ҫ�ӵĽ���������ex_add_zhengpai()

if (not __H_EXTENTPRIZE__) then
	__H_EXTENTPRIZE__ = 1;

Include([[\script\event\teachersday06_v\head.lua]]);

--���н׶�������ɶ���
function ex_add_all()
	vt06_addzi();	--Խ�Ͻ�ʦ�ڻ������֧������ӽ���
end;

--���н׶�������ɶ���:����
function ex_add_zhengpai()

end;

--���н׶�������ɶ���:����
function ex_add_zhongli()

end;

--���н׶�������ɶ���:����
function ex_add_xiepai()

end;

--���н׶�������ɶ���:20��
function ex_add_level20()

end;

--���н׶�������ɶ���:30��
function ex_add_level30()

end;

--���н׶�������ɶ���:40��
function ex_add_level40()

end;

--���н׶�������ɶ���:50��
function ex_add_level50()

end;

--���н׶�������ɶ���:60��
function ex_add_level60()

end;

--===========================����ϵ��=====================================
--���н׶�������ɶ���:20��
function ex_add_zp_level20()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level20();
end;

--���н׶�������ɶ���:30��
function ex_add_zp_level30()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level30();
end;

--���н׶�������ɶ���:40��
function ex_add_zp_level40()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level40();
end;

--���н׶�������ɶ���:50��
function ex_add_zp_level50()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level50();
end;

--���н׶�������ɶ���:60��
function ex_add_zp_level60()
	ex_add_all();
	ex_add_zhengpai();
	ex_add_level60();
end;
--===========================����ϵ��=====================================

--===========================����ϵ��=====================================
--���н׶�������ɶ���:20��
function ex_add_zl_level20()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level20();
end;

--���н׶�������ɶ���:30��
function ex_add_zl_level30()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level30();
end;

--���н׶�������ɶ���:40��
function ex_add_zl_level40()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level40();
end;

--���н׶�������ɶ���:50��
function ex_add_zl_level50()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level50();
end;

--���н׶�������ɶ���:60��
function ex_add_zl_level60()
	ex_add_all();
	ex_add_zhongli();
	ex_add_level60();
end;
--===========================����ϵ��=====================================

--===========================а��ϵ��=====================================
--���н׶�������ɶ���:20��
function ex_add_xp_level20()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level20();
end;

--���н׶�������ɶ���:30��
function ex_add_xp_level30()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level30();
end;

--���н׶�������ɶ���:40��
function ex_add_xp_level40()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level40();
end;

--���н׶�������ɶ���:50��
function ex_add_xp_level50()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level50();
end;

--���н׶�������ɶ���:60��
function ex_add_xp_level60()
	ex_add_all();
	ex_add_xiepai();
	ex_add_level60();
end;
--===========================а��ϵ��=====================================

end; --__H_EXTENTPRIZE__