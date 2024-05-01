function fish_greeting
    if type -q fortune
        fortune
    else
        echo "Welcome to 🐟. Install `fortune` if you'd rather see a fortune here :)"
    end
end
