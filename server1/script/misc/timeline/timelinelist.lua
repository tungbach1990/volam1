--ʱ���������ļ�
--strName:ʱ��������(��������)
--tbTimeLineData:ʱ�������
--				nBeginDayLimit/nEndDayLimit:		���뿪ʼ/�����¼������������Ժ󿪷�/�ر�
--				strBeginEventType/strEndEventType:	��ʼ/�����¼�������,Ŀǰ֧��(�����û������)	
--													1.ServerOpenTimeEvent 	�����������¼�																							
--													2.RefTimeEvent			ĳ��ʱ����Ŀ�ʼ���߽����¼�																						
--													3.FixTimeEvent			�̶�����
--				strBeginEventName/strEndEventName:	��ʼ/�����¼�������
--
--����:�������ñ�ʾ,�ڷ���������100��֮��"����ʮ��"���ʱ���ἤ��,��"����ʮ��"���ʱ���ἤ����300��ر�ʱ����
--	[1] =
--	{
--		strName = "����ʮ��",
--
--		tbTimeLineData = 
--		{
--			nBeginDayLimit = 100,
--			nEndDayLimit = 300,
--			strBeginEventType = "ServerOpenTimeEvent",
--			strEndEventType = "RefTimeEvent",
--			strBeginEventName = "����ʮ��",
--			strEndEventName = "�ر�ʮ��",
--		},
--		tbBeginEventData = 
--		{
--		},
--		tbEndEventData = 
--		{
--			strRefTimeLineName = "����ʮ��", --��"����ʮ��"���ʱ����Ŀ�������Ϊ�����¼�
--			bBeginOrEnd = 0,				 --0��ʾ��ʱ���Ὺ������Ϊ����,1��ʾʱ�����������Ϊ����,Ĭ�ϲ���Ļ�Ϊ0
--		},
--	},
--
--	��2010��5��14��֮��5��Ҳ����2010��5��19��"�����׽�+6"ʱ���ἤ��,��"����ʮ��"���ʱ����رպ��20��ر�"�����׽�+6"ʱ����
--	[2] =
--	{
--		strName = "�����׽�+6",

--		tbTimeLineData = 
--		{
--			nBeginDayLimit = 5,
--			nEndDayLimit = 20,
--			strBeginEventType = "FixTimeEvent",
--			strEndEventType = "RefTimeEvent",
--			strBeginEventName = "�����׽�+6",
--			strEndEventName = "�رհ׽�+6",
--		},
--		tbBeginEventData = 
--		{
--			nEventDate = 20100514
--		},
--		tbEndEventData = 
--		{
--			strRefTimeLineName = "����ʮ��",
--			bBeginOrEnd = 1,
--		},
--	},


tbTimeLineList = 
{
	[1] =
	{
		strName = "ItemExchange1",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "FixTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange1",
			strEndEventName = "CloseItemExchange1",
		},
		tbBeginEventData = 
		{
			nEventDate = 20100901,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange1", --��"����ʮ��"���ʱ����Ŀ�������Ϊ�����¼�
			bBeginOrEnd = 0,				 --0��ʾ��ʱ���Ὺ������Ϊ����,1��ʾʱ�����������Ϊ����,Ĭ�ϲ���Ļ�Ϊ0
		},
	},
	[2] =
	{
		strName = "ItemExchange2",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange2",
			strEndEventName = "CloseItemExchange2",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange1",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange2",
			bBeginOrEnd = 0,
		},
	},
	[3] =
	{
		strName = "ItemExchange3",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange3",
			strEndEventName = "CloseItemExchange3",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange2",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange3",
			bBeginOrEnd = 0,
		},
	},
	[4] =
	{
		strName = "ItemExchange4",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			nEndDayLimit = 30,
			strBeginEventType = "RefTimeEvent",
			strEndEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange4",
			strEndEventName = "CloseItemExchange4",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange3",
			bBeginOrEnd = 1,
		},
		tbEndEventData = 
		{
			strRefTimeLineName = "ItemExchange4",
			bBeginOrEnd = 0,
		},
	},
	[5] =
	{
		strName = "ItemExchange5",

		tbTimeLineData = 
		{
			nBeginDayLimit = 0,
			strBeginEventType = "RefTimeEvent",
			strBeginEventName = "OpenItemExchange5",
		},
		tbBeginEventData = 
		{
			strRefTimeLineName = "ItemExchange4",
			bBeginOrEnd = 1,
		},
	},
}
