function cos_i = get_cos_similarity_item_based(id)
%计算余弦相似度
%t0=cputime;计算时间，大概10s
load('rating');
%获取电影评分列向量
oneRow = getOneRow(id);
%用户——电影评分矩阵
rating3 = [rating,oneRow];
info = textread('u.info','%n%*[^\n]');
n = info(2);
%初始化余弦相似度矩阵
cos_i=zeros(n+1,n+1);
%计算
for i = 1:n+1
    for j = 1:n+1
        cos_i(i,j) = dot(rating3(:,i),rating3(:,j))/(norm(rating3(:,i))*norm(rating3(:,j)));
    end
end
%获取前十名电影相似度，同时去掉NaN非数相似度（因为某部电影存在全零列，也就是所有用户都未评过分）
[cos_line,cos_row] = size(cos_i);
similarity = cos_i(:,cos_row);
similarity(cos_line)=[];
[sim_value,sim_userid]=sort(similarity,1,'descend');
index = find((~isnan(sim_value(:,1))));
index = index(1);
cos_i = [sim_value(index+1:index+10),sim_userid(index+1:index+10)];
%t1 =cputime-t0;
end