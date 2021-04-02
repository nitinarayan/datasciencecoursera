print("Jai Gurudev")

##******************************************************************
##*  Week 1: R Programming
##*  
##*   5.1 Entering Input
##*   
##*       Assignment Operators: 
##*       The <- symbol is the assignment operator.

x <- 1
print(x)
x

msg <- "Jai Gurudev"

##*       The grammar of a language determines whether an expression is complete or not.
##*     
##*           x <-       ## Incomplete expression
##*     
##*       The # character indicates a comment. Anything to the right of the # (including the 
##*       # itself) is ignored. This is the only comment character in R. Unlike some other 
##*       languages, R does not support multi-line comments or comment blocks.

##*  5.2 Evaluation
##*       When a complete expression is entered at the prompt, it is evaluated and the result 
##*       of the evaluated expression is returned. The result may be auto-printed.

x <- 5               ## nothing printed
x                    ## auto-printing occurs

print(x)             ## explicit printing


##*        The [1] shown in the output indicates that x is a vector and 5 is its first element.
##*        Typically with interactive work, we do not explicitly print objects with the 
##*        print function; it is much easier to just auto-print them by typing the name of the 
##*        object and hitting return/enter. However,when writing scripts, functions, or longer 
##*        programs, there is sometimes a need to explicitly print objects because auto-printing 
##*        does not work in those settings. When an R vector is printed you will notice that an 
##*        index for the vector is printed in square brackets [] on the side. For example, 
##*        see this integer sequence of length 20.

x <- 11:30
x

##*        [1] 11 12 13 14 15 16 17 18 19 20 21 22
##*        [13] 23 24 25 26 27 28 29 30
##*        The numbers in the square brackets are not part of the vector itself, they are merely 
##*        part of the printed output.  With R, it’s important that one understands that there is 
##*        a difference between the actual R object and the manner in which that R object is 
##*        printed to the console. Often, the printed output may have additional bells and whistles 
##*        to make the output more friendly to the users. However, these bells and whistles are 
##*        not inherently part of the object. 
##*        
##*        Note that the : operator is used to create integer sequences.


##*  5.3 R Objects
##*       R has five basic or “atomic” classes of objects:
##*       1. character
##*       2. numeric (real numbers)
##*       3. integer
##*       4. complex
##*       5. logical (True/False)
##*       
##*       The most basic type of R object is a vector. 
##*       Empty vectors can be created with the vector() function.
##*       There is only one rule about vectors in R, which is that 
##*       A vector can only contain objects of the same class.
##*       But of course, like any good rule, there is an exception, which is a list. 
##*       A list is represented as a vector but can contain objects of different classes. 
##*       Indeed, that’s usually why we use them. There is also a class for “raw” objects, 
##*       but they are not commonly used directly in data analysis 


##*  5.4 Numbers
##*       Numbers in R are generally treated as numeric objects (i.e. double precision 
##*       real numbers). This means that even if you see a number like “1” or “2” in R, 
##*       which you might think of as integers, they are likely represented behind the scenes 
##*       as numeric objects (so something like “1.00” or “2.00”). This isn’t important most of 
##*       the time…except when it is. 
##*       If you explicitly want an integer, you need to specify the L suffix. So entering 1 
##*       in R gives you a numeric object; entering 1L explicitly gives you an integer object.
##*       There is also a special number Inf which represents infinity. 
##*       This allows us to represent entities like 1 / 0. 
##*       This way, Inf can be used in ordinary calculations; e.g. 1 / Inf is 0.
##*       The value NaN represents an undefined value (“not a number”); e.g. 0 / 0; 
##*       NaN can also be thought of as a missing value (more on that later)



##*  5.5 Attributes
##*       R objects can have attributes, which are like metadata for the object. These metadata 
##*       can be very useful in that they help to describe the object. For example, column names 
##*       on a data frame help to tell us what data are contained in each of the columns. 
##*       Some examples of R object attributes are:
##*       
##*       • names, dimnames
##*       • dimensions (e.g. matrices, arrays)
##*       • class (e.g. integer, numeric)
##*       • length
##*       • other user-defined attributes/metadata
##*       
##*       Attributes of an object (if any) can be accessed using the attributes() function. 
##*       Not all R objects contain attributes, in which case the attributes() function returns 
##*       NULL.







##*  5.6 Creating Vectors
##*       The c() function can be used to create vectors of objects by concatenating things 
##*       together.

x <- c(0.5, 0.6)             ## numeric
x

x <- c(TRUE, FALSE)          ## logical
x

x <- c(T, F)                 ## logical
x

x <- c("a", "b", "c")        ## character
x

x <- 9:29                    ## integer
x

x <- c(1+0i, 2+4i)           ## complex
x


##*       Note that in the above example, T and F are short-hand ways to specify TRUE and FALSE. 
##*       However, in general one should try to use the explicit TRUE and FALSE values when 
##*       indicating logical values.  The T and F values are primarily there for when you’re 
##*       feeling lazy. 
##*       You can also use the vector() function to initialize vectors.

x <- vector("numeric", length = 10)
x







##*  5.7 Mixing Objects
##*       There are occasions when different classes of R objects get mixed together. Sometimes 
##*       this happens by accident but it can also happen on purpose. So what happens with the 
##*       following code?

