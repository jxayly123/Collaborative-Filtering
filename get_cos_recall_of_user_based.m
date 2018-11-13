function [recall,precision] = get_cos_recall_of_user_based(id)
%计算召回率和准确率
array1 = get_cos_filmsid_user_based(id);
%获取被推荐电影数目
[n1,v] = size(array1);
k=0;
text = load('u1.test');
array2 = text(text(:,1)==id,2);
%获取测试集该用户的评测过的电影数目
[n2,v] = size(text);
for i = 1:n1
    if find(array2(:) == str2double(array1(i)))~=0
            k=k+1;
    end
end
recall = k/n2 ;
precision = k/n1;
