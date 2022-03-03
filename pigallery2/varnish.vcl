# ---------------------------------------------------------------------------------
# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
#vcl 4.0;

# Default backend definition. Set this to point to your content server.
#backend default {
#    .host = "127.0.0.1";
#    .port = "8080";
#}

#sub vcl_recv {
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.
#}

#sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.
#}

#sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
#}
#---------------------------------------------------------------------------------

vcl 4.0;

backend default {
  .host = "app";
  .port = "80";
}

sub vcl_synth {
  if (resp.status == 750) {
    set resp.status = 301;
    set resp.http.Location = req.http.x-redir;
    return(deliver);
  }
}

sub vcl_recv {
    if ( (req.http.host ~ "^(?i)192.168.0.2:8080") && req.http.X-Forwarded-Proto !~ "(?i)https") {
       set req.http.x-redir = "https://" + req.http.host + req.url;
       return (synth(750, ""));
    }
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.
}



sub vcl_backend_response {
#  if (beresp.status == 200) {
#    unset beresp.http.Cache-Control;
#    set beresp.http.Cache-Control = "public; max-age=200";
    set beresp.ttl = 10s;
    set beresp.grace = 1h;
#  }
#  set beresp.http.Served-By = beresp.backend.name;
#  set beresp.http.V-Cache-TTL = beresp.ttl;
#  set beresp.http.V-Cache-Grace = beresp.grace;
}

