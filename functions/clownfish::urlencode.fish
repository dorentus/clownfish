function clownfish::urlencode -a url -d "URL Encode"
  perl -MURI::Escape -le "print uri_escape('$url')"
end
