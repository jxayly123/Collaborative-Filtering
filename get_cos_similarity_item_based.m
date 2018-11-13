function cos_i = get_cos_similarity_item_based(id)
%�����������ƶ�
%t0=cputime;����ʱ�䣬���10s
load('rating');
%��ȡ��Ӱ����������
oneRow = getOneRow(id);
%�û�������Ӱ���־���
rating3 = [rating,oneRow];
info = textread('u.info','%n%*[^\n]');
n = info(2);
%��ʼ���������ƶȾ���
cos_i=zeros(n+1,n+1);
%����
for i = 1:n+1
    for j = 1:n+1
        cos_i(i,j) = dot(rating3(:,i),rating3(:,j))/(norm(rating3(:,i))*norm(rating3(:,j)));
    end
end
%��ȡǰʮ����Ӱ���ƶȣ�ͬʱȥ��NaN�������ƶȣ���Ϊĳ����Ӱ����ȫ���У�Ҳ���������û���δ�����֣�
[cos_line,cos_row] = size(cos_i);
similarity = cos_i(:,cos_row);
similarity(cos_line)=[];
[sim_value,sim_userid]=sort(similarity,1,'descend');
index = find((~isnan(sim_value(:,1))));
index = index(1);
cos_i = [sim_value(index+1:index+10),sim_userid(index+1:index+10)];
%t1 =cputime-t0;
end