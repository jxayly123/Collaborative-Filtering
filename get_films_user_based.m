function  films = get_films_user_based( id )
    %��ȡǰʮ�����ƶȾ���
    sim_value_userId = get_similarity_of_users(id);
    base = load('u1.base');
    %��ȡ��Ӱ����
    items = importdata('u.item','|',0);
    %�ȶ�����Ƽ���Ӱ�Ŀռ�
    films = [];
    %ǰ10�����ƶȱ�����Ӱ
    for n=1:10
        %��ȡ�������û������־���
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %��ȡ���û�����Ϊ5�ֵ���ߵĵ�Ӱ���־���
        first_base_top = first_base(first_base(:,3)==5,:);
        %��ȡ��Ӱ���͵�Ӱid
        films_items = items.textdata(first_base_top(:,2),2);
        %׷�ӵ�Ӱ������ǰ����õĿռ���
        films = [films;films_items];
    end
    %ȥ�أ���ֹ10���������û��Ƽ��ĵ�Ӱ���ظ�
    fprintf('Ϊ�û� %d �Ƽ����µ�Ӱ:', id);
    films = unique(films);
end