function users = get_users_item_based( id )
    %��ȡǰ10�����ƶȾ���
    sim_value_movieId = get_similarity_of_movies(id);
    base = load('u1.base');
    %��ȡ��Ӱ����
    items = importdata('u.item','|',0);
    %�ȶ�����Ƽ���Ӱ�Ŀռ�
    users = [];
    %ǰ10�����ƶȱ�����Ӱ
    for n=1:10
        %��ȡ�������û������־���
        first_base = base(base(:,3)>=4,:);
        %��ȡ���û�����Ϊ4��5�ֵ���ߵĵ�Ӱ���־���
        second_base = first_base(first_base(:,2)==sim_value_movieId(n,2),:);
        second_base_top = second_base(:,1);
        %׷���û�������ǰ����õĿռ���
        users = [users;second_base_top];
    end
     char = items.textdata(id,2);
     char = cell2mat(char);
    %ȥ�أ���ֹ10���������û��Ƽ��ĵ�Ӱ���ظ�
    fprintf( '����Ӱ %d: %s�Ƽ��������û�: ',id,char);
    users = unique(users);
end
