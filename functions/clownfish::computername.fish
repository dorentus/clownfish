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
