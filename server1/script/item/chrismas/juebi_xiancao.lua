----------------------------------------------------------------
	--FileName:	juebi_xiancao.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	ʥ���ڻ�������������ɲ�
	--			���ܣ�ÿ���ʹ��10�Σ�ÿʹ��һ�α��ܻ��һƬ�ɲ�Ҷ�����ÿɻ��10���Ӿ���˫����
-----------------------------------------------------------------
Uworld0001 = 2002
MAX_USETIME = 10
--��һ�ֽ�Ϊ����ʹ�ô���
--�ڶ��ֽ�Ϊ���ʹ�õ�����
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "Ti�n Th�o Di�p tr�n v�ch �� �� b� b�n h�i s�ch, ��nh ph�i ��i ng�y mai th�i!")
	else
		--AddItem()�ɲ�Ҷ
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B�n nh�n ���c 1 phi�n Ti�n Th�o Di�p")
	end
	return 1
end