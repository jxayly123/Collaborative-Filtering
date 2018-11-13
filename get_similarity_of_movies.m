function sim_value_movieId = get_similarity_of_movies( id )
    %读取makedata做出的评分矩阵
    load('rating');
    %通过输入的id导出该用户对各电影的评分向量（未评分为0）
    oneRow = getOneRow(id);
    %将测试用户的评分向量追加到rating末尾
    rating1 = [rating,oneRow];
    %获得各列之间的皮尔逊相似度
    corr = corrcoef(rating1);
    %获取行列，都等于用户数
    [corr_line,corr_row] = size(corr);
    %获取最后一列的相似度，就是输入的电影id的与各个电影的相似度
    similarity = corr(:,corr_row);
    %去除与自身的相似度
    similarity(corr_line)=[];
    % 得到前10的相似度值，电影id矩阵
    [sim_v,sim_value_movieId]=sort(similarity,1,'descend');
    index = find((~isnan(sim_v(:,1))));
    index = index(1);
    sim_value_movieId = [sim_v(index:index+10),sim_value_movieId(index:index+10)];
    
end
