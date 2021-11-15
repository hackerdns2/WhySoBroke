# WhySoBroke 


<h1 align="center">
<br>
<img src=https://github.com/vatsalroot/whysobroke/blob/main/wsb.png>
</h1>


<p align="center">
<a href="https://github.com/vatsalroot/whysobroke/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-red.svg"> </a>
<a href="https://www.gnu.org/software/bash"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"> </a>
<a href="https://github.com/vatsalroot/whysobroke/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
</p>


## ⚡Introduction 

<b>WhySoBroke</b> is a Bash script which checks if NS(nameserver) record of a domain resolves to that domain or not. It also scans target's other dns records such as cname, servfail, nxdomain.  
<br>  

### ✔️Installation
  
```
- sudo git clone https://github.com/vatsalroot/WhySoBroke.git ; cd WhySoBroke
- sudo chmod +x whysobroke ; sudo chmod +x install.sh
- sudo ./install.sh
```
  
### 🚀How to run?


```
$ cat domains.txt
  
example.com
example2.com
example3.com
example4.com 
example5.com

$ ./whysobroke domains.txt

[*] NOERROR             : example.com [ns1.example.com]
[*] SERVFAIL RECORD     : example2.com [ns100.example.com]
[+] PROBABLY VULNERABLE : example3.com [brokenserver.example.com] 
[*] NXDOMAIN            : example4.com  
[*] CNAME               : example5.com [someotherdomain.com]   
```  

### ⭐Other features

- The tool also cleans urls either they are in uppercase or assorted with special chars. 

```
$ cat domains.txt

EXAMPLE.COM
#!@!@*(EXAMPLE2.COM
example3%$-staging.com

$ ./whysobroke domains.txt

[*] NOERROR             : example.com [ns.example.com]
[*] NOERROR             : example2.com [ns.example2.com]
[+] PROBABLY VULNERABLE : example3-staging.com [brokenserver.example3-staging.com]
```

### 📁Output

- The script appends the output of CNAME,SERVFAIL and VULNERABLE records in cname.txt, servfail.txt and vulns.txt respectively. 
- Note : If you want fresh output then consider removing existing txt files otherwise output will be added to that files.

### 📌How it works? / Summary

- The script gives output in standard dns record names such as CNAME,NOERROR,SERVFAIL. 
- Checkout below flags returned by the script...

```
[+] Flags retruned by the script
---------------------------------

1. NXDOMAIN : When target domain does not exist. However, sometimes NXDOMAIN records does have CNAME record which will be scanned by the script.
~ [*] NXDOMAIN : example.com [cname.example.com]
~ [*] NXDOMAIN : example.com = when it returns result like this, it means that no such domain or CNAME records found.

2. SERVFAIL RECORD : When target domain's dns query fails. However, this script will also attempt to look for SERVFAIL target's nameservers.
~ [*] SERVFAIL RECORD : example.com [ns1.example.com.ns2.example.com.ns3.example.com.ns4.example.com]
 
3. NOERROR : When nameservers are working completely fine. 
~ [*] NOERROR : example.com   
 
4. NO NAMESERVERS : When there are no nameservers for a target domain.
~ [*] NO NAMESERVERS : test.example.com
 
5. CNAME : When target is pointed to canonical name record (CNAME)
~ [*] CNAME : example.com [example2.com]

6. [+] PROBABLY VULNERABLE  : It is returned when the nameserver fails to resolve domain.
~ [+] PROBABLY VULNERABLE : example.com [brokenserver.example.com]
```

### 🆗 Tested OS

- Ubuntu 20.04


### 📃Licence

This project uses MIT License. For more details, click [here](https://github.com/vatsalroot/WhySoBroke/blob/main/LICENSE).


### ❤️Contributions 

All contributions are warmly welcomed!
