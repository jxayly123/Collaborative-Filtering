function  films = get_films_user_based( id )
    %获取前十名相似度矩阵
    sim_value_userId = get_similarity_of_users(id);
    base = load('u1.base');
    %读取电影数据
    items = importdata('u.item','|',0);
    %先定义好推荐电影的空集
    films = [];
    %前10名相似度遍历电影
    for n=1:10
        %获取最相似用户的评分矩阵
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %获取此用户评价为5分的最高的电影评分矩阵
        first_base_top = first_base(first_base(:,3)==5,:);
        %获取电影名和电影id
        films_items = items.textdata(first_base_top(:,2),2);
        %追加电影名到先前定义好的空集中
        films = [films;films_items];
    end
    %去重，防止10个最相似用户推荐的电影有重复
    fprintf('为用户 %d 推荐以下电影:', id);
    films = unique(films);
end