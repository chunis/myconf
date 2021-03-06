#!/bin/bash
#檔案名 epub檔簡轉繁 (包含以下目錄)
#    * 需安裝套件 ： nautilus-script-manager
#    * 把檔案放在： $HOME/.gnome2/nautilus-scripts ，檔名例如為：簡轉繁，並加入執行權限。
#    * 在檔案瀏覽器中，選擇檔案按滑鼠右鍵會出現 -- 指令稿-->epub簡轉繁 
#
function ren() {
	local n_path 
	for fn in $*
	do
        	#取得最後檔名部份
        	base_name=${fn##*/}
        	#取得路徑
        	n_path=${fn%/*}
 
		old=$base_name
 
		#轉換的檔案類型
		if [ ${old##*.} == "html" ] || [ ${old##*.} == "xhtml" ]  || [ ${old##*.} == "opf" ] ||  [ ${old##*.} == "ncx" ] ; then
			cat $n_path/$old |iconv -c -f utf8 -t gb2312 | iconv -c -f gb2312 -t big5 | iconv -c -f big5 -t utf8  > $n_path/$old.new 
			rm -f  $n_path/$old
			mv $n_path/$old.new  $n_path/$old
  	  	fi
        done	
}	

function dr() {
#一定要加入  local ，否則會成全域變數
local ni 
for i in $* ; do
        ni=$i
 	#判斷為目錄再進入
	if [ -d $i ]   ; then
	   
 	   fn_list=`ls -d $i/*`
	   dr  $fn_list  
 
  	fi 
  	
	if [ -e $ni ] ; then 
	   ren $ni 
 	fi
done
}

IFS=$'\n'
for fn in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS
do
        	#取得最後檔名部份
        	base_name=${fn##*/}
        	#取得路徑
        	epub_path=${fn%/*}
 
		fn_old=$base_name       
		#繁體檔名
		fn_new=`echo $fn_old |iconv -c -f utf8 -t gb2312 | iconv -c -f gb2312 -t big5 | iconv -c -f big5 -t utf8`
		
		#解開 epub ，到工作目錄 epub
                unzip $epub_path/$fn_old  -d  $epub_path/epub
                
                #轉繁體動作
                dr  $epub_path/epub
                
                #重新打包繁體 epub 檔，會放在 tw 次目錄中
                cd  $epub_path/epub
                mkdir  $epub_path/tw
                zip -Xr9D ../tw/$fn_new   mimetype *
                
                #清除工作目錄
                rm -fR  $epub_path/epub
done
