function [recall,precision] = get_cos_recall_of_item_based(id)
%�����ٻ��ʺ�׼ȷ��
array1 = get_cos_users_item_based(id);
%��ȡ���Ƽ��û���
[n1,v] = size(array1);
k=0;
text = load('u1.test');
array2 = text(text(:,2)==id,1);
%��ȡ���Լ����۹��õ�Ӱ���û���
[n2,v] = size(text);
for i = 1:n1
    if find(array2(:) == array1(i))~=0
            k=k+1;
    end
end
recall = k/n2 ;
precision = k/n1;
fprintf("\n���㱾���Ƽ����ٻ��ʺ�׼ȷ��:");
end