function  filmsid = get_filmsid_user_based( id )
    %��ȡǰʮ�����ƶȾ���
    sim_value_userId = get_similarity_of_users(id);
    base = load('u1.base');
    %��ȡ��Ӱ����
    items = importdata('u.item','|',1);
    %�ȶ�����Ƽ���Ӱ�Ŀռ�
    filmsid = [];
    %ǰ5�����ƶȱ�����Ӱ
    for n=1:10
        %��ȡ�������û������־���
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %��ȡ���û�����Ϊ5�ֵ���ߵĵ�Ӱ���־���
        first_base_top = first_base(first_base(:,3)==5,:);
        %׷�ӵ�Ӱ������ǰ����õĿռ���
        filmsid_items = items.textdata(first_base_top(:,2),1);
        filmsid = [filmsid;filmsid_items];
    end
    %ȥ�أ���ֹ10���������û��Ƽ��ĵ�ӰID���ظ�
    filmsid = unique(filmsid);
end

