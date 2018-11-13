function [recall,precision] = get_cos_recall_of_item_based(id)
%计算召回率和准确率
array1 = get_cos_users_item_based(id);
%获取被推荐用户数
[n1,v] = size(array1);
k=0;
text = load('u1.test');
array2 = text(text(:,2)==id,1);
%获取测试集评价过该电影的用户数
[n2,v] = size(text);
for i = 1:n1
    if find(array2(:) == array1(i))~=0
            k=k+1;
    end
end
recall = k/n2 ;
precision = k/n1;
fprintf("\n计算本次推荐的召回率和准确率:");
end