y <- c(1.7, "a")        ## returns a character
class(y)
y

y <- c(TRUE, 2)         ## returns a numeric
class(y)
y

y <- c("a", TRUE)       ## returns a character
class(y)
y


##*       In each case above, we are mixing objects of two different classes in a vector. 
##*       But remember that the only rule about vectors says this is not allowed. When different 
##*       objects are mixed in a vector, coercion occurs so that every element in the vector is 
##*       of the same class. 
##*       In the example above, we see the effect of implicit coercion. What R tries to do is 
##*       find a way to represent all of the objects in the vector in a reasonable fashion. 
##*       Sometimes this does exactly what you want and…sometimes not. For example, combining 
##*       a numeric object with a character object will create a character vector, because 
##*       numbers can usually be easily represented as strings.







##*  5.8 Explicit Coercion
##*       Objects can be explicitly coerced from one class to another using the as.* functions, 
##*       if available.

x <- 0:6
class(x)
x

as.numeric(x)
x
class(x)

as.logical(x)
x
class(x)

as.character(x)
x
class(x)


##*       Sometimes, R can’t figure out how to coerce an object and this can result in NAs being 
##*       produced.

x <- c("a", "b", "c")

as.numeric(x)

##*       [1] NA NA NA
##*       Warning: NAs introduced by coercion

  

as.logical(x)

##*       [1] NA NA NA
##*       Warning: NAs introduced by coercion

as.complex(x)

##*       [1] NA NA NA
##*       Warning: NAs introduced by coercion

##*       When nonsensical coercion takes place, you will usually get a warning from R.







##*  5.9 Matrices
##*       Matrices are vectors with a dimension attribute. The dimension attribute is itself 
##*       an integer vector of length 2 (number of rows, number of columns)

m <- matrix(nrow = 2, ncol = 3)
m

dim(m)
attributes(m)


##*       Matrices are constructed column-wise, so entries can be thought of starting in 
##*       the “upper left” corner and running down the columns.

m <- matrix(1:6, nrow = 2, ncol = 3)
m

##*       Matrices can also be created directly from vectors by adding a dimension attribute.

m <- 1:10
m

dim(m) <- c(2, 5)
m

##*       Matrices can be created by column-binding or row-binding with the cbind() and rbind() 
##*       functions.

x <- 1:3
y <- 10:12

cbind(x, y)        ## Using cbind() function
rbind(x, y)        ## using rbind() function





##*  5.10 Lists
##*       Lists are a special type of vector that can contain elements of different classes. 
##*       Lists are a very important data type in R and you should get to know them well. 
##*       Lists, in combination with the various “apply” functions discussed later, make for a 
##*       powerful combination.  Lists can be explicitly created using the list() function, 
##*       which takes an arbitrary number of arguments.

x <- list(1, "a", TRUE, 1 + 4i)
x

##*       We can also create an empty list of a pre-specified length with the vector() function

x <- vector("list", length = 5)
x






##*  5.11 Factors

##*       Factors are used to represent categorical data and can be unordered or ordered. 
##*       One can think of a factor as an integer vector where each integer has a label. 
##*       Factors are important in statistical modeling and are treated specially by 
##*       modelling functions like lm() and glm().  Using factors with labels is better than 
##*       using integers because factors are self-describing. Having a variable that has values 
##*       “Male” and “Female” is better than a variable that has values 1 and 2. 
##*       Factor objects can be created with the factor() function.

x <- factor(c("yes", "yes", "no", "yes", "no"))
x

table(x)
x

## See the underlying representation of factor

unclass(x)

##*       Often factors will be automatically created for you when you read a dataset in 
##*       using a function like read.table(). Those functions often default to creating factors 
##*       when they encounter data that looks like characters or strings.
##*       The order of the levels of a factor can be set using the levels argument to factor(). 
##*       This can be important in linear modelling because the first level is used as the 
##*       baseline level.


x <- factor(c("yes", "yes", "no", "yes", "no"))
x                                         ## Levels are put in alphabetical order


x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x







##*  5.12 Missing Values
##*       Missing values are denoted by NA or NaN for q undefined mathematical operations.
##*       
##*       • is.na() is used to test objects if they are NA
##*       • is.nan() is used to test for NaN
##*       • NA values have a class also, so there are integer NA, character NA, etc.
##*       • A NaN value is also NA but the converse is not true


## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)


## Return a logical vector indicating which elements are NA
is.na(x)

## Return a logical vector indicating which elements are NaN
is.nan(x)


## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x)


is.nan(x)








