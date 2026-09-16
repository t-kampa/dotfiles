function close-all
    echo "closing apps:"
    set keep "Finder" "iTerm2" "Thaw"

    set apps (osascript -e 'tell application "System Events" to get name of every process where background only is false')
    if test $status -ne 0
        set_color red
        echo "error: osascript failed" >&2
        set_color normal
        return 1
    end

    set closed 0
    for app in (string split ", " $apps)
        set app (string trim $app)
        if not contains $app $keep
            echo "  ✕ $app"
            killall "$app" 2>/dev/null
            set closed (math $closed + 1)
        end
    end

    echo ""
    set_color --bold normal
    echo "done: closed $closed app(s)"
    set_color normal
end
