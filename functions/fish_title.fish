function fish_title -d "Tell Apple Terminal about the working directory at each prompt"
  if test (clownfish::platform) = "Darwin"
    printf '\a\033]7;file://localhost/%s' (clownfish::urlencode $PWD)
  end
end