##*  5.13 Data Frames
##*       Data frames are used to store tabular data in R. 
##*       They are an important type of object in R and are used in a variety of statistical 
##*       modeling applications. Hadley Wickham’s package dplyr⁵ has an optimized set of
##*       functions designed to work efficiently with data frames.
##*       
##*       Data frames are represented as a special type of list where every element of the list 
##*       has to have the same length. Each element of the list can be thought of as a column 
##*       and the length of each element of the list is the number of rows.
##*       
##*       Unlike matrices, data frames can store different classes of objects in each column. 
##*       Matrices must have every element be the same class (e.g. all integers or all numeric).
##*       
##*       In addition to column names, indicating the names of the variables or predictors, 
##*       data frames have a special attribute called row.names which indicate information 
##*       about each row of the data frame. Data frames are usually created by reading in a 
##*       dataset using the read.table() or read.csv()
##*       
##*       However, data frames can also be created explicitly with the data.frame() function 
##*       or they can be coerced from other types of objects like lists.
##*       
##*       Data frames can be converted to a matrix by calling data.matrix(). While it might 
##*       seem that the as.matrix() function should be used to coerce a data frame to a matrix, 
##*       almost always, what you want is the result of data.matrix().
##*        ⁵https://github.com/hadley/dplyr

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x

nrow(x)
ncol(x)







##*  5.14 Names
##*       R objects can have names, which is very useful for writing readable code and 
##*       self-describing objects.
##*       Here is an example of assigning names to an integer vector.

x <- 1:3
names(x)

names(x) <- c("New York", "Seattle", "Los Angeles")
x
names(x)


##*       Lists can also have names, which is often very useful.

x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x

names(x)

##*       Matrices can have both column and row names.

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

##*       Column names and row names can be set separately using the colnames() 
##*       and rownames() functions.

colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m

##*       Note that for data frames, there is a separate function for setting the row names, 
##*       the row.names() function. Also, data frames do not have column names, they just have 
##*       names (like lists). So to set the column names of a data frame just use the names() 
##*       function. Yes, its confusing. Here’s a quick summary:
##*       
##*            Object Set       column names      Set row names
##*            data frame         names()            row.names()
##*            matrix             colnames()         rownames()




##* 5.15 Summary
##*       There are a variety of different builtin-data types in R. In this chapter we have 
##*       reviewed the following:
##*       
##*       • atomic classes: numeric, logical, character, integer, complex
##*       • vectors, lists
##*       • factors
##*       • missing values
##*       • data frames and matrices
##*       
##*       All R objects can have attributes that help to describe what is in the object. 
##*       Perhaps the most useful attribute is names, such as column and row names in a 
##*       data frame, or simply names in a vector or list. Attributes like dimensions are 
##*       also important as they can modify the behavior of objects, like turning a vector 
##*       into a matrix.

##**********************************************************************************     
##**********************************************************************************

    
##* 6. Getting Data In and Out of R

##* 6.1 Reading and Writing Data

##*       There are a few principal functions reading data into R.
##*       • read.table, read.csv, for reading tabular data
##*       • readLines, for reading lines of a text file
##*       • source, for reading in R code files (inverse of dump)
##*       • dget, for reading in R code files (inverse of dput)
##*       • load, for reading in saved workspaces
##*       • unserialize, for reading single R objects in binary form

##*       There are of course, many R packages that have been developed to read in all 
##*       kinds of other datasets, and you may need to resort to one of these packages 
##*       if you are working in a specific area.

##*       There are analogous functions for writing data to files
##*       • write.table, for writing tabular data to text files (i.e. CSV) or connections
##*       • writeLines, for writing character data line-by-line to a file or connection
##*       • dump, for dumping a textual representation of multiple R objects
##*       • dput, for outputting a textual representation of an R object
##*       • save, for saving an arbitrary number of R objects in binary format (possibly 
##*       compressed) to a file.
##*       • serialize, for converting an R object into a binary format for outputting to a 
##*       connection (or file).


##* 6.2 Reading Data Files with read.table()
##*       The read.table() function is one of the most commonly used functions for reading data. 
##*       The help file for read.table() is worth reading in its entirety if only because the
##*       function gets used a lot (run ?read.table in R). 


?read.table


##*       The read.table() function has a few important arguments:
##*       
##*       • file, the name of a file, or a connection
##*       • header, logical indicating if the file has a header line
##*       • sep, a string indicating how the columns are separated
##*       • colClasses, a character vector indicating the class of each column in the dataset
##*       • nrows, the number of rows in the dataset. By default read.table() reads an entire 
##*       file. 
##*       • comment.char, a character string indicating the comment character. 
##*       This defalts to "#". If there are no commented lines in your file, it’s worth 
##*       setting this to be the empty string "".
##*       • skip, the number of lines to skip from the beginning
##*       • stringsAsFactors, should character variables be coded as factors? This defaults 
##*       to TRUE because back in the old days, if you had data that were stored as strings, 
##*       it was because those strings represented levels of a categorical variable. Now we 
##*       have lots of data that is text data and they don’t always represent categorical 
##*       variables. So you may want to set this to be FALSE in those cases. If you always want 
##*       this to be FALSE, you can set a global option via options(stringsAsFactors = FALSE). 
##*       I’ve never seen so much heat generated on discussion forums about an R function 
##*       argument than the stringsAsFactors argument. For small to moderately sized datasets, 
##*       you can usually call read.table without specifying any other arguments

data <- read.table("foo.txt")


##*       In this case, R will automatically:
##*       
##*       • skip lines that begin with a #
##*       • figure out how many rows there are (and how much memory needs to be allocated)
##*       • figure what type of variable is in each column of the table.
##*       
##*       Telling R all these things directly makes R run faster and more efficiently. 
##*       The read.csv() function is identical to read.table except that some of the defaults 
##*       are set differently (like the sep argument).


