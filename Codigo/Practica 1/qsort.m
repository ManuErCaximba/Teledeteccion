function x = qsort(x)

if isempty(x)
    return
end

n = length(x);
pivot = x(randi(n));
a = [];
b = [];

for i = x
    if i < pivot
        a = [a i];
    end
    if i > pivot
        b = [b i];
    end
end
    

aord = qsort(a);
bord = qsort(b);

x = [aord, x(x == pivot), bord];

