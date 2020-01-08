function fitness!(m::Member,objfn::Function)
    objfn(m)
end

function one_max(m::Member)
    score = 0
    for i = 1:size(m.chromosome,1)
        m.chromosome[i] == 1 ? score += 1 : score += 0
    end
    m.fitness = score
end
