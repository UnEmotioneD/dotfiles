function mkdtn
    mkdir -p $argv[1] && touch $argv[1]/$argv[2] && nvim $argv[1]/$argv[2]
end
