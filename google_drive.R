# URL's obtained from Google Shared Directory
ShareDataURL1 = "https://drive.google.com/open?id=1SHnmzV4L1Lqjj9XMdIFQ-nQHOGRpnPhB" 
ShareDataURL2 = "https://drive.google.com/open?id=1_EtVr2nngh6V67Y8_l_phWqvpFqTlqfb"  #example of a txt file

dataURL1 <- gsub("open\\?", "uc\\?export=download\\&", ShareDataURL1 )
dataURL2 <- gsub("open\\?", "uc\\?export=download\\&", ShareDataURL2 )  

dataDest1 = file.path("C:/Users/jhuang/test1.ncf" )
dataDest2 = file.path("C:/Users/jhuang/test2.txt" )

download.file(dataURL1, destfile = dataDest1, method = "auto", mode = "wb")
download.file(dataURL2, destfile = dataDest2, method = "auto", mode = "wb")