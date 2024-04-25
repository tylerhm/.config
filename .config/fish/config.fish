if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin

    fnm env --shell fish --use-on-cd | source
    fnm completions --shell fish | source
end
