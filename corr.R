#corr.R
#pre-?cor
#list.files()



corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

	folder_content<-list.files(path=directory);
	folder_content_df<-as.data.frame(folder_content);
	apply(folder_content_df,1,function(x){#x is the file name
		char_x<-as.character(x);
		file_content<-na.omit(read.csv(char_x));
		print(cor(file_content$sulfate,file_content$nitrate));#spelling
	});
}