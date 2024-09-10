if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin

    fnm env --shell fish --use-on-cd | source
    fnm completions --shell fish | source
end

# Added by `rbenv init` on Sat Aug  3 23:09:38 EDT 2024
status --is-interactive; and rbenv init - --no-rehash fish | source
