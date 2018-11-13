function cos_u = get_cos_similarity_user_based(id)
%º∆À„”‡œ“œ‡À∆∂»
%t0=cputime;
load('rating');
oneline = getOneLine(id);
rating2 = [rating;oneline];
rating2 = rating2';
info = textread('u.info','%n%*[^\n]');
n = info(2);
m = info(1);
cos_u=zeros(m+1,m+1);
for i = 1:m+1
    for j = 1:m+1
        cos_u(i,j) = dot(rating2(:,i),rating2(:,j))/(norm(rating2(:,i))*norm(rating2(:,j)));
    end
end
[cos_line,cos_row] = size(cos_u);
similarity = cos_u(:,cos_row);
similarity(cos_line)=[];
[sim_value,sim_userid]=sort(similarity,1,'descend');
cos_u = [sim_value(1:10),sim_userid(1:10)];
%t1 =cputime-t0;
end

