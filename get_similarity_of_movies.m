function sim_value_movieId = get_similarity_of_movies( id )
    %��ȡmakedata���������־���
    load('rating');
    %ͨ�������id�������û��Ը���Ӱ������������δ����Ϊ0��
    oneRow = getOneRow(id);
    %�������û�����������׷�ӵ�ratingĩβ
    rating1 = [rating,oneRow];
    %��ø���֮���Ƥ��ѷ���ƶ�
    corr = corrcoef(rating1);
    %��ȡ���У��������û���
    [corr_line,corr_row] = size(corr);
    %��ȡ���һ�е����ƶȣ���������ĵ�Ӱid���������Ӱ�����ƶ�
    similarity = corr(:,corr_row);
    %ȥ������������ƶ�
    similarity(corr_line)=[];
    % �õ�ǰ10�����ƶ�ֵ����Ӱid����
    [sim_v,sim_value_movieId]=sort(similarity,1,'descend');
    index = find((~isnan(sim_v(:,1))));
    index = index(1);
    sim_value_movieId = [sim_v(index:index+10),sim_value_movieId(index:index+10)];
    
end
