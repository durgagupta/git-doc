### Parsing access.log and error.logs using linux commands

####Access logs
We are using following format, which is also default nginx format named “combined”:

    $remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent"
    
######Explanation of fields is as follows:

* `$remote_addr` – IP from which request was made
* `$remote_user` – HTTP Authenticated User. This will be blank for most apps as modern apps do not use HTTP-based authentication.
* `[$time_local]` – timestamp as per server timezone
* `"$request"` – HTTP request type GET, POST, etc + requested path without args + HTTP protocol version
* `$status` – HTTP response code from server
* `$body_bytes_sent` – size of server response in bytes
* `"$http_referer"` – Referral URL (if present)
* `"$http_user_agent"` – User agent as seen by server


###### Lets explore some commands which can help us analyse logs.

#######Sort access by Response Codes
    cd /var/log/nginx/
    cat access.log | cut -d '"' -f3 | cut -d ' ' -f2 | sort | uniq -c | sort -rn

#######Sample Output:
     111997 301
      79147 403
      64039 200
      21971 302
      20393 404
       1324 499
        160 304
        123 400
          9 502
          6 500
          2 503
          2 206

####### Same thing can be done using awk:
    awk '{print $9}' access.log | sort | uniq -c | sort -rn

#######Sample Output:
     112407 301
      79290 403
      68766 200
      22557 302
      20427 404
       1401 499
        172 304
        120 "-"
          9 502
          6 HTTP/1.0"
          6 500
          5 400
          2 503
          2 206
          1 405

As you can see it log says more than 20427 requests were returned 404!

##### Lets find out which links are broken now?

Following will search for requests which resulted in 404 response and then sort them by number of requests per URL. You will get most visited 404 pages.

    awk '($9 ~ /404/)' access.log | awk '{print $7}' | sort | uniq -c | sort -rn
Following will search for requests which request "customer/account/edit/" and then sort them by number of requests per URL.

    awk '($7 ~ /customer\/account\/edit\//)' access.log | awk '{print $7}' | sort | uniq -c | sort -rn

Similarly, for 502 (bad-gateway) we can run following command:

    awk '($9 ~ /502/)' access.log | awk '{print $7}' | sort | uniq -c | sort -r
    
 Who are requesting broken links (or URLs resulting in 502)
 
    awk -F\" '($2 ~ "/wp-admin/install.php"){print $1}' access.log | awk '{print $1}' | sort | uniq -c | sort -r
   
 ##### Hacking attempts   
 404 for php files – mostly hacking attempts
 
    awk '($9 ~ /404/)' access.log | awk -F\" '($2 ~ "^GET .*\.php")' | awk '{print $7}' | sort | uniq -c | sort -r | head -n 20
 
 ######sample result
       3 /en_cz/wp-login.php
       1 /en_cz/thinkphp/html/public/index.php
       1 /en_cz/public/index.php
       1 /en_cz/html/public/index.php
       1 /en_cz/elrekt.php
       1 /en_cz/TP/public/index.php
       1 /en_cz/TP/index.php
       1 /en_cz/TP/html/public/index.php
       1 /cs_cz/extranet/index2.php
 
 #####Most requested URLs
    awk -F\" '{print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -r
  
 #####Most requested URLs containing XYZ
  
    awk -F\" '($2 ~ "ref"){print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -r
    
 #### Referance URL for more detail
 * https://www.the-art-of-web.com/system/logs/
 * https://www.w3.org/Protocols/HTTP/HTRESP.html (Response Code detail)
