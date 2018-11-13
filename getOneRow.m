function [ oneRow ] = getOneRow( id )
%通过电影的ID获取对各个电影的评分的向量

%读取测试集（用户ID，电影id，评分，时间戳）
test = load('u1.test');
%去除时间戳
test = test(:,1:3);
%查找到输入电影的id的对应用户的所有评分，用户id，电影ID，评分的矩阵
oneTest = test(test(:,2)==id,:);
%直接读取info给的用户数
info = textread('u.info','%n%*[^\n]');
oneRow = zeros(info(1),1);

% 给用户向量赋值
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneRow(oneTestLine(1)) = oneTestLine(3);
end



end
