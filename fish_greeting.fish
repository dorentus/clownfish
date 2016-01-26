function fish_greeting
  printf "\n"
  if command -s fortune > /dev/null
    if command -s lolcat > /dev/null
      fortune -s | lolcat
    else
      fortune -s
    end
  end
end
