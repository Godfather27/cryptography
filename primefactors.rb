target = 3574406403731
i = 2
while i <= target
    if (target % i == 0)
        puts i
        target /= i
    else
        i+=1
    end
end