##* 6.3 Reading in Larger Datasets with read.table

##*       With much larger datasets, there are a few things that you can do that will make your  
##*       life easier and will prevent R from choking.
##*       
##*       • Read the help page for read.table, which contains many hints
##*       • Make a rough calculation of the memory required to store your dataset (see the next 
##*       section for an example of how to do this). If the dataset is larger than the amount of 
##*       RAM on your computer, you can probably stop right here.


##*       • Set comment.char = "" if there are no commented lines in your file.
##*       • Use the colClasses argument. Specifying this option instead of using the default can 
##*       make ’read.table’ run MUCH faster, often twice as fast. In order to use this option, 
##*       you have to know the class of each column in your data frame. If all of the columns 
##*       are “numeric”, for example, then you can just set colClasses = "numeric". A quick and 
##*       dirty way to figure out the classes of each column is the following:
     
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)

##*       • Set nrows. This doesn’t make R run faster but it helps with memory usage. A mild 
##*       overestimate is okay. You can use the Unix tool wc to calculate the number of lines 
##*       in a file. In general, when using R with larger datasets, it’s also useful to know 
##*       a few things about your system.
##*       
##*       • How much memory is available on your system?
##*         • What other applications are in use? Can you close any of them?
##*         • Are there other users logged into the same system?
##*         • What operating system are you using? Some operating systems can limit the amount of 
##*       memory a single process can access


##* 6.4 Calculating Memory Requirements for R Objects
##*       Because R stores all of its objects physical memory, it is important to be cognizant 
##*       of how much memory is being used up by all of the data objects residing in your 
##*       workspace. One situation where it’s particularly important to understand memory 
##*       requirements is when  you are reading in a new dataset into R. Fortunately, it’s 
##*       easy to make a back of the envelope calculation of how much memory will be 
##*       required by a new dataset.


##*       For example, suppose I have a data frame with 1,500,000 rows and 120 columns, all of 
##*       which are numeric data. Roughly, how much memory is required to store this data frame? 
##*       Well, on most modern computers double precision floating point numbers³ are stored 
##*       using ##*       64 bits of memory, or 8 bytes. Given that information, you can do 
##*       the following calculation
##*       



##*       1,500,000 × 120 × 8 bytes/numeric = 1,440,000,000 bytes
##*       = 1,440,000,000 / 2²⁰ bytes/MB
##*       = 1,373.29 MB
##*       = 1.34 GB


##*       So the dataset would require about 1.34 GB of RAM. Most computers these days have at 
##*       least that much RAM. However, you need to be aware of
##*       
##*       • what other programs might be running on your computer, using up RAM
##*       • what other R objects might already be taking up RAM in your workspace
##*       
##*       Reading in a large dataset for which you do not have enough RAM is one easy way 
##*       to freeze up your computer (or at least your R session). This is usually an 
##*       unpleasant experience that usually requires you to kill the R process, in the 
##*       best case scenario, or reboot your computer, in the worst case. So make sure to 
##*       do a rough calculation of memory requirements before reading in a large dataset.




##**********************************************************************************     
##**********************************************************************************



##* 7. Using the readr Package
##* 
##*       The readr package is recently developed by Hadley Wickham to deal with reading in large 
##*       flat files quickly. The package provides replacements for functions like read.table() 
##*       and read.csv(). The analogous functions in readr are read_table() and read_csv(). 
##*       These functions are often much faster than their base R analogues and provide a few 
##*       other nice features such as progress meters. For the most part, you can read use 
##*       read_table() and read_csv() pretty much anywhere you might use read.table() and 
##*       read.csv(). In addition,  if there are non-fatal problems that occur while reading 
##*       in the data, you will get a warning and the returned data frame will have some 
##*       information about which rows/observations triggered the warning. This can be very 
##*       helpful for “debugging” problems with your data before you get neck deep in data 
##*       analysis. The importance of the read_csv function is perhaps better understood from 
##*       an historical perspective. R’s built in read.csv function similarly reads CSV files, 
##*       but the read_csv function in readr builds on that by removing some of the quirks and 
##*       “gotchas” of read.csv as well as dramatically optimizing the speed with which it can 
##*       read data into R. The read_csv function also adds some nice user oriented
##*       features like a progress meter and a compact method for specifying column types.  
##*       A typical call to read_csv will look as follows.

library(readr)
teams <- read_csv("data/team_standings.csv")

##*       Parsed with column specification:

  cols(
    Standing = col_double(),
    Team = col_character()
  )

teams

##*       # A tibble: 32 x 2

##*       Standing Team
##*       <dbl> <chr>
##*         1 1 Spain
##*       2 2 Netherlands
##*       3 3 Germany
##*       4 4 Uruguay
##*       5 5 Argentina
##*       6 6 Brazil
##*       7 7 Ghana
##*       8 8 Paraguay
##*       9 9 Japan
##*       10 10 Chile

##*       # … with 22 more rows


