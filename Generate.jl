function generate_population(psize::Integer,f::Function,len::Integer)
    new_pop = Array{Member,1}()
    for i = 1:psize
        chr = Array{Int,1}()
        for j = 1:len
            push!(chr,rand(0:1))
        end
        temp = Member(chr,one_max(temp))
        push!(new_pop,deepcopy(temp))
    end
    return Population(psize,new_pop)
end
