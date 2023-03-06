function fish_title -d "Tell Apple Terminal about the working directory at each prompt"
  if test (clownfish::platform) = "Darwin"
    printf '\033]7;file://localhost/%s\a' (clownfish::urlencode $PWD)
  end
end