##*       By default, read_csv will open a CSV file and read it in line-by-line. It will also 
##*       (by default), read in the first few rows of the table in order to figure out the type 
##*       of each column (i.e. integer, character, etc.). From the read_csv help page:
##*       
##*       If ‘NULL’, all column types will be imputed from the first 1000 rows on the input. This
##*       is convenient (and fast), but not robust. If the imputation fails, you’ll need to 
##*       supply the correct types yourself.  You can specify the type of each column with the 
##*       col_types argument. In general, it’s a good idea to specify the column types explicitly. 
##*       This rules out any possible guessing errors on the part of read_csv. Also, specifying 
##*       the column types explicitly provides a useful safety check in case 
##*       anything about the dataset should change without you knowing about it. 

teams <- read_csv("data/team_standings.csv", col_types = "cc")

##*       Note that the col_types argument accepts a compact representation. Here "cc" indicates 
##*       that the first column is character and the second column is character (there are only 
##*       two columns). Using the col_types argument is useful because often it is not easy to 
##*       automatically figure out the type of a column by looking at a few rows (especially if a 
##*       column has many missing values). The read_csv function will also read compressed files 
##*       automatically. There is no need to decompress the file first or use the gzfile 
##*       connection function. The following call reads a gzip-compressed CSV file 
##*       containing download logs from the RStudio CRAN mirror.

       
logs <- read_csv("data/2016-07-19.csv.bz2", n_max = 10)

##*       Parsed with column specification:
  
cols(
    date = col_date(format = ""),
    time = col_time(format = ""),
    size = col_double(),
    r_version = col_character(),
    r_arch = col_character(),
    r_os = col_character(),
    package = col_character(),
    version = col_character(),
    country = col_character(),
    ip_id = col_double()
  )

##*       Note that the warnings indicate that read_csv may have had some difficulty identifying 
##*       the type of each column. This can be solved by using the col_types argument.

logs <- read_csv("data/2016-07-19.csv.bz2", col_types = "ccicccccci", n_max = 10)
logs

##*       # A tibble: 10 x 10
##*       date time size r_version r_arch r_os package version country ip_id
##*       <chr> <chr> <int> <chr> <chr> <chr> <chr> <chr> <chr> <int>
##*         1 2016-0… 22:00… 1.89e6 3.3.0 x86_64 mingw32 data.t… 1.9.6 US 1
##*       2 2016-0… 22:00… 4.54e4 3.3.1 x86_64 mingw32 assert… 0.1 US 2
##*       3 2016-0… 22:00… 1.43e7 3.3.1 x86_64 mingw32 stringi 1.1.1 DE 3
##*       4 2016-0… 22:00… 1.89e6 3.3.1 x86_64 mingw32 data.t… 1.9.6 US 4
##*       5 2016-0… 22:00… 3.90e5 3.3.1 x86_64 mingw32 foreach 1.4.3 US 4
##*       6 2016-0… 22:00… 4.88e4 3.3.1 x86_64 linux-… tree 1.0-37 CO 5
##*       7 2016-0… 22:00… 5.25e2 3.3.1 x86_64 darwin… surviv… 2.39-5 US 6
##*       8 2016-0… 22:00… 3.23e6 3.3.1 x86_64 mingw32 Rcpp 0.12.5 US 2
##*       9 2016-0… 22:00… 5.56e5 3.3.1 x86_64 mingw32 tibble 1.1 US 2
##*       10 2016-0… 22:00… 1.52e5 3.3.1 x86_64 mingw32 magrit… 1.5 US 2

##*       You can specify the column type in a more detailed fashion by using the various 
##*       col_* functions. For example, in the log data above, the first column is actually 
##*       a date, so it might make more sense to read it in as a Date variable. If we 
##*       wanted to just read in that first column, we could do:

logdates <- read_csv("data/2016-07-19.csv.bz2",
                       + col_types = cols_only(date = col_date()),
                       + n_max = 10)
logdates


##*       # A tibble: 10 x 1
date

##*       <date>
##*         1 2016-07-19
##*       2 2016-07-19
##*       3 2016-07-19
##*       4 2016-07-19
##*       5 2016-07-19
##*       6 2016-07-19
##*       7 2016-07-19
##*       8 2016-07-19
##*       9 2016-07-19
##*       10 2016-07-19

##*       Now the date column is stored as a Date object which can be used for relevant 
##*       date-related computations (for example, see the lubridate package).
##*       
##*       The read_csv function has a progress option that defaults to TRUE. This options 
##*       provides a nice progress meter while the CSV file is being read. However, if 
##*       you are using read_csv in a function, or perhaps embedding it in a loop, it’s 
##*       probably best to set progress = FALSE.
##*       




##**********************************************************************************     
##**********************************************************************************




##* 8. Using Textual and Binary Formats for Storing Data

