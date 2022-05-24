

IE Cache [Version 1.10]


 Displays or deletes items in the Internet Explorer cache (also known as
 Temporary Internet Files).


 Syntax: IECache.exe [/FILTER:pattern] [/VERBOSE] [/DELETE]

 /FILTER: Allows you to enumerate specific entries in the cache (See examples).
 /VERBOSE Allows you to display details about each item in the cache.
 /DELETE  Allows you to delete items in the cache. If /FILTER is not specified,
          this will include all cookies and history. (Overrides /VERBOSE)

 NOTE: Before deleting anything, you should get familiar with the format of the
 cache by running IECache.exe>filename.log and then viewing it in Notepad.

 Filter examples:
   /FILTER:http://      (Returns only web items, http://*)
   /FILTER:https://     (Returns only SSL web items, https://*)
   /FILTER:http         (Returns http:// and https://, http*)
   /FILTER:http://www.microsoft.com/  (Web items from a specific domain)
   /FILTER:visited:     (Returns all history, Visited:*)
   /FILTER:cookie:      (Returns all cookies, Cookie:*)
   /FILTER:cookie:%USERNAME%@microsoft.com/  (Cookies for a specific domain)

 /? or -? displays this syntax and always returns 1.
 A successful completion returns 0.


Copyright 2003 Marty List, www.optimumx.com


==================================================================


System Requirements:

	Windows XP; Windows 2000; Windows NT
	Windows ME; Windows 98; Windows 95
	Internet Explorer 3 or later


Revision History:

	1.10 	12/21/2003
	Added the cache folder location to the output.
	
	1.00 	10/20/2003
	Initial release.
