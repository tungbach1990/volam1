-------------------------------------------------------------------------
-- FileName		:	enemy_flyboss6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 17:30:14
-- Desc			:   ��֮��ؿ��ı�־boss�ű�[60-79��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_biaozhiboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

------��ʹ�����֮�ﶨ��ɱ�ֱ��--------------
--С��ͼ����x��y���������֣�60-79����,
killfly ={
{184,189,"Ho�n Nhan Xung",1},
{181,183,"Ho�n Nhan V� Lo�i",2},
{197,179,"��i Cao",3},
{197,172,"Ho�n Nhan T� ",4},
{198,163,"��i M�c",5},
{190,160,"Ho�n Nhan Nguy�t",6},
{164,162,"Gia Lu�t M�nh",7},
{164,172,"��i H�c",8},
{178,190,"Ho�n Nhan Ni�n",9},
{178,187,"��i V� ",10},
{169,190,"Gia Lu�t B�nh Tr��ng",11},
{172,193,"Ho�n Nhan H�o",12},
{165,191,"Gia Lu�t L�p Ph�m",13},
{178,178,"Ho�n Nhan An",14},
{186,183,"��i Tr� ",15},
}

-----��ʹ�����֮��boss���������ӹ���ı��----
--...����ʮ��Ϊboss�ı�ţ�60-79����
killflyboss ={
--��֮��60-79��ˢ����
{825,70,387,1367,2619,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",1},
{825,70,387,1360,2624,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",1},
{825,70,387,1359,2616,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",1},
{825,70,387,1368,2567,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",2},
{825,70,387,1367,2578,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",2},
{825,70,387,1366,2562,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",2},
{825,70,387,1375,2670,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",3},
{825,70,387,1379,2677,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",3},
{825,70,387,1375,2673,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",3},
{825,70,387,1406,2599,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",4},
{825,70,387,1413,2602,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",4},
{825,70,387,1410,2612,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",4},
{825,70,387,1397,2631,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",5},
{825,70,387,1390,2642,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",5},
{825,70,387,1392,2619,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",5},
{825,70,387,1414,2634,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",6},
{825,70,387,1418,2646,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",6},
{825,70,387,1420,2639,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",6},
{825,70,387,1435,2661,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",7},
{825,70,387,1438,2670,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",7},
{825,70,387,1431,2670,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",7},
{825,70,387,1399,2682,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",8},
{825,70,387,1407,2682,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",8},
{825,70,387,1400,2691,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",8},
{825,70,387,1397,2739,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",9},
{825,70,387,1388,2728,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",9},
{825,70,387,1397,2724,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",9},
{825,70,387,1432,2715,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",10},
{825,70,387,1428,2719,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",10},
{825,70,387,1440,2721,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",10},
{825,70,387,1480,2612,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",11},
{825,70,387,1488,2622,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",11},
{825,70,387,1486,2615,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",11},
{825,70,387,1506,2645,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",12},
{825,70,387,1504,2652,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",12},
{825,70,387,1511,2641,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",12},
{825,70,387,1460,2654,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",13},
{825,70,387,1455,2653,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",13},
{825,70,387,1463,2663,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",13},
{825,70,387,1521,2663,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",14},
{825,70,387,1514,2679,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",14},
{825,70,387,1527,2680,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",14},
{825,70,387,1532,2742,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",15},
{825,70,387,1541,2735,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",15},
{825,70,387,1541,2744,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",15},
{825,70,387,1491,2771,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",16},
{825,70,387,1491,2781,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",16},
{825,70,387,1485,2780,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",16},
{825,70,387,1466,2751,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",17},
{825,70,387,1464,2740,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",17},
{825,70,387,1470,2742,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",17},
{825,70,387,1578,2786,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",18},
{825,70,387,1588,2801,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",18},
{825,70,387,1578,2806,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",18},
{825,70,387,1559,2707,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",19},
{825,70,387,1564,2709,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",19},
{825,70,387,1558,2721,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",19},
{825,70,387,1589,2564,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",20},
{825,70,387,1581,2557,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",20},
{825,70,387,1581,2568,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",20},
{825,70,387,1491,2570,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",21},
{825,70,387,1495,2564,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",21},
{825,70,387,1496,2583,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",21},
{825,70,387,1414,2561,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",22},
{825,70,387,1424,2554,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",22},
{825,70,387,1423,2568,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",22},
{825,70,387,1322,2704,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",23},
{825,70,387,1326,2697,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",23},
{825,70,387,1335,2718,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",23},
{825,70,387,1426,2782,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",24},
{825,70,387,1418,2773,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",24},
{825,70,387,1416,2785,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",24},
{825,70,387,1451,2823,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",25},
{825,70,387,1459,2836,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",25},
{825,70,387,1446,2825,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",25},
{825,70,387,1494,2860,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",26},
{825,70,387,1488,2865,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",26},
{825,70,387,1492,2874,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",26},
{825,70,387,1395,2889,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",27},
{825,70,387,1406,2875,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",27},
{825,70,387,1407,2890,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",27},
{825,70,387,1527,2916,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",28},
{825,70,387,1519,2916,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",28},
{825,70,387,1514,2899,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",28},
{825,70,387,1523,2958,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",29},
{825,70,387,1522,2967,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",29},
{825,70,387,1530,2969,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",29},
{825,70,387,1459,3026,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",30},
{825,70,387,1462,3036,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",30},
{825,70,387,1469,3027,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",30},
{825,70,387,1359,2935,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",31},
{825,70,387,1369,2940,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",31},
{825,70,387,1361,2924,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",31},
{825,70,387,1372,2844,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",32},
{825,70,387,1370,2833,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",32},
{825,70,387,1366,2830,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",32},
{825,70,387,1349,2803,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",33},
{825,70,387,1345,2807,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",33},
{825,70,387,1339,2806,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",33},
{825,70,387,1311,2894,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",34},
{825,70,387,1303,2882,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",34},
{825,70,387,1308,2870,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",34},
{825,70,387,1314,2935,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",35},
{825,70,387,1319,2943,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",35},
{825,70,387,1321,2931,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",35},
{825,70,387,1367,2987,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",36},
{825,70,387,1357,2996,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",36},
{825,70,387,1353,2983,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",36},
{825,70,387,1398,2969,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",37},
{825,70,387,1410,2979,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",37},
{825,70,387,1402,2985,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",37},
{825,70,387,1466,2990,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",38},
{825,70,387,1459,2992,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",38},
{825,70,387,1452,2991,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",38},
{825,70,387,1473,3090,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",39},
{825,70,387,1470,3099,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",39},
{825,70,387,1469,3082,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",39},
{825,70,387,1481,3149,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",40},
{825,70,387,1487,3151,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",40},
{825,70,387,1492,3157,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",40},
{825,70,387,1447,3159,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",41},
{825,70,387,1440,3160,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",41},
{825,70,387,1441,3146,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",41},
{825,70,387,1441,3083,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",42},
{825,70,387,1442,3089,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",42},
{825,70,387,1443,3086,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",42},
{825,70,387,1405,3132,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",43},
{825,70,387,1409,3149,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",43},
{825,70,387,1400,3105,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",43},
{825,70,387,1363,3162,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",44},
{825,70,387,1371,3161,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",44},
{825,70,387,1371,3145,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",44},
{825,70,387,1316,3156,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",45},
{825,70,387,1314,3139,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",45},
{825,70,387,1313,3124,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",45},
{825,70,387,1345,3070,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",46},
{825,70,387,1342,3060,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",46},
{825,70,387,1344,3036,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",46},
{825,70,387,1299,3033,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",47},
{825,70,387,1302,3013,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",47},
{825,70,387,1306,3004,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",47},
{825,70,387,1594,2935,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",48},
{825,70,387,1588,2931,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",48},
{825,70,387,1579,2920,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",48},
{825,70,387,1545,2890,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",49},
{825,70,387,1552,2892,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",49},
{825,70,387,1550,2875,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",49},
{825,70,387,1588,2969,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",50},
{825,70,387,1588,2978,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",50},
{825,70,387,1581,2972,1,"Kim Qu�c H� B�o K� ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\6079\\flyrefresh6079.lua",50},

}


NPC_PARAM_ID = 1;        --����boss������ˢ������������¼��У�����npc��ʱ����ΪGetNpcParam�ĵڶ�λ����˼�Ǹú���ȡ�����Ǵ���Ŀǰ����bossID������   
FLYBOSS_RELIVE=120        --ÿ����־������ʱ��
FLYBOSS_EXP=         tonumber( TabFile_GetCell( "tollprize" ,2 ,"boss_exp"))    --ÿ��boss�ľ��飨60-79��
FLYBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,2 ,"boss_jifen"))  --ÿ����־boss����������һ��2�����֡�
FLYBOSS_MAPID=387        --��ǰ������ڵ�ͼ��֮��ĵ�ͼ��ţ����Ƕ��٣���

function main()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		Talk(1,"messenger_gogogo","B�n �� ��t ���c ti�u ch� n�y.")
	end
end

