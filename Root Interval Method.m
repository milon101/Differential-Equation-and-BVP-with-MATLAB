function x =  root_interval(p,epsilon)
r = roots(p)
x = [r - epsilon, r + epsilon]
end

