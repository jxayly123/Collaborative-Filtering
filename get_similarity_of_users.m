function sim_value_userId = get_similarity_of_users( id )
    %��ȡmakedata���������־���
    load('rating');
    %ͨ�������id�������û��Ը���Ӱ������������δ����Ϊ0��
    oneLine = getOneLine(id);
    %�������û�����������׷�ӵ�ratingĩβ
    rating = [rating;oneLine];
    %ת�ã���Ϊcorrcoef������е����ƶȣ�
    rating = rating';
    %��ø���֮���Ƥ��ѷ���ƶ�
    corr = corrcoef(rating);
    %��ȡ���У��������û���
    [corr_line,corr_row] = size(corr);
    %��ȡ���һ�е����ƶȣ����������id�û���������û������ƶ�
    similarity = corr(:,corr_row);
    %ȥ������������ƶ�
    similarity(corr_line)=[];
    % �õ�ǰ10�����ƶ�ֵ���û�id����
    [sim_value,sim_userid]=sort(similarity,1,'descend');
    sim_value_userId = [sim_value(1:10),sim_userid(1:10)];
    
    
    
end

