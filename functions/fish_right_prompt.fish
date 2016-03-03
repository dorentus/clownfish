function fish_right_prompt
  if test (clownfish::platform) = "Darwin"
    clownfish::prompt::rbenv (set_color black; printf "🐠  ") (printf "🍄  ")
  else
    clownfish::prompt::rbenv (set_color black)
  end
end
