function tag
    set -x TAG_SEARCH_PROG rg
    set -q TAG_ALIAS_FILE; or set -l TAG_ALIAS_FILE /tmp/tag_aliases
    command tag $argv; and source $TAG_ALIAS_FILE 2>/dev/null
    alias rg tag
end
