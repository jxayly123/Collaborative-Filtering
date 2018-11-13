clear;clc; 
%��ȡ��Ӱ���ݽṹ
items = importdata('u.item','|');
%��ȡ��Ӱid�б�
itemIds = items.textdata(:,1);
%��ȡѵ�������û�id����Ӱid�����֣�ʱ�����
base = load('u1.base');
%ȥ��ʱ���
base = base(:,1:3);
%��ȡ�û�id�б�
users = load('u.user');
%��ȡ��Ӱ��
[itemNum,v]=size(itemIds);
%��ȡ�û���
[userNum,v]=size(users);
%�����Ӱ���û������ֵľ��󡣵�ӰΪγ�ȣ��ȶ��������
rating =zeros(userNum,itemNum);
%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(base);
%ѭ������������rating����
for n=1:baseNum
	baseLine = base(n,:);
	line = baseLine(1);
	row = baseLine(2);
	value = baseLine(3);
	rating(line,row) = value;
end
%��rating���󱣴�Ϊ�ļ�
save('rating.mat','rating');