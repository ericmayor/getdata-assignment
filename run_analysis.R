
body_acc_x_train = unlist(read.table("train/Inertial Signals/body_acc_x_train.txt"))
body_acc_y_train = unlist(read.table("train/Inertial Signals/body_acc_y_train.txt"))
body_acc_z_train = unlist(read.table("train/Inertial Signals/body_acc_z_train.txt"))

body_gyro_x_train = unlist(read.table("train/Inertial Signals/body_gyro_x_train.txt"))
body_gyro_y_train = unlist(read.table("train/Inertial Signals/body_gyro_y_train.txt"))
body_gyro_z_train = unlist(read.table("train/Inertial Signals/body_gyro_z_train.txt"))

total_acc_x_train = unlist(read.table("train/Inertial Signals/total_acc_x_train.txt"))
total_acc_y_train = unlist(read.table("train/Inertial Signals/total_acc_y_train.txt"))
total_acc_z_train = unlist(read.table("train/Inertial Signals/total_acc_z_train.txt"))
train=data.frame(body_acc_x_train,body_acc_y_train,body_acc_z_train,body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,total_acc_x_train,total_acc_y_train,total_acc_z_train)
names(train) = c("body_acc_x","body_acc_y","body_acc_z","body_gyro_x","body_gyro_y","body_gyro_z","total_acc_x","total_acc_y","total_acc_z")
train$dataset = rep("train",nrow(train))


body_acc_x_test = unlist(read.table("test/Inertial Signals/body_acc_x_test.txt"))
body_acc_y_test = unlist(read.table("test/Inertial Signals/body_acc_y_test.txt"))
body_acc_z_test = unlist(read.table("test/Inertial Signals/body_acc_z_test.txt"))

body_gyro_x_test = unlist(read.table("test/Inertial Signals/body_gyro_x_test.txt"))
body_gyro_y_test = unlist(read.table("test/Inertial Signals/body_gyro_y_test.txt"))
body_gyro_z_test = unlist(read.table("test/Inertial Signals/body_gyro_z_test.txt"))

total_acc_x_test = unlist(read.table("test/Inertial Signals/total_acc_x_test.txt"))
total_acc_y_test = unlist(read.table("test/Inertial Signals/total_acc_y_test.txt"))
total_acc_z_test = unlist(read.table("test/Inertial Signals/total_acc_z_test.txt"))
test=data.frame(body_acc_x_test,body_acc_y_test,body_acc_z_test,body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,total_acc_x_test,total_acc_y_test,total_acc_z_test)

names(test) = c("body_acc_x","body_acc_y","body_acc_z","body_gyro_x","body_gyro_y","body_gyro_z","total_acc_x","total_acc_y","total_acc_z")
test$dataset = rep("test",nrow(test))

joined = rbind(test,train)

write.table(joined,"joined_dataset.txt", sep="\t",row.names = F)

means = colMeans(joined[,1:9])
message("Mean values, by variable, for this data set are: ")
means

variables = ncol(joined)-1
sds = rep(0,variables)
for (i in 1:variables) { 
sds[i] = sd(joined[,i])  
}
names(sds) = names(joined[1:variables])
sds

message("Standard deviations, by variable, for this data set are: ")
sds