import Base.*

function load_files(files; base_path="")
    incurrent() = (base_path == "")
    includefile(file) = include(incurrent() ? file : "$(base_path)/$file")

    for file in files
        includefile(file)
    end
end

ga_files = ["Member.jl",
            "Population.jl",
            "Crossover.jl",
            "Mutation.jl",
            "Selection.jl",
            "Fitness.jl",
            "Generate.jl",
            "RunGA.jl"
            ]
path = "C:/Users/dillo/OneDrive - University of Guelph/JuliaPracticeGA"
cd(path)
load_files(ga_files)
