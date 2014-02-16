#complete.R
#function needed list.files
#for loop in r
#for each file count(df,na.rm=TRUE)
#



	print_each <- function(x){#x is the file name
	char_x<-as.character(x);
	file_content<-read.csv(char_x);
	print(nrow(na.omit(file_content)));


	}
	
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
	#actual code goes here


	folder_content<-list.files(path=directory);
	folder_content_df<-as.data.frame(folder_content);
	apply(folder_content_df,function(x));





}