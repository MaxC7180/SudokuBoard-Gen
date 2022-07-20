function [number,N] = Random_with_exclsusion(iMax,exclusion)
Given = randi(iMax,1);
N = 0;
while any(exclusion == Given)
    Given = randi(iMax,1);
    N = N + 1;
    if N == 25
        break
    end
end
number = Given;
