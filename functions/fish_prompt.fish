function fish_prompt
  set -l last_status $status

  if not set -q __clownfish_prompt_emoji
    set -l symbols 🍏 🍡 👾 ⭕ 🌀 🌐
    set -l symbols_count (count $symbols)
    set -l hosthash (begin hostname -f > /dev/null; or hostname; end | tr -d '\n' | shasum)
    set -l selected_index (ruby -e "print '$hosthash'.to_i(16) % $symbols_count + 1")
    set -g __clownfish_prompt_emoji $symbols[$selected_index]
  end

  if test (clownfish::platform) = 'Darwin'
    if test (sysctl -n sysctl.proc_translated) -eq 1
      set at_symbol (set_color red)(set_color normal)
    else
      set at_symbol 
    end
  else
    set at_symbol @
  end

  if not test $last_status -eq 0
    set prompt_line_color $fish_color_error
  else
    set prompt_line_color brblack
  end

  printf "%s\n┌─ %s%s%s%s%s%s%s:%s%s%s\n└─── %s%s %s%s " \
    (set_color $prompt_line_color) \
    (set_color brblack) $USER \
    (set_color brblack) $at_symbol \
    (set_color brblack --bold) (clownfish::computername) (set_color normal) \
    (set_color blue) (echo $PWD | sed -e "s|^$HOME|~|") \
    (set_color $prompt_line_color) \
    (set_color brblack) $__clownfish_prompt_emoji (set_color normal) \
    (__fish_git_prompt)(set_color normal)

end
