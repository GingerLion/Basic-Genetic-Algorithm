
mutable struct Population
    size::Int
    members::Array{Member,1}
end

popnsize(p::Population) = p.size
getindex(p::Population, idx::Int) = p.members[idx]
getindex(p::Population, choice::Symbol, idx::Int) = ((choice==:chr) ? p[idx].chromosome :
                                                     (choice==:fit) ? p[idx].fitness :
                                                     error("bad symbol"))
