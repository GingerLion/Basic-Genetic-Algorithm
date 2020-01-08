
max_generations = 100
pop_size = 200
chr_len = 16
f = one_max
tourn_size = 3
global fin = false
while !fin
    #generate initial Population
    init_pop = generate_population(pop_size,f,chr_len)
    #n_pop is empty only on the first generation
    n_pop = Population(pop_size,Array{Member,1}())
    for g = 1:max_generations
        #reinitialize mating pool every generation
        m_pool = Array{Member,1}()
        if g==1
            for i = 1:pop_size
                push!(m_pool,tournament_selection(init_pop,tourn_size))
            end
        else
            #select members of population to reproduce
            for i = 1:pop_size
                push!(m_pool,tournament_selection(n_pop,tourn_size))
            end
        end

        #crossover and mutate members in mating pool and add to new population
        #for i in Iterators.countfrom(1,2)
        for i = 1:(size(m_pool,1)-1)
            par1 = deepcopy(m_pool[i])
            par2 = deepcopy(m_pool[i+1])
            child = deepcopy(par1)
            if rand() <= 0.75
                child = crossover1(par1,par2)
            end
            mutation_flipbit(0.1,child)
            one_max(child)
            println(child.chromosome,"\t",child.fitness,"\t gen: ",g)
            push!(n_pop.members,deepcopy(child))
            if child.fitness == chr_len
                println("solution found - GA successful")
                global fin = true
                break;
            end
            if fin
                break
            end
        end
        if fin
            break
        end
        println("\n")
        println("__________________")
        println("\n")
    end
    if !fin
        println("maximum generations reached...GA did not converge")
    end
end
