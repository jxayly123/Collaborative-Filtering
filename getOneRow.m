function [ oneRow ] = getOneRow( id )
%ͨ����Ӱ��ID��ȡ�Ը�����Ӱ�����ֵ�����

%��ȡ���Լ����û�ID����Ӱid�����֣�ʱ�����
test = load('u1.test');
%ȥ��ʱ���
test = test(:,1:3);
%���ҵ������Ӱ��id�Ķ�Ӧ�û����������֣��û�id����ӰID�����ֵľ���
oneTest = test(test(:,2)==id,:);
%ֱ�Ӷ�ȡinfo�����û���
info = textread('u.info','%n%*[^\n]');
oneRow = zeros(info(1),1);

% ���û�������ֵ
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneRow(oneTestLine(1)) = oneTestLine(3);
end



end
