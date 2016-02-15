# configurations for __fish_git_prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "● "
set -g __fish_git_prompt_char_dirtystate "✚ "
set -g __fish_git_prompt_char_untrackedfiles "… "
set -g __fish_git_prompt_char_conflictedstate "✖ "
set -g __fish_git_prompt_char_cleanstate "✔ "

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green

set -g __fish_git_prompt_color_suffix black
set -g __fish_git_prompt_color_prefix black


function clownfish::urlencode -a url -d "URL Encode"
  perl -MURI::Escape -le "print uri_escape('$url')"
end

function clownfish::platform -d "OS name"
  if not set -q __clownfish_platform
    set -g __clownfish_platform (uname -s)
  end

  printf $__clownfish_platform
end

function clownfish::computername -d "Computer Name"
  if not set -q __clownfish_computername
    if command -s scutil > /dev/null
      set -g __clownfish_computername (scutil --get ComputerName)
    else
      set -g __clownfish_computername (hostname -f ^ /dev/null; or hostname)
    end
  end

  printf $__clownfish_computername
end