##*       There are a variety of ways that data can be stored, including structured text files
##*       like CSV or tab delimited, or more complex binary formats. However, there is an 
##*       intermediate format that is textual, but not as simple as something like CSV. 
##*       The format is native to R and is somewhat readable because of its textual nature. 
##*       One can create a more descriptive representation of an R object by using the 
##*       dput() or dump() functions. 
##*       
##*       The dump() and dput() functions are useful because the resulting textual format is 
##*       editable, and in the case of corruption, potentially recoverable. Unlike writing 
##*       out a table or CSV file, dump() and dput() preserve the metadata (sacrificing some 
##*       readability), so that another user doesn’t have to specify it all over again. 
##*       For example, we can preserve the class of each column of a table or the levels of 
##*       a factor variable. Textual formats can work much better with version control programs 
##*       like subversion or git which can only track changes meaningfully in text files. 
##*       In addition, textual formats can be longer-lived; if there is corruption somewhere 
##*       in the file, it can be easier to fix the problem because one can just open the 
##*       file in an editor and look at it (although this would probably only be done in a 
##*       worst case scenario!). 
##*       
##*       Finally, textual formats adhere to the Unix philosophy, if that means anything to you. 
##*       There are a few downsides to using these intermediate textual formats. The format is 
##*       not very space efficient, because all of the metadata is specified. Also, it is 
##*       really only partially readable.  In some instances it might be preferable to have 
##*       data stored in a CSV file and then have a separate code file that specifies the 
##*       metadata.
##*       
##*       8.1 Using dput() and dump()
##*       
##*       One way to pass data around is by deparsing the R object with dput() and reading it 
##*       back in (parsing it) using dget().
##*        

##Create a data frame

y <- data.frame(a = 1, b = "a")

## Print 'dput' output to console

dput(y)

structure(list(a = 1, b = "a"), class = "data.frame", row.names = c(NA,-1L))


##*       Notice that the dput() output is in the form of R code and that it preserves metadata 
##*       like the class of the object, the row names, and the column names. The output of dput() 
##*       can also be saved directly to a file.

## Send 'dput' output to a file

dput(y, file = "y.R")

## Read in 'dput' output from a file

new.y <- dget("y.R")

new.y


##*       Multiple objects can be deparsed at once using the dump function and read back in 
##*       using source.

x <- "foo"
y <- data.frame(a = 1L, b = "a")

##*       We can dump() R objects to a file by passing a character vector of their names.

dump(c("x", "y"), file = "data.R")

rm(x, y)

##*       The inverse of dump() is source().

source("data.R")

str(y)
x


##*       8.2 Binary Formats
##*       
##*       The complement to the textual format is the binary format, which is sometimes necessary 
##*       to use for efficiency purposes, or because there’s just no useful way to represent 
##*       data in a textual manner. Also, with numeric data, one can often lose precision when 
##*       converting to and from a textual format, so it’s better to stick with a binary format. 
##*       
##*       The key functions for converting R objects into a binary format are save(), 
##*       save.image(), and serialize(). 
##*       
##*       Individual R objects can be saved to a file using the save() function.

a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)

## Save 'a' and 'b' to a file

save(a, b, file = "mydata.rda")

## Load 'a' and 'b' into your workspace

load("mydata.rda")

##*       If you have a lot of objects that you want to save to a file, you can save all objects 
##*       in your workspace using the save.image() function.

## Save everything to a file

save.image(file = "mydata.RData")

## load all objects in this file

load("mydata.RData")

##*       Notice that I’ve used the .rda extension when using save() and the .RData extension 
##*       when using save.image(). This is just my personal preference; you can use whatever 
##*       file extension you want. The save() and save.image() functions do not care. 
##*       However, .rda and .RData are fairly common extensions and you may want to use them 
##*       because they are recognized by other software. 
##*       
##*       The serialize() function is used to convert individual R objects into a binary format 
##*       that can be communicated across an arbitrary connection. This may get sent to a file, 
##*       but it could get sent over a network or other connection. When you call serialize() 
##*       on an R object, the output will be a raw vector coded in hexadecimal
##*       format.
##*       


x <- list(1, 2, 3)

serialize(x, NULL)

##*       If you want, this can be sent to a file, but in that case you are better off using 
##*       something like save(). The benefit of the serialize() function is that it is the 
##*       only way to perfectly represent an R object in an exportable format, without losing 
##*       precision or any metadata. If that is what you need, then serialize() is the 
##*       function for you.





##**********************************************************************************     
##**********************************************************************************




##* 9. Interfaces to the Outside World


##*       Data are read in using connection interfaces. Connections can be made to files 
##*       (most common) or to other more exotic things.
##*       
##*       • file, opens a connection to a file
##*       • gzfile, opens a connection to a file compressed with gzip
##*       • bzfile, opens a connection to a file compressed with bzip2
##*       • url, opens a connection to a webpage

##*       In general, connections are powerful tools that let you navigate files or other 
##*       external objects. Connections can be thought of as a translator that lets you 
##*       talk to objects that are outside of R. Those outside objects could be anything 
##*       from a data base, a simple text file, or a a web service API. Connections allow 
##*       R functions to talk to all these different external objects without you having 
##*       to Write custom code for each object.

##*       9.1 File Connections

##*       Connections to text files can be created with the file() function.


str(file)
function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"),
          raw = FALSE, method = getOption("url.method", "default"))

##*       The file() function has a number of arguments that are common to many other connection 
##*       functions so it’s worth going into a little detail here.
##*       
##*       • description is the name of the file
##*       • open is a code indicating what mode the file should be opened in

##*       The open argument allows for the following options:
##*       • “r” open file in read only mode
##*       • “w” open a file for writing (and initializing a new file)
##*       • “a” open a file for appending
##*       • “rb”, “wb”, “ab” reading, writing, or appending in binary mode (Windows)

