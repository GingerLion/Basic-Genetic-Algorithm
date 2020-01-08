function crossover1(m1::Member,m2::Member)
    chr_size = size(m1.chromosome,1)
    cross_pt = rand(1:chr_size)
    child_chromosome = Array{Any,1}()

    child_chromosome = cat(child_chromosome,m1.chromosome[1:cross_pt],dims=1)
    child_chromosome = cat(child_chromosome,m2.chromosome[(cross_pt+1):size(m2.chromosome,1)],dims=1)
    child_member = Member(child_chromosome,0)
    one_max(child_member)
    return child_member
    #println(child_chromosome)
end
