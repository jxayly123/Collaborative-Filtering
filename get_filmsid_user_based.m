function  filmsid = get_filmsid_user_based( id )
    %获取前十名相似度矩阵
    sim_value_userId = get_similarity_of_users(id);
    base = load('u1.base');
    %读取电影数据
    items = importdata('u.item','|',1);
    %先定义好推荐电影的空集
    filmsid = [];
    %前5名相似度遍历电影
    for n=1:10
        %获取最相似用户的评分矩阵
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %获取此用户评价为5分的最高的电影评分矩阵
        first_base_top = first_base(first_base(:,3)==5,:);
        %追加电影名到先前定义好的空集中
        filmsid_items = items.textdata(first_base_top(:,2),1);
        filmsid = [filmsid;filmsid_items];
    end
    %去重，防止10个最相似用户推荐的电影ID有重复
    filmsid = unique(filmsid);
end

