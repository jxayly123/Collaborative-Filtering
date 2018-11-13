function users = get_users_item_based( id )
    %获取前10名相似度矩阵
    sim_value_movieId = get_similarity_of_movies(id);
    base = load('u1.base');
    %读取电影数据
    items = importdata('u.item','|',0);
    %先定义好推荐电影的空集
    users = [];
    %前10名相似度遍历电影
    for n=1:10
        %获取最相似用户的评分矩阵
        first_base = base(base(:,3)>=4,:);
        %获取此用户评价为4到5分的最高的电影评分矩阵
        second_base = first_base(first_base(:,2)==sim_value_movieId(n,2),:);
        second_base_top = second_base(:,1);
        %追加用户名到先前定义好的空集中
        users = [users;second_base_top];
    end
     char = items.textdata(id,2);
     char = cell2mat(char);
    %去重，防止10个最相似用户推荐的电影有重复
    fprintf( '将电影 %d: %s推荐给以下用户: ',id,char);
    users = unique(users);
end
