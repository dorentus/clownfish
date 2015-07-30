function clownfish::prompt::rbenv -a ph_message -a rb_emoji -d "Display rbenv local version if available"
  if available rbenv
    set -l rb_version (rbenv local 2> /dev/null)
    if [ "$rb_version" != "" ]
      set_color 62A; printf "rb=%s%s" $rb_version $rb_emoji
    else
      printf "$ph_message"
    end
  else
    printf "$ph_message"
  end
end

function fish_right_prompt
  if test (clownfish::platform) = "Darwin"
    clownfish::prompt::rbenv (set_color black; printf "🐠  ") (printf "🍄  ")
  else
    clownfish::prompt::rbenv (set_color black)
  end
end
