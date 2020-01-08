function tournament_selection(p::Population,n::Int)
    t_members = Array{Member,1}()
    for t = 1:n
        push!(t_members,rand(p.members))
    end

    max_idx = 0
    max_fit = 0

    for i = 1:n
        if t_members[i].fitness > max_fit
            max_idx = i
            max_fit = t_members[i].fitness
        end
    end
    if max_idx == 0
        return deepcopy(t_members[1])
    else
        return deepcopy(t_members[max_idx])
    end
end
