--========�ļ�����==================================--
--�ļ�����ktabfile.lua
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-29
--����������
--	���ļ�����ϵͳ�ṩ��TabFile��ؽű�ָ�ʵ���˶�ȡ
--tabfile�ļ��ĸ��ֲ���������������˷�װ
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--

if not KTABFILE_HEAD then
KTABFILE_HEAD = 1

Include("\\script\\lib\\mem.lua")
Include("\\script\\class\\lerror.lua")


IncludeLib("FILESYS")

--========�ඨ��====================================--
--������KTabFile
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-29
--����������
--	���ฺ���ȡһ��tabfile�������������ж�������
--��Ա������
--	__key��tabfile�ı�����ϵͳ�Ĺؼ���
--��Ա������
--	:__new(filename,key)
--	���캯����
--	:load(filename,key)
--	������Ϊfilename��tabfile��
--	:release()
--	ɾ�������tabfile���ݣ����ͷŴ洢�ռ䣮
--	:getFilds()
--	���ر�ͷ�ֶε����飮
--	:getField(col)
--	�õ���ͷ��ĳ���ֶ���
--	:getRow()
--	�õ�tabfile���ݵ�������
--	:getCol()
--	�õ�tabfile���ݵ�������
--	:getCell(field,row) or :getCell(col,row)
--	��ȡtabfileĳһ��Ԫ������
--������
--	��
--==================================================--
KTabFile = inherit(LError,{

--========��������==================================--
--����ԭ�Σ�:__new(filename,key)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-29
--����������
--	ʵ����ʱ�Զ�������Ϊfilename��tabfile����filename
--��������·���������Ϸ·��/settings�ġ�keyΪ��Ǹ�
--tabfile���ڴ�Ψһ��ʶ
--������
--	filename��Ҫ�����tabfile·��
--	key��Ψһ��ʶ
--����ֵ��
--	��
--������
--	local myTabfile = new(KTabFile,"settings/npcs.txt","NPCS")
--	if(myTabfile:getLaseError()) then 
--		--ʧ���ˡ�
--	end
--==================================================--
	__new = function(self,arg)
		if(not arg) then return end
		self:load(arg[1],arg[2])
	end,

--========��������==================================--
--����ԭ�Σ�:load(filename,key)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-29
--����������
--	������Ϊfilename��tabfile��������key��ʶ�����ڴ�
--�еĹؼ��֣�һ������ɹ������еط�������ͨ��key����
--��tabfile��
--������
--	filename��Ҫ�����tabfile��·����
--	key����ʶ�ؼ���
--����ֵ��
--	nil��ʾִ��ʧ�ܣ������ʾ�ɹ���
--������
--	local tabfile = new(KTabFile)
--	if(not tabfile:load("settings/npcs.txt")) then
--		print(tabfile:getLastError)
--	end
--==================================================--
	load = function(self,filename,key)
		self.__key = key
		if(TabFile_Load(filename,key) ==0) then
			self:__notify(100,"��ng nh�p"..filename.."xu�t hi�n l�i!")
			return nil
		end
		return 1
	end,

--========��������==================================--
--����ԭ�Σ�:getCell(col,row) or :getCell(fieldName,row)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-29
--����������
--	��ȡtabfile��row�У���col������Ӧ�ĵ�Ԫ������ݣ���
--��colΪ�ַ��������ʾΪ�ֶ���fieldName��������Ӧ�ĵ�Ԫ
--��Ϊ��row�У��ֶ���ΪfieldName�����ݡ�
--������
--	col/fieldName�����ò���Ϊ�����ǣ�ȡ��Ϊ���������ò�
--��Ϊ�ַ�������ʱ��ȡ��Ϊtabfile���ֶ�����
--	row��tabfile�е�������
--����ֵ��
--	�򷵻��ַ����͵ĵ�Ԫ���ݡ�
--������
--	local tabfile = new(KTabFile,"settings/npcs.txt","NPCS")
--	local cell = tabfile:getCell(1,1)
--==================================================--
	getCell = function(self,col,row)
		return TabFile_GetCell(self.__key,row+1,col)
	end,

--========��������==================================--
--����ԭ�Σ�:getRow()
--���ߣ�yfeng
--�������ڣ�2005-1-29
--����޸����ڣ�2005-1-29
--����������
--	�õ�tabfile���ݵ���������ͷ����������
--������
--	��
--����ֵ��
--	����
--������
--	��
--==================================================--
	getRow = function(self)
		return TabFile_GetRowCount(self.__key) -1
	end,
	
	release = function(self)
		TabFile_UnLoad(self.__key)
	end
})

end

