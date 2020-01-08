
function mutation_flipbit(prob::Float64,m::Member)
    for i = 1:size(m.chromosome,1)
        if rand(Float64) < prob
            m.chromosome[i] == 0 ? m.chromosome[i] = 1 : m.chromosome[i] = 0
        end
    end
end
