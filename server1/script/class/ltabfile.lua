--========�ļ�����==================================--
--�ļ�����ltabfile.lua
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-27
--����������
--	���ļ������˲���tabfile�ļ���һ��luaģ���࣬ʵ����
--��tabfile�Ķ�ȡ��д�룬�Լ�����Ԫ�صĶ�ȡ���޸�
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--
if not LTABFILE_HEAD then
LTABFILE_HEAD = 1

Include("\\script\\lib\\mem.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\class\\lerror.lua")


--========�ඨ��====================================--
--������LTabFile
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	���ฺ���ȡһ��tabfile�������������ж�д������
--�Լ����������ݣ�
--��Ա������
--	__flieds��tabfile�ı�ͷ�ֶμ���
--	__content��tabfile������
--	__errorNo��������
--	__errorMsg��������Ϣ
--��Ա������
--	:__notify(errorNo,errorMsg)
--	����ͨ�棬����getLastError()��ѯ
--	:__new(filename)
--	���캯����
--	:load(filename)
--	������Ϊfilename��tabfile��
--	:writeto(filename)
--	������д�뵽�ļ�filename�У�
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
--	:setCell(field,row,value) or :setCell(col,row,value))
--	��дĳһ��Ԫ������
--	:renameFieldName(oldFieldName,newFieldName) or :renameFieldName(col,newFieldName)
--	�������ֶ���
--	:addField(fieldName)
--	����һ���µ��ֶΣ�
--	:insertField(fieldName,before)
--	����һ���ֶ�
--	:deleteField(fieldName) or :deleteField(col) 
--	ɾ��һ���ֶ�
--	:addRow()
--	���һ��
--	:insertRow(before)
--	����һ��
--	:deleteRow(row)
--	ɾ��һ��
--	:getLastError()
--	�õ����һ�γ������Ϣ��
--������
--
--
--
--==================================================--
LTabFile=inherit(LError,{

--========��������==================================--
--����ԭ�Σ�:__new(filename)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	ʵ����ʱ�Զ�������Ϊfilename��tabfile���������ʧ
--�ܣ��������:getLastError()�õ������Ϣ�����filename
--Ϊnil�������ڴ洴��һ�ݿյ�tabfile��ʽ��
--������
--	filename��Ҫ�����tabfile·��
--����ֵ��
--	��
--������
--	local myTabfile = new(KTabFile,"settings/npcs.txt")
--	if(myTabfile:getLaseError()) then 
--		--ʧ���ˡ�
--	end
--==================================================--
	__new = function(self,arg)
		if(not arg) then
			return
		end
		self:load(arg[1],arg[2])
	end,

--========��������==================================--
--����ԭ�Σ�:load(filename,key)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	������Ϊfilename��tabfile���������ʧ�ܣ�ͨ��
--getLastError()���Եõ������Ϣ������ö����Ѿ��ɹ�
--�����һ��tabfile����ú�����ʧ�ܣ�
--������
--	filename��Ҫ�����tabfile��·����
--	key������KTabfile
--����ֵ��
--	nil��ʾִ��ʧ�ܣ������ʾ�ɹ���
--������
--	local tabfile = new(KTabFile,"key")
--	if(not tabfile:load("settings/npcs.txt") then
--		print(tabfile:getLastError)
--	end
--==================================================--
	load = function(self,filename,key)
		local fh = openfile(filename,"r")
		if(not fh) then
			self:__notify(200,"open file "..filename.."error for read.")
			return nil
		end
		local line = read(fh,"*l")
		if(not line) then
			self:__notify(300,"empty content of ."..filename)
			return nil
		end
		self.__fields = split(line,"\t") --��ȡ��ͷ��Ϣ
		local ln = 0
		line = read(fh,"*l")
		if(line) then --��ʼ��content
			self.__content = {}
			local col = getn(self.__fields)
			while  line do  --��ȡ������
				ln = ln + 1
				self.__content[ln] = split(line,"\t")
				--�������ݣ���nil�����""����ֹ������Ȳ���
				--��ʱȡ��������ԭ�и�ʽ
				--local st = getn(self.__content[ln])
				--for i=st,col do
					--if(not self.__content[ln][i]) then
						--self.__content[ln][i] = ""
					--end
				--end
				line = read(fh,"*l")
			end
		end
		if(not closefile(fh)) then
			self:__notify(400,"close "..filename.." error.")
			return nil
		end
		return 1
	end,
	
--========��������==================================--
--����ԭ�Σ�:writeto(filename)
--���ߣ�yfeng
--�������ڣ�2005-1-24
--����޸����ڣ�2005-1-24
--����������
--	���ڴ��е�tabfile��ʽд�뵽�ļ�filename��ȥ��
--������
--	filename����Ҫд����ļ���·������
--����ֵ��
--	nil��ʾʧ�ܣ�����Ϊ�ɹ���
--������
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	if(tabfile:getLastError() == 0) then
--		tabfile:writeto("settings/npcs2.txt")
--	end
--==================================================--
	writeto = function(self,filename)
		local fh = openfile(filename,"w")
		if(not fh) then
			self:__notify(600,"open file "..filename.." error for read.")
			return nil
		end
		if(not self.__fields) then --��ͷ�գ�����д
			self:__notify(100,"fields empty.")
			return nil
		end
		write(fh,join(self.__fields,"\t").."\n") --д��ͷ,ms excel��ʽ�������\n������\r
		if(self.__content) then -- ���ݷǿգ�д����
			for i=1,getn(self.__content) do --д�������
				write(fh,join(self.__content[i],"\t").."\n")
			end
		end
		flush(fh)
		if(not closefile(fh)) then
			self:__notify(400,"close "..filename.." error.")
			return nil
		end
		return 1
	end,

--========��������==================================--
--����ԭ�Σ�:release()
--���ߣ�yfeng
--�������ڣ�2005-1-24
--����޸����ڣ�2005-1-24
--����������
--	�ͷ�tabfile���ڴ�ṹ���ͷ�֮��Ķ�������ٴ�ͨ��
--:local(filename)����tabfile
--������
--	��
--����ֵ��
--	��
--������
--	��
--==================================================--
	release = function(self)
		self.__fields = nil
		self.__content = nil
		return
	end,

--========��������==================================--
--����ԭ�Σ�:getFields()
--���ߣ�yfeng
--�������ڣ�2005-1-24
--����޸����ڣ�2005-1-24
--����������
--	�õ�tabfile�ı�ͷ�ֶμ��ϡ�
--������
--	��
--����ֵ��
--	nilΪʧ�ܣ�ԭ����:getLastError()��ã�����ɹ���
--�򷵻��ֶ����顣
--������
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	local fields = tabfile:getFields()
--==================================================--
	getFields = function(self)
		if(not self.__fields) then
			self:__notify(100,"fields empty."	)
			return nil
		end
		return self.__fields
	end,

--========��������==================================--
--����ԭ�Σ�:getField(col)
--���ߣ�yfeng
--�������ڣ�2005-1-24
--����޸����ڣ�2005-1-24
--����������
--	�õ���col�еı�ͷ�ֶ�����
--������
--	col������
--����ֵ��
--	����ɹ����򷵻��ַ����͵��ֶ�����ʧ�ܷ���nil����
--�������Ϣͨ��:getLastError()��á�
--������
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	for i=1,tabfile:getCol() do
--		print(tabfile:getField(i))
--	end
--==================================================--
	getField = function(self,col)
		if(not self.__fields) then
			self:__notify(100,"fields empty."	)
			return nil
		end
		if(col < 1 or col > getn(self.__fields)) then
			self:__notify(800,"invalidate column number.")
			return nil
		end
		return self.__fields[col]
	end,
	
--========��������==================================--
--����ԭ�Σ�:getRow()
--���ߣ�yfeng
--�������ڣ�2004-61
--����޸����ڣ�2005-1-25
--����������
--	���tabfile����������������������ͷ����
--������
--	��
--����ֵ��
--	����tabfile��������û��Ϊ0��
--������
--	��
--==================================================--
	getRow = function(self)
		if(not self.__content) then
			return 0
		end
		return getn(self.__content)
	end,
	
--========��������==================================--
--����ԭ�Σ�:getCol()
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	�õ�tabfile��������
--������
--	��
--����ֵ��
--	tabfile��������û����Ϊ0��
--������
--	��
--==================================================--
	getCol = function(self)
		if(not self.__fields) then
			return 0
		end
		return getn(self.__fields)
	end,
	
--========��������==================================--
--����ԭ�Σ�:getCell(col,row) or :getCell(fieldName,row)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	��ȡtabfile��row�У���col������Ӧ�ĵ�Ԫ������ݣ���
--��colΪ�ַ��������ʾΪ�ֶ���fieldName��������Ӧ�ĵ�Ԫ
--��Ϊ��row�У��ֶ���ΪfieldName�����ݡ�
--������
--	col/fieldName�����ò���Ϊ�����ǣ�ȡ��Ϊ���������ò�
--��Ϊ�ַ�������ʱ��ȡ��Ϊtabfile���ֶ�����
--	row��tabfile�е�������
--����ֵ��
--	���ʧ�ܣ�����nil���˽���������ʹ��:getLastError()
--����ɹ����򷵻��ַ����͵ĵ�Ԫ���ݡ�
--������
--	local tabfile = new(KTabFile,"settings/npcs.txt")
--	local cell = tabfile:getCell(1,1)
--==================================================--
	getCell = function(self,col,row)
		--��֤Ч�ʣ�������
		if(type(col) == "string") then
			local len = getn(self.__fields)
			for i=1,len do
				if(self.__fields[i] == col) then
					col = i
					break
				end
			end
		end
		local data = self.__content[row][col]
		if not data then
			return ""
		end
		return tostring(data)
	end,
	
})

end