##*       In practice, we often don’t need to deal with the connection interface directly as many 
##*       functions for reading and writing data just deal with it in the background.
##*       For example, if one were to explicitly use connections to read a CSV file in to R, 
##*       it might look like this,

## Create a connection to 'foo.txt'

con <- file("foo.txt")

## Open connection to 'foo.txt' in read-only mode

open(con, "r")

## Read from the connection

data <- read.csv(con)

## Close the connection

close(con)

##*       which is the same as

data <- read.csv("foo.txt")

##*       In the background, read.csv() opens a connection to the file foo.txt, reads from it, 
##*       and closes the connection when it’s done.  The above example shows the basic approach 
##*       to using connections. Connections must be opened, then they are read from or 
##*       written to, and then they are closed.


##* 9.2 Reading Lines of a Text File

##*       Text files can be read line by line using the readLines() function. This function is 
##*       useful for reading text files that may be unstructured or contain non-standard data.

## Open connection to gz-compressed text file

con <- gzfile("words.gz")

x <- readLines(con, 10)
x


##*       For more structured text data like CSV files or tab-delimited files, there are other 
##*       functions like read.csv() or read.table(). 
##*       
##*       The above example used the gzfile() function which is used to create a connection 
##*       to files compressed using the gzip algorithm. This approach is useful because 
##*       it allows you to read from a file without having to uncompress the file first, 
##*       which would be a waste of space and time. 
##*       
##*       There is a complementary function writeLines() that takes a character vector and 
##*       writes each element of the vector one line at a time to a text file.


##* 9.3 Reading From a URL Connection

##*       The readLines() function can be useful for reading in lines of webpages. Since web 
##*       pages are basically text files that are stored on a remote server, there is 
##*       conceptually not much difference between a web page and a local text file. However, 
##*       we need R to negotiate the communication between your computer and the web server. 
##*       This is what the url() function can do for you, by creating a url connection to 
##*       a web server. This code might take time depending on your connection speed.

       
## Open a URL connection for reading

con <- url("http://www.jhsph.edu", "r")

## Read the web page

x <- readLines(con)

## Print out the first few lines

head(x)

##*       While reading in a simple web page is sometimes useful, particularly if data are 
##*       embedded in the web page somewhere. However, more commonly we can use URL connection 
##*       to read in specific data files that are stored on web servers. Using URL connections 
##*       can be useful for producing a reproducible analysis, because the code essentially 
##*       documents where the data came from and how they were obtained. This is approach 
##*       is preferable to opening a web browser and downloading a dataset by hand. Of course, 
##*       the code you write with connections may not be executable at a later date if things 
##*       on the server side are changed or reorganized.





##**********************************************************************************     
##**********************************************************************************



##* 10. Subsetting R Objects


##*       There are three operators that can be used to extract subsets of R objects:

##*       • The [ operator always returns an object of the same class as the original. 
##*       It can be used to select multiple elements of an object
##*       • The [[ operator is used to extract elements of a list or a data frame. It can only 
##*       be used to extract a single element and the class of the returned object will not 
##*       necessarily be a list or data frame.
##*       • The $ operator is used to extract elements of a list or data frame by literal name. 
##*       Its semantics are similar to that of [[.

##*       10.1 Subsetting a Vector
##*       
##*       Vectors are basic objects in R and they can be subsetted using the [ operator.                      

x <- c("a", "b", "c", "c", "d", "a")
    
x[1] ## Extract the first element
x[2] ## Extract the second element

##*       The [ operator can be used to extract multiple elements of a vector by passing the 
##*       operator an integer sequence. Here we extract the first four elements of the vector.
                                                                                     
x[1:4]

##*       The sequence does not have to be in order; you can specify any arbitrary integer 
##*       vector.
          
x[c(1, 3, 4)]

##*       We can also pass a logical sequence to the [ operator to extract elements of a vector 
##*       that satisfy a given condition. For example, here we want the elements of x that 
##*       come lexicographically after the letter “a”.


u <- x > "a"
u

x[u]

##*       Another, more compact, way to do this would be to skip the creation of a logical vector 
##*       and just subset the vector directly with the logical expression.

x[x > "a"]


##*       10.2 Subsetting a Matrix

##*       Matrices can be subsetted in the usual way with (i,j) type indices. Here, we create 
##*       simple 2x3 matrix with the matrix function.

x <- matrix(1:6, 2, 3)
x

##*       We can access the (1; 2) or the (2; 1) element of this matrix using the appropriate 
##*       indices.

x[1, 2]
x[2, 1]

##*       Indices can also be missing. This behavior is used to access entire rows or columns 
##*       of a matrix.

x[1, ] ## Extract the first row
x[, 2] ## Extract the second column

##*       Dropping matrix dimensions

##*       By default, when a single element of a matrix is retrieved, it is returned as a 
##*       vector of length 1 rather than a 1x1 matrix. Often, this is exactly what we want, 
##*       but this behaviorcan be turned off by setting drop = FALSE.

x <- matrix(1:6, 2, 3)
x[1, 2]

x[1, 2, drop = FALSE]

