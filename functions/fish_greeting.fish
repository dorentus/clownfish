function fish_greeting
  if test "$ASCIINEMA_REC" = "1"
    return
  end

  printf "\n"
  if command -s fortune > /dev/null
    if command -s lolcat > /dev/null
      fortune -s | lolcat
    else
      fortune -s
    end
  end
end
