function fish_right_prompt
  if test (clownfish::platform) = "Darwin"
    clownfish::prompt::rbenv (set_color black; printf "🐠  ") (printf "🍄  ")(set_color normal)
  else
    clownfish::prompt::rbenv (set_color black)(set_color normal)
  end
end
