function fish_greeting
  printf "\n"
  if available fortune
    if available lolcat
      fortune -s | lolcat
    else
      fortune -s
    end
  end
end
