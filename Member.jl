
mutable struct Member
    chromosome::Array{Any,1}
    fitness::Number
end


Member(chr::Array{Any,1}, objfn::Function) = Member(chr, objfn(chr))
chromosome(m::Member) = m.chromosome
fitness(m::Member) = m.fitness
print(m::Member) = println("{$(fitness(m))}\t$(chromosome(m))")
