# save arguments from bash file
args = commandArgs(trailingOnly=TRUE)
accelDir=args[1]
BMXDir=args[2]
resDir=args[3]

print(paste0('Accel ID Data directory: ', accelDir))
print(paste0('BMX Data directory: ', BMXDir))
print(paste0('Results directory: ', resDir))

# Read and clean accel IDs
accel_ids <- read.delim(file = paste(accelDir))
accel_ids <- unlist(accel_ids)
accel_ids <- as.numeric(accel_ids)
accel_ids <- na.omit(accel_ids)

BMX_data <- read.csv(file = paste(BMXDir))

# function returns 0 if NA and 1 otherwise
is.complete <- function(x){
      return ((is.na(x)*-1)+1)
}

# create new data frame
generate_sample <- BMX_data

# create a binary variable on wether BMI has NAs
generate_sample$BMI_info <- is.complete(BMX_data$BMXBMI)

# create binary variable on whether individual has accel data
n <- length(BMX_data$SEQN)
generate_sample$accel_info <- integer(n)
for (i in 1:n) {
  generate_sample$accel_info[i] <- is.complete(match(generate_sample$SEQN[i],accel_ids))
}

# create binary variable on whether individual has both BMI and accel data
generate_sample$complete_BMI_and_accel <- I(generate_sample$accel_info*generate_sample$BMI_info)
print(paste("There are",sum(generate_sample$complete_BMI_and_accel),"individuals with both accel and BMI data"))

summary(generate_sample)

# save this data
# write.csv(generate_sample, paste0(resDir, 'generate_sample.csv'))
#write.table(generate_sample, paste0(resDir, 'generatesample.csv'), sep=',', row.names=FALSE)
write.table(generate_sample, 'generate_sample.csv', sep=',', row.names=FALSE)

print("so where is it?????")
