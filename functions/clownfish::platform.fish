function clownfish::platform -d "OS name"
  if not set -q __clownfish_platform
    set -g __clownfish_platform (uname -s)
  end

  printf $__clownfish_platform
end