##*       Similarly, when we extract a single row or column of a matrix, R by default drops the 
##*       dimension of length 1, so instead of getting a 1 x 3 matrix after extracting the 
##*       first row, we get a vector of length 3. This behavior can similarly be turned off 
##*       with the drop = FALSE option.

x <- matrix(1:6, 2, 3)
x[1, ]

x[1, , drop = FALSE]

##*       Be careful of R’s automatic dropping of dimensions. This is a feature that is 
##*       often quite useful during interactive work, but can later come back to bite you 
##*       when you are writing longer programs or functions.


##*       10.3 Subsetting Lists

##*       Lists in R can be subsetted using all three of the operators mentioned above, and 
##*       all three are used for different purposes.

x <- list(foo = 1:4, bar = 0.6)
x

##*       The [[ operator can be used to extract single elements from a list. Here we extract 
##*       the first element of the list.
 

x[[1]]

##*       The [[ operator can also use named indices so that you don’t have to remember the 
##*       exact ordering of every element of the list. You can also use the $ operator to 
##*       extract elements by name.

x[["bar"]]

x$bar

##*       Notice you don’t need the quotes when you use the $ operator. One thing that 
##*       differentiates the [[ operator from the $ is that the [[ operator can be used 
##*       with computed indices. The $ operator can only be used with literal names.

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
name <- "foo"

## computed index for "foo"

x[[name]]


## element "name" doesn't exist! (but no error here)
x$name

## element "foo" does exist
x$foo


##*       10.4 Subsetting Nested Elements of a List
##*       
##*       The [[ operator can take an integer sequence if you want to extract a nested element 
##*       of a list.

x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))

## Get the 3rd element of the 1st element
x[[c(1, 3)]]

## Same as above

x[[1]][[3]]

## 1st element of the 2nd element

x[[c(2, 1)]]


##*       10.5 Extracting Multiple Elements of a List
##*       
##*       The [ operator can be used to extract multiple elements from a list. For example, 
##*       if you wanted to extract the first and third elements of a list, you would do the 
##*       following

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

##*       Note that x[c(1, 3)] is NOT the same as x[[c(1, 3)]].  
##*       Remember that the [ operator always returns an object of the same class as the original. 
##*       Since the original object was a list, the [ operator returns a list. In the above code, 
##*       we returned a list with two elements (the first and the third)


##*       10.6 Partial Matching

##*       Partial matching of names is allowed with [[ and $. This is often very useful during 
##*       interactive work if the object you’re working with has very long element names. You can 
##*       just abbreviate those names and R will figure out what element you’re referring to.

x <- list(aardvark = 1:5)
x$a

x[["a"]]

x[["a", exact = FALSE]]


##*       In general, this is fine for interactive work, but you shouldn’t resort to partial 
##*       matching if you are writing longer scripts, functions, or programs. In those cases, 
##*       you should refer to the full element name if possible. That way there’s no ambiguity 
##*       in your code.


##*       10.7 Removing NA Values

##*       A common task in data analysis is removing missing values (NAs).

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)

x[!bad]

##*       What if there are multiple R objects and you want to take the subset with no missing 
##*       values in any of those objects?

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good

x[good]
y[good]

##*       You can use complete.cases on data frames too.


head(airquality)
good <- complete.cases(airquality)
head(airquality[good, ])

x<-4
class(x)

x <- c(4, "a", TRUE)
class(x)


x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)


x <- list(2, "a", "b", TRUE)
x[[1]]
Class( x[[1]])


x <- 1:4 
x
y <- 2:3
y
z<-x + y
z
class(z)

x <- c(3, 5, 1, 10, 12, 6)
x

x[x > 0] <- 6
x

?read.csv
data<-read.csv("C:\\R\\MyProjects\\datasciencecoursera\\hw1_data.csv")
colnames(data)
head(data)
tail(data)

## What is the mean of "Temp" when "Month" is equal to 6?
  
data1<-mean(Data)
summary(data)
data[47,]
data
library(dplyr)
data
good<-complete.cases(data)
data1<-data[good,]
data1

data1 %>% filter(Ozone > 31, Temp > 90)
data2<-data1 %>% filter(Ozone > 31, Temp > 90)
data2
mean(data2$Solar.R)
browseVignettes(package = c("dplyr", "tidyr"))


view(data)
data1<-data %>% filter((Ozone>31 | Temp>90))%>% mean(solar.R)

data.df1

ca_ny_expert_10000 <- pfizer %>%
  filter((state == "CA" | state == "NY") & total >= 10000 & category == "Expert-Led Forums") %>%
  arrange(desc(total))
sstemp_mean<-subset(data, data$Month==6) 
mean(sstemp_mean$Temp)

ssOzone_max<-subset(data, data$Month==5) 
ssOzone_max
ssOzone_max_good<-complete.cases(ssOzone_max)
ss1<-ssOzone_max[ssOzone_max_good,]
ss1
max(ss1$Ozone)

max(ssOzone_max$Ozone)

ssnew<-subset(data, data$Ozone>31 data)
data
?subset

## Extract the subset of rows of the data frame where Ozone values are above 31 and 
## Temp values are above 90. What is the mean of Solar.R in this subset?




is.na(data$Ozone)
desc(data)

good<-complete.cases(data)
data1<-data[good,]
data1
mean(data1$Ozone)

data2